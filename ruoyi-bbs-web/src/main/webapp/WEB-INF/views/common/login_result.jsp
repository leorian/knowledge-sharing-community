<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid " style="padding-bottom: 5px;">
    <div class="pull-left">
        <a href="/bbs/index"><h4 class="text text-danger">知识分享社区 <span class="text text-dark"
                                                                       style="font-size: 12px;">欢迎您的到来</span>
        </h4></a>
    </div>
    <c:if test="${bbsSessionUser != null && bbsSessionUser.account != null}">
        <div class="pull-right">
            <span class="label label-success">${bbsSessionUser.userName}</span>
            <c:if test="${bbsSessionUser.userType==0}">
                <span class="label label-dark">普通用户</span>
            </c:if>
            <c:if test="${bbsSessionUser.userType==1}">
                <span class="label label-warning">终身会员</span>
            </c:if>
            <a href="/bbs/logout">
                <span class="label label-danger">退出</span>
            </a>
        </div>
    </c:if>
    <c:if test="${bbsSessionUser == null || bbsSessionUser.account == null}">
        <div class="text-right">
            <a href="/bbs/login">
                <span class="label label-success">登录</span>
            </a>
            <a href="/bbs/register">
                <span class="label label-secondary">注册</span>
            </a>
        </div>
    </c:if>
    <div class="clearfix">
    </div>
</div>