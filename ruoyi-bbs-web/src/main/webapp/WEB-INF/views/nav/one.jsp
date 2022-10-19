<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="card">
    <div class="card-header"><h4><span class="label label-secondary">智能导航</span></h4></div>
    <div class="card-body">
        <div class="row">

            <%--程序猿网址导航 开始--%>
            <div class="col-md-3">
                <a href="https://web.hujiangtao.cn/" target="_blank" class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/webcc-logo-001.png"
                                        class="navigation_img"><b class="navigation_title">程序猿网址导航</b>
                                </div>
                                <div class="navigation_introduction">
                                    站内全文检索、站外常用搜索、精品推荐提交、个性化样式定制、实用教程分享、站内互动
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--程序猿网址导航 结束--%>

            <%--设计师网址导航 开始--%>
            <div class="col-md-3">
                <a href="https://webstack.cc/cn/index.html" target="_blank"
                   class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/logo@2x.png"
                                        class="navigation_img"><b class="navigation_title">设计师网址导航</b>
                                </div>
                                <div class="navigation_introduction">
                                    如果你也是设计师，如果你也正好喜欢设计，那希望这个网站能给你带来一些作用。
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--设计师网址导航 结束--%>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--Web前端导航 开始--%>
                <div class="col-md-3">
                    <a href="http://nav.web-hub.cn/" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/front_end_nav_logo.ico"
                                            class="navigation_img"><b class="navigation_title">Web前端导航</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        FrontEndNav 前端网站导航
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--Web前端导航 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <%--极客导航 开始--%>
            <div class="col-md-3">
                <a href="https://www.jikedaohang.com/" target="_blank"
                   class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/jk.png"
                                        class="navigation_img"><b class="navigation_title">极客导航</b>
                                </div>
                                <div class="navigation_introduction">
                                    我有一份学习资料想送给大家，关注 极客导航 公众号，回复[1024]领取。
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--极客导航 结束--%>

        </div>

        <div class="row">

            <%--三旺网址导航 开始--%>
            <div class="col-md-3">
                <a href="http://www.3wfw.com/" target="_blank"
                   class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/spritev5.png"
                                        class="navigation_img"><b class="navigation_title">三旺网址导航</b>
                                </div>
                                <div class="navigation_introduction">
                                    三旺 - 程序员垂直导航
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--三旺网址导航 结束--%>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--高效搜罗 开始--%>
                <div class="col-md-3">
                    <a href="http://www.gaoxiaosouluo.cn/" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/gaoxiaosouluo.png"
                                            class="navigation_img"><b class="navigation_title">高效搜罗</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        高效搜罗，精准的职业导航
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--高效搜罗 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--SpringBoot中文导航 开始--%>
                <div class="col-md-3">
                    <a href="http://springboot.fun/" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/springfun.png"
                                            class="navigation_img"><b class="navigation_title">Spring中文导航</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        Spring Boot 中文索引
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--SpringBoot中文导航 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>
        </div>
    </div>
</div>