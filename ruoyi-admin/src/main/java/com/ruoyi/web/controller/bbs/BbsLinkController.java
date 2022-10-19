package com.ruoyi.web.controller.bbs;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.ruoyi.bbs.domain.BbsCategory;
import com.ruoyi.bbs.domain.BbsLink;
import com.ruoyi.bbs.service.IBbsCategoryService;
import com.ruoyi.bbs.service.IBbsLinkService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.util.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


/**
 * @author xiezhonggui
 */
@Controller
@RequestMapping("/bbs/link")
public class BbsLinkController extends BaseController {
    private String prefix = "bbs/link";

    @Autowired
    private IBbsLinkService linkService;

    @Autowired
    private IBbsCategoryService categoryService;

    /**
     * 首页面
     *
     * @return
     */
    @RequiresPermissions("bbs:link:view")
    @GetMapping()
    public String content() {
        return prefix + "/link";
    }

    /**
     * 查询导航链接列表
     */
    @RequiresPermissions("bbs:link:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BbsLink link) {
        //分类列表
        final Map<Long, String> categoryIdNameMap = new HashMap<>(0);
        List<BbsCategory> bbsCategoryList = categoryService.list();
        if (!CollectionUtils.isEmpty(bbsCategoryList)) {
            categoryIdNameMap.putAll(bbsCategoryList.stream().collect(Collectors.toMap(BbsCategory::getCategoryId,
                    BbsCategory::getCategoryName)));
        }

        startPage();
        LambdaQueryWrapper<BbsLink> lambdaQueryWrapper = new LambdaQueryWrapper();
        if (link != null && !StringUtils.isEmpty(link.getLinkName())) {
            lambdaQueryWrapper.like(BbsLink::getLinkName, link.getLinkName());
        }

        List<BbsLink> bbsLinks = linkService.list(lambdaQueryWrapper);
        if (!CollectionUtils.isEmpty(bbsLinks)) {
            bbsLinks.forEach(bbsLink -> {
                bbsLink.setCategoryName(categoryIdNameMap.get(bbsLink.getCategoryId()));
            });
        }
        return getDataTable(bbsLinks);
    }

    /**
     * 新增导航链接
     */
    @GetMapping("/add")
    public String add(ModelMap mmap) {
        //分类列表
        List<BbsCategory> bbsCategoryList = categoryService.list();
        mmap.put("bbsCategoryList", bbsCategoryList);
        return prefix + "/add";
    }

    /**
     * 新增保存导航链接
     */
    @RequiresPermissions("bbs:link:add")
    @Log(title = "论坛导航链接", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BbsLink bbsLink) {
        bbsLink.setCreateTime(new Date());
        bbsLink.setUpdateTime(new Date());
        bbsLink.setCreateBy(ShiroUtils.getLoginName());
        bbsLink.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(linkService.save(bbsLink));
    }

    /**
     * 修改导航链接
     */
    @GetMapping("/edit/{linkId}")
    public String edit(@PathVariable("linkId") Long linkId, ModelMap mmap) {
        BbsLink bbsLink = linkService.getById(linkId);
        mmap.put("bbsLink", bbsLink);
        //分类列表
        List<BbsCategory> bbsCategoryList = categoryService.list();
        mmap.put("bbsCategoryList", bbsCategoryList);
        return prefix + "/edit";
    }

    /**
     * 修改保存导航链接
     */
    @RequiresPermissions("bbs:link:edit")
    @Log(title = "论坛导航链接", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BbsLink link) {
        link.setUpdateBy(ShiroUtils.getLoginName());
        link.setUpdateTime(new Date());
        return toAjax(linkService.updateById(link));
    }

    /**
     * 删除导航链接
     */
    @RequiresPermissions("bbs:link:remove")
    @Log(title = "论坛导航链接", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(linkService.removeByIds(CollectionUtils.arrayToList(ids.split(","))));
    }
}
