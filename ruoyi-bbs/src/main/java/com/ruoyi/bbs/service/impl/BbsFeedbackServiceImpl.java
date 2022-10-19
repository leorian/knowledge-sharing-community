package com.ruoyi.bbs.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.bbs.domain.BbsContent;
import com.ruoyi.bbs.domain.BbsFeedback;
import com.ruoyi.bbs.mapper.BbsFeedbackMapper;
import com.ruoyi.bbs.service.IBbsFeedbackService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author xiezhonggui
 */
@Service
public class BbsFeedbackServiceImpl extends ServiceImpl<BbsFeedbackMapper, BbsFeedback> implements IBbsFeedbackService {

    @Autowired
    private BbsFeedbackMapper bbsFeedbackMapper;

    @Override
    public int insertFeedback(BbsFeedback feedback) {
        return bbsFeedbackMapper.insertFeedback(feedback);
    }

    @Override
    public int updateFeedback(BbsFeedback feedback) {
        return bbsFeedbackMapper.updateFeedback(feedback);
    }

    @Override
    public List<BbsContent> findList(Map<String, Object> queryMap) {
        return bbsFeedbackMapper.findList(queryMap);
    }

    @Override
    public int getTotal(Map<String, Object> queryMap) {
        return bbsFeedbackMapper.getTotal(queryMap);
    }

    @Override
    public List<BbsFeedback> selectFeedbackList(BbsFeedback feedback) {
        return bbsFeedbackMapper.selectFeedbackList(feedback);
    }

    @Override
    public BbsFeedback selectFeedbackById(Long feedbackId) {
        return bbsFeedbackMapper.selectFeedbackById(feedbackId);
    }

    @Override
    public int deleteFeedbackByIds(String ids) {
        return bbsFeedbackMapper.deleteFeedbackByIds(Convert.toStrArray(ids));
    }
}
