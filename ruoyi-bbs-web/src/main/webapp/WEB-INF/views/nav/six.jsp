<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="card">
    <div class="card-header"><h4><span class="label label-secondary">博客社区</span></h4></div>
    <div class="card-body">
        <div class="row">
            <%--OSCHINA 开始--%>
            <div class="col-md-3">
                <a href="https://www.oschina.net/" target="_blank" class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/logo_osc_new.svg"
                                        class="navigation_img"><b class="navigation_title">OSCHINA</b>
                                </div>
                                <div class="navigation_introduction">
                                    我们一直不遗余力地推动国内开源软件的应用和发展，为本土开源能力的提高、开源生态环境的优化提供长期推进的平台。
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--OSCHINA 结束--%>

            <%--CSDN 开始--%>
            <div class="col-md-3">
                <a href="https://www.csdn.net/" target="_blank" class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/csdn-logo.svg"
                                        class="navigation_img"><b class="navigation_title">CSDN</b>
                                </div>
                                <div class="navigation_introduction">
                                    CSDN使命：成就一亿技术人
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--CSDN 结束--%>

            <%--博客园 开始--%>
            <div class="col-md-3">
                <a href="https://www.cnblogs.com/" target="_blank" class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/bokeyuan.gif"
                                        class="navigation_img"><b class="navigation_title">博客园</b>
                                </div>
                                <div class="navigation_introduction">
                                    博客园创立于2004年1月，是一个面向开发者的知识分享社区。
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--博客园 结束--%>

            <%--简书 开始--%>
            <div class="col-md-3">
                <a href="https://www.jianshu.com" target="_blank" class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/nav-logo-4c7bbafe27adc892f3046e6978459bac.png"
                                        class="navigation_img"><b class="navigation_title">简书</b>
                                </div>
                                <div class="navigation_introduction">
                                    简书是国内最优质的创作社区。
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--简书 结束--%>
        </div>

        <div class="row">
            <%--掘金 开始--%>
            <div class="col-md-3">
                <a href="https://juejin.im/" target="_blank" class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/logo.a7995ad.svg"
                                        class="navigation_img"><b class="navigation_title">掘金</b>
                                </div>
                                <div class="navigation_introduction">
                                    一个帮助开发者成长的社区
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--掘金 结束--%>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--语雀 开始--%>
                <div class="col-md-3">
                    <a href="https://www.yuque.com/" target="_blank" class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/kyjrtmqaKAvzJAaoZfFp.svg"
                                            class="navigation_img"><b class="navigation_title">语雀</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        专业的云端知识库
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--语雀 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>
        </div>
    </div>
</div>