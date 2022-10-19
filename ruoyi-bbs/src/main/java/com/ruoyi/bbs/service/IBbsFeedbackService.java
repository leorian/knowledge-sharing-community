package com.ruoyi.bbs.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.bbs.domain.BbsContent;
import com.ruoyi.bbs.domain.BbsFeedback;

import java.util.List;
import java.util.Map;

/**
 * @author xiezhonggui
 */
public interface IBbsFeedbackService extends IService<BbsFeedback> {
    /**
     * 新增一条反馈
     *
     * @param feedback
     * @return
     */
    int insertFeedback(BbsFeedback feedback);

    /**
     * 更新一条反馈
     *
     * @param feedback
     * @return
     */
    int updateFeedback(BbsFeedback feedback);

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
     * 删除反馈信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteFeedbackByIds(String ids);
}
