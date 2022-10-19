package com.ruoyi.bbs.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.bbs.domain.BbsForum;
import com.ruoyi.bbs.mapper.BbsForumMapper;
import com.ruoyi.bbs.service.IBbsForumService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author xiezhonggui
 */
@Service
public class BbsForumServiceImpl extends ServiceImpl<BbsForumMapper, BbsForum> implements IBbsForumService {

    @Autowired
    private BbsForumMapper forumMapper;

    @Override
    public List<BbsForum> selectForumList(BbsForum forum) {
        return forumMapper.selectForumList(forum);
    }

    @Override
    public int insertForum(BbsForum forum) {
        return forumMapper.insertForum(forum);
    }

    @Override
    public int deleteForumByIds(String ids) {
        return forumMapper.deleteForumByIds(Convert.toStrArray(ids));
    }

    @Override
    public Long getForumCount() {
        return forumMapper.getForumCount();
    }
}
