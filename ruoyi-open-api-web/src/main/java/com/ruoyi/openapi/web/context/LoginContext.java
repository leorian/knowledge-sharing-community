package com.ruoyi.openapi.web.context;

import cn.hutool.core.util.IdUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

/**
 * @author xiezhonggui
 */
@Component
public class LoginContext {

    public static final String LOGIN_PREFIX_ACCOUNT = "login_prefix_account_";

    @Autowired
    private RedisTemplate<String, String> redisTemplate;


    /**
     * 登录
     *
     * @param account
     * @return
     */
    public String login(String account) {
        String token = IdUtil.simpleUUID();
        redisTemplate.opsForValue().set(LOGIN_PREFIX_ACCOUNT + account, token);
        return token;
    }

    /**
     * 登录
     *
     * @param account
     * @return
     */
    public boolean logout(String account, String token) {
        String tokenFromDB = redisTemplate.opsForValue().get(LOGIN_PREFIX_ACCOUNT + account);
        if (token.equals(tokenFromDB)) {
            redisTemplate.delete(LOGIN_PREFIX_ACCOUNT + account);
        } else {
            return false;
        }

        return true;
    }
}
