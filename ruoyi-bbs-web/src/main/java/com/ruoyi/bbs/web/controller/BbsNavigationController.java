package com.ruoyi.bbs.web.controller;

import com.ruoyi.bbs.domain.BbsCategory;
import com.ruoyi.bbs.domain.BbsLink;
import com.ruoyi.bbs.domain.BbsUser;
import com.ruoyi.bbs.service.IBbsCategoryService;
import com.ruoyi.bbs.service.IBbsLinkService;
import com.ruoyi.bbs.web.aop.InjectLoginUser;
import com.ruoyi.bbs.web.aop.InjectNowDate;
import com.ruoyi.bbs.web.context.LoginContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @author xiezhonggui
 */
@Controller
@RequestMapping("/navigation")
public class BbsNavigationController {

    @Autowired
    private IBbsCategoryService categoryService;

    @Autowired
    private IBbsLinkService linkService;

    @Autowired
    private LoginContext loginContext;

    /**
     * 导航首页
     *
     * @return
     */
    @RequestMapping("/index")
    @InjectLoginUser
    @InjectNowDate
    public String navigationIndex() {
        return "navigation/index";
    }

    /**
     * 导航首页2
     *
     * @return
     */
    @RequestMapping("/index2")
    @InjectLoginUser
    @InjectNowDate
    public String navigationIndex2(HttpServletRequest request, ModelMap modelMap) {
        BbsUser bbsUser = loginContext.getCurrentUser(request);
        List<BbsCategory> bbsCategoryList = categoryService.list();
        if (!CollectionUtils.isEmpty(bbsCategoryList)) {
            bbsCategoryList.forEach(bbsCategory -> bbsCategory
                    .setBbsLinkList(new ArrayList<>()));
        }
        List<BbsLink> bbsLinkList = linkService.list();
        if (!CollectionUtils.isEmpty(bbsLinkList)) {
            bbsLinkList.forEach(bbsLink -> {
                if (bbsUser != null && bbsUser.getUserType() == 1) {
                    //终身会员
                    bbsLink.setShow(true);
                } else {
                    //普通用户
                    if (bbsLink.getVip() == 1) {
                        bbsLink.setShow(false);
                    } else {
                        bbsLink.setShow(true);
                    }
                }

                bbsCategoryList.forEach(bbsCategory -> {
                    if (bbsLink.getCategoryId().longValue() == bbsCategory.getCategoryId().longValue()) {
                        bbsCategory.getBbsLinkList().add(bbsLink);
                    }
                });
            });
        }

        modelMap.put("bbsCategoryList", bbsCategoryList);
        return "navigation/index2";
    }
}
