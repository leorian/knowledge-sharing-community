package com.ruoyi.framework.web.service;

import com.ruoyi.bbs.domain.BbsBlock;
import com.ruoyi.bbs.service.IBbsBlockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author xiezhonggui
 */
@Service("bbs")
public class BbsService {
    @Autowired
    private IBbsBlockService blockService;

    /**
     * 获取所有的板块信息
     *
     * @return
     */
    public List<BbsBlock> getAllBlockList() {
        BbsBlock bbsBlock = new BbsBlock();
        return blockService.selectBlockList(bbsBlock);
    }

}
