package com.ruoyi.bbs.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.bbs.domain.BbsForum;

import java.util.List;

/**
 * @author xiezhonggui
 */
public interface IBbsForumService extends IService<BbsForum> {
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
     * 删除论坛帖子信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteForumByIds(String ids);

    /**
     * 获取帖子总数
     *
     * @return
     */
    Long getForumCount();
}
