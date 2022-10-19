<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                                <div class="col-lg-6">
                                    <div class="input-group">
                                        <input type="hidden" name="searchBlockId" id="searchBlockId" value="-1"/>
                                        <input type="hidden" name="searchModuleId" id="searchModuleId" value="-1"/>
                                        <input type="text" name="searchContent" id="searchContent" class="form-control"
                                               placeholder="请输入关键词...">
                                        <span class="input-group-btn"><button class="btn btn-default btn-search-bbs"
                                                                              type="button">搜索</button></span>
                                    </div>
                                </div>
                            </div>

                            <br/>
                            <div class="row-fluid">
                                <button data-id="-1" class="btn btn-sm btn-dark btn-block-bbs">所有版块</button>
                                <c:if test="${blockList != null}">
                                    <c:forEach items="${blockList}" var="block" varStatus="i">
                                        <button data-id="${block.blockId}"
                                                class="btn btn-sm btn-secondary btn-block-bbs"
                                                style="margin: 5px">${block.blockTitle}</button>
                                    </c:forEach>
                                </c:if>
                            </div>

                            <br/>
                            <div class="row-fluid">
                                <button data-id="-1" data-block-id="-1" class="btn btn-sm btn-dark btn-module-bbs">
                                    所有栏目
                                </button>
                                <c:if test="${moduleList != null}">
                                    <c:forEach items="${moduleList}" var="module" varStatus="i">
                                        <button data-block-id="${module.blockId}" data-id="${module.moduleId}"
                                                class="btn btn-sm btn-secondary btn-module-bbs"
                                                style="margin: 5px">${module.moduleTitle}</button>
                                    </c:forEach>
                                </c:if>
                            </div>

                            <br/>
                            <div class="row">
                                <table
                                        id="table"
                                        data-toggle="table"
                                <%--data-height="460"--%>
                                        data-pagination="true"
                                        data-method="post"
                                        data-classes="table table-striped"
                                        data-side-pagination="server"
                                        data-query-params="queryParams"
                                        data-page-size="20"
                                        data-url="/bbs/topic_list">
                                    <thead>
                                    <tr>
                                        <th data-field="tag" data-formatter="tagFormatter" data-align="center">标签</th>
                                        <th data-field="topicTitle" data-formatter="topicTitleFormatter">主题</th>
                                        <th data-field="topicType" data-formatter="topicTypeFormatter"
                                            data-align="center">类型
                                        </th>
                                        <th data-field="commentCount" data-align="center">回复数</th>
                                        <th data-field="createBy" data-align="center">发布者</th>
                                        <th data-field="createTime" data-align="center">发布时间</th>
                                    </tr>
                                    </thead>
                                </table>
                                <script>

                                    var scrollTopSmooth = function (position) {
                                        if (!window.requestAnimationFrame) {
                                            window.requestAnimationFrame = function (cb) {
                                                return setTimeout(cb, 10);
                                            };
                                        }
                                        var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
                                        var step = function () {
                                            var distance = position - scrollTop;
                                            scrollTop = scrollTop + distance / 15;
                                            if (Math.abs(distance) < 1) {
                                                window.scrollTo(0, position);
                                            } else {
                                                window.scrollTo(0, scrollTop);
                                                requestAnimationFrame(step);
                                            }
                                        };
                                        step();
                                    };

                                    $('#table').bootstrapTable({
                                        onPageChange: function () {
                                            scrollTopSmooth(0);
                                        }
                                    });

                                    function queryParams(params) {
                                        params.searchBlockId = $("#searchBlockId").val();
                                        params.searchModuleId = $("#searchModuleId").val();
                                        params.searchContent = $("#searchContent").val();
                                        return params
                                    }

                                    function tagFormatter(value, row) {
                                        return "<span class='label' style='color:#48b0f7;font-size:14px;'><b>" + value + "</b></span>"
                                    }

                                    function topicTitleFormatter(value, row) {
                                        // return "<a href='/bbs/detail?topicId=" + row.topicId + "'>"
                                        //     + "<img src='" + row.topicImage + "' width='200' height='100' style='border: 3px solid whitesmoke'/></a>"
                                        //     + "<br/><br/>"
                                        //     + "<a style='color:black' href='/bbs/detail?topicId=" + row.topicId + "'>" + value + "</a>"
                                        //     ;

                                        return "<a style='color:black' href='/bbs/detail?topicId=" + row.topicId + "'>" + value + "</a>";
                                    }

                                    function topicTypeFormatter(value, row) {
                                        if (value == 0) {
                                            return "<span class='label label-secondary'>" + "普通" + "</span>";
                                        } else if (value == 1) {
                                            return "<span class='label label-yellow'>" + "精华" + "</span>";
                                        } else if (value == 2) {
                                            return "<span class='label label-dark'>" + "置顶" + "</span>";
                                        }
                                        return value;
                                    }

                                    //版块点击事件
                                    $(".btn-block-bbs").click(function () {
                                        $(".btn-block-bbs").removeClass("btn-dark").removeClass("btn-secondary");
                                        $(".btn-block-bbs").addClass("btn-secondary");
                                        $(this).addClass("btn-dark");
                                        var mainBlockId = $(this).attr("data-id");
                                        $("#searchBlockId").val(mainBlockId);
                                        var btnModuleBbs = $(".btn-module-bbs");
                                        for (var i = 0; i < btnModuleBbs.length; i++) {
                                            var btnModuleBbsChild = btnModuleBbs.get(i);
                                            var blockId = $(btnModuleBbsChild).attr("data-block-Id");
                                            if (mainBlockId == blockId || blockId == -1 || mainBlockId == -1) {
                                                $(btnModuleBbsChild).show();
                                            } else {
                                                $(btnModuleBbsChild).hide();
                                            }
                                        }
                                        $(btnModuleBbs.get(0)).trigger("click");
                                    });

                                    //栏目点击事件
                                    $(".btn-module-bbs").click(function () {
                                        $(".btn-module-bbs").removeClass("btn-dark").removeClass("btn-secondary");
                                        $(".btn-module-bbs").addClass("btn-secondary");
                                        $(this).addClass("btn-dark");
                                        $("#searchModuleId").val($(this).attr("data-id"));
                                        tableRefresh();
                                    });

                                    $(".btn-search-bbs").click(function () {
                                        tableRefresh();
                                    });

                                    function tableRefresh() {
                                        var $table = $("#table");
                                        $table.bootstrapTable('refresh');
                                    }
                                </script>
                            </div>
                            
                            <br/>
                            <div class="row">
                                <%@include file="common/account.jsp"%>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<%@include file="common/footer.jsp" %>