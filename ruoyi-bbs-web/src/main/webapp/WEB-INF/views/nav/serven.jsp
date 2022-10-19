<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="card">
    <div class="card-header"><h4><span class="label label-secondary">托管平台</span></h4></div>
    <div class="card-body">
        <div class="row">
            <%--Github 开始--%>
            <div class="col-md-3">
                <a href="https://github.com/" target="_blank" class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/github.jpg"
                                        class="navigation_img"><b class="navigation_title">Github</b>
                                </div>
                                <div class="navigation_introduction">
                                    GitHub是一个面向开源及私有软件项目的托管平台,因为只支持git 作为唯一的版本库格式进行托管,故名GitHub。
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--Github 结束--%>

            <%--码云 开始--%>
            <div class="col-md-3">
                <a href="https://gitee.com/" target="_blank" class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/mayun.svg"
                                        class="navigation_img"><b class="navigation_title">码云</b>
                                </div>
                                <div class="navigation_introduction">
                                    代码托管·协作开发平台，开发者超过 300 万，托管项目超过 500 万，汇聚几乎所有本土原创开源项目，并于 2016
                                    年推出企业版，提供企业级代码托管服务，成为开发领域领先的 SaaS 服务提供商。
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--码云 结束--%>

            <%--Gitlab 开始--%>
            <div class="col-md-3">
                <a href="https://about.gitlab.com/" target="_blank" class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/gitlab.jpg"
                                        class="navigation_img"><b class="navigation_title">Gitlab</b>
                                </div>
                                <div class="navigation_introduction">
                                    GitLab 是一个用于仓库管理系统的开源项目,使用Git作为代码管理工具,并在此基础上搭建起来的web服务。
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--Gitlab 结束--%>

            <%--CODING 开始--%>
            <div class="col-md-3">
                <a href="hhttps://coding.net/" target="_blank" class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/3561610c-0908-49fa-8da2-846777015db1.png"
                                        class="navigation_img"><b class="navigation_title">CODING</b>
                                </div>
                                <div class="navigation_introduction">
                                    一站式 DevOps， 提升研发效能
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--CODING 结束--%>

        </div>

        <div class="row">
            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--Gogs 开始--%>
                <div class="col-md-3">
                    <a href="https://gogs.io" target="_blank" class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/gogs.png"
                                            class="navigation_img"><b class="navigation_title">Gogs</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        A painless self-hosted Git service.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--Gogs 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--Gitea 开始--%>
                <div class="col-md-3">
                    <a href="https://gitea.io/en-us/" target="_blank" class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/12724356.png"
                                            class="navigation_img"><b class="navigation_title">Gitea</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        Git with a cup of tea。
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--Gitea 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--Gitblit 开始--%>
                <div class="col-md-3">
                    <a href="http://www.gitblit.com/" target="_blank" class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/gitblt_25_white.png"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">Gitblit</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        Git with a cup of tea。
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--Gitblit 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>
        </div>
    </div>
</div>