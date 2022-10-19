package com.ruoyi.bbs.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.bbs.domain.BbsUser;

import java.util.List;

/**
 * @author xiezhonggui
 */
public interface IBbsUserService extends IService<BbsUser> {
    /**
     * 查询论坛用户列表
     *
     * @param user 论坛用户信息
     * @return 论坛用户集合
     */
    List<BbsUser> selectUserList(BbsUser user);


    /**
     * 新增论坛用户
     *
     * @param user 论坛用户信息
     * @return 结果
     */
    int insertUser(BbsUser user);

    /**
     * 查询论坛用户信息
     *
     * @param userId 用户ID
     * @return 版块信息
     */
    BbsUser selectUserById(Long userId);

    /**
     * 查询用户信息
     *
     * @param account
     * @return
     */
    BbsUser selectUserByAccount(String account);


    /**
     * 修改论坛用户
     *
     * @param user 论坛用户信息
     * @return 结果
     */
    int updateUser(BbsUser user);

    /**
     * 删除论坛用户信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteUserByIds(String ids);

    /**
     * 获取用户总数
     *
     * @return
     */
    Long getUserCount(Integer userType);
}
