package com.ruoyi.bbs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.bbs.domain.BbsForum;

import java.util.List;

/**
 * @author xiezhonggui
 */
public interface BbsForumMapper extends BaseMapper<BbsForum> {

    /**
     * 查询论坛帖子列表
     *
     * @param forum 论坛帖子信息
     * @return 论坛帖子集合
     */
    List<BbsForum> selectForumList(BbsForum forum);

    /**
     * 新增论坛用户
     *
     * @param forum 论坛帖子信息
     * @return 结果
     */
    int insertForum(BbsForum forum);

    /**
     * 批量删除论坛帖子
     *
     * @param forumIds 需要删除的数据ID
     * @return 结果
     */
    int deleteForumByIds(String[] forumIds);

    /**
     * 获取帖子总数
     *
     * @return
     */
    Long getForumCount();
}
