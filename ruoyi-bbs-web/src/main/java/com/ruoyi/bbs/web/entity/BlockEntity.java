package com.ruoyi.bbs.web.entity;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

/**
 * @author xiezhonggui
 */
@Data
@ToString
public class BlockEntity implements Serializable {

    /**
     * 版块ID
     */
    private Long blockId;

    /**
     * 版块标题
     */
    private String blockTitle;

    /**
     * 栏目集合
     */
    private List<ModuleEntity> moduleEntityList;
}
