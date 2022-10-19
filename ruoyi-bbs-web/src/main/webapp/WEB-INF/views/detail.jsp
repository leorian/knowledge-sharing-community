<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="common/header.jsp" %>
<div class="lyear-layout-web" style="padding: 15px;">
    <div class="lyear-layout-container">
        <main class="lyear-layout-content">
            <div class="row">
                <%@include file="common/login_result.jsp" %>
            </div>
            <div class="row">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-2">
                            <!--手风琴效果-->
                            <c:forEach items="${blockEntityList}" var="blockEntity" varStatus="i">
                                <!--手风琴效果-->
                                <div class="panel-group" id="accordion_${blockEntity.blockId}" role="tablist"
                                     aria-multiselectable="true">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading" role="tab" id="heading_${blockEntity.blockId}">
                                            <h6 class="panel-title">
                                                <a role="button" data-toggle="collapse"
                                                   data-parent="#accordion_${blockEntity.blockId}"
                                                   href="#collapse_${blockEntity.blockId}"
                                                   aria-expanded="true" aria-controls="collapse_${blockEntity.blockId}">
                                                    <b>${blockEntity.blockTitle}</b>
                                                </a>
                                            </h6>
                                        </div>
                                        <div id="collapse_${blockEntity.blockId}" class="panel-collapse collapse in"
                                             role="tabpanel"
                                             aria-labelledby="heading_${blockEntity.blockId}">
                                            <div class="panel-body">
                                                <c:forEach items="${blockEntity.moduleEntityList}" var="moduleEntity"
                                                           varStatus="j">
                                                    <div class="row">

                                                        <c:if test="${moduleEntity.moduleId == module.moduleId}">
                                                            <p class="h6 text-white m-t-0 bg-info"
                                                               style="text-align: left;padding-left: 15px; padding-top: 3px;padding-bottom: 3px;">
                                                                <b><a class="text-white"
                                                                      href="/bbs/list?moduleId=${moduleEntity.moduleId}">${moduleEntity.moduleTitle}</a></b>
                                                            </p>
                                                        </c:if>
                                                        <c:if test="${moduleEntity.moduleId != module.moduleId}">
                                                            <p class="h6 text-dark m-t-0"
                                                               style="text-align: left;padding-left: 15px; padding-top: 1px;padding-bottom: 1px;">
                                                                <b><a class="text-dark"
                                                                      href="/bbs/list?moduleId=${moduleEntity.moduleId}">${moduleEntity.moduleTitle}</a></b>
                                                            </p>
                                                        </c:if>


                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <!--手风琴效果 End-->
                            </c:forEach>
                            <!--手风琴效果 End-->
                        </div>

                        <div class="col-md-10">
                            <div class="card">
                                <div class="card-header bg-success">
                                    <h4><span
                                            class="label label-default"><a href="/bbs/index"
                                                                           class="text-default">${block.blockTitle}</a> | <a
                                            href="/bbs/list?moduleId=${module.moduleId}"
                                            class="text-default">${module.moduleTitle}</a> | ${topic.topicTitle}</span>
                                    </h4>
                                    <ul class="card-actions">
                                        <li>
                                            <button type="button"><a href="/bbs/list?moduleId=${module.moduleId}"><i
                                                    class="mdi mdi-24px text-dark mdi-arrow-left-bold-circle"></i></a>
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-body">
                                    <h3 style="text-align: center">${topic.topicTitle}</h3>
                                    <div style="text-align: center"><img style="width: 600px; height: 300px;"
                                                                         src="${topic.topicImage}"/></div>
                                    <br/>
                                    <h4 class="label label-dark">公开内容</h4>
                                    <div style="margin-left: 25px; margin-top: 15px;">${topic.publicContent}</div>
                                    <br/>
                                    <br/>
                                    <h4 class="label label-dark">隐藏内容</h4>
                                    <div style="margin-left: 25px; margin-top: 15px;">${topic.privateContent}</div>
                                    <br/>
                                    <br/>
                                    <h4 class="label label-dark">回复内容</h4>
                                    <c:if test="${commentFlag == 0}">
                                        <div style="margin-left: 25px; margin-top: 15px;">
                                            <div class="summernote"></div>
                                        </div>
                                        <div style="margin-left: 25px; margin-top: 15px;">
                                            <div class="row">
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
                                                         src="/bbs/get_captcha?vl=4&w=150&h=40&type=commentCaptcha"
                                                         width="110px" height="30px" onclick="changeCaptcha()">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-right">
                                            <button id="commentBtn" class="btn btn-info">回复</button>
                                        </div>
                                    </c:if>
                                    <c:if test="${commentFlag == 1}">
                                        <div style="margin-left: 25px; margin-top: 15px;">
                                                ${comment.forumContent}
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </main>
    </div>
</div>
<%@include file="common/footer.jsp" %>
<c:if test="${commentFlag == 0}">
    <script type="text/javascript">
        $('.summernote').summernote({
            placeholder: '请输入回复内容',
            height: 192,
            lang: 'zh-CN',
            followingToolbar: false,
            callbacks: {
                onImageUpload: function (files) {
                    sendFile(files[0], this);
                }
            }
        });

        // 上传文件
        function sendFile(file, obj) {
            var data = new FormData();
            data.append("photo", file);
            $.ajax({
                type: "POST",
                url: "/bbs/upload_photo",
                data: data,
                cache: false,
                contentType: false,
                processData: false,
                dataType: 'json',
                success: function (result) {
                    if (result.type == "success") {
                        $(obj).summernote('editor.insertImage', result.filepath, result.msg);
                    } else {
                        lightyear.notify(result.msg, 'danger', 100);
                    }
                },
                error: function (error) {
                    lightyear.notify("图片上传失败。", 'danger', 100);
                }
            });
        }

        $("#commentBtn").click(function () {
            var captcha = $("#captcha").val();
            if (captcha == null || captcha == '') {
                lightyear.notify("验证码不能为空！", 'danger', 100);
                return;
            }
            var forumContent = $('.summernote').summernote('code');
            if (forumContent == null || forumContent == '' || forumContent.length < 5) {
                lightyear.notify("回复内容必须超过5个字", 'danger', 100);
                return;
            }
            lightyear.loading('show');
            $.ajax({
                url: '/bbs/doComment',
                data: {topicId: ${topic.topicId}, captcha: captcha, forumContent: forumContent},
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    lightyear.loading('hide');
                    if (data.type == 'success') {
                        lightyear.notify("回复成功", 'success', 100);
                        window.parent.location = '/bbs/detail?topicId=${topic.topicId}';
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
        });

        function changeCaptcha() {
            $("#captcha-img").attr("src", 'get_captcha?vl=4&w=150&h=40&type=commentCaptcha&t=' + new Date().getTime());
        }
    </script>
</c:if>