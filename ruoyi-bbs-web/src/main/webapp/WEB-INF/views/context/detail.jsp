<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="../common/header.jsp" %>
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

                            <h3 style="text-align: center">${bbsContent.contentTitle}</h3>
                            <div style="text-align: center"><img style="width: 600px; height: 300px;"
                                                                 src="${bbsContent.mainImage}"/></div>
                            <br/>
                            <h4 class="label label-dark">内容类型</h4>
                            <div style="margin-left: 25px; margin-top: 15px;">${contentTypeTitle}</div>
                            <br/>
                            <br/>
                            <h4 class="label label-dark">公开内容</h4>
                            <div style="margin-left: 25px; margin-top: 15px;">${bbsContent.publicContent}</div>
                            <br/>
                            <br/>
                            <h4 class="label label-dark">隐藏内容</h4>
                            <div style="margin-left: 25px; margin-top: 15px;">${bbsContent.privateContent}</div>
                            <br/>
                            <br/>

                            <%@include file="../common/account.jsp" %>

                        </div>
                    </div>
                </div>
            </div>

        </main>
    </div>
</div>

<%@include file="../common/footer.jsp" %>