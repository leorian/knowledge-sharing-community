<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="card">
    <div class="card-header"><h4><span class="label label-secondary">暗黑论坛</span></h4></div>
    <div class="card-body">
        <div class="row">
            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--我爱学IT 开始--%>
                <div class="col-md-3">
                    <a href="http://www.52studyit.com/" target="_blank" class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/52studyit.png"
                                            class="navigation_img"><b class="navigation_title">我爱学IT</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        论坛已关闭注册, 不再对外开放
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--我爱学IT 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--IT教程吧 开始--%>
                <div class="col-md-3">
                    <a href="https://www.itjc8.com/" target="_blank" class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/itjc8.png"
                                            class="navigation_img"><b class="navigation_title">IT教程吧</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        程序员的新大陆, 更新更快的IT教程网
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--IT教程吧 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--IT自学吧 开始--%>
                <div class="col-md-3">
                    <a href="http://www.zxit8.com" target="_blank" class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/itzxb.png"
                                            class="navigation_img"><b class="navigation_title">IT自学吧</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        自学IT吧是一个分享IT课程资源的学习社区，注重于最新最前沿的IT学习教程的分享，旨在打造一个在线共享IT学习课程和深入交流学习IT技术的主题平台。
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--IT自学吧 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--IT视频学习网 开始--%>
                <div class="col-md-3">
                    <a href="https://www.itspxx.com/" target="_blank" class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/itspxx.png"
                                            class="navigation_img"><b class="navigation_title">IT视频学习网</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        IT视频学习网-免费分享优质资源-程序员的新世界-分享最快的IT学习网
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--IT视频学习网 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>
        </div>

        <div class="row">
            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--脚本之家 开始--%>
                <div class="col-md-3">
                    <a href="https://www.jb51.net/do/book.html" target="_blank" class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/jbzj.gif"
                                            class="navigation_img"><b class="navigation_title">脚本之家</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        最新更新电子书
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--脚本之家 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--自学编程吧 开始--%>
                <div class="col-md-3">
                    <a href="https://www.zxbc8.com/forum.php" target="_blank" class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/zxbc8.png"
                                            class="navigation_img"><b class="navigation_title">自学编程吧</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        自学编程吧论坛一个有价值的IT学习资源分享站,大家一起学习交流讨论和进步！
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--自学编程吧 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>
        </div>
    </div>
</div>
