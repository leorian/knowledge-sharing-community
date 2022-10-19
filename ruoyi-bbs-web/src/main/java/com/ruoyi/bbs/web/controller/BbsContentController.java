package com.ruoyi.bbs.web.controller;

import com.ruoyi.bbs.domain.BbsContent;
import com.ruoyi.bbs.domain.BbsUser;
import com.ruoyi.bbs.service.IBbsContentService;
import com.ruoyi.bbs.web.ContentTypeEnum;
import com.ruoyi.bbs.web.aop.InjectLoginUser;
import com.ruoyi.bbs.web.aop.InjectNowDate;
import com.ruoyi.bbs.web.context.LoginContext;
import com.ruoyi.bbs.web.utils.Page;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @author xiezhonggui
 */
@Controller
@RequestMapping("/content")
public class BbsContentController {

    @Autowired
    private IBbsContentService bbsContentService;

    @Autowired
    private LoginContext loginContext;


    /**
     * 内容首页
     *
     * @return
     */
    @RequestMapping("/index/{contentType}")
    @InjectLoginUser
    @InjectNowDate
    public String contentIndex(@PathVariable("contentType") String contentType, ModelMap modelMap) {
        if (ContentTypeEnum.DATA_MAP.containsKey(contentType)) {
            modelMap.put("contentType", contentType);
            modelMap.put("contentTypeTitle", ContentTypeEnum.DATA_MAP.get(contentType));
        } else {
            modelMap.put("contentType", ContentTypeEnum.BOOK.name().toLowerCase());
            modelMap.put("contentTypeTitle", ContentTypeEnum.DATA_MAP.get(ContentTypeEnum.BOOK.name().toLowerCase()));
        }
        return "context/index";
    }


    /**
     * 获取内容列表
     *
     * @param contentType
     * @param page
     * @return
     */
    @RequestMapping("/content_list/{contentType}")
    @ResponseBody
    public Map<String, Object> getContentList(@PathVariable("contentType") String contentType,
                                              @RequestBody Page page) {
        Map<String, Object> ret = new HashMap<String, Object>(2);
        Map<String, Object> queryMap = new HashMap<String, Object>(4);
        queryMap.put("offset", page.getOffset());
        queryMap.put("pageSize", page.getLimit());
        queryMap.put("contentType", contentType);
        if (!StringUtils.isEmpty(page.getSearchContent())) {
            queryMap.put("contentTitle",page.getSearchContent());
        }

        ret.put("rows", bbsContentService.findList(queryMap));
        ret.put("total", bbsContentService.getTotal(queryMap));
        return ret;
    }


    @RequestMapping("/detail")
    @InjectLoginUser
    @InjectNowDate
    public String detail(@RequestParam("contentId") Long contentId, HttpServletRequest request, ModelMap modelMap) {
        BbsContent bbsContent = bbsContentService.getById(contentId);
        BbsUser bbsUser = loginContext.getCurrentUser(request);
        if (bbsUser == null || bbsUser.getUserType() == 0) {
            bbsContent.setPrivateContent("<p style=\"color:red;\">终身会员可见部分</p>");
        }
        modelMap.put("contentTypeTitle", ContentTypeEnum.DATA_MAP.get(bbsContent.getContentType()));
        modelMap.put("bbsContent", bbsContent);
        return "context/detail";
    }


}
