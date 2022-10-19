package com.ruoyi.bbs.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.bbs.domain.BbsThirdUser;
import com.ruoyi.bbs.domain.BbsUser;
import com.ruoyi.bbs.service.IBbsThirdUserService;
import com.ruoyi.bbs.service.IBbsUserService;
import com.ruoyi.bbs.web.context.LoginContext;
import com.ruoyi.bbs.web.utils.Constants;
import com.ruoyi.bbs.web.utils.Result;
import me.zhyd.oauth.config.AuthConfig;
import me.zhyd.oauth.exception.AuthException;
import me.zhyd.oauth.model.AuthCallback;
import me.zhyd.oauth.model.AuthResponse;
import me.zhyd.oauth.model.AuthToken;
import me.zhyd.oauth.model.AuthUser;
import me.zhyd.oauth.request.*;
import me.zhyd.oauth.utils.AuthStateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

/**
 * @author yadong.zhang (yadong.zhang0415(a)gmail.com)
 * @version 1.0
 * @website https://www.zhyd.me
 * @date 2019/2/19 9:28
 * @since 1.8
 */
@RestController
@RequestMapping("/oauth")
public class RestAuthController {

    @Autowired
    private IBbsThirdUserService thirdUserService;

    @Autowired
    private IBbsUserService userService;

    @Autowired
    private LoginContext loginContext;

    @Autowired
    private HttpServletRequest request;


    @RequestMapping("/render/{source}")
    public void renderAuth(@PathVariable("source") String source, HttpServletResponse response) throws IOException {
        System.out.println("进入render：" + source);
        AuthRequest authRequest = getAuthRequest(source);
        String authorizeUrl = authRequest.authorize(AuthStateUtils.createState());
        System.out.println(authorizeUrl);
        response.sendRedirect(authorizeUrl);
    }

    /**
     * oauth平台中配置的授权回调地址，以本项目为例，在创建github授权应用时的回调地址应为：http://127.0.0.1:8443/oauth/callback/github
     */
    @RequestMapping("/callback/{source}")
    public Object login(@PathVariable("source") String source, AuthCallback callback, HttpServletRequest request,
                        HttpServletResponse httpServletResponse) throws IOException {
        System.out.println("进入callback：" + source + " callback params：" + JSONObject.toJSONString(callback));
        AuthRequest authRequest = getAuthRequest(source);
        AuthResponse response = authRequest.login(callback);
        if (response.ok()) {
            AuthUser authUser = (AuthUser) response.getData();
            BbsThirdUser bbsThirdUser = thirdUserService.selectThirdUserByUuidAndSource(authUser.getUuid(),
                    authUser.getSource());
            BbsUser bbsUser = null;
            if (bbsThirdUser != null) {
                //更新账号信息
                bbsThirdUser.setUuid(authUser.getUuid());
                bbsThirdUser.setUsername(authUser.getUsername());
                bbsThirdUser.setNickName(authUser.getNickname());
                bbsThirdUser.setAvatar(authUser.getAvatar());
                bbsThirdUser.setSource(authUser.getSource());
                bbsThirdUser.setAccessToken(authUser.getToken().getAccessToken());
                thirdUserService.updateThirdUser(bbsThirdUser);
                if (bbsThirdUser.getUserId() == null) {
                    return Result.builderErrorMsg("没有找到绑定的用户ID");
                }
                bbsUser = userService.selectUserById(bbsThirdUser.getUserId());
                if (bbsUser == null) {
                    return Result.builderErrorMsg("没有找到绑定的用户信息");
                }
                bbsUser.setUserName(authUser.getSource() + "_" + authUser.getUsername());
                bbsUser.setSex(authUser.getGender().getCode());
                //用户图像
                bbsUser.setUserImage(authUser.getAvatar());
                bbsUser.setUpdateBy("bbs_register" + "_" + authUser.getSource());
                bbsUser.setUpdateTime(new Date());
                userService.updateUser(bbsUser);
            } else {

                //注册账号
                bbsUser = new BbsUser();
                bbsUser.setUserName(authUser.getSource() + "_" + authUser.getUsername());
                bbsUser.setAccount(authUser.getSource() + "_" + authUser.getUuid());
                bbsUser.setPassword("");
                bbsUser.setEmail(authUser.getUuid() + "_" + authUser.getUsername() + "@" + authUser.getSource() + ".com");
                bbsUser.setSex(authUser.getGender().getCode());
                //用户图像
                bbsUser.setUserImage(authUser.getAvatar());
                //用户手机号
                bbsUser.setPhoneNumber("");
                //用户QQ
                bbsUser.setQq("");
                bbsUser.setUserType(0);
                bbsUser.setStatus(0);
                bbsUser.setDelFlag(0);
                bbsUser.setBirthday(new Date());
                bbsUser.setCreateBy("bbs_register" + "_" + authUser.getSource());
                bbsUser.setCreateTime(new Date());
                bbsUser.setUpdateBy("bbs_register" + "_" + authUser.getSource());
                bbsUser.setUpdateTime(new Date());

                bbsThirdUser = new BbsThirdUser();
                bbsThirdUser.setUuid(authUser.getUuid());
                bbsThirdUser.setUsername(authUser.getUsername());
                bbsThirdUser.setNickName(authUser.getNickname());
                bbsThirdUser.setAvatar(authUser.getAvatar());
                bbsThirdUser.setSource(authUser.getSource());
                bbsThirdUser.setAccessToken(authUser.getToken().getAccessToken());
                bbsThirdUser.setStatus(0);
                bbsThirdUser.setDelFlag(0);
                bbsThirdUser.setCreateBy("bbs_register" + "_" + authUser.getSource());
                bbsThirdUser.setCreateTime(new Date());
                bbsThirdUser.setUpdateBy("bbs_register" + "_" + authUser.getSource());
                bbsThirdUser.setUpdateTime(new Date());
                try {
                    thirdUserService.insertThirdUser(bbsThirdUser, bbsUser);
                } catch (Exception e) {
                    e.printStackTrace();
                    return Result.builderErrorMsg("注册异常！");
                }
            }

            String token = UUID.randomUUID().toString();
            loginContext.setCurrentUser(request, bbsUser, token);
            httpServletResponse.sendRedirect("/bbs/index");
        }
        System.out.println(JSONObject.toJSONString(response));
        return response;
    }

    @RequestMapping("/revoke/{source}/{token}")
    public Object revokeAuth(@PathVariable("source") String source, @PathVariable("token") String token) throws IOException {
        AuthRequest authRequest = getAuthRequest(source);
        return authRequest.revoke(AuthToken.builder().accessToken(token).build());
    }

    @RequestMapping("/refresh/{source}")
    public Object refreshAuth(@PathVariable("source") String source, String token) {
        AuthRequest authRequest = getAuthRequest(source);
        return authRequest.refresh(AuthToken.builder().refreshToken(token).build());
    }

    /**
     * 根据具体的授权来源，获取授权请求工具类
     *
     * @param source
     * @return
     */
    private AuthRequest getAuthRequest(String source) {
        AuthRequest authRequest = null;
        switch (source) {
            case "dingtalk":
                authRequest = new AuthDingTalkRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/dingtalk")
                        .build());
                break;
            case "baidu":
                authRequest = new AuthBaiduRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/baidu")
                        .build());
                break;
            case "github":
                authRequest = new AuthGithubRequest(AuthConfig.builder()
                        .clientId("7b258d164ff5299e2990")
                        .clientSecret("840f6ef05849a4ef20992f88c99facf62acb6d4f")
                        .redirectUri(Constants.getDomain(request) + "/oauth/callback/github")
                        .build());
                break;
            case "gitee":
                authRequest = new AuthGiteeRequest(AuthConfig.builder()
                        .clientId("dc14bb076f5e8c5310d253ed97070730a0ba34818333c8b04ef49bcc963b1e81")
                        .clientSecret("45c921c7176ec31476ed9cdf2514f6a1bf8dc0d8439fa6aa53e34aea7936fb1d")
                        .redirectUri(Constants.getDomain(request) + "/oauth/callback/gitee")
                        .build());
                break;
            case "weibo":
                authRequest = new AuthWeiboRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/weibo")
                        .build());
                break;
            case "coding":
                authRequest = new AuthCodingRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/tencentCloud")
                        .build());
                break;
            case "tencentCloud":
                authRequest = new AuthTencentCloudRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/tencentCloud")
                        .build());
                break;
            case "oschina":
                authRequest = new AuthOschinaRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/oschina")
                        .build());
                break;
            case "alipay":
                // 支付宝在创建回调地址时，不允许使用localhost或者127.0.0.1，所以这儿的回调地址使用的局域网内的ip
                authRequest = new AuthAlipayRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .alipayPublicKey("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/alipay")
                        .build());
                break;
            case "qq":
                authRequest = new AuthQqRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/qq")
                        .build());
                break;
            case "wechat":
                authRequest = new AuthWeChatRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/wechat")
                        .build());
                break;
            case "csdn":
                authRequest = new AuthCsdnRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/csdn")
                        .build());
                break;
            case "taobao":
                authRequest = new AuthTaobaoRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/taobao")
                        .build());
                break;
            case "google":
                authRequest = new AuthGoogleRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/google")
                        .build());
                break;
            case "facebook":
                authRequest = new AuthFacebookRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/facebook")
                        .build());
                break;
            case "douyin":
                authRequest = new AuthDouyinRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/douyin")
                        .build());
                break;
            case "linkedin":
                authRequest = new AuthLinkedinRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/linkedin")
                        .build());
                break;
            case "microsoft":
                authRequest = new AuthMicrosoftRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/microsoft")
                        .build());
                break;
            case "mi":
                authRequest = new AuthMiRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/mi")
                        .build());
                break;
            case "toutiao":
                authRequest = new AuthToutiaoRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/toutiao")
                        .build());
                break;
            case "teambition":
                authRequest = new AuthTeambitionRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/teambition")
                        .build());
                break;
            case "pinterest":
                authRequest = new AuthPinterestRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/pinterest")
                        .build());
                break;
            case "renren":
                authRequest = new AuthRenrenRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/teambition")
                        .build());
                break;
            case "stackoverflow":
                authRequest = new AuthStackOverflowRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/login_success")
                        .stackOverflowKey("")
                        .build());
                break;
            case "huawei":
                authRequest = new AuthHuaweiRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/huawei")
                        .build());
                break;
            case "wechatEnterprise":
                authRequest = new AuthHuaweiRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/wechatEnterprise")
                        .agentId("")
                        .build());
                break;
            case "kujiale":
                authRequest = new AuthKujialeRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://127.0.0.1:8443/oauth/callback/kujiale")
                        .build());
                break;
            case "gitlab":
                authRequest = new AuthGitlabRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://localhost:8443/oauth/callback/gitlab")
                        .build());
                break;
            case "meituan":
                authRequest = new AuthMeituanRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://localhost:8443/oauth/callback/meituan")
                        .build());
                break;
            case "eleme":
                authRequest = new AuthElemeRequest(AuthConfig.builder()
                        .clientId("")
                        .clientSecret("")
                        .redirectUri("http://dblog-web.zhyd.me/oauth/callback/eleme")
                        .build());
                break;
            default:
                break;
        }
        if (null == authRequest) {
            throw new AuthException("未获取到有效的Auth配置");
        }
        return authRequest;
    }
}