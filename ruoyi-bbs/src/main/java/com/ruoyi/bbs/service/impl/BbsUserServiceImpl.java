package com.ruoyi.bbs.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.bbs.domain.BbsUser;
import com.ruoyi.bbs.mapper.BbsUserMapper;
import com.ruoyi.bbs.service.IBbsUserService;
import com.ruoyi.common.core.text.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author xiezhonggui
 */
@Service
public class BbsUserServiceImpl extends ServiceImpl<BbsUserMapper, BbsUser> implements IBbsUserService {

    @Autowired
    private BbsUserMapper userMapper;

    @Override
    public List<BbsUser> selectUserList(BbsUser user) {
        return userMapper.selectUserList(user);
    }

    @Override
    public int insertUser(BbsUser user) {
        return userMapper.insertUser(user);
    }

    @Override
    public BbsUser selectUserById(Long userId) {
        return userMapper.selectUserById(userId);
    }

    @Override
    public BbsUser selectUserByAccount(String account) {
        BbsUser bbsUser = new BbsUser();
        bbsUser.setAccount(account);
        bbsUser.setEmail(account);
        return userMapper.selectUserByAccount(bbsUser);
    }

    @Override
    public int updateUser(BbsUser user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int deleteUserByIds(String ids) {
        return userMapper.deleteUserByIds(Convert.toStrArray(ids));
    }

    @Override
    public Long getUserCount(Integer userType) {
        return userMapper.getUserCount(userType);
    }
}
