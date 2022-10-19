package com.ruoyi.bbs.web.context;

import com.ruoyi.bbs.domain.BbsUser;
import com.ruoyi.bbs.web.utils.Constants;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author xiezhonggui
 */
@Component
public class LoginContext {

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    /**
     * 设置会话
     *
     * @param request
     * @param findByAccount
     * @param token
     */
    public void setCurrentUser(HttpServletRequest request, BbsUser findByAccount, String token) {
        request.getSession().setAttribute(Constants.BBS_SESSION_USER, findByAccount);
        request.getSession().setAttribute(Constants.BBS_SESSION_TOKEN, token);
        redisTemplate.opsForValue().set(findByAccount.getAccount(), token);
    }

    /**
     * 清空会话
     */
    public void clearCurrentUser(HttpServletRequest request, BbsUser bbsUser) {
        HttpSession session = request.getSession();
        session.setAttribute(Constants.BBS_SESSION_USER, null);
        session.setAttribute(Constants.BBS_SESSION_TOKEN, null);
        redisTemplate.delete(bbsUser.getAccount());
    }

    /**
     * 获取当前登录用户
     *
     * @param request
     * @return
     */
    public BbsUser getCurrentUser(HttpServletRequest request) {
        return getCurrentUser(request.getSession());
    }

    public BbsUser getCurrentUser(HttpSession session) {
        BbsUser bbsUser = (BbsUser) session.getAttribute(Constants.BBS_SESSION_USER);
        String tokenFromSession = (String) session.getAttribute(Constants.BBS_SESSION_TOKEN);
        if (bbsUser == null || StringUtils.isEmpty(tokenFromSession)) {
            return null;
        }

        String tokenFromRedis = redisTemplate.opsForValue().get(bbsUser.getAccount());
        if (StringUtils.isEmpty(tokenFromRedis)) {
            return null;
        }

        if (tokenFromRedis.equals(tokenFromSession)) {
            return bbsUser;
        }

        return null;
    }
}
