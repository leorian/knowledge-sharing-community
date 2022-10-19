package com.ruoyi.bbs.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.bbs.domain.BbsContent;
import com.ruoyi.bbs.mapper.BbsContentMapper;
import com.ruoyi.bbs.service.IBbsContentService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author xiezhonggui
 */
@Service
public class BbsContentServiceImpl extends ServiceImpl<BbsContentMapper, BbsContent> implements IBbsContentService {

    @Autowired
    private BbsContentMapper bbsContentMapper;

    @Override
    public List<BbsContent> selectContentList(BbsContent bbsContent) {
        return bbsContentMapper.selectContentList(bbsContent);
    }

    @Override
    public int insertContent(BbsContent content) {
        return bbsContentMapper.insertContent(content);
    }

    @Override
    public BbsContent selectContentById(Long contentId) {
        return bbsContentMapper.selectContentById(contentId);
    }

    @Override
    public int updateContent(BbsContent content) {
        return bbsContentMapper.updateContent(content);
    }

    @Override
    public int deleteContentByIds(String ids) {
        return bbsContentMapper.deleteContentByIds(Convert.toStrArray(ids));
    }

    @Override
    public List<BbsContent> findList(Map<String, Object> queryMap) {
        return bbsContentMapper.findList(queryMap);
    }

    @Override
    public int getTotal(Map<String, Object> queryMap) {
        return bbsContentMapper.getTotal(queryMap);
    }
}
