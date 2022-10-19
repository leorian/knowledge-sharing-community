package com.ruoyi.bbs.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.ToString;

import java.util.Date;

/**
 * @author xiezhonggui
 */
@Data
@ToString
@TableName("bbs_user")
public class BbsUser extends BbsBaseEntity {
    /**
     * 主键ID
     */
    @TableId(value = "user_id", type = IdType.AUTO)
    private Long userId;

    /**
     * 用户名称
     */
    private String userName;

    /**
     * 用户图像
     */
    private String userImage = "https://avatar.gitee.com/uploads/enterprise_logo/71961194015.png";

    /**
     * 账号
     */
    private String account;

    /**
     * 密码
     */
    private String password;

    /**
     * 性别（0女，1男）
     */
    private Integer sex;

    /**
     * 出生日期
     */
    private Date birthday;

    /**
     * 手机号码
     */
    private String phoneNumber;

    /**
     * 邮箱
     */
    private String email;

    /**
     * QQ号
     */
    private String qq;

    /**
     * 用户类型（0普通用户，1终身会员）
     */
    private Integer userType;

    /**
     * 状态（0正常，1关闭）
     */
    private Integer status;

    /**
     * 是否删除（0否，1是）
     */
    private Integer delFlag;

}
