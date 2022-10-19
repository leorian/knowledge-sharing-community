<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="common/header.jsp" %>
<div class="lyear-layout-web" style="padding: 15px;">
    <div class="lyear-layout-container">
        <main class="lyear-layout-content">

            <div class="row">
                <%@include file="common/login_result.jsp" %>
            </div>

            <div class="row">
                <div class="container-fluid">
                    <div class="card">
                        <div class="card-header bg-success">
                            <%@include file="common/tips.jsp" %>
                            <ul class="card-actions">
                                <li>
                                    <button type="button"><span class="mdi">${now}</span></button>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-header"><h4><span class="label label-secondary">修改密码</span>
                                        </h4></div>
                                        <div class="card-body">
                                            <c:if test="${bbsUser != null}">
                                                <form action="#!" method="post">
                                                    <div class="form-group has-feedback feedback-left">
                                                        <input type="password" placeholder="请输入原始密码"
                                                               class="form-control"
                                                               name="old_password" id="old_password"/>
                                                        <span class="mdi mdi-lock form-control-feedback"
                                                              aria-hidden="true"></span>
                                                    </div>
                                                    <div class="form-group has-feedback feedback-left">
                                                        <input type="password" placeholder="请输入新密码" class="form-control"
                                                               id="new_password" name="new_password"/>
                                                        <span class="mdi mdi-lock form-control-feedback"
                                                              aria-hidden="true"></span>
                                                    </div>
                                                    <div class="form-group has-feedback feedback-left">
                                                        <input type="password" placeholder="请再输入一次新密码"
                                                               class="form-control"
                                                               id="confirm_new_password" name="confirm_new_password"/>
                                                        <span class="mdi mdi-lock form-control-feedback"
                                                              aria-hidden="true"></span>
                                                    </div>
                                                    <div class="form-group has-feedback feedback-left row">
                                                        <div class="col-xs-7">
                                                            <input type="text" id="captcha" name="captcha"
                                                                   class="form-control"
                                                                   placeholder="验证码">
                                                            <span class="mdi mdi-check-all form-control-feedback"
                                                                  aria-hidden="true"></span>
                                                        </div>
                                                        <div class="col-xs-5">
                                                                <%--<img src="../../resources/admin/light/images/captcha.png" class="pull-right" id="captcha" style="cursor: pointer;" onclick="this.src=this.src+'?d='+Math.random();" title="点击刷新" alt="captcha">--%>
                                                            <img id="captcha-img" class="pull-right" title="点击切换验证码"
                                                                 style="cursor:pointer;"
                                                                 src="/bbs/get_captcha?vl=4&w=150&h=40&type=modifyPasswordCaptcha"
                                                                 width="110px" height="30px" onclick="changeCaptcha()">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <button class="btn pull-right btn-danger modify-password-button"
                                                                type="button">确认修改
                                                        </button>
                                                        <div class="clearfix">

                                                        </div>
                                                    </div>
                                                </form>
                                                <p class="pull-right" style="color: red">注意：暂不支持第三方登录的用户修改密码！！！</p>
                                            </c:if>
                                            <c:if test="${msg1_tips != null}">
                                                <h3>${msg1_tips}</h3>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-header"><h4><span class="label label-secondary">反馈意见</span>
                                        </h4></div>
                                        <div class="card-body">
                                            <c:if test="${bbsUser != null}">
                                                <form action="#!" method="post">
                                                    <div class="form-group has-feedback feedback-left">
                                                        <textarea rows="9" placeholder="请输入您的宝贵意见或者进行资源求助"
                                                                  class="form-control"
                                                                  id="feedbackContent"
                                                                  name="feedbackContent"></textarea>
                                                    </div>
                                                    <div class="form-group has-feedback feedback-left row">
                                                        <div class="col-xs-7">
                                                            <input type="text" id="feedbackCaptcha"
                                                                   name="feedbackCaptcha"
                                                                   class="form-control"
                                                                   placeholder="验证码">
                                                            <span class="mdi mdi-check-all form-control-feedback"
                                                                  aria-hidden="true"></span>
                                                        </div>
                                                        <div class="col-xs-5">
                                                                <%--<img src="../../resources/admin/light/images/captcha.png" class="pull-right" id="captcha" style="cursor: pointer;" onclick="this.src=this.src+'?d='+Math.random();" title="点击刷新" alt="captcha">--%>
                                                            <img id="feedbackCaptcha-img" class="pull-right"
                                                                 title="点击切换验证码"
                                                                 style="cursor:pointer;"
                                                                 src="/bbs/get_captcha?vl=4&w=150&h=40&type=feedbackCaptcha"
                                                                 width="110px" height="30px"
                                                                 onclick="changeFeedbackCaptcha()">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <button class="btn pull-right btn-danger do-feedback-button"
                                                                type="button">确认反馈
                                                        </button>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </form>
                                                <p class="pull-right" style="color: red">
                                                    注意：在这里既可以反馈你的宝贵意见也可以进行资源求助！！！</p>
                                            </c:if>
                                            <c:if test="${msg2_tips != null}">
                                                <h3>${msg2_tips}</h3>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header"><h4><span
                                                class="label label-secondary">反馈列表</span>
                                        </h4></div>
                                        <div class="card-body">
                                            <table
                                                    id="table"
                                                    data-toggle="table"
                                            <%--data-height="460"--%>
                                                    data-pagination="true"
                                                    data-method="post"
                                                    data-classes="table table-striped"
                                                    data-side-pagination="server"
                                                    data-url="/feedback/feedback_list">
                                                <thead>
                                                <tr>
                                                    <th data-field="feedbackContent">反馈内容</th>
                                                    <th data-field="feedbackAnswer">社区回复</th>
                                                    <th data-field="createTime">反馈时间</th>
                                                    <th data-field="status" data-formatter="statusFormatter">状态</th>
                                                </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <script type="text/javascript">
                                function statusFormatter(value, row) {
                                    if (value == 0) {
                                        return "<span class='label label-success'>" + "正常" + "</span>";
                                    } else if (value == 1) {
                                        return "<span class='label label-warning'>" + "关闭" + "</span>";
                                    }
                                    return value;
                                }
                            </script>
                            <%@include file="common/account.jsp" %>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </div>
</div>
<script type="text/javascript">
    function changeCaptcha() {
        $("#captcha-img").attr("src", 'get_captcha?vl=4&w=150&h=40&type=modifyPasswordCaptcha&t=' + new Date().getTime());
    }

    function changeFeedbackCaptcha() {
        $("#captcha-img").attr("src", 'get_captcha?vl=4&w=150&h=40&type=feedbackCaptcha&t=' + new Date().getTime());
    }

    //修改密码
    document.querySelector(".modify-password-button").onclick = function () {
        var old_password = $("#old_password").val();
        var new_password = $("#new_password").val();
        var confirm_new_password = $("#confirm_new_password").val();
        var captcha = $("#captcha").val();
        if (old_password == '' || old_password == 'undefined') {
            lightyear.notify("请填写原始密码！", 'danger', 100);
            return;
        }
        if (new_password == '' || new_password == 'undefined') {
            lightyear.notify("请填写新密码！", 'danger', 100);
            return;
        }

        if (confirm_new_password == '' || confirm_new_password == 'undefined') {
            lightyear.notify("请填写确认新密码！", 'danger', 100);
            return;
        }

        if (new_password != confirm_new_password) {
            lightyear.notify("两次输入的密码不一致！", 'danger', 100);
            return;
        }
        if (captcha == '' || captcha == 'undefined') {
            lightyear.notify("请填写验证码！", 'danger', 100);
            return;
        }
        lightyear.loading('show');
        $.ajax({
            url: '/bbs/doModifyPassword',
            data: {
                old_password: old_password,
                new_password: new_password,
                confirm_new_password: confirm_new_password,
                captcha: captcha
            },
            type: 'post',
            dataType: 'json',
            success: function (data) {
                lightyear.loading('hide');
                if (data.type == 'success') {
                    lightyear.notify("修改成功，已经清除登录痕迹,记得重新登录一下", 'success', 100);
                    window.parent.location = '/bbs/logout';
                } else {
                    lightyear.notify(data.msg, 'danger', 100);
                    changeCaptcha();
                }
            },
            error: function () {
                lightyear.loading('hide');
                lightyear.notify("请求异常", 'danger', 100);
            }
        });

    };

    //反馈意见
    document.querySelector(".do-feedback-button").onclick = function () {
        var feedbackContent = $("#feedbackContent").val();
        var captcha = $("#feedbackCaptcha").val();
        if (feedbackContent == null || feedbackContent.trim() == '') {
            lightyear.notify("反馈内容不能为空！", 'danger', 100);
            return;
        }
        if (captcha == '' || captcha == 'undefined') {
            lightyear.notify("请填写验证码！", 'danger', 100);
            return;
        }
        lightyear.loading('show');
        $.ajax({
            url: '/feedback/doFeedback',
            data: {
                feedbackContent: feedbackContent,
                captcha: captcha
            },
            type: 'post',
            dataType: 'json',
            success: function (data) {
                lightyear.loading('hide');
                if (data.type == 'success') {
                    lightyear.notify(data.msg, 'success', 100);
                    window.parent.location = '/bbs/personal';
                } else {
                    lightyear.notify(data.msg, 'danger', 100);
                    changeCaptcha();
                }
            },
            error: function () {
                lightyear.loading('hide');
                lightyear.notify("请求异常", 'danger', 100);
            }
        });

    }
</script>
<%@include file="common/footer.jsp" %>