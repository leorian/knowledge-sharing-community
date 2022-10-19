<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                                <div class="card-header"><h4><span class="label label-secondary">推荐应用</span></h4></div>
                                <div class="card-body">
                                    <c:if test="${adminBbsAppList != null}">
                                        <c:forEach items="${adminBbsAppList}" var="adminBbsApp"
                                                   varStatus="j">
                                            <c:if test="${(j.index)%4==0}">
                                                <div class="row">
                                            </c:if>
                                            <div class="col-sm-6 col-lg-3">
                                                <div style="border:1px solid #E3D2AB;padding-top: 8px;padding-bottom: 8px;">
                                                    <div class="col-sm-4 col-lg-4" style="height: 90px;">
                                                <span class="img-avatar img-avatar-48 bg-translucent">
                                                  <img width="48px" height="48px"
                                                       style="border: 2px solid #ffffff; border-radius: 24px"
                                                       src="${adminBbsApp.appIcon}"/>
                                                </span>
                                                    </div>
                                                    <div class="col-sm-8 col-lg-8" style="height: 90px;">
                                                        <p class="h4 text-dark m-t-0">
                                                            <b>${adminBbsApp.appName}</b>
                                                            <span class="text-danger">
                                                    <c:if test="${adminBbsApp.downloadTimes > 0}">
                                                        (${adminBbsApp.downloadTimes})
                                                    </c:if>
                                                </span>
                                                        </p>
                                                        <a href="/app/version/${adminBbsApp.appId}" target="_blank">${adminBbsApp.appVersion}</a>
                                                        <p class="h6 text-dark m-b-0"
                                                           style="font-size: 10px;display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 3;overflow: hidden;">${adminBbsApp.introduction}</p>
                                                    </div>
                                                    <br/>
                                                    <div style="text-align: center">
                                                        <%--<button class="btn btn-xs btn-dark app_modify"--%>
                                                                <%--data-id="${adminBbsApp.appId}" data-name="${adminBbsApp.appName}">--%>
                                                            <%--修改--%>
                                                        <%--</button>--%>
                                                        <button class="btn btn-xs btn-primary app_info"
                                                                data-id="${adminBbsApp.appId}" data-name="${adminBbsApp.appName}">
                                                            预览
                                                        </button>
                                                        <button class="btn btn-xs btn-info app_detail"
                                                                data-id="${adminBbsApp.appId}" data-name="${adminBbsApp.appName}">
                                                            扫码
                                                        </button>
                                                        <%--<button class="btn btn-xs btn-danger app_delete"--%>
                                                                <%--data-id="${adminBbsApp.appId}" data-name="${adminBbsApp.appName}">--%>
                                                            <%--删除--%>
                                                        <%--</button>--%>
                                                    </div>
                                                </div>

                                            </div>
                                            <c:if test="${(j.index+1)%4==0}">
                                                </div>
                                                <br/>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${adminBbsAppList == null}">
                                        <div style="text-align: left">
                                            暂无应用
                                        </div>
                                    </c:if>
                                    <br/>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-header"><h4><span class="label label-secondary">我的应用</span></h4></div>
                                <div class="card-body">
                                    <c:if test="${bbsAppList != null}">
                                        <c:forEach items="${bbsAppList}" var="bbsApp"
                                                   varStatus="j">
                                            <c:if test="${(j.index)%4==0}">
                                                <div class="row">
                                            </c:if>
                                            <div class="col-sm-6 col-lg-3">
                                                <div style="border:1px solid #E3D2AB;padding-top: 8px;padding-bottom: 8px;">
                                                    <div class="col-sm-4 col-lg-4" style="height: 90px;">
                                                <span class="img-avatar img-avatar-48 bg-translucent">
                                                  <img width="48px" height="48px"
                                                       style="border: 2px solid #ffffff; border-radius: 24px"
                                                       src="${bbsApp.appIcon}"/>
                                                </span>
                                                    </div>
                                                    <div class="col-sm-8 col-lg-8" style="height: 90px;">
                                                        <p class="h4 text-dark m-t-0">
                                                            <b>${bbsApp.appName}</b>
                                                            <span class="text-danger">
                                                    <c:if test="${bbsApp.downloadTimes > 0}">
                                                        (${bbsApp.downloadTimes})
                                                    </c:if>
                                                </span>
                                                        </p>
                                                        <a href="/app/version/${bbsApp.appId}" target="_blank">${bbsApp.appVersion}</a>
                                                        <p class="h6 text-dark m-b-0"
                                                           style="font-size: 10px;display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 3;overflow: hidden;">${bbsApp.introduction}</p>
                                                    </div>
                                                    <br/>
                                                    <div style="text-align: center">
                                                        <button class="btn btn-xs btn-dark app_modify"
                                                                data-id="${bbsApp.appId}" data-name="${bbsApp.appName}">
                                                            修改
                                                        </button>
                                                        <button class="btn btn-xs btn-primary app_info"
                                                                data-id="${bbsApp.appId}" data-name="${bbsApp.appName}">
                                                            预览
                                                        </button>
                                                        <button class="btn btn-xs btn-info app_detail"
                                                                data-id="${bbsApp.appId}" data-name="${bbsApp.appName}">
                                                            扫码
                                                        </button>
                                                        <button class="btn btn-xs btn-danger app_delete"
                                                                data-id="${bbsApp.appId}" data-name="${bbsApp.appName}">
                                                            删除
                                                        </button>
                                                    </div>
                                                </div>

                                            </div>
                                            <c:if test="${(j.index+1)%4==0}">
                                                </div>
                                                <br/>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${bbsAppList == null}">
                                        <div style="text-align: left">
                                            暂无应用
                                        </div>
                                    </c:if>
                                    <br/>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-header"><h4><span class="label label-secondary">上传应用</span></h4></div>
                                <div class="card-body">

                                    <form class="form-horizontal" id="formAppUpload" name="formAppUpload">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="appName">应用名称</label>
                                            <div class="col-md-7">
                                                <input class="form-control" type="text" id="appName" name="appName"
                                                       placeholder="请输入应用名称..">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="appVersion">应用版本</label>
                                            <div class="col-md-7">
                                                <input class="form-control" type="text" id="appVersion"
                                                       name="appVersion"
                                                       placeholder="请输入应用版本..">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="appIcon">应用图标</label>
                                            <div class="col-md-7">
                                                <input type="file" id="appIcon" name="appIcon"
                                                       accept=".jpg, .jpeg, .png">
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
                                                          rows="6" placeholder="内容.."></textarea>
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
                                                <a class="btn btn-primary pull-right" onclick="submitHandler()">上传</a>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>

                            <div class="card">
                                <div class="card-header"><h4><span class="label label-secondary">平台公告</span></h4></div>
                                <div class="card-body">
                                    <p>1、本平台只限于AndroidAPP应用分享</p>
                                    <p>2、本平台只开放给<label class="label label-warning">终身会员</label>使用</p>
                                    <p>3、本平台非商业应用分发平台，只提供给用户内测应用分发体验使用，不得用于商业推广，否则后果自己承担</p>
                                    <p>4、请先注册为<label class="label label-dark">普通用户</label>，向以下账户缴纳会员费用<b
                                            style="color: red">(不低于88元)</b>，注明自己的账号，审核通过后，享受社区所有福利。</p>
                                    <p>5、社区会员费用皆用于社区未来发展之用。</p>
                                    <p>6、社区客服微信号：leorain201314</p>
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
        var appName = document.formAppUpload.appName.value;
        var appVersion = document.formAppUpload.appVersion.value;
        var appIcon = document.formAppUpload.appIcon.files[0];
        var downloadUrl = document.formAppUpload.downloadUrl.files[0];
        var introduction = document.formAppUpload.introduction.value;
        var remark = document.formAppUpload.remark.files;
        var captcha = document.formAppUpload.captcha.value;
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

        if (appIcon == null) {
            lightyear.notify('应用图标不能为空!', 'danger', 100);
            return;
        }

        if (downloadUrl == null) {
            lightyear.notify('APK文件不能为空!', 'danger', 100);
            return;
        }

        if (introduction == null || introduction.trim() == '') {
            lightyear.notify('应用简介不能为空!', 'danger', 100);
            return;
        }

        if (remark == null) {
            lightyear.notify('应用截图不能为空!', 'danger', 100);
            return;
        }

        var data = new FormData();
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

    //删除
    $('.app_delete').on('click', function () {
        var dataId = $(this).attr("data-id");
        var dataName = $(this).attr("data-name");
        $.alert({
            title: '删除提示',
            content: '确认删除该【' + dataName + '】应用吗？',
            buttons: {
                confirm: {
                    text: '确认',
                    btnClass: 'btn-primary',
                    action: function () {
                        //$.alert('你点击了确认!' + dataId);
                        $.get("/app/delete", {appId: dataId}, function (data) {
                            if (data.type == "success") {
                                alert(data.msg);
                                window.location.href = "/app/index";
                            } else {
                                alert(data.msg);
                            }
                        });
                    }
                },
                cancel: {
                    text: '取消',
                    action: function () {
                        // $.alert('你点击了取消!');
                    }
                }
            }
        });
    });

    //扫码
    $('.app_detail').on('click', function () {
        var dataId = $(this).attr("data-id");
        var dataName = $(this).attr("data-name");
        $("#myModalLabel").text(dataName);
        $("#myModalImg").attr("src", "/app/generateqrcode/" + dataId);
        $("#myModal").modal('show');
    });

    //预览
    $('.app_info').on('click', function () {
        var dataId = $(this).attr("data-id");
        window.location.href = "/app/detail?appId=" + dataId;
    });

    //修改
    $(".app_modify").on('click', function () {
        var dataId = $(this).attr("data-id");
        window.location.href = "/app/modify?appId=" + dataId;
    });

    function changeCaptcha() {
        $("#captcha-img").attr("src", '/bbs/get_captcha?vl=4&w=150&h=40&type=appCaptcha&t=' + new Date().getTime());
    }
</script>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">标题</h4>
            </div>
            <div class="modal-body" style="text-align: center">
                <img id="myModalImg" src=""/>
                <br/>
                <p>请手机扫描二维码下载APP安装或者另存为图片分享给他人扫码下载安装</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <%--<button type="button" class="btn btn-primary">点击保存</button>--%>
            </div>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp" %>