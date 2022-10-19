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
                                                                <b>${moduleEntity.moduleTitle}</b>
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
                                                                           class="text-default">${block.blockTitle}</a> | ${module.moduleTitle}</span>
                                    </h4>
                                    <ul class="card-actions">
                                        <li>
                                            <button type="button"><a href="/bbs/index"><i
                                                    class="mdi mdi-24px text-dark mdi-arrow-left-bold-circle"></i></a>
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-body">
                                    <input type="hidden" id="tagInput" name="tagInput" value=""/>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="input-group">
                                                <input type="text" name="searchContent" id="searchContent" class="form-control"
                                                       placeholder="请输入关键词...">
                                                <span class="input-group-btn"><button class="btn btn-default btn-search-bbs"
                                                                                      type="button">搜索</button></span>
                                            </div>
                                        </div>
                                    </div>
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
                                        <caption>
                                            <div class="pull-left label-default topic_tag"
                                                 onclick="tagClick('', this)"
                                                 style="cursor: pointer; border:2px solid #fff; border-radius:5px; margin-bottom: 3px;margin-right: 3px; padding: 5px; font-size: 75%">
                                                所有&nbsp;&nbsp;<span class="badge"
                                                                    style="border-radius: 3px; color: #0a0a0a; background-color: #e4e7ea">${tagTotalCount}</span>
                                            </div>
                                            <c:if test="${not empty tagList}">
                                                <c:forEach items="${tagList}" var="tag">
                                                    <div class="pull-left label-default topic_tag"
                                                         onclick="tagClick('${tag.tag}', this)"
                                                         style="cursor: pointer; border:2px solid #fff; border-radius:5px; margin-bottom: 3px;margin-right: 3px; padding: 5px; font-size: 75%">
                                                            ${tag.tag}&nbsp;&nbsp;<span class="badge"
                                                                                        style="border-radius: 3px; color: #0a0a0a; background-color: #e4e7ea">${tag.tagCount}</span>
                                                    </div>
                                                </c:forEach>
                                            </c:if>
                                        </caption>
                                        <thead>
                                        <tr>
                                            <th data-field="tag" data-formatter="tagFormatter" data-align="center">标签</th>
                                            <th data-field="topicTitle" data-formatter="topicTitleFormatter">主题</th>
                                            <th data-field="topicType" data-formatter="topicTypeFormatter"
                                                data-align="center">类型
                                            </th>
                                            <th data-field="commentCount" data-align="center">回复数</th>
                                            <th data-field="createBy" data-align="center">发布者</th>
                                            <th data-field="createTime" data-width="180" data-align="center">发布时间</th>
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
                                            params.search = ${module.moduleId};
                                            params.tag = $("#tagInput").val();
                                            params.searchContent = $("#searchContent").val();
                                            return params
                                        }

                                        function tagFormatter(value, row) {
                                            return "<span class='label' style='color:#48b0f7;font-size:14px;'><b>" + value + "</b></span>"
                                        }
                                        function topicTitleFormatter(value, row) {
                                            return "<a  style='color: black' href='/bbs/detail?topicId=" + row.topicId + "'>" + value + "</a>";
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

                                        function tagClick(tag, obj) {
                                            $("#tagInput").val(tag);
                                            $(".topic_tag").css("border", "2px solid #fff");
                                            $(obj).css("border", "2px solid #e4e7ea");
                                            var $table = $("#table");
                                            $table.bootstrapTable('refresh');
                                        }
                                        $(".btn-search-bbs").click(function () {
                                            var $table = $("#table");
                                            $table.bootstrapTable('refresh');
                                        });
                                    </script>

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
