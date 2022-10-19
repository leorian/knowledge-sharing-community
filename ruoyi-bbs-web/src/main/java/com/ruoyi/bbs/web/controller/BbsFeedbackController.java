package com.ruoyi.bbs.web.controller;

import com.ruoyi.bbs.domain.BbsFeedback;
import com.ruoyi.bbs.domain.BbsUser;
import com.ruoyi.bbs.service.IBbsFeedbackService;
import com.ruoyi.bbs.web.check.RequestDtoCheck;
import com.ruoyi.bbs.web.context.LoginContext;
import com.ruoyi.bbs.web.entity.FeedbackEntity;
import com.ruoyi.bbs.web.utils.Page;
import com.ruoyi.bbs.web.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @author xiezhonggui
 */
@Controller
@RequestMapping("/feedback")
public class BbsFeedbackController {

    @Autowired
    private IBbsFeedbackService feedbackService;

    @Autowired
    private LoginContext loginContext;


    /**
     * 反馈表单提交处理控制器
     *
     * @param feedback
     * @param captcha
     * @return
     */
    @RequestMapping(value = "/doFeedback", method = RequestMethod.POST)
    @ResponseBody
    public Result feedbackAct(FeedbackEntity feedback, String captcha, HttpServletRequest request) {
        Result result = RequestDtoCheck.feedbackAct(feedback, captcha, request);
        if (result != null) {
            return result;
        }

        BbsUser bbsUser = loginContext.getCurrentUser(request);
        if (bbsUser == null) {
            return Result.builderErrorMsg("回复之前，请先登录社区账号");
        }

        BbsFeedback bbsFeedback = new BbsFeedback();
        bbsFeedback.setFeedbackContent(feedback.getFeedbackContent());
        bbsFeedback.setFeedbackUserId(bbsUser.getUserId());
        bbsFeedback.setFeedbackAnswer("排队中");
        bbsFeedback.setStatus(0);
        bbsFeedback.setDelFlag(0);
        bbsFeedback.setCreateBy(bbsUser.getAccount());
        bbsFeedback.setUpdateBy(bbsUser.getAccount());
        feedbackService.insertFeedback(bbsFeedback);
        return Result.builderSuccessMsg("反馈成功,谢谢你的反馈，请耐心等待社区的回复！");
    }

    /**
     * 获取反馈内容列表
     *
     * @param page
     * @return
     */
    @RequestMapping("/feedback_list")
    @ResponseBody
    public Map<String, Object> getFeedbackList(@RequestBody Page page, HttpServletRequest request) {
        Map<String, Object> ret = new HashMap<String, Object>(2);
        BbsUser bbsUser = loginContext.getCurrentUser(request);
        if (bbsUser == null) {
            ret.put("rows", new ArrayList<>());
            ret.put("total", 0);
        }

        Map<String, Object> queryMap = new HashMap<String, Object>(4);
        queryMap.put("offset", page.getOffset());
        queryMap.put("pageSize", page.getLimit());
        queryMap.put("feedbackUserId", bbsUser.getUserId());
        ret.put("rows", feedbackService.findList(queryMap));
        ret.put("total", feedbackService.getTotal(queryMap));
        return ret;
    }

}
