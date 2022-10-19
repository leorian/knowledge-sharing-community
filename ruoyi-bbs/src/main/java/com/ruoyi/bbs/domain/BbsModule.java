package com.ruoyi.bbs.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.ToString;

import java.util.Date;

/**
 * @author xiezhonggui
 */
@Data
@ToString
@TableName("bbs_module")
public class BbsModule extends BbsBaseEntity {

    /**
     * 栏目ID
     */
    @TableId(value = "module_id", type = IdType.AUTO)
    private Long moduleId;

    /**
     * 栏目标题
     */
    private String moduleTitle;

    /**
     * 栏目图标
     */
    private String icon;

    /**
     * 所属板块ID
     */
    private Long blockId;

    /**
     * 说书版块标题
     */
    private String blockTitle;

    /**
     * 字段顺序
     */
    private Integer sequence;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 是否删除
     */
    private Integer delFlag;

    /**
     * 主题数量
     */
    private Long topicCount;

    /**
     * 精华主题数量
     */
    private Long goodTopicCount;

    /**
     * 帖子数量
     */
    private Long forumCount;

    /**
     * 最后发表时间
     */
    private Date lastUpdateTime;
}
