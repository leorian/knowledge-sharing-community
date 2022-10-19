package com.ruoyi.web.controller.bbs;

import com.ruoyi.bbs.domain.BbsBlock;
import com.ruoyi.bbs.service.IBbsBlockService;
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
@RequestMapping("/bbs/block")
public class BbsBlockController extends BaseController {
    private String prefix = "bbs/block";

    @Autowired
    private IBbsBlockService blockService;

    @RequiresPermissions("bbs:block:view")
    @GetMapping()
    public String block() {
        return prefix + "/block";
    }

    /**
     * 查询公告列表
     */
    @RequiresPermissions("bbs:block:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BbsBlock block) {
        startPage();
        List<BbsBlock> list = blockService.selectBlockList(block);
        return getDataTable(list);
    }

    /**
     * 新增版块
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存版块
     */
    @RequiresPermissions("bbs:block:add")
    @Log(title = "论坛版块", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BbsBlock block) {
        block.setCreateBy(ShiroUtils.getLoginName());
        block.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(blockService.insertBlock(block));
    }

    /**
     * 修改版块
     */
    @GetMapping("/edit/{blockId}")
    public String edit(@PathVariable("blockId") Long blockId, ModelMap mmap) {
        mmap.put("block", blockService.selectBlockById(blockId));
        return prefix + "/edit";
    }

    /**
     * 修改保存版块
     */
    @RequiresPermissions("bbs:block:edit")
    @Log(title = "论坛版块", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BbsBlock block) {
        block.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(blockService.updateBlock(block));
    }

    /**
     * 删除版块
     */
    @RequiresPermissions("bbs:block:remove")
    @Log(title = "论坛版块", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(blockService.deleteBlockByIds(ids));
    }
}
