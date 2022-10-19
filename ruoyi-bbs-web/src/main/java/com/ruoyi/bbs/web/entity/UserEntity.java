package com.ruoyi.bbs.web.entity;


import lombok.Data;
import lombok.ToString;

/**
 * 用户实体类
 *
 * @author xiezhonggui
 */
@Data
@ToString
public class UserEntity {

    /**
     * 用户id，设置自增
     */
    private Long id;

    /**
     * 用户名
     */
    private String username;

    /**
     * 账号，登录名
     */
    private String account;

    /**
     * 登录密码
     */
    private String password;

    /**
     * 所属角色id
     */
    private Long roleId;

    /**
     * 头像照片地址
     */
    private String photo;

    /**
     * 性别0,代表未知，1代表男，2代表女
     */
    private int sex;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 家庭住址
     */
    private String address;

    /**
     * 邮箱
     */
    private String email;
}
