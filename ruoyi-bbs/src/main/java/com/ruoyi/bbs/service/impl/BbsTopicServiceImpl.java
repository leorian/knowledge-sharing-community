package com.ruoyi.bbs.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.bbs.domain.BbsTopic;
import com.ruoyi.bbs.mapper.BbsTopicMapper;
import com.ruoyi.bbs.service.IBbsTopicService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author xiezhonggui
 */
@Service
public class BbsTopicServiceImpl extends ServiceImpl<BbsTopicMapper, BbsTopic> implements IBbsTopicService {

    @Autowired
    private BbsTopicMapper topicMapper;

    @Override
    public List<BbsTopic> selectTopicList(BbsTopic topic) {
        return topicMapper.selectTopicList(topic);
    }

    @Override
    public int insertTopic(BbsTopic topic) {
        return topicMapper.insertTopic(topic);
    }

    @Override
    public BbsTopic selectTopicById(Long topicId) {
        return topicMapper.selectTopicById(topicId);
    }

    @Override
    public int updateTopic(BbsTopic topic) {
        return topicMapper.updateTopic(topic);
    }

    @Override
    public int deleteTopicByIds(String ids) {
        return topicMapper.deleteTopicByIds(Convert.toStrArray(ids));
    }

    @Override
    public List<BbsTopic> findList(Map<String, Object> queryMap) {
        return topicMapper.findList(queryMap);
    }

    @Override
    public int getTotal(Map<String, Object> queryMap) {
        return topicMapper.getTotal(queryMap);
    }

    @Override
    public List<BbsTopic> statisticsForumList(List<Long> topicIds) {
        return topicMapper.statisticsForumList(topicIds);
    }

    @Override
    public List<BbsTopic> newsTopicTop5() {
        return topicMapper.newsTopicTop5();
    }

    @Override
    public List<BbsTopic> newCommentTopicTop5() {
        return topicMapper.newCommentTopicTop5();
    }

    @Override
    public List<BbsTopic> hotTopicTop5() {
        return topicMapper.hotTopicTop5();
    }

    @Override
    public List<BbsTopic> tagCount(Long moduleId) {
        return topicMapper.tagCount(moduleId);
    }
}
