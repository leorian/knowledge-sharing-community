package com.ruoyi.bbs.web.utils;

import javax.servlet.http.HttpServletRequest;

/**
 * @author xiezhonggui
 */
public class Constants {
    public static final String BBS_SESSION_USER = "bbs_session_user";
    public static final String BBS_SESSION_TOKEN = "bbs_session_token";

    public static String getDomain(HttpServletRequest request) {
        StringBuffer url = request.getRequestURL();
        String contextPath = request.getServletContext().getContextPath();
        return url.delete(url.length() - request.getRequestURI().length(), url.length()).append(contextPath).toString();
    }
}
