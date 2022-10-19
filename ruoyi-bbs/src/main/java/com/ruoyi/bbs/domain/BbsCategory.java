package com.ruoyi.bbs.domain;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.ToString;

import java.util.List;

/**
 * @author xiezhonggui
 */
@TableName("bbs_category")
@Data
@ToString
public class BbsCategory extends BbsBaseEntity {

    /**
     * 分类ID
     */
    @TableId(value = "category_id", type = IdType.AUTO)
    private Long categoryId;

    /**
     * 分类名称
     */
    @TableField("category_name")
    private String categoryName;

    /**
     * 分类用途
     */
    @TableField("category_type")
    private String categoryType;

    /**
     * 分类图标
     */
    @TableField("category_image")
    private String categoryImage;

    /**
     * 状态
     */
    @TableField("status")
    private Integer status;

    /**
     * 是否删除
     */
    @TableField("del_flag")
    private Integer delFlag;

    /**
     * 分类下的连接
     */
    @TableField(exist = false)
    private List<BbsLink> bbsLinkList;
}
