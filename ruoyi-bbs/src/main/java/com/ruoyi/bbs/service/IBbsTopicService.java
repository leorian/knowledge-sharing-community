package com.ruoyi.bbs.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.bbs.domain.BbsTopic;

import java.util.List;
import java.util.Map;

/**
 * @author xiezhonggui
 */
public interface IBbsTopicService extends IService<BbsTopic> {
    /**
     * 查询主题列表
     *
     * @param topic 主题信息
     * @return 主题集合
     */
    List<BbsTopic> selectTopicList(BbsTopic topic);

    /**
     * 新增主题
     *
     * @param topic 主题信息
     * @return 结果
     */
    int insertTopic(BbsTopic topic);


    /**
     * 查询主题信息
     *
     * @param topicId 主题ID
     * @return 主题信息
     */
    BbsTopic selectTopicById(Long topicId);

    /**
     * 修改主题
     *
     * @param topic 主题信息
     * @return 结果
     */
    int updateTopic(BbsTopic topic);

    /**
     * 删除主题信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteTopicByIds(String ids);

    /**
     * 分页查询集合
     *
     * @param queryMap
     * @return
     */
    List<BbsTopic> findList(Map<String, Object> queryMap);


    /**
     * 分页查询总数
     *
     * @param queryMap
     * @return
     */
    int getTotal(Map<String, Object> queryMap);

    /**
     * 统计主题的回复数
     *
     * @param topicIds
     * @return
     */
    List<BbsTopic> statisticsForumList(List<Long> topicIds);

    /**
     * 最新资源
     *
     * @return
     */
    List<BbsTopic> newsTopicTop5();

    /**
     * 最新回复
     *
     * @return
     */
    List<BbsTopic> newCommentTopicTop5();

    /**
     * 人气热门
     *
     * @return
     */
    List<BbsTopic> hotTopicTop5();

    /**
     * 标签个数统计
     *
     * @return
     */
    List<BbsTopic> tagCount(Long moduleId);
}
