package com.ruoyi.web.controller.bbs;

import com.ruoyi.bbs.domain.BbsBlock;
import com.ruoyi.bbs.domain.BbsModule;
import com.ruoyi.bbs.domain.BbsTopic;
import com.ruoyi.bbs.service.IBbsBlockService;
import com.ruoyi.bbs.service.IBbsModuleService;
import com.ruoyi.bbs.service.IBbsTopicService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.framework.util.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author xiezhonggui
 */
@Controller
@RequestMapping("/bbs/topic")
public class BbsTopicController extends BaseController {
    private String prefix = "bbs/topic";

    @Autowired
    private IBbsModuleService moduleService;

    @Autowired
    private IBbsBlockService blockService;

    @Autowired
    private IBbsTopicService topicService;

    @RequiresPermissions("bbs:topic:view")
    @GetMapping()
    public String topic() {
        return prefix + "/topic";
    }

    /**
     * 查询公告列表
     */
    @RequiresPermissions("bbs:topic:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BbsTopic topic) {
        BbsModule bbsModule = new BbsModule();
        Map<Long, String> moduleMap = new HashMap<>();
        if (topic != null && topic.getModuleId() != null) {
            if (topic.getModuleId() == 0) {
                topic.setModuleId(null);
            } else if (topic.getModuleId() < 0) {
                bbsModule.setBlockId(-topic.getModuleId());
                topic.setModuleId(null);
            }
        }
        List<BbsModule> moduleList = moduleService.selectModuleList(bbsModule);
        if (!CollectionUtils.isEmpty(moduleList)) {
            moduleMap = moduleList.stream().collect(Collectors.toMap(BbsModule::getModuleId, BbsModule::getModuleTitle));
            List<Long> moduleIdList = moduleList.stream().map(BbsModule::getModuleId).collect(Collectors.toList());
            topic.setModuleIdList(moduleIdList);
        } else {
            topic.setModuleId(0L);
        }
        startPage();
        List<BbsTopic> list = topicService.selectTopicList(topic);
        for (BbsTopic bbsTopic : list) {
            bbsTopic.setModuleTitle(moduleMap.get(bbsTopic.getModuleId()));
        }
        return getDataTable(list);
    }

    /**
     * 新增主题
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存栏目
     */
    @RequiresPermissions("bbs:topic:add")
    @Log(title = "论坛主题", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BbsTopic topic) {
        topic.setCreateBy(ShiroUtils.getLoginName());
        topic.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(topicService.insertTopic(topic));
    }

    /**
     * 修改主题
     */
    @GetMapping("/edit/{topicId}")
    public String edit(@PathVariable("topicId") Long topicId, ModelMap mmap) {
        BbsTopic topic = topicService.selectTopicById(topicId);
        if (topic != null && topic.getModuleId() != null) {
            BbsModule module = moduleService.selectModuleById(topic.getModuleId());
            if (module != null) {
                topic.setModuleTitle(module.getModuleTitle());
            }
        }
        mmap.put("topic", topic);
        return prefix + "/edit";
    }

    /**
     * 修改保存主题
     */
    @RequiresPermissions("bbs:topic:edit")
    @Log(title = "论坛主题", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BbsTopic topic) {
        topic.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(topicService.updateTopic(topic));
    }

    /**
     * 删除主题
     */
    @RequiresPermissions("bbs:topic:remove")
    @Log(title = "论坛主题", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(topicService.deleteTopicByIds(ids));
    }

    /**
     * 选择论坛版块栏目树
     */
    @GetMapping("/selectBlockAndModuleTree/{moduleId}")
    public String selectDeptTree(@PathVariable("moduleId") Long moduleId, ModelMap mmap) {
        mmap.put("module", moduleService.selectModuleById(moduleId));
        return prefix + "/tree";
    }


    /**
     * 加载版块栏目列表数
     */
    @GetMapping("/treeData")
    @ResponseBody
    public List<Ztree> treeData() {
        List<BbsBlock> blockList = blockService.selectBlockList(new BbsBlock());
        List<BbsModule> moduleList = moduleService.selectModuleList(new BbsModule());
        List<Long> blockIdList = blockList.stream().map(BbsBlock::getBlockId).collect(Collectors.toList());
        moduleList = moduleList.stream().filter(module -> blockIdList.contains(module.getBlockId()))
                .collect(Collectors.toList());
        List<Ztree> ztrees = initZtree(blockList, moduleList);
        return ztrees;
    }

    private List<Ztree> initZtree(List<BbsBlock> blockList, List<BbsModule> moduleList) {
        List<Ztree> ztrees = new ArrayList<Ztree>();
        if (!CollectionUtils.isEmpty(blockList)) {
            for (BbsBlock bbsBlock : blockList) {
                Ztree ztree = new Ztree();
                ztree.setId(-bbsBlock.getBlockId());
                ztree.setpId(0L);
                ztree.setName(bbsBlock.getBlockTitle());
                ztree.setTitle(bbsBlock.getBlockTitle());
                ztrees.add(ztree);
            }
        }

        if (!CollectionUtils.isEmpty(moduleList)) {
            for (BbsModule bbsModule : moduleList) {
                Ztree ztree = new Ztree();
                ztree.setId(bbsModule.getModuleId());
                ztree.setpId(-bbsModule.getBlockId());
                ztree.setName(bbsModule.getModuleTitle());
                ztree.setTitle(bbsModule.getModuleTitle());
                ztrees.add(ztree);
            }
        }

        return ztrees;
    }

}
