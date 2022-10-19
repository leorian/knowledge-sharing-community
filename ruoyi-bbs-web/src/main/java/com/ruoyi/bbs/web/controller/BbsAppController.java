package com.ruoyi.bbs.web.controller;

import cn.hutool.http.HtmlUtil;
import com.ruoyi.bbs.domain.BbsApp;
import com.ruoyi.bbs.domain.BbsUser;
import com.ruoyi.bbs.service.IBbsAppService;
import com.ruoyi.bbs.service.IBbsUserService;
import com.ruoyi.bbs.web.aop.InjectLoginUser;
import com.ruoyi.bbs.web.aop.InjectNowDate;
import com.ruoyi.bbs.web.check.RequestDtoCheck;
import com.ruoyi.bbs.web.context.LoginContext;
import com.ruoyi.bbs.web.utils.Constants;
import com.ruoyi.bbs.web.utils.Result;
import com.ruoyi.common.config.Global;
import com.ruoyi.common.utils.QRCodeUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.file.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * @author xiezhonggui
 */
@Controller
@RequestMapping("/app")
public class BbsAppController {

    @Autowired
    private IBbsAppService appService;

    @Autowired
    private LoginContext loginContext;

    @Autowired
    private IBbsUserService userService;


    /**
     * 应用首页
     *
     * @return
     */
    @RequestMapping("/index")
    @InjectLoginUser
    @InjectNowDate
    public String appIndex(HttpServletRequest request, ModelMap modelMap) {

        BbsUser bbsSessionUser = loginContext.getCurrentUser(request);
        if (bbsSessionUser != null) {
            BbsApp bbsApp = new BbsApp();
            bbsApp.setUserId(bbsSessionUser.getUserId());
            List<BbsApp> bbsAppList = appService.selectAppList(bbsApp);
            if (!CollectionUtils.isEmpty(bbsAppList)) {
                bbsAppList.stream().forEach(app -> {
                    if (app.getIntroduction() != null) {
                        app.setIntroduction(HtmlUtil.filter(app.getIntroduction()));
                    }
                });
            }

            if (!CollectionUtils.isEmpty(bbsAppList)) {
                modelMap.put("bbsAppList", bbsAppList);
            }
        }

        //社区推荐应用
        BbsUser adminBbsUser = userService.selectUserByAccount("admin");
        if (adminBbsUser != null) {
            BbsApp bbsApp = new BbsApp();
            bbsApp.setUserId(adminBbsUser.getUserId());
            List<BbsApp> adminBbsAppList = appService.selectAppList(bbsApp);
            if (!CollectionUtils.isEmpty(adminBbsAppList)) {
                modelMap.put("adminBbsAppList", adminBbsAppList);
            }
        }


        return "app/index";
    }

    /**
     * 上传应用
     *
     * @param appIcon
     * @param downloadUrl
     * @param appName
     * @param introduction
     * @param request
     * @return
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public Result uploadAct(
            @RequestParam(value = "appId", required = false) Long appId,
            @RequestParam("captcha") String captcha,
            @RequestParam(value = "appIcon", required = false) MultipartFile appIcon,
            @RequestParam(value = "downloadUrl", required = false) MultipartFile downloadUrl,
            @RequestParam(value = "remark", required = false) MultipartFile[] remark,
            @RequestParam("appName") String appName,
            @RequestParam("appVersion") String appVersion,
            @RequestParam("introduction") String introduction, HttpServletRequest request) throws IOException {
        Result ret = RequestDtoCheck.uploadActCheck(appId, captcha, appIcon, downloadUrl, remark, appName,
                appVersion, introduction, request);
        if (ret != null) {
            return ret;
        }


        BbsUser bbsSessionUser = loginContext.getCurrentUser(request);
        if (bbsSessionUser == null || StringUtils.isEmpty(bbsSessionUser.getAccount())) {
            return Result.builderErrorMsg("上传应用之前请先登录！");
        }

        if (bbsSessionUser.getUserType() == null || bbsSessionUser.getUserType() == 0) {
            return Result.builderErrorMsg("您现在的身份是普通用户，不能上传应用，请先升级为终身会员！");
        }

        BbsApp bbsApp;
        if (appId == null) {
            bbsApp = new BbsApp();
        } else {
            bbsApp = appService.selectAppById(appId);
            if (bbsApp == null || bbsApp.getDelFlag() != 0
                    || bbsApp.getUserId().longValue() != bbsSessionUser.getUserId().longValue()) {
                return Result.builderErrorMsg("您不应该尝试修改别人的应用！");
            }
        }

        // 上传文件路径
        String filePath = Global.getUploadPath();
        // 上传并返回新文件名称
        if (appIcon != null) {
            String appIconFileName = FileUploadUtils.upload(filePath, appIcon);
            bbsApp.setAppIcon(appIconFileName);
        }

        if (downloadUrl != null) {
            String downloadUrlFileName = FileUploadUtils.upload(filePath, downloadUrl);
            bbsApp.setDownloadUrl(downloadUrlFileName);
        }


        //上传应用截图
        if (remark != null && remark.length != 0) {
            List<String> appImgPathList = new ArrayList<>();
            for (MultipartFile appImg : remark) {
                String appImgPath = FileUploadUtils.upload(filePath, appImg);
                appImgPathList.add(appImgPath);
            }
            bbsApp.setRemark(StringUtils.collectionToCommaDelimitedString(appImgPathList));
        }

        bbsApp.setAppName(appName);
        bbsApp.setAppVersion(appVersion);
        bbsApp.setIntroduction(introduction);

        if (appId == null) {
            bbsApp.setAppType(0);
            bbsApp.setUserId(bbsSessionUser.getUserId());
            bbsApp.setUserName(bbsSessionUser.getUserName());
            bbsApp.setAccount(bbsSessionUser.getAccount());
            bbsApp.setDownloadTimes(0L);
            bbsApp.setCreateBy(bbsSessionUser.getAccount());
            bbsApp.setStatus(0);
            bbsApp.setDelFlag(0);
        }

        bbsApp.setUpdateBy(bbsSessionUser.getAccount());


        try {
            if (appId == null) {
                appService.insertApp(bbsApp);
            } else {
                appService.updateApp(bbsApp);
            }
            return Result.builderSuccessMsg("上传成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.builderErrorMsg("上传异常！");
        }
    }

    /**
     * 删除应用
     *
     * @param appId
     * @param request
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Result del(@RequestParam("appId") Long appId, HttpServletRequest request) {
        BbsUser bbsSessionUser = loginContext.getCurrentUser(request);
        if (bbsSessionUser == null || StringUtils.isEmpty(bbsSessionUser.getAccount())) {
            return Result.builderErrorMsg("删除应用之前请先登录！");
        }

        if (bbsSessionUser.getUserType() == null || bbsSessionUser.getUserType() == 0) {
            return Result.builderErrorMsg("您现在的身份是普通用户，不能删除应用，请先升级为终身会员！");
        }

        BbsApp bbsApp = appService.selectAppById(appId);

        if (bbsApp == null) {
            return Result.builderErrorMsg("需要删除的应用没有找到！");
        }

        if (bbsApp.getUserId().longValue() != bbsSessionUser.getUserId().longValue()) {
            return Result.builderErrorMsg("你无权删除别人的应用！");
        }

        try {
            appService.deleteAppByIds(String.valueOf(appId));
            return Result.builderSuccessMsg("删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.builderErrorMsg("删除异常！");
        }

    }

    /**
     * 查看应用
     *
     * @param appId
     * @return
     */
    @RequestMapping("/detail")
    public String detail(@RequestParam("appId") Long appId, ModelMap modelMap) {
        invokeAppInfo(appId, modelMap);
        return "app/detail";
    }

    /**
     * 获取应用版本号
     *
     * @param appId
     * @return
     */
    @RequestMapping("/version/{appId}")
    @ResponseBody
    public Result version(@PathVariable("appId") Long appId) {
        BbsApp bbsApp = appService.selectAppById(appId);
        return Result.builderSuccessMsg(bbsApp.getAppVersion());
    }


    /**
     * 修改应用
     *
     * @param appId
     * @param modelMap
     * @return
     */
    @RequestMapping("/modify")
    @InjectLoginUser
    @InjectNowDate
    public String modify(@RequestParam("appId") Long appId, ModelMap modelMap) {
        invokeAppInfo(appId, modelMap);
        return "app/modify";
    }

    /**
     * 生成二维码
     *
     * @param appId
     * @param response
     */
    @RequestMapping(value = "/generateqrcode/{appId}", method = RequestMethod.GET)
    @ResponseBody
    public void generateQRCode4Product(@PathVariable("appId") Long appId, HttpServletRequest request, HttpServletResponse response) {
        try {
            String filePath = Global.getProfile();
            BbsApp bbsApp = appService.selectAppById(appId);
            String appIcon = bbsApp.getAppIcon();
            appIcon = appIcon.replaceFirst("/profile", "");
            QRCodeUtils.encode(Constants.getDomain(request) + "/app/detail?appId=" + appId,
                    filePath + appIcon, response.getOutputStream());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 通用下载请求
     *
     * @param appId 应用ID
     */
    @GetMapping("/download")
    public void download(@RequestParam("appId") Long appId, HttpServletResponse response, HttpServletRequest request) {
        try {
            BbsApp bbsApp = appService.selectAppById(appId);
            String fileName = bbsApp.getDownloadUrl();
            String filePath = Global.getProfile() + fileName.replaceFirst("/profile", "");
            String realFileName = fileName.substring(fileName.lastIndexOf("/") + 1);
            response.setCharacterEncoding("utf-8");
            response.setHeader("Content-Disposition",
                    "attachment;fileName=" + FileUtils.setFileDownloadHeader(request, realFileName));
            response.setHeader("Content-Length", "" + new File(filePath).length());
            response.setContentType("multipart/form-data");
            FileUtils.writeBytes(filePath, response.getOutputStream());
            appService.plusOneDownloadTimes(appId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void invokeAppInfo(Long appId, ModelMap modelMap) {
        BbsApp bbsApp = appService.selectAppById(appId);
        if (bbsApp.getDelFlag() == 0) {
            modelMap.put("bbsApp", bbsApp);
            String remark = bbsApp.getRemark();
            if (!StringUtils.isEmpty(remark)) {
                String[] appImgPathList = remark.split(",");
                modelMap.put("appImgPathList", appImgPathList);
            }
        } else {
            modelMap.put("error_msg", "应用没有找到，或许已经被作者删掉了");
        }
    }

}
