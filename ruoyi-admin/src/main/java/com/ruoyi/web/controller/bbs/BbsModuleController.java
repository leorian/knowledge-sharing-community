package com.ruoyi.web.controller.bbs;

import com.ruoyi.bbs.domain.BbsBlock;
import com.ruoyi.bbs.domain.BbsModule;
import com.ruoyi.bbs.service.IBbsBlockService;
import com.ruoyi.bbs.service.IBbsModuleService;
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
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author xiezhonggui
 */
@Controller
@RequestMapping("/bbs/module")
public class BbsModuleController extends BaseController {
    private String prefix = "bbs/module";

    @Autowired
    private IBbsModuleService moduleService;

    @Autowired
    private IBbsBlockService blockService;

    @RequiresPermissions("bbs:module:view")
    @GetMapping()
    public String module() {
        return prefix + "/module";
    }

    /**
     * 查询公告列表
     */
    @RequiresPermissions("bbs:module:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BbsModule module) {
        startPage();
        List<BbsModule> list = moduleService.selectModuleList(module);
        if (!CollectionUtils.isEmpty(list)) {
            BbsBlock bbsBlock = new BbsBlock();
            bbsBlock.setBlockId(module.getBlockId());
            List<BbsBlock> blockList = blockService.selectBlockList(bbsBlock);
            if (!CollectionUtils.isEmpty(blockList)) {
                Map<Long, String> blockMap = blockList.stream().collect(Collectors.toMap(BbsBlock::getBlockId,
                        BbsBlock::getBlockTitle));
                for (BbsModule bbsModule : list) {
                    bbsModule.setBlockTitle(blockMap.get(bbsModule.getBlockId()));
                }
            }
        }
        return getDataTable(list);
    }

    /**
     * 新增栏目
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存栏目
     */
    @RequiresPermissions("bbs:module:add")
    @Log(title = "版块栏目", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BbsModule module) {
        module.setCreateBy(ShiroUtils.getLoginName());
        module.setUpdateBy(ShiroUtils.getLoginName());
        module.setLastUpdateTime(new Date());
        return toAjax(moduleService.insertModule(module));
    }

    /**
     * 修改栏目
     */
    @GetMapping("/edit/{moduleId}")
    public String edit(@PathVariable("moduleId") Long moduleId, ModelMap mmap) {
        mmap.put("module", moduleService.selectModuleById(moduleId));
        return prefix + "/edit";
    }

    /**
     * 修改保存栏目
     */
    @RequiresPermissions("bbs:module:edit")
    @Log(title = "版块栏目", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BbsModule module) {
        module.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(moduleService.updateModule(module));
    }

    /**
     * 删除栏目
     */
    @RequiresPermissions("bbs:module:remove")
    @Log(title = "版块栏目", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(moduleService.deleteModuleByIds(ids));
    }
}
