package com.ruoyi.bbs.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.ToString;

/**
 * @author xiezhonggui
 */
@TableName("bbs_link")
@Data
@ToString
public class BbsLink extends BbsBaseEntity {

    /**
     * 主键ID
     */
    @TableId(value = "link_id", type = IdType.AUTO)
    private Long linkId;

    /**
     * 链接名称
     */
    @TableField("link_name")
    private String linkName;

    /**
     * 链接地址
     */
    @TableField("link_url")
    private String linkUrl;

    /**
     * 链接图标
     */
    @TableField("link_image")
    private String linkImage;

    /**
     * 链接内容
     */
    @TableField("link_content")
    private String linkContent;

    /**
     * 分类ID
     */
    @TableField("category_id")
    private Long categoryId;

    /**
     * 分类名称
     */
    @TableField(exist = false)
    private String categoryName;


    /**
     * 是否是VIP
     */
    @TableField("vip")
    private Integer vip;


    /**
     * 状态
     */
    @TableField("status")
    private Integer status;

    /**
     * 删除标志位
     */
    @TableField("del_flag")
    private Integer delFlag;

    /**
     * 是否展示
     */
    @TableField(exist = false)
    private Boolean show;
}
