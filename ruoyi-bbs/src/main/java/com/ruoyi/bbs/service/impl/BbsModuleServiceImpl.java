package com.ruoyi.bbs.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.bbs.domain.BbsModule;
import com.ruoyi.bbs.mapper.BbsModuleMapper;
import com.ruoyi.bbs.service.IBbsModuleService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author xiezhonggui
 */
@Service
public class BbsModuleServiceImpl extends ServiceImpl<BbsModuleMapper, BbsModule> implements IBbsModuleService {

    @Autowired
    private BbsModuleMapper moduleMapper;

    @Override
    public List<BbsModule> selectModuleList(BbsModule module) {
        return moduleMapper.selectModuleList(module);
    }

    @Override
    public List<BbsModule> statisticsModuleList(BbsModule module) {
        return moduleMapper.statisticsModuleList(module);
    }

    @Override
    public List<BbsModule> statisticsModuleForumList(BbsModule module) {
        return moduleMapper.statisticsModuleForumList(module);
    }

    @Override
    public int insertModule(BbsModule module) {
        return moduleMapper.insertModule(module);
    }

    @Override
    public BbsModule selectModuleById(Long moduleId) {
        return moduleMapper.selectModuleById(moduleId);
    }

    @Override
    public int updateModule(BbsModule module) {
        return moduleMapper.updateModule(module);
    }

    @Override
    public int deleteModuleByIds(String ids) {
        return moduleMapper.deleteModuleByIds(Convert.toStrArray(ids));
    }

    @Override
    public List<Long> getModuleIdListByBlockId(Long blockId) {
        return moduleMapper.getModuleIdListByBlockId(blockId);
    }
}
