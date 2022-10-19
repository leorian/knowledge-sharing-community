package com.ruoyi.web.controller.bbs;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.ruoyi.bbs.domain.BbsCategory;
import com.ruoyi.bbs.service.IBbsCategoryService;
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


/**
 * @author xiezhonggui
 */
@Controller
@RequestMapping("/bbs/category")
public class BbsCategoryController extends BaseController {
    private String prefix = "bbs/category";

    @Autowired
    private IBbsCategoryService categoryService;

    /**
     * 首页面
     *
     * @return
     */
    @RequiresPermissions("bbs:category:view")
    @GetMapping()
    public String content() {
        return prefix + "/category";
    }

    /**
     * 查询导航分类列表
     */
    @RequiresPermissions("bbs:category:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BbsCategory category) {
        startPage();
        LambdaQueryWrapper<BbsCategory> lambdaQueryWrapper = new LambdaQueryWrapper();
        if (category != null && !StringUtils.isEmpty(category.getCategoryName())) {
            lambdaQueryWrapper.like(BbsCategory::getCategoryName, category.getCategoryName());
        }
        return getDataTable(categoryService.list(lambdaQueryWrapper));
    }

    /**
     * 新增导航分类
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存导航分类
     */
    @RequiresPermissions("bbs:category:add")
    @Log(title = "论坛导航分类", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BbsCategory category) {
        category.setCreateBy(ShiroUtils.getLoginName());
        category.setUpdateBy(ShiroUtils.getLoginName());
        category.setCreateTime(new Date());
        category.setUpdateTime(new Date());
        return toAjax(categoryService.save(category));
    }

    /**
     * 修改导航分类
     */
    @GetMapping("/edit/{categoryId}")
    public String edit(@PathVariable("categoryId") Long categoryId, ModelMap mmap) {
        BbsCategory category = categoryService.getById(categoryId);
        mmap.put("category", category);
        return prefix + "/edit";
    }

    /**
     * 修改保存导航分类
     */
    @RequiresPermissions("bbs:category:edit")
    @Log(title = "论坛导航分类", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BbsCategory category) {
        category.setUpdateBy(ShiroUtils.getLoginName());
        category.setUpdateTime(new Date());
        return toAjax(categoryService.updateById(category));
    }

    /**
     * 删除导航分类
     */
    @RequiresPermissions("bbs:category:remove")
    @Log(title = "论坛导航分类", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(categoryService.removeByIds(CollectionUtils.arrayToList(ids.split(","))));
    }
}
