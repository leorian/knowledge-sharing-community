package com.ruoyi.bbs.web.entity;

import lombok.Data;
import lombok.ToString;

/**
 * @author xiezhonggui
 */
@Data
@ToString
public class ForumEntity {

    /**
     * 回复主题ID
     */
    private Long topicId;


    /**
     * 回复内容
     */
    private String forumContent;

}
