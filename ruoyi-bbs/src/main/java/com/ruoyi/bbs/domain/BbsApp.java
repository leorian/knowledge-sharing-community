package com.ruoyi.bbs.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.ToString;

/**
 * @author xiezhonggui
 */
@Data
@ToString
@TableName("bbs_app")
public class BbsApp extends BbsBaseEntity {

    /**
     * 应用ID
     */
    @TableId(value = "app_id", type = IdType.AUTO)
    private Long appId;

    /**
     * 应用名称
     */
    private String appName;

    /**
     * 应用图标
     */
    private String appIcon;

    /**
     * 应用类型
     */
    private Integer appType;


    /**
     * 应用版本号
     */
    private String appVersion;

    /**
     * 应用介绍
     */
    private String introduction;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 用户名称
     */
    private String userName;

    /**
     * 账号
     */
    private String account;

    /**
     * 下载地址
     */
    private String downloadUrl;

    /**
     * 下载次数
     */
    private Long downloadTimes;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 是否删除
     */
    private Integer delFlag;


}
