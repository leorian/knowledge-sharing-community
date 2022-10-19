package com.ruoyi.bbs.web.entity;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

/**
 * @author xiezhonggui
 */
@Data
@ToString
public class PasswordEntity implements Serializable {

    /**
     * 原始密码
     */
    private String old_password;

    /**
     * 新密码
     */
    private String new_password;

    /**
     * 确认新密码
     */
    private String confirm_new_password;
}
