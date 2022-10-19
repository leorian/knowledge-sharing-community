<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="../common/header.jsp" %>
<style type="text/css">
    .navigation_introduction {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        overflow: hidden;
        margin-top: 5px;
        font-size: 12px;
    }

    .navigation_title {
        padding: 8px;
    }

    .navigation_container {
        border: 1px solid #7c7c7c;
        height: 110px;
    }

    .navigation_img {
        width: 32px;
        height: 32px;
    }
</style>
<div class="lyear-layout-web" style="padding: 15px;">
    <div class="lyear-layout-container">
        <main class="lyear-layout-content">

            <div class="row">
                <%@include file="../common/login_result.jsp" %>
            </div>

            <div class="row">
                <div class="container-fluid">
                    <div class="card">
                        <div class="card-header bg-success">
                            <%@include file="../common/tips.jsp" %>
                            <ul class="card-actions">
                                <li>
                                    <button type="button"><span class="mdi">${now}</span></button>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">

                            <%--智能导航--%>
                            <%@include file="../nav/one.jsp" %>
                            <%--热门项目--%>
                            <%@include file="../nav/two.jsp" %>
                            <%--优秀组织--%>
                            <%@include file="../nav/three.jsp" %>
                            <%--知名论坛--%>
                            <%@include file="../nav/four.jsp" %>
                            <%--在线教育--%>
                            <%@include file="../nav/five.jsp" %>
                            <%--博客社区--%>
                            <%@include file="../nav/six.jsp" %>
                            <%--托管平台--%>
                            <%@include file="../nav/serven.jsp" %>

                            <%@include file="../common/account.jsp" %>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </div>
</div>

<%@include file="../common/footer.jsp" %>