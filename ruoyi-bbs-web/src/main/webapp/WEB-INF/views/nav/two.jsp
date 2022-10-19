<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="card">
    <div class="card-header"><h4><span class="label label-secondary">热门项目</span></h4></div>
    <div class="card-body">
        <div class="row">

            <%--Spring 开始--%>
            <div class="col-md-3">
                <a href="https://spring.io/projects" target="_blank" class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/317776.png"
                                        class="navigation_img"><b class="navigation_title">Spring</b>
                                </div>
                                <div class="navigation_introduction">
                                    Spring, SpringBoot, SpringCloud, SpringMVC, SpringIOC, SpringAOP
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--Spring 结束--%>

            <%--Dubbo 开始--%>
            <div class="col-md-3">
                <a href="http://dubbo.apache.org/en-us/" target="_blank"
                   class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/dubbo_colorful.png"
                                        class="navigation_img"><b class="navigation_title">Dubbo</b>
                                </div>
                                <div class="navigation_introduction">
                                    Apache Dubbo™ 是一款高性能Java RPC框架。
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--Dubbo 结束--%>

            <%--SOFAStack 开始--%>
            <div class="col-md-3">
                <a href="https://www.sofastack.tech/" target="_blank"
                   class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/36956638.png"
                                        class="navigation_img"><b class="navigation_title">SOFAStack</b>
                                </div>
                                <div class="navigation_introduction">
                                    金融级分布式架构
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--SOFAStack 结束--%>

            <%--MyBatis 开始--%>
            <div class="col-md-3">
                <a href="https://github.com/mybatis" target="_blank"
                   class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/1483254.png"
                                        class="navigation_img"><b class="navigation_title">MyBatis</b>
                                </div>
                                <div class="navigation_introduction">
                                    MyBatis SQL mapper framework for Java
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--MyBatis 结束--%>

        </div>

        <div class="row">
            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--MyBatis-Plus 开始--%>
                <div class="col-md-3">
                    <a href="https://mybatis.plus/" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/mybatisplus.png"
                                            class="navigation_img"><b class="navigation_title">MyBatis-Plus</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        为简化开发而生
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--MyBatis-Plus 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--Hutool 开始--%>
                <div class="col-md-3">
                    <a href="https://hutool.cn/docs/#/" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/hutool.jpg"
                                            class="navigation_img"><b class="navigation_title">Hutool</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        Hutool是一个Java工具包，也只是一个工具包，它帮助我们简化每一行代码，减少每一个方法，让Java语言也可以“甜甜的”。它最初是作者项目中“util”包的一个整理，后来慢慢积累并加入更多非业务相关功能，并广泛学习其它开源项目精髓，经过自己整理修改，最终形成丰富的开源工具集。
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--Hutool 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--JustAuth 开始--%>
                <div class="col-md-3">
                    <a href="https://docs.justauth.whnb.wang/#/" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/justauth.png"
                                            class="navigation_img"><b class="navigation_title">JustAuth</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        史上最全的整合第三方登录的开源库
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--JustAuth 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--watchdog-framework 开始--%>
                <div class="col-md-3">
                    <a href="https://github.com/watchdog-framework" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/38688212.png"
                                            class="navigation_img"><b class="navigation_title">watchdog</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        watchdog-framework 快速开发脚手架
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--watchdog-framework 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

        </div>

        <div class="row">
            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--ApiBoot 开始--%>
                <div class="col-md-3">
                    <a href="http://apiboot.minbox.io/zh-cn/" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img style="background-color: #7c7c7c"
                                              src="/resources/images/navigation/apiboot-white.png"
                                              class="navigation_img"><b class="navigation_title">ApiBoot</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        基于SpringBoot为接口服务而生，组件化Api的首选落地解决方案
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--ApiBoot 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--hdw-dubbo 开始--%>
                <div class="col-md-3">
                    <a href="https://gitee.com/tumao2/hdw-dubbo" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img src="/resources/images/navigation/hdw-dubbo.png"
                                              class="navigation_img"><b class="navigation_title">hdw-dubbo</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        hdw-dubbo微服务化开发平台，具有统一授权、认证后台管理系统，其中包含具备用户管理、资源权限管理等多个模块，支持多业务系统并行开发，可以作为后端服务的开发脚手架。代码简洁，架构清晰，适合学习和直接项目中使用。
                                        核心技术采用SpringBoot、Dubbo、Mybatis、Mybatis-plus、Druid、Redis、Solr
                                        、ActiveMQ、Quartz、JWT
                                        Token等主要框架和中间件。前端采用vue-element ui组件。
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--hdw-dubbo 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--WxJava 开始--%>
                <div class="col-md-3">
                    <a href="https://gitee.com/binary/weixin-java-tools" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img src="/resources/images/navigation/5303_binary.png"
                                              class="navigation_img"><b class="navigation_title">WxJava</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        WxJava - 微信开发 Java SDK，支持微信支付、开放平台、公众号、企业号/企业微信、小程序等的后端开发
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--WxJava 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--RuoYi 开始--%>
                <div class="col-md-3">
                    <a href="http://www.ruoyi.vip/" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img src="/resources/images/navigation/1151004_y_project.png"
                                              class="navigation_img"><b class="navigation_title">RuoYi</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        基于SpringBoot的权限管理系统 易读易懂、界面简洁美观。 核心技术采用Spring、MyBatis、Shiro没有任何其它重度依赖。直接运行即可用
                                        http://www.ruoyi.vip
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--RuoYi 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

        </div>

        <div class="row">
            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--华夏ERP 开始--%>
                <div class="col-md-3">
                    <a href="https://gitee.com/jishenghua/JSH_ERP" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img style="background-color: #7c7c7c"
                                              src="/resources/images/navigation/852955_jishenghua.png"
                                              class="navigation_img"><b class="navigation_title">华夏ERP</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        华夏ERP基于SpringBoot框架和SaaS模式，立志为中小企业提供开源好用的ERP软件，目前专注进销存+财务功能。主要模块有零售管理、采购管理、销售管理、仓库管理、财务管理、报表查询、系统管理等。支持预付款、收入支出、仓库调拨、组装拆卸、订单等特色功能。拥有库存状况、出入库统计等报表。同时对角色和权限进行了细致全面控制，精确到每个按钮和菜单。
                                        http://www.huaxiaerp.com
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--华夏ERP 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--soul 开始--%>
                <div class="col-md-3">
                    <a href="https://dromara.org/website/zh-cn/" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img style="background-color: #7c7c7c"
                                              src="/resources/images/navigation/soul.png"
                                              class="navigation_img"><b class="navigation_title">soul</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        异步的,高性能的,跨语言的,反应式的API网关。我们希望能够有一样东西像灵魂一样，保护您的微服务
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--soul 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--光年后台管理模板 开始--%>
                <div class="col-md-3">
                    <a href="http://lyear.itshubao.com/" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img style="background-color: #7c7c7c"
                                              src="/resources/images/navigation/guangnian.ico"
                                              class="navigation_img"><b class="navigation_title">光年后台模版</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        光年后台管理模板(Light Year Admin)是一个基于Bootstrap v3.3.7的后台HTML模板。
                                        http://lyear.itshubao.com
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--光年后台管理模板 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--layui 开始--%>
                <div class="col-md-3">
                    <a href="https://www.layui.com" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img style="background-color: #7c7c7c"
                                              src="/resources/images/navigation/layui.png"
                                              class="navigation_img"><b class="navigation_title">layui</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        layui 是一款采用自身模块规范编写的前端 UI 框架，遵循原生 HTML/CSS/JS 的书写与组织形式，门槛极低，拿来即用。
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--layui 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

        </div>

        <div class="row">
            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--zTree 开始--%>
                <div class="col-md-3">
                    <a href="http://www.treejs.cn/v3/main.php#_zTreeInfo" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img style="background-color: #7c7c7c"
                                              src="/resources/images/navigation/zTreeIntroduction.jpg"
                                              class="navigation_img"><b class="navigation_title">zTree</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        zTree 是一个依靠 jQuery 实现的多功能 “树插件”。优异的性能、灵活的配置、多种功能的组合是 zTree 最大优点。
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--zTree 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--docsifyjs 开始--%>
                <div class="col-md-3">
                    <a href="https://github.com/docsifyjs" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img style="background-color: #7c7c7c"
                                              src="/resources/images/navigation/40133106.png"
                                              class="navigation_img"><b class="navigation_title">docsifyjs</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        一个神奇的文档网站生成工具
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--docsifyjs 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>
        </div>
    </div>
</div>