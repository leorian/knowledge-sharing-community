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
public class LogoutReqDTO implements Serializable {

    /**
     * 账号
     */
    @NotEmpty(message = "账号不能为空")
    private String account;

    /**
     * token
     */
    @NotEmpty(message = "token不能为空")
    private String token;
}
