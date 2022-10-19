package com.ruoyi.web.controller.bbs;

import com.ruoyi.bbs.domain.BbsFeedback;
import com.ruoyi.bbs.service.IBbsFeedbackService;
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
@RequestMapping("/bbs/feedback")
public class BbsFeedbackController extends BaseController {
    private String prefix = "bbs/feedback";

    @Autowired
    private IBbsFeedbackService feedbackService;

    /**
     * 首页面
     *
     * @return
     */
    @RequiresPermissions("bbs:feedback:view")
    @GetMapping()
    public String feedback() {
        return prefix + "/feedback";
    }

    /**
     * 查询反馈内容列表
     */
    @RequiresPermissions("bbs:feedback:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BbsFeedback feedback) {
        startPage();
        List<BbsFeedback> list = feedbackService.selectFeedbackList(feedback);
        return getDataTable(list);
    }

    /**
     * 修改内容
     */
    @GetMapping("/edit/{feedbackId}")
    public String edit(@PathVariable("feedbackId") Long feedbackId, ModelMap mmap) {
        BbsFeedback feedback = feedbackService.selectFeedbackById(feedbackId);
        mmap.put("feedback", feedback);
        return prefix + "/edit";
    }

    /**
     * 修改保存反馈
     */
    @RequiresPermissions("bbs:feedback:edit")
    @Log(title = "论坛反馈", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BbsFeedback feedback) {
        feedback.setUpdateBy(ShiroUtils.getLoginName());
        feedback.setStatus(1);
        return toAjax(feedbackService.updateFeedback(feedback));
    }

    /**
     * 删除反馈
     */
    @RequiresPermissions("bbs:feedback:remove")
    @Log(title = "论坛反馈", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(feedbackService.deleteFeedbackByIds(ids));
    }
}
