package com.ruoyi.bbs.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.bbs.domain.BbsBlock;
import com.ruoyi.bbs.mapper.BbsBlockMapper;
import com.ruoyi.bbs.service.IBbsBlockService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author xiezhonggui
 */
@Service
public class BbsBlockServiceImpl extends ServiceImpl<BbsBlockMapper, BbsBlock> implements IBbsBlockService {

    @Autowired
    private BbsBlockMapper blockMapper;


    @Override
    public List<BbsBlock> selectBlockList(BbsBlock block) {
        return blockMapper.selectBlockList(block);
    }

    @Override
    public int insertBlock(BbsBlock block) {
        return blockMapper.insertBlock(block);
    }

    @Override
    public BbsBlock selectBlockById(Long blockId) {
        return blockMapper.selectBlockById(blockId);
    }

    @Override
    public int updateBlock(BbsBlock block) {
        return blockMapper.updateBlock(block);
    }

    @Override
    public int deleteBlockByIds(String ids) {
        return blockMapper.deleteBlockByIds(Convert.toStrArray(ids));
    }
}
