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
@TableName("bbs_block")
public class BbsBlock extends BbsBaseEntity {

    /**
     * 主键ID
     */
    @TableId(value = "block_id", type = IdType.AUTO)
    private Long blockId;

    /**
     * 版块标题
     */
    private String blockTitle;

    /**
     * 顺序
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



}
