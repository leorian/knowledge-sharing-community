package com.ruoyi.bbs.web;

import java.util.HashMap;
import java.util.Map;

/**
 * @author xiezhonggui
 */
public enum ContentTypeEnum {
    /**
     * 电子书籍
     */
    BOOK,
    /**
     * 视频教程
     */
    VIDEO,
    /**
     * 项目源码
     */
    CODE;

    public static Map<String, String> DATA_MAP = new HashMap<>();

    static {
        DATA_MAP.put(BOOK.name().toLowerCase(), "电子书籍");
        DATA_MAP.put(VIDEO.name().toLowerCase(), "视频教程");
        DATA_MAP.put(CODE.name().toLowerCase(), "项目源码");
    }
}
