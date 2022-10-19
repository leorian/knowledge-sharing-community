package com.ruoyi.openapi.web.dto;

import lombok.Data;
import lombok.ToString;
import org.hibernate.validator.constraints.NotEmpty;

import java.io.Serializable;

/**
 * @author xiezhonggui
 */
@Data
@ToString
public class LoginReqDTO implements Serializable {

    /**
     * 账号和密码
     */
    @NotEmpty(message = "账号不能为空")
    private String account;


    /**
     * 密码
     */
    @NotEmpty(message = "密码不能为空")
    private String password;
}
