<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="common/header.jsp" %>
<style type="text/css">
    .nav_width {
        width: 180px !important;
    }
</style>
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
                                <div class="col-md-4">
                                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators">
                                            <c:forEach items="${newsTopicTop5}" var="newsTopic" varStatus="i">
                                                <c:if test="${i.index == 0}">
                                                    <li data-target="#carouselExampleIndicators"
                                                        data-slide-to="${i.index}"
                                                        class="active"></li>
                                                </c:if>
                                                <c:if test="${i.index != 0}">
                                                    <li data-target="#carouselExampleIndicators"
                                                        data-slide-to="${i.index}"></li>
                                                </c:if>
                                            </c:forEach>
                                        </ol>
                                        <div class="carousel-inner">
                                            <c:forEach items="${newsTopicTop5}" var="newsTopic" varStatus="i">
                                                <c:if test="${i.index == 0}">
                                                    <div class="item active">
                                                        <div style="font-size: 12px; text-align: center; padding: 3px 5px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">${newsTopic.topicTitle}</div>
                                                        <a
                                                                href="/bbs/detail?topicId=${newsTopic.topicId}">
                                                            <img
                                                                    style="width: 320px; height: 200px;"
                                                                    src="${newsTopic.topicImage}"
                                                                    alt="图片一">

                                                        </a>
                                                    </div>
                                                </c:if>
                                                <c:if test="${i.index != 0}">
                                                    <div class="item">
                                                        <div style="font-size: 12px; text-align: center; padding: 3px 5px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">${newsTopic.topicTitle}</div>
                                                        <a
                                                                href="/bbs/detail?topicId=${newsTopic.topicId}">
                                                            <img
                                                                    style="width: 320px; height: 200px;"
                                                                    src="${newsTopic.topicImage}" alt="图片一">
                                                        </a>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <a class="left carousel-control" href="#carouselExampleIndicators" role="button"
                                           data-slide="prev"><span class="icon-left-open-big icon-prev"
                                                                   aria-hidden="true"></span><span class="sr-only">Previous</span></a>
                                        <a class="right carousel-control" href="#carouselExampleIndicators"
                                           role="button" data-slide="next"><span class="icon-right-open-big icon-next"
                                                                                 aria-hidden="true"></span><span
                                                class="sr-only">Next</span></a>
                                    </div>
                                </div>
                                <div class="col-md-6">

                                    <ul class="nav nav-tabs nav-justified">
                                        <li class="active">
                                            <a data-toggle="tab" href="#home-basic" style="padding: 5px 10px">最新资源</a>
                                        </li>
                                        <li class="nav-item">
                                            <a data-toggle="tab" href="#profile-basic"
                                               style="padding: 5px 10px">最新回复</a>
                                        </li>
                                        <li class="nav-item">
                                            <a data-toggle="tab" href="#messages-basic"
                                               style="padding: 5px 10px">人气热门</a>
                                        </li>
                                        <li class="nav-item">
                                            <a data-toggle="tab" href="#notice-basic"
                                               style="padding: 5px 10px">重要公告</a>
                                        </li>
                                        <li class="nav-item">
                                            <a data-toggle="tab" href="#settings-basic"
                                               style="padding: 5px 10px">社区声明</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" style="padding: 0px 0px;">
                                        <div class="tab-pane fade active in" id="home-basic">
                                            <table class="table">
                                                <tbody>
                                                <c:forEach items="${newsTopicTop5}" varStatus="i" var="newsTopic">
                                                    <tr>
                                                        <td scope="row" style="padding: 5px;font-size: 12px;">
                                                            <a href="/bbs/detail?topicId=${newsTopic.topicId}"><span
                                                                    title="${newsTopic.topicTitle}"
                                                                    style="width:320px;color:black;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;"
                                                                    class="pull-left">${i.index + 1}、${newsTopic.topicTitle}</span></a>
                                                            <span class="pull-right text-gray">[<fmt:formatDate
                                                                    value="${newsTopic.createTime}"
                                                                    pattern="yyyy-MM-dd HH:mm:ss"/>]</span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="tab-pane fade" id="profile-basic">
                                            <table class="table">
                                                <tbody>
                                                <c:forEach items="${newCommentTopicTop5}" varStatus="i"
                                                           var="newCommentTopic">
                                                    <tr>
                                                        <td scope="row" style="padding: 5px;font-size: 12px;">
                                                            <a href="/bbs/detail?topicId=${newCommentTopic.topicId}"><span
                                                                    title="${newCommentTopic.topicTitle}"
                                                                    style="width:320px;color:black;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;"
                                                                    class="pull-left">${i.index + 1}、${newCommentTopic.topicTitle}</span></a>
                                                            <span class="pull-right text-gray">[<fmt:formatDate
                                                                    value="${newCommentTopic.createTime}"
                                                                    pattern="yyyy-MM-dd HH:mm:ss"/>]</span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="tab-pane fade" id="messages-basic">
                                            <table class="table">
                                                <tbody>
                                                <c:forEach items="${hotTopicTop5}" varStatus="i" var="hotTopic">
                                                    <tr>
                                                        <td scope="row" style="padding: 5px;font-size: 12px;">
                                                            <a href="/bbs/detail?topicId=${hotTopic.topicId}"><span
                                                                    title="${hotTopic.topicTitle}"
                                                                    style="width:320px;color:black;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;"
                                                                    class="pull-left">${i.index + 1}、${hotTopic.topicTitle}</span></a>
                                                            <span class="pull-right text-gray">[<fmt:formatDate
                                                                    value="${hotTopic.createTime}"
                                                                    pattern="yyyy-MM-dd HH:mm:ss"/>]</span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="tab-pane fade" id="notice-basic" style="font-size: 13px;">
                                            <p>
                                            <div style="margin-top: 5px">1、<span
                                                    class="label label-secondary">游客身份</span>，只能浏览主题的公开内容，不能查看主题的隐藏内容。
                                            </div>
                                            <div style="margin-top: 5px">2、<span class="label label-dark">普通用户</span>，若想查看某个主题的隐藏内容，请联系社区客服。
                                            </div>
                                            <div style="margin-top: 5px">3、<span class="label label-warning">终身会员</span>，回复主题即可查看主题的隐藏内容。
                                            </div>
                                            <div style="margin-top: 5px">4、请自行注册普通用户，若想升级为终身会员，请联系社区客服。</div>
                                            <div style="margin-top: 5px">5、请先注册为<label
                                                    class="label label-dark">普通用户</label>，向社区支付账户缴纳会员费用<b
                                                    style="color: red">(不低于88元,付款码见本页最底部)</b>，注明自己的账号，审核通过后，享受社区<b
                                                    style="color: blue">（包括个人APP应用分发功能）</b>所有福利。
                                            </div>
                                            <div style="margin-top: 5px">6、社区会员费用皆用于社区未来发展之用。</div>
                                            <div style="margin-top: 5px">7、社区客服微信号：leorain201314</div>
                                            </p>
                                        </div>
                                        <div class="tab-pane fade" id="settings-basic" style="font-size: 14px;">
                                            <p><span style="color: red"><b>社区声明：</b></span>为了社区的长治久安，本社区杜绝盗版资源分享，希望广大网友监督，若在社区内发现盗版资源，请及时反馈给社区。
                                                <br/>
                                                <br/>
                                                <span style="color: red"><b>社区目标：</b></span>为广大互联网从业人员推荐一些优秀的开源项目地址，高质量的教学资源网址，少走弯路...<br/>
                                                <br/>
                                                <span style="color: red"><b>社区服务：</b></span>资源分享池(社区原创)、应用分发平台、开放常用API接口、程序猿导航，后续会慢慢开发更多的功能....<br/>
                                                <br/>
                                                <span style="color: red"><b>社区愿景：</b></span>提高互联网从业人员的技术实力，为祖国的软件事业添砖加瓦...

                                            </p>
                                        </div>
                                    </div>


                                </div>
                                <div class="col-md-2">
                                    <img src="https://avatar.gitee.com/uploads/enterprise_logo/71961194015.png"/>
                                    <h4 style="text-align: center;color: red">知识分享社区</h4>
                                    <br/>
                                    <c:if test="${bbsSessionUser != null && bbsSessionUser.account != null}">
                                        <div class="text-center">
                                            <button class="label label-success" id="personalCenter">个人中心</button>
                                            <c:if test="${bbsSessionUser.userType==0}">
                                                <button disabled class="label label-dark">普通用户</button>
                                            </c:if>
                                            <c:if test="${bbsSessionUser.userType==1}">
                                                <button disabled class="label label-warning">终身会员</button>
                                            </c:if>
                                        </div>
                                    </c:if>
                                    <c:if test="${bbsSessionUser == null || bbsSessionUser.account == null}">
                                        <div class="text-center">
                                            <a href="/bbs/login">
                                                <button class="btn btn-sm btn-success" type="button">登录</button>
                                            </a>
                                            <a href="/bbs/register">
                                                <button class="btn btn-sm btn-default" type="button">注册</button>
                                            </a>
                                        </div>
                                    </c:if>
                                    <h6 style="margin-top: 5px;color: #1396FF">社区创建于2019年08月</h6>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="container-fluid">
                    <div class="card" style="margin-bottom: 12px;">
                        <div class="card-body" style="padding: 12px 12px;">

                            <div class="" style="display: inline-block">
                                <a href="/bbs/search" target="_self" class="text-center btn btn-default nav_width"
                                   style="cursor: pointer;"><span
                                        class="mdi mdi-search-web"></span><label class="label text-info"
                                                                                 style="cursor: pointer;font-size: 12px"><b>站内资源
                                    -
                                    全局搜索</b></label></a>
                                <a href="/app/index" target="_self" class="text-center btn btn-default nav_width"
                                   style="cursor: pointer"><span
                                        class="mdi  mdi-android"></span><label class="label text-info"
                                                                               style="cursor: pointer;font-size: 12px"><b>移动应用
                                    -
                                    分发平台</b></label></a>
                                <a href="/navigation/index" target="_self" class="text-center btn btn-default nav_width"
                                   style="cursor: pointer"><span
                                        class="mdi  mdi-car"></span><label class="label text-info"
                                                                           style="cursor: pointer;font-size: 12px"><b>程序猿
                                    -
                                    静态导航</b></label></a>
                                <a href="/navigation/index2" target="_self"
                                   class="text-center btn btn-default nav_width" style="cursor: pointer"><span
                                        class="mdi  mdi-airplane"></span><label class="label text-info"
                                                                                style="cursor: pointer;font-size: 12px"><b>程序猿
                                    -
                                    动态导航</b></label></a>

                            </div>
                            <div style="height: 10px;"></div>
                            <div style="display: inline-block">
                                <a href="/content/index/code" target="_self"
                                   class="text-center btn btn-default nav_width" style="cursor: pointer"><span
                                        class="mdi  mdi-code-tags"></span><label class="label text-info"
                                                                                 style="cursor: pointer;font-size: 12px"><b
                                        style="color: red;">VIP资源 -
                                    项目源码</b></label></a>
                                <a href="/content/index/video" target="_self"
                                   class="text-center btn btn-default nav_width" style="cursor: pointer"><span
                                        class="mdi  mdi-video"></span><label class="label text-info"
                                                                             style="cursor: pointer;font-size: 12px"><b
                                        style="color: red;">VIP资源 -
                                    视频教程</b></label></a>
                                <a href="/content/index/book" target="_self"
                                   class="text-center btn btn-default nav_width" style="cursor: pointer"><span
                                        class="mdi  mdi-book"></span><label class="label text-info"
                                                                            style="cursor: pointer;font-size: 12px"><b
                                        style="color: red;">VIP资源 -
                                    电子书籍</b></label></a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <%--<br/>--%>

            <div class="row">
                <div class="container-fluid">
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
                                            <c:if test="${(j.index)%4==0}">
                                                <div class="row">
                                            </c:if>
                                            <div class="col-sm-6 col-lg-3">
                                                <div class="pull-left">
                                                <span class="img-avatar img-avatar-48 bg-translucent">
                                                 <a href="/bbs/list?moduleId=${moduleEntity.moduleId}"><img
                                                         style="width: 48px;height: 48px;"
                                                         src="${moduleEntity.moduleIcon}"/></a>
                                                </span>
                                                </div>
                                                <div class="col-sm-8 col-lg-8"
                                                     style="margin-left: 3px;">
                                                    <p class="h6 text-dark m-t-0">
                                                        <b><a href="/bbs/list?moduleId=${moduleEntity.moduleId}">${moduleEntity.moduleTitle}</a></b><span
                                                            class="text-danger">
                                                    <c:if test="${moduleEntity.goodTopicCount > 0}">
                                                        (${moduleEntity.goodTopicCount})
                                                    </c:if>
                                                </span></p>
                                                    <p class="h6 text-dark m-b-0">主题: ${moduleEntity.topicCount},
                                                        帖数: ${moduleEntity.forumCount}</p>
                                                    <p class="h6 text-dark m-b-0">最后发表: ${moduleEntity.forumTime}</p>
                                                </div>
                                            </div>
                                            <c:if test="${(j.index+1)%4==0}">
                                                </div>
                                                <br/>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <!--手风琴效果 End-->
                    </c:forEach>

                    <%@include file="common/account.jsp" %>

                    <div class="card" style="margin-bottom: 12px;">
                        <div class="card-body" style="padding: 12px 12px;">
                            <div class="text-center" style="display: inline-block">
                                <img src="/resources/images/post.png"/>
                                <div class="pull-right">
                                    <span class="label text-dark">普通用户</span>
                                    <br/>
                                    <span class="label text-dark"><b>${totalUserCount}</b></span>
                                </div>

                            </div>
                            <div class=" text-center" style="display: inline-block">
                                <img src="/resources/images/huiyuan.png"/>
                                <div class="pull-right">
                                    <span class="label text-dark">终身会员</span>
                                    <br/>
                                    <span class="label text-dark"><b>${totalFeeUserCount}</b></span>
                                </div>
                            </div>
                            <div class=" text-center" style="display: inline-block">
                                <img src="/resources/images/yesterday.png"/>
                                <div class="pull-right">
                                    <span class="label text-dark">主题数</span>
                                    <br/>
                                    <span class="label text-dark"><b>${totalTopicCount}</b></span>
                                </div>
                            </div>
                            <div class=" text-center" style="display: inline-block">
                                <img src="/resources/images/today.png"/>
                                <div class="pull-right">
                                    <span class="label text-dark">帖子数</span>
                                    <br/>
                                    <span class="label text-dark"><b>${totalForumCount}</b></span>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </main>
    </div>
</div>
<script type="text/javascript">
    $("#personalCenter").on("click", function () {
        window.location.href = "/bbs/personal";
    });
</script>
<%@include file="common/footer.jsp" %>
