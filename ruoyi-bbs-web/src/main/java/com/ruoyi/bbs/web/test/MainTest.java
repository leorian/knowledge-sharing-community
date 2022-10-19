package com.ruoyi.bbs.web.test;

/**
 * @author xiezhonggui
 */
public class MainTest {
    public static void main(String[] args) {
        Long p1 = 10000L;
        Long p2 = 10000L;
        System.out.println(p1.equals( p2));
        System.out.println(p1.longValue() == p2.longValue());
    }
}
