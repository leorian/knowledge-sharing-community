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
@TableName("bbs_content")
public class BbsContent extends BbsBaseEntity {

    /**
     * 内容ID
     */
    @TableId(value = "content_id", type = IdType.AUTO)
    private Long contentId;

    /**
     * 内容类型
     */
    private String contentType;

    /**
     * 内容标题
     */
    private String contentTitle;

    /**
     * 公开内容
     */
    private String publicContent;

    /**
     * 私密内容
     */
    private String privateContent;

    /**
     * 主图
     */
    private String mainImage;

    /**
     * 标签
     */
    private String tags;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 是否删除
     */
    private Integer delFlag;
}
