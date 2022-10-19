package com.ruoyi.bbs.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.bbs.domain.BbsApp;
import com.ruoyi.bbs.mapper.BbsAppMapper;
import com.ruoyi.bbs.service.IBbsAppService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author xiezhonggui
 */
@Service
public class BbsAppServiceImpl extends ServiceImpl<BbsAppMapper, BbsApp> implements IBbsAppService {

    @Autowired
    private BbsAppMapper appMapper;

    @Override
    public List<BbsApp> selectAppList(BbsApp app) {
        return appMapper.selectAppList(app);
    }

    @Override
    public int insertApp(BbsApp app) {
        return appMapper.insertApp(app);
    }

    @Override
    public BbsApp selectAppById(Long appId) {
        return appMapper.selectAppById(appId);
    }

    @Override
    public int updateApp(BbsApp app) {
        return appMapper.updateApp(app);
    }

    @Override
    public int deleteAppByIds(String ids) {
        return appMapper.deleteAppByIds(Convert.toStrArray(ids));
    }

    @Override
    public int plusOneDownloadTimes(Long appId) {
        return appMapper.plusOneDownloadTimes(appId);
    }
}
