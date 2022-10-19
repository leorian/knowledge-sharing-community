package com.ruoyi.bbs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.bbs.domain.BbsUser;

import java.util.List;

/**
 * @author xiezhonggui
 */
public interface BbsUserMapper extends BaseMapper<BbsUser> {
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
     * 根据账号和邮件查询用户
     *
     * @param bbsUser
     * @return
     */
    BbsUser selectUserByAccount(BbsUser bbsUser);

    /**
     * 修改论坛用户
     *
     * @param user 论坛用户信息
     * @return 结果
     */
    int updateUser(BbsUser user);

    /**
     * 批量删除论坛用户
     *
     * @param userIds 需要删除的数据ID
     * @return 结果
     */
    int deleteUserByIds(String[] userIds);

    /**
     * 获取用户总数
     *
     * @return
     */
    Long getUserCount(Integer userType);

}
