package com.ruoyi.bbs.web.context;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author xiezhonggui
 */
public class DateContext {

    /**
     * @return
     */
    public static final String getCurrentDate() {
        //创建一个Date对象，获取当前时间
        Date now = new Date();
        //指定格式化格式
        SimpleDateFormat f = new SimpleDateFormat("yyyy年MM月dd日 E HH时mm分");
        return f.format(now);
    }
}
