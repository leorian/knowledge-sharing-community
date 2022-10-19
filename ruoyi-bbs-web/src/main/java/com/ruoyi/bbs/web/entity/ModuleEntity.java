package com.ruoyi.bbs.web.entity;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

/**
 * @author xiezhonggui
 */
@Data
@ToString
public class ModuleEntity implements Serializable {

    /**
     * 栏目ID
     */
    private Long moduleId;

    /**
     * 栏目标题
     */
    private String moduleTitle;

    /**
     * 栏目图标
     */
    private String moduleIcon;

    /**
     * 主题数量
     */
    private String topicCount;

    /**
     * 帖子数量
     */
    private String forumCount;

    /**
     * 精华帖子数量
     */
    private String goodTopicCount;

    /**
     * 最后发帖时间
     */
    private String forumTime;
}
