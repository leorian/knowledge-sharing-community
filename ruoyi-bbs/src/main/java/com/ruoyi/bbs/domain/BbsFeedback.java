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
@TableName("bbs_feedback")
public class BbsFeedback extends BbsBaseEntity {

    /**
     * 反馈主键ID
     */
    @TableId(value = "feedback_id", type = IdType.AUTO)
    private Long feedbackId;

    /**
     * 反馈内容
     */
    private String feedbackContent;

    /**
     * 反馈用户ID
     */
    private Long feedbackUserId;

    /**
     * 回复反馈
     */
    private String feedbackAnswer;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 删除标志位
     */
    private Integer delFlag;

}
