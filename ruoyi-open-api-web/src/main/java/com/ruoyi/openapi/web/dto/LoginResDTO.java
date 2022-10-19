package com.ruoyi.openapi.web.dto;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

/**
 * @author xiezhonggui
 */
@Data
@ToString
public class LoginResDTO implements Serializable {

    /**
     * 账号
     */
    private String account;

    /**
     * token
     */
    private String token;


    /**
     * 个人图像
     */
    private String personalImage;

    /**
     * 简介
     */
    private String introduction;
}
