package com.ruoyi.web.controller.bbs;

import com.ruoyi.bbs.domain.BbsContent;
import com.ruoyi.bbs.service.IBbsContentService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.framework.util.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author xiezhonggui
 */
@Controller
@RequestMapping("/bbs/content")
public class BbsContentController extends BaseController {
    private String prefix = "bbs/content";

    @Autowired
    private IBbsContentService contentService;

    /**
     * 首页面
     *
     * @return
     */
    @RequiresPermissions("bbs:content:view")
    @GetMapping()
    public String content() {
        return prefix + "/content";
    }

    /**
     * 查询内容列表
     */
    @RequiresPermissions("bbs:content:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BbsContent content) {
        startPage();
        List<BbsContent> list = contentService.selectContentList(content);
        return getDataTable(list);
    }

    /**
     * 新增内容
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存内容
     */
    @RequiresPermissions("bbs:content:add")
    @Log(title = "论坛内容", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BbsContent content) {
        content.setCreateBy(ShiroUtils.getLoginName());
        content.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(contentService.insertContent(content));
    }

    /**
     * 修改内容
     */
    @GetMapping("/edit/{contentId}")
    public String edit(@PathVariable("contentId") Long contentId, ModelMap mmap) {
        BbsContent content = contentService.selectContentById(contentId);
        mmap.put("content", content);
        return prefix + "/edit";
    }

    /**
     * 修改保存内容
     */
    @RequiresPermissions("bbs:content:edit")
    @Log(title = "论坛内容", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BbsContent content) {
        content.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(contentService.updateContent(content));
    }

    /**
     * 删除内容
     */
    @RequiresPermissions("bbs:content:remove")
    @Log(title = "论坛内容", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(contentService.deleteContentByIds(ids));
    }
}
