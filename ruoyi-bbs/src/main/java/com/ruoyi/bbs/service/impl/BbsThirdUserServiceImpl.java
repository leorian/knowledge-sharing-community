package com.ruoyi.bbs.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.bbs.domain.BbsThirdUser;
import com.ruoyi.bbs.domain.BbsUser;
import com.ruoyi.bbs.mapper.BbsThirdUserMapper;
import com.ruoyi.bbs.mapper.BbsUserMapper;
import com.ruoyi.bbs.service.IBbsThirdUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author xiezhonggui
 */
@Service
public class BbsThirdUserServiceImpl extends ServiceImpl<BbsThirdUserMapper, BbsThirdUser> implements IBbsThirdUserService {

    @Autowired
    private BbsThirdUserMapper bbsThirdUserMapper;

    @Autowired
    private BbsUserMapper bbsUserMapper;

    @Override
    public BbsThirdUser selectThirdUserByUuidAndSource(String uuid, String source) {
        BbsThirdUser bbsThirdUser = new BbsThirdUser();
        bbsThirdUser.setUuid(uuid);
        bbsThirdUser.setSource(source);
        return bbsThirdUserMapper.selectThirdUserByUuidAndSource(bbsThirdUser);
    }

    @Override
    public BbsThirdUser selectThirdUserByUuidAndSource(BbsThirdUser bbsThirdUser) {
        return bbsThirdUserMapper.selectThirdUserByUuidAndSource(bbsThirdUser);
    }

    @Override
    public void insertThirdUser(BbsThirdUser bbsThirdUser) {
        bbsThirdUserMapper.insertThirdUser(bbsThirdUser);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void insertThirdUser(BbsThirdUser bbsThirdUser, BbsUser bbsUser) {
        bbsUserMapper.insertUser(bbsUser);
        bbsThirdUser.setUserId(bbsUser.getUserId());
        bbsThirdUserMapper.insertThirdUser(bbsThirdUser);
    }

    @Override
    public void updateThirdUser(BbsThirdUser bbsThirdUser) {
        bbsThirdUserMapper.updateThirdUser(bbsThirdUser);
    }
}
