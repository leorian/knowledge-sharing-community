package com.ruoyi.bbs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.bbs.domain.BbsContent;
import com.ruoyi.bbs.domain.BbsFeedback;

import java.util.List;
import java.util.Map;

/**
 * @author xiezhonggui
 */
public interface BbsFeedbackMapper extends BaseMapper<BbsFeedback> {

    /**
     * 新增一条反馈
     *
     * @param feedback
     * @return
     */
    int insertFeedback(BbsFeedback feedback);

    /**
     * 分页查询集合
     *
     * @param queryMap
     * @return
     */
    List<BbsContent> findList(Map<String, Object> queryMap);


    /**
     * 分页查询总数
     *
     * @param queryMap
     * @return
     */
    int getTotal(Map<String, Object> queryMap);

    /**
     * 查询反馈列表
     *
     * @param feedback
     * @return
     */
    List<BbsFeedback> selectFeedbackList(BbsFeedback feedback);

    /**
     * 根据主键查询反馈详情信息
     *
     * @param feedbackId
     * @return
     */
    BbsFeedback selectFeedbackById(Long feedbackId);

    /**
     * 更新一条反馈信息
     *
     * @param feedback
     * @return
     */
    int updateFeedback(BbsFeedback feedback);

    /**
     * 删除反馈信息
     *
     * @param toStrArray
     * @return
     */
    int deleteFeedbackByIds(String[] toStrArray);
}
