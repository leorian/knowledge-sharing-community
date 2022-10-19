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

                            <div class="card">
                                <div class="card-header"><h4><span class="label label-secondary">修改应用</span></h4></div>
                                <div class="card-body">
                                    <form class="form-horizontal" id="formAppUpload" name="formAppUpload">
                                        <input type="hidden" id="appId" name="appId" value="${bbsApp.appId}"/>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="appName">应用名称</label>
                                            <div class="col-md-7">
                                                <input class="form-control" type="text" id="appName" name="appName"
                                                       placeholder="请输入应用名称.." value="${bbsApp.appName}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="appVersion">应用版本</label>
                                            <div class="col-md-7">
                                                <input class="form-control" type="text" id="appVersion"
                                                       name="appVersion"
                                                       placeholder="请输入应用版本.." value="${bbsApp.appVersion}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="appIcon">应用图标</label>
                                            <div class="col-md-5">
                                                <input type="file" id="appIcon" name="appIcon"
                                                       accept=".jpg, .jpeg, .png">
                                            </div>
                                            <div class="col-md-2">
                                                <img src="${bbsApp.appIcon}" style="width: 96px; height: 96px;"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="downloadUrl">APK文件</label>
                                            <div class="col-md-7">
                                                <input type="file" id="downloadUrl" name="downloadUrl" accept=".apk">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="introduction">应用简介</label>
                                            <div class="col-md-7">
                                                <textarea class="form-control" id="introduction" name="introduction"
                                                          rows="6" placeholder="内容..">${bbsApp.introduction}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="introduction">应用截图</label>
                                            <div class="col-md-7">
                                                <input type="file" id="remark" name="remark" multiple="multiple"
                                                       accept=".jpg, .jpeg, .png">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-3">

                                            </div>
                                            <div class="col-md-7">
                                                <div class="row-fluid">
                                                    <c:if test="${appImgPathList != null && fn:length(appImgPathList) >0}">
                                                        <c:forEach items="${appImgPathList}" var="appImgPath">
                                                            <img src="${appImgPath}"
                                                                 style="width: 128px; height: 128px;"/>
                                                        </c:forEach>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="introduction">验证码</label>
                                            <div class="col-md-7">
                                                <div class="col-xs-7">
                                                    <input type="text" id="captcha" name="captcha" class="form-control"
                                                           placeholder="验证码">
                                                    <span class="mdi mdi-check-all form-control-feedback"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-xs-5">
                                                    <%--<img src="../../resources/admin/light/images/captcha.png" class="pull-right" id="captcha" style="cursor: pointer;" onclick="this.src=this.src+'?d='+Math.random();" title="点击刷新" alt="captcha">--%>
                                                    <img id="captcha-img" class="pull-right" title="点击切换验证码"
                                                         style="cursor:pointer;"
                                                         src="/bbs/get_captcha?vl=4&w=150&h=40&type=appCaptcha"
                                                         width="110px" height="30px" onclick="changeCaptcha()">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">上传进度</label>
                                            <div class="col-sm-7">
                                                <div class="progress pull-left">
                                                    <div></div>
                                                </div>
                                                <div class="progress_text pull-left">

                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-md-offset-3">
                                                <a class="btn btn-primary pull-right" onclick="submitHandler()">重新上传</a>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>

                            <%@include file="../common/account.jsp" %>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </div>
</div>
<script type="text/javascript">
    //上传应用
    function submitHandler() {

        var appId = document.formAppUpload.appId.value;
        var appName = document.formAppUpload.appName.value;
        var appVersion = document.formAppUpload.appVersion.value;
        var appIcon = document.formAppUpload.appIcon.files[0];
        var downloadUrl = document.formAppUpload.downloadUrl.files[0];
        var introduction = document.formAppUpload.introduction.value;
        var remark = document.formAppUpload.remark.files;
        var captcha = document.formAppUpload.captcha.value;
        if (appId == null || appId.trim() == '') {
            lightyear.notify('应用ID不能为空!', 'danger', 100);
            return;
        }

        if (captcha == null || captcha.trim() == '') {
            lightyear.notify('验证码不能为空!', 'danger', 100);
            return;
        }
        if (appName == null || appName.trim() == '') {
            lightyear.notify('应用名称不能为空!', 'danger', 100);
            return;
        }
        if (appVersion == null || appVersion.trim() == '') {
            lightyear.notify("应用版本号不能为空！", 'danger', 100);
            return;
        }

        // if (appIcon == null) {
        //     lightyear.notify('应用图标不能为空!', 'danger', 100);
        //     return;
        // }

        // if (downloadUrl == null) {
        //     lightyear.notify('APK文件不能为空!', 'danger', 100);
        //     return;
        // }

        if (introduction == null || introduction.trim() == '') {
            lightyear.notify('应用简介不能为空!', 'danger', 100);
            return;
        }

        // if (remark == null) {
        //     lightyear.notify('应用截图不能为空!', 'danger', 100);
        //     return;
        // }

        var data = new FormData();
        data.append("appId", appId);
        data.append("captcha", captcha);
        data.append("appName", appName);
        data.append("appVersion", appVersion);
        data.append("appIcon", appIcon);
        data.append("downloadUrl", downloadUrl);
        data.append("introduction", introduction);
        for (var i = 0; i < remark.length; i++) {
            data.append("remark", remark[i]);
        }

        $.ajax({
            type: "POST",
            url: "/app/upload",
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            dataType: 'json',
            beforeSend: function () {
                lightyear.loading('show');
            },
            success: function (result) {
                lightyear.loading('hide');
                if (result.type == 'success') {
                    lightyear.notify("上传成功", 'success', 100);
                    window.parent.location = '/app/index';
                } else {
                    lightyear.notify(result.msg, 'danger', 100);
                    $('.progress > div').css('width', "0%");
                    $(".progress_text").text("0%");
                }
            },
            error: function (error) {
                lightyear.loading('hide');
                lightyear.notify("请求异常", 'danger', 100);
                $('.progress > div').css('width', "0%");
                $(".progress_text").text("0%");
            },
            xhr: function () {
                var xhr = new XMLHttpRequest();
                //使用XMLHttpRequest.upload监听上传过程，注册progress事件，打印回调函数中的event事件
                xhr.upload.addEventListener('progress', function (e) {
                    console.log(e);
                    //loaded代表上传了多少
                    //total代表总数为多少
                    var progressRate = (e.loaded / e.total) * 100 + '%';

                    //通过设置进度条的宽度达到效果
                    $('.progress > div').css('width', progressRate);
                    $(".progress_text").text(progressRate);
                });

                return xhr;
            }
        });
    }

    function changeCaptcha() {
        $("#captcha-img").attr("src", '/bbs/get_captcha?vl=4&w=150&h=40&type=appCaptcha&t=' + new Date().getTime());
    }
</script>
<%@include file="../common/footer.jsp" %>