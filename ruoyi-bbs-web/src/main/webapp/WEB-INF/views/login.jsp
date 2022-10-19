<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="common/header.jsp" %>
<div class="row lyear-wrapper">
    <div class="lyear-login">
        <div class="login-center">
            <div class="login-header text-center">
                <a href="index.html"> <img alt="知识分享社区" style="width: 96px; height: 96px;"
                                           src="https://avatar.gitee.com/uploads/enterprise_logo/71961194015.png"> </a>
            </div>
            <form action="#!" method="post">
                <div class="form-group has-feedback feedback-left">
                    <input type="text" placeholder="请输入您的账号" class="form-control" name="account" id="account"/>
                    <span class="mdi mdi-account form-control-feedback" aria-hidden="true"></span>
                </div>
                <div class="form-group has-feedback feedback-left">
                    <input type="password" placeholder="请输入密码" class="form-control" id="password" name="password"/>
                    <span class="mdi mdi-lock form-control-feedback" aria-hidden="true"></span>
                </div>
                <div class="form-group has-feedback feedback-left row">
                    <div class="col-xs-7">
                        <input type="text" id="captcha" name="captcha" class="form-control" placeholder="验证码">
                        <span class="mdi mdi-check-all form-control-feedback" aria-hidden="true"></span>
                    </div>
                    <div class="col-xs-5">
                        <%--<img src="../../resources/admin/light/images/captcha.png" class="pull-right" id="captcha" style="cursor: pointer;" onclick="this.src=this.src+'?d='+Math.random();" title="点击刷新" alt="captcha">--%>
                        <img id="captcha-img" class="pull-right" title="点击切换验证码" style="cursor:pointer;"
                             src="/bbs/get_captcha?vl=4&w=150&h=40&type=loginCaptcha"
                             width="110px" height="30px" onclick="changeCaptcha()">
                    </div>
                </div>
                <div class="form-group">
                    <button class="btn btn-block btn-primary login-button" type="button">立即登录
                    </button>
                </div>
                <div class="form-group">
                    <div style="text-align: center;margin-top: 5px">
                        <a href="/oauth/render/github"><img style="width: 32px;height: 32px;"
                                                            src="/resources/images/github.png"/> </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="/oauth/render/gitee"><img style="width: 32px;height: 32px;"
                                                           src="/resources/images/logo_themecolor.png"/> </a>
                    </div>
                </div>
            </form>
            <hr>
            <footer class="col-sm-12 text-center">
                <p class="m-b-0">Copyright © 2019 <a href="/bbs/index">知识分享社区</a>. All right reserved</p>
            </footer>
        </div>
    </div>
</div>
<%@include file="common/footer.jsp" %>
<script type="text/javascript">
    function hasClass(elem, cls) {
        cls = cls || '';
        if (cls.replace(/\s/g, '').length == 0) return false; //当cls没有参数时，返回false
        return new RegExp(' ' + cls + ' ').test(' ' + elem.className + ' ');
    }

    function addClass(ele, cls) {
        if (!hasClass(ele, cls)) {
            ele.className = ele.className == '' ? cls : ele.className + ' ' + cls;
        }
    }

    function removeClass(ele, cls) {
        if (hasClass(ele, cls)) {
            var newClass = ' ' + ele.className.replace(/[\t\r\n]/g, '') + ' ';
            while (newClass.indexOf(' ' + cls + ' ') >= 0) {
                newClass = newClass.replace(' ' + cls + ' ', ' ');
            }
            ele.className = newClass.replace(/^\s+|\s+$/g, '');
        }
    }

    function changeCaptcha() {
        $("#captcha-img").attr("src", 'get_captcha?vl=4&w=150&h=40&type=loginCaptcha&t=' + new Date().getTime());
    }

    document.querySelector(".login-button").onclick = function () {
        var account = $("#account").val();
        var password = $("#password").val();
        var captcha = $("#captcha").val();
        if (account == '' || account == 'undefined') {
            lightyear.notify("请填写账号！", 'danger', 100);
            return;
        }
        if (password == '' || password == 'undefined') {
            lightyear.notify("请填写密码！", 'danger', 100);
            return;
        }
        if (captcha == '' || captcha == 'undefined') {
            lightyear.notify("请填写验证码！", 'danger', 100);
            return;
        }
        lightyear.loading('show');
        $.ajax({
            url: '/bbs/doLogin',
            data: {account: account, password: password, captcha: captcha},
            type: 'post',
            dataType: 'json',
            success: function (data) {
                lightyear.loading('hide');
                if (data.type == 'success') {
                    lightyear.notify("登录成功", 'success', 100);
                    window.parent.location = '/bbs/index';
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