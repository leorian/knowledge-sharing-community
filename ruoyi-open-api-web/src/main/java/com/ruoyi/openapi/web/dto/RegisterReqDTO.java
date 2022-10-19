package com.ruoyi.openapi.web.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.ToString;
import org.hibernate.validator.constraints.NotEmpty;

import java.io.Serializable;

/**
 * @author xiezhonggui
 */
@Data
@ToString
public class RegisterReqDTO implements Serializable {

    /**
     * 账号
     */
    @NotEmpty(message = "账号不能为空")
    private String account;

    /**
     * 密码
     */
    @NotEmpty(message = "密码不能为空")
    private String password;

    /**
     * 个人图像
     */
    private String personalImage;

    /**
     * 简介
     */
    private String introduction;
}
