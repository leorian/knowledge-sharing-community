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
                            <%--导航展示区--%>
                                <c:forEach items="${bbsCategoryList}" var="bbsCategory">
                                        <div class="card">
                                        <div class="card-header"><h4><span class="label label-secondary">${bbsCategory.categoryName}</span></h4></div>
                                        <div class="card-body">
                                            <c:if test="${!empty bbsCategory.bbsLinkList}">
                                                <c:forEach items="${bbsCategory.bbsLinkList}" var="bbsLink" varStatus="j">
                                                    <c:if test="${(j.index)%4==0}">
                                                        <div class="row">
                                                    </c:if>
                                                    <%--${bbsLink.linkName} 开始--%>
                                                    <c:if test="${bbsLink.show}">
                                                        <div class="col-md-3">
                                                        <a href="${bbsLink.linkUrl}" target="_blank" class="text-dark">
                                                        <div class="card">
                                                        <div class="card-body clearfix navigation_container">
                                                        <div class="pull-left">
                                                        <div>
                                                        <img src="${bbsLink.linkImage}"
                                                        class="navigation_img"><b class="navigation_title">${bbsLink.linkName}</b>
                                                        </div>
                                                        <div class="navigation_introduction">
                                                        ${bbsLink.linkContent}
                                                        </div>
                                                        </div>
                                                        </div>
                                                        </div>
                                                        </a>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${bbsLink.show==false}">
                                                        <%@include file="../nav/vip.jsp" %>
                                                    </c:if>
                                                    <%--${bbsLink.linkName} 结束--%>
                                                    <c:if test="${(j.index+1)%4==0}">
                                                        </div>
                                                        <br/>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </div>
                                        </div>
                                </c:forEach>

                            <%@include file="../common/account.jsp" %>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<%@include file="../common/footer.jsp" %>