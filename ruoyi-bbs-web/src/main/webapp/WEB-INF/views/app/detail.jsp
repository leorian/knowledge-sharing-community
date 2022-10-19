<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../common/header.jsp" %>
<div class="lyear-layout-web" style="padding: 15px;">
    <div class="lyear-layout-container">
        <main class="lyear-layout-content">
            <div class="row">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12 col-lg-12">
                            <div style="border:1px solid #E3D2AB;padding-top: 8px;padding-bottom: 8px;padding-left: 15px;padding-right: 15px;">
                                <c:if test="${bbsApp!=null}">
                                    <div style="text-align: center">
                                        <img width="192px" height="192px"
                                             style="border: 2px solid #ffffff; border-radius: 96px"
                                             src="${bbsApp.appIcon}"/>
                                        <p class="h1 text-dark m-t-0">
                                            <b>${bbsApp.appName}</b>
                                            <span class="text-danger">
                                                    <c:if test="${bbsApp.downloadTimes > 0}">
                                                        (${bbsApp.downloadTimes})
                                                    </c:if>
                                                </span>
                                        </p>
                                        <p class="h3 text-dark m-b-0" style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;${bbsApp.introduction}</p>
                                        <br/>

                                        <button class="btn btn-w-lg btn-info app_download"
                                                style="line-height: 45px; font-size: 30px;"
                                                data-id="${bbsApp.appId}" data-name="${bbsApp.appName}">
                                            下载
                                        </button>
                                        <p>${bbsApp.appVersion}</p>
                                    </div>
                                </c:if>

                                <c:if test="${appImgPathList != null}">
                                    <c:forEach items="${appImgPathList}" var="appImgPath">
                                        <div style="text-align: center; padding-top: 10px; padding-bottom: 10px;">
                                            <img src="${appImgPath}"/>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>

                            <c:if test="${error_msg != null}">
                                <div style="border:1px solid #E3D2AB;padding-top: 8px;padding-bottom: 8px;">
                                    <div style="text-align: center">
                                        <h1>${error_msg}</h1>
                                    </div>
                                </div>
                            </c:if>

                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<script type="text/javascript">
    $('.app_download').on('click', function () {
        var dataId = $(this).attr("data-id");
        window.location.href = "/app/download?appId=" + dataId;
    });
</script>
<%@include file="../common/footer.jsp" %>
