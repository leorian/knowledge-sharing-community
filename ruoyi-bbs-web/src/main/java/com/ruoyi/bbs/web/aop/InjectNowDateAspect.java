package com.ruoyi.bbs.web.aop;

import com.ruoyi.bbs.web.context.DateContext;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * @author xiezhonggui
 */
@Aspect
@Component
@Slf4j
public class InjectNowDateAspect {

    @Autowired
    private HttpServletRequest request;


    @Before(value = "@annotation(com.ruoyi.bbs.web.aop.InjectNowDate)")
    public void checkLogin() {
        request.setAttribute("now", DateContext.getCurrentDate());
        log.info("当前时间注入");
    }
}
