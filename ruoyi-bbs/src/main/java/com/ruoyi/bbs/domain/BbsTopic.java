package com.ruoyi.bbs.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.ToString;

import java.util.List;

/**
 * @author xiezhonggui
 */
@Data
@ToString
@TableName("bbs_topic")
public class BbsTopic extends BbsBaseEntity {

    /**
     * 主键ID
     */
    @TableId(value = "topic_id", type = IdType.AUTO)
    private Long topicId;

    /**
     * 主题标题
     */
    private String topicTitle;

    /**
     * 主题类型
     */
    private Integer topicType;

    /**
     * 主题主图
     */
    private String topicImage;

    /**
     * 标签
     */
    private String tag;

    /**
     * 公开内容
     */
    private String publicContent;

    /**
     * 私密内容
     */
    private String privateContent;

    /**
     * 栏目ID
     */
    private Long moduleId;

    /**
     * 栏目ID集合
     */
    private List<Long> moduleIdList;

    /**
     * 栏目标题
     */
    private String moduleTitle;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 是否删除
     */
    private Integer delFlag;

    /**
     * 访问人次
     */
    private Long viewCount;

    /**
     * 评论人次
     */
    private Long commentCount;

    /**
     * 标签个数
     */
    private Long tagCount;
}
