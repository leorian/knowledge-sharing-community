package com.ruoyi.bbs.web.check;

import com.ruoyi.bbs.web.entity.FeedbackEntity;
import com.ruoyi.bbs.web.entity.ForumEntity;
import com.ruoyi.bbs.web.entity.PasswordEntity;
import com.ruoyi.bbs.web.entity.UserEntity;
import com.ruoyi.bbs.web.utils.Result;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * @author xiezhonggui
 */
public class RequestDtoCheck {

    /**
     * 登录入参验证
     *
     * @param feedback
     * @param captcha
     * @param request
     * @return
     */
    public static Result feedbackAct(FeedbackEntity feedback, String captcha, HttpServletRequest request) {
        if (feedback == null) {
            return Result.builderErrorMsg("请填写反馈信息！");
        }

        if (org.apache.commons.lang.StringUtils.isEmpty(feedback.getFeedbackContent())) {
            return Result.builderErrorMsg("请填写反馈内容！");
        }
        if (org.apache.commons.lang.StringUtils.isEmpty(captcha)) {
            return Result.builderErrorMsg("请填写验证码！");
        }

        Object feedbackCaptcha = request.getSession().getAttribute("feedbackCaptcha");
        if (feedbackCaptcha == null) {
            return Result.builderErrorMsg("会话超时，请刷新页面！");
        }
        if (!captcha.toUpperCase().equals(feedbackCaptcha.toString().toUpperCase())) {
            return Result.builderErrorMsg("验证码错误！");
        }

        return null;
    }

    /**
     * 登录入参验证
     *
     * @param user
     * @param captcha
     * @param request
     * @return
     */
    public static Result loginActCheck(UserEntity user, String captcha, HttpServletRequest request) {
        if (user == null) {
            return Result.builderErrorMsg("请填写用户信息！");
        }
        if (org.apache.commons.lang.StringUtils.isEmpty(captcha)) {
            return Result.builderErrorMsg("请填写验证码！");
        }
        if (org.apache.commons.lang.StringUtils.isEmpty(user.getAccount())) {
            return Result.builderErrorMsg("请填写账号！");
        }
        if (org.apache.commons.lang.StringUtils.isEmpty(user.getPassword())) {
            return Result.builderErrorMsg("请填写密码！");
        }
        Object loginCpacha = request.getSession().getAttribute("loginCaptcha");
        if (loginCpacha == null) {
            return Result.builderErrorMsg("会话超时，请刷新页面！");
        }
        if (!captcha.toUpperCase().equals(loginCpacha.toString().toUpperCase())) {
            return Result.builderErrorMsg("验证码错误！");
        }

        return null;
    }


    /**
     * 修改密码入参验证
     *
     * @param passwordEntity
     * @param captcha
     * @param request
     * @return
     */
    public static Result modifyPasswordActCheck(PasswordEntity passwordEntity, String captcha, HttpServletRequest request) {
        if (passwordEntity == null) {
            return Result.builderErrorMsg("请输入密码相关信息!");
        }

        if (StringUtils.isEmpty(passwordEntity.getOld_password())) {
            return Result.builderErrorMsg("请输入原始密码！");
        }

        if (StringUtils.isEmpty(passwordEntity.getNew_password())) {
            return Result.builderErrorMsg("请输入新密码！");
        }

        if (StringUtils.isEmpty(passwordEntity.getConfirm_new_password())) {
            return Result.builderErrorMsg("请输入确认新密码！");
        }

        if (!passwordEntity.getNew_password().equals(passwordEntity.getConfirm_new_password())) {
            return Result.builderErrorMsg("两次输入的密码不一致！");
        }

        Object modifyPasswordCaptcha = request.getSession().getAttribute("modifyPasswordCaptcha");
        if (modifyPasswordCaptcha == null) {
            return Result.builderErrorMsg("会话超时，请刷新页面！");
        }
        if (!captcha.toUpperCase().equals(modifyPasswordCaptcha.toString().toUpperCase())) {
            return Result.builderErrorMsg("验证码错误！");
        }

        return null;
    }

    /**
     * 注册入参验证
     *
     * @param user
     * @param captcha
     * @param request
     * @return
     */
    public static Result registerActCheck(UserEntity user, String captcha, HttpServletRequest request) {
        if (user == null) {
            return Result.builderErrorMsg("请填写用户信息！");
        }
        if (org.apache.commons.lang.StringUtils.isEmpty(captcha)) {
            return Result.builderErrorMsg("请填写验证码！");
        }
        if (org.apache.commons.lang.StringUtils.isEmpty(user.getUsername())) {
            return Result.builderErrorMsg("请填写用户名！");
        }

        if (org.apache.commons.lang.StringUtils.isEmpty(user.getAccount())) {
            return Result.builderErrorMsg("请填写账号！");
        }
        if (org.apache.commons.lang.StringUtils.isEmpty(user.getPassword())) {
            return Result.builderErrorMsg("请填写密码！");
        }

        if (org.apache.commons.lang.StringUtils.isEmpty(user.getEmail())) {
            return Result.builderErrorMsg("请填写邮箱！");
        }

        Object registerCaptcha = request.getSession().getAttribute("registerCaptcha");
        if (registerCaptcha == null) {
            return Result.builderErrorMsg("会话超时，请刷新页面！");
        }
        if (!captcha.toUpperCase().equals(registerCaptcha.toString().toUpperCase())) {
            return Result.builderErrorMsg("验证码错误！");
        }


        if (user.getSex() != 0 && user.getSex() != 1) {
            return Result.builderErrorMsg("性别不合法！");
        }
        return null;
    }


    /**
     * 回复主题入参验证
     *
     * @param forum
     * @param captcha
     * @param request
     * @return
     */
    public static Result commentActCheck(ForumEntity forum, String captcha, HttpServletRequest request) {

        if (org.apache.commons.lang.StringUtils.isEmpty(captcha)) {
            return Result.builderErrorMsg("请填写验证码！");
        }

        Object registerCaptcha = request.getSession().getAttribute("commentCaptcha");
        if (registerCaptcha == null) {
            return Result.builderErrorMsg("会话超时，请刷新页面！");
        }
        if (!captcha.toUpperCase().equals(registerCaptcha.toString().toUpperCase())) {
            return Result.builderErrorMsg("验证码错误！");
        }

        if (forum == null) {
            return Result.builderErrorMsg("请填写回复信息！");
        }

        if (forum.getTopicId() == null) {
            return Result.builderErrorMsg("请确认回复主题！");
        }

        if (StringUtils.isEmpty(forum.getForumContent()) || forum.getForumContent().length() < 5) {
            return Result.builderErrorMsg("请填写回复内容！");
        }

        return null;
    }

    /**
     * 上传应用入参验证
     *
     * @return
     */
    public static Result uploadActCheck(Long appId, String captcha, MultipartFile appIcon,
                                        MultipartFile downloadUrl, MultipartFile[] remark,
                                        String appName, String appVersion, String introduction,
                                        HttpServletRequest request) {


        if (org.apache.commons.lang.StringUtils.isEmpty(captcha)) {
            return Result.builderErrorMsg("请填写验证码！");
        }

        Object appCaptcha = request.getSession().getAttribute("appCaptcha");
        if (appCaptcha == null) {
            return Result.builderErrorMsg("会话超时，请刷新页面！");
        }
        if (!captcha.toUpperCase().equals(appCaptcha.toString().toUpperCase())) {
            return Result.builderErrorMsg("验证码错误！");
        }

        if (StringUtils.isEmpty(appName)) {
            return Result.builderErrorMsg("应用名称不能为空！");
        }

        if (StringUtils.isEmpty(appVersion)) {
            return Result.builderErrorMsg("应用版本号不能为空！");
        }

        if (StringUtils.isEmpty(introduction)) {
            return Result.builderErrorMsg("应用简介不能为空！");
        }

        if (appId == null) {
            //上传
            if (appIcon == null) {
                return Result.builderErrorMsg("应用图标不能为空！");
            }

            if (downloadUrl == null) {
                return Result.builderErrorMsg("APK文件不能为空！");
            }

            if (remark == null || remark.length == 0) {
                return Result.builderErrorMsg("应用截图不能为空！");
            }
        }

        return null;
    }
}
