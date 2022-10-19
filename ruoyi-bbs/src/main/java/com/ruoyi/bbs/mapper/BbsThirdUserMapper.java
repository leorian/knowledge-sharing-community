package com.ruoyi.bbs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.bbs.domain.BbsThirdUser;

/**
 * @author xiezhonggui
 */
public interface BbsThirdUserMapper extends BaseMapper<BbsThirdUser> {

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
     * 更新第三方用户
     *
     * @param bbsThirdUser
     */
    void updateThirdUser(BbsThirdUser bbsThirdUser);
}
