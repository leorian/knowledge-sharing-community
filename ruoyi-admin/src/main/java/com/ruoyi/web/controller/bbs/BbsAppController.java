package com.ruoyi.web.controller.bbs;

import com.ruoyi.bbs.domain.BbsApp;
import com.ruoyi.bbs.service.IBbsAppService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.config.Global;
import com.ruoyi.common.config.ServerConfig;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.QRCodeUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.framework.util.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * @author xiezhonggui
 */
@Controller
@RequestMapping("/bbs/app")
public class BbsAppController extends BaseController {


    @Autowired
    private ServerConfig serverConfig;

    @Autowired
    private IBbsAppService appService;

    private String prefix = "bbs/app";

    @RequiresPermissions("bbs:app:view")
    @GetMapping()
    public String app() {
        return prefix + "/app";
    }

    /**
     * 查询应用列表
     */
    @RequiresPermissions("bbs:app:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BbsApp app) {
        startPage();
        List<BbsApp> list = appService.selectAppList(app);
        return getDataTable(list);
    }

    /**
     * 新增应用
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存应用
     */
    @RequiresPermissions("bbs:app:add")
    @Log(title = "应用", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(
                              @RequestParam("appVersion") String appVersion,
                              @RequestParam("appIcon") MultipartFile appIcon,
                              @RequestParam("downloadUrl") MultipartFile downloadUrl,
                              @RequestParam("appName") String appName,
                              @RequestParam("introduction") String introduction,
                              @RequestParam("status") Integer status
    ) throws IOException {

        // 上传文件路径
        String filePath = Global.getUploadPath();
        // 上传并返回新文件名称
        String appIconFileName = FileUploadUtils.upload(filePath, appIcon);
        String downloadUrlFileName = FileUploadUtils.upload(filePath, downloadUrl);
        BbsApp bbsApp = new BbsApp();
        bbsApp.setAppVersion(appVersion);
        bbsApp.setAppName(appName);
        bbsApp.setAppIcon(appIconFileName);
        bbsApp.setAppType(0);
        bbsApp.setIntroduction(introduction);
        bbsApp.setUserId(ShiroUtils.getUserId());
        bbsApp.setUserName(ShiroUtils.getLoginName());
        bbsApp.setAccount(ShiroUtils.getLoginName());
        bbsApp.setDownloadUrl(downloadUrlFileName);
        bbsApp.setDownloadTimes(0L);
        bbsApp.setCreateBy(ShiroUtils.getLoginName());
        bbsApp.setUpdateBy(ShiroUtils.getLoginName());
        bbsApp.setStatus(status);
        bbsApp.setDelFlag(0);
        bbsApp.setRemark("");
        return toAjax(appService.insertApp(bbsApp));
    }

    /**
     * 修改版块
     */
    @GetMapping("/edit/{appId}")
    public String edit(@PathVariable("appId") Long appId, ModelMap mmap) {
        mmap.put("app", appService.selectAppById(appId));
        return prefix + "/edit";
    }

    /**
     * 修改保存应用
     */
    @RequiresPermissions("bbs:app:edit")
    @Log(title = "应用", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@RequestParam(value = "appIcon", required = false) MultipartFile appIcon,
                               @RequestParam(value = "downloadUrl", required = false) MultipartFile downloadUrl,
                               @RequestParam("appId") Long appId,
                               @RequestParam("appName") String appName,
                               @RequestParam("appVersion") String appVersion,
                               @RequestParam("introduction") String introduction,
                               @RequestParam("status") Integer status) throws IOException {
        BbsApp bbsApp = new BbsApp();
        // 上传文件路径
        String filePath = Global.getUploadPath();
        if (appIcon != null) {
            String appIconFileName = FileUploadUtils.upload(filePath, appIcon);
            bbsApp.setAppIcon(appIconFileName);
        }

        if (downloadUrl != null) {
            String downloadUrlFileName = FileUploadUtils.upload(filePath, downloadUrl);
            bbsApp.setDownloadUrl(downloadUrlFileName);
        }


        bbsApp.setAppId(appId);
        bbsApp.setAppName(appName);
        bbsApp.setAppVersion(appVersion);
        bbsApp.setIntroduction(introduction);
        bbsApp.setStatus(status);
        bbsApp.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(appService.updateApp(bbsApp));
    }


    /**
     * 删除应用
     */
    @RequiresPermissions("bbs:app:remove")
    @Log(title = "应用", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(appService.deleteAppByIds(ids));
    }


    /**
     * 查看应用
     *
     * @param appId
     * @param mmap
     * @return
     */
    @RequiresPermissions("bbs:app:detail")
    @GetMapping("/detail/{appId}")
    public String detail(@PathVariable("appId") Long appId, ModelMap mmap) {
        BbsApp bbsApp = appService.selectAppById(appId);
        mmap.put("bbsApp", bbsApp);
        return prefix + "/detail";
    }

    @RequestMapping(value = "/generateqrcode/{appId}", method = RequestMethod.GET)
    @ResponseBody
    public void generateQRCode4Product(@PathVariable("appId") Long appId, HttpServletResponse response) {
        try {
            String filePath = Global.getProfile();
            BbsApp bbsApp = appService.selectAppById(appId);
            String appIcon = bbsApp.getAppIcon();
            appIcon = appIcon.replaceFirst("/profile", "");
            QRCodeUtils.encode(serverConfig.getUrl() + "/bbs/app/apk/download?appId=" + appId,
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
    @GetMapping("/apk/download")
    public void fileDownload(@RequestParam("appId") Long appId, HttpServletResponse response, HttpServletRequest request) {
        try {
            BbsApp bbsApp = appService.selectAppById(appId);
            String fileName = bbsApp.getDownloadUrl();
            String filePath = Global.getProfile() + fileName.replaceFirst("/profile", "");
            String realFileName = fileName.substring(fileName.lastIndexOf("/") + 1);


            response.setCharacterEncoding("utf-8");
            response.setContentType("multipart/form-data");
            response.setHeader("Content-Disposition",
                    "attachment;fileName=" + FileUtils.setFileDownloadHeader(request, realFileName));
            response.setHeader("Content-Length", "" + new File(filePath).length());
            FileUtils.writeBytes(filePath, response.getOutputStream());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
