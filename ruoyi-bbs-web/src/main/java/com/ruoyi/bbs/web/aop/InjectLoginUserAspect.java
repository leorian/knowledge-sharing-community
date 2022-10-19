package com.ruoyi.bbs.web.aop;

import com.ruoyi.bbs.domain.BbsUser;
import com.ruoyi.bbs.web.context.LoginContext;
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
public class InjectLoginUserAspect {

    @Autowired
    private LoginContext loginContext;

    @Autowired
    private HttpServletRequest request;


    @Before(value = "@annotation(com.ruoyi.bbs.web.aop.InjectLoginUser)")
    public void checkLogin() {

        BbsUser bbsSessionUser = loginContext.getCurrentUser(request);
        if (bbsSessionUser != null) {
            request.setAttribute("bbsSessionUser", bbsSessionUser);
        }
        log.info("登录状态注入");
    }
}
