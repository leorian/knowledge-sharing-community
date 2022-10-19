package com.ruoyi.bbs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.bbs.domain.BbsBlock;

import java.util.List;

/**
 * @author xiezhonggui
 */
public interface BbsBlockMapper extends BaseMapper<BbsBlock> {

    /**
     * 查询版块列表
     *
     * @param block 版块信息
     * @return 版块集合
     */
    List<BbsBlock> selectBlockList(BbsBlock block);


    /**
     * 新增版块
     *
     * @param block 版块信息
     * @return 结果
     */
    int insertBlock(BbsBlock block);


    /**
     * 查询版块信息
     *
     * @param blockId 版块ID
     * @return 版块信息
     */
    BbsBlock selectBlockById(Long blockId);

    /**
     * 修改版块
     *
     * @param block 版块信息
     * @return 结果
     */
    int updateBlock(BbsBlock block);

    /**
     * 批量删除版块
     *
     * @param blockIds 需要删除的数据ID
     * @return 结果
     */
    int deleteBlockByIds(String[] blockIds);
}
