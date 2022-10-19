package com.ruoyi.bbs.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.bbs.domain.BbsThirdUser;
import com.ruoyi.bbs.domain.BbsUser;

/**
 * @author xiezhonggui
 */
public interface IBbsThirdUserService extends IService<BbsThirdUser> {

    /**
     * 根据uuid和来源查询第三方登录信息
     *
     * @param uuid
     * @param source
     * @return
     */
    BbsThirdUser selectThirdUserByUuidAndSource(String uuid, String source);

    /**
     * 根据uuid和来源查询第三方登录信息
     *
     * @param bbsThirdUser
     * @return
     */
    BbsThirdUser selectThirdUserByUuidAndSource(BbsThirdUser bbsThirdUser);

    /**
     * 插入第三方用户
     *
     * @param bbsThirdUser
     */
    void insertThirdUser(BbsThirdUser bbsThirdUser);

    /**
     * 插入第三方用户
     *
     * @param bbsThirdUser
     * @param bbsUser
     */
    void insertThirdUser(BbsThirdUser bbsThirdUser, BbsUser bbsUser);

    /**
     * 更新第三方用户
     *
     * @param bbsThirdUser
     */
    void updateThirdUser(BbsThirdUser bbsThirdUser);
}
