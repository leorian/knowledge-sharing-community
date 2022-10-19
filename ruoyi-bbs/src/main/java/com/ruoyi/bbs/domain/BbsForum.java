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
@TableName("bbs_forum")
public class BbsForum extends BbsBaseEntity {

    /**
     * 主键ID
     */
    @TableId(value = "forum_id", type = IdType.AUTO)
    private Long forumId;

    /**
     * 主题ID
     */
    private Long topicId;

    /**
     * 主题标题
     */
    private String topicTitle;

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
     * 帖子内容
     */
    private String forumContent;

    /**
     * 发帖时间
     */
    private Date forumTime;

    /**
     * 状态（0正常，1关闭）
     */
    private Integer status;

    /**
     * 是否删除（0否，1是）
     */
    private Integer delFlag;
}
