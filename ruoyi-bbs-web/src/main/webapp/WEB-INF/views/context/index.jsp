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
                                <div class="card-header"><h4><span
                                        class="label label-secondary text-danger"><b>${contentTypeTitle}</b></span></h4></div>
                                <div class="card-body">

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="input-group">
                                                <input type="text" name="searchContent" id="searchContent"
                                                       class="form-control"
                                                       placeholder="请输入关键词...">
                                                <span class="input-group-btn"><button
                                                        class="btn btn-default btn-search-content"
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
                                            data-url="/content/content_list/${contentType}">
                                        <thead>
                                        <tr>
                                            <th data-field="tags" data-align="center" data-formatter="tagFormatter">标签</th>
                                            <th data-field="contentTitle" data-formatter="contentTypeFormatter">标题</th>
                                            <th data-field="contentTitle" data-formatter="contentTitleFormatter" data-align="center">主图</th>
                                            <th data-field="createBy">发布者</th>
                                            <th data-field="createTime">发布时间</th>
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
                                            params.searchContent = $("#searchContent").val();
                                            return params
                                        }

                                        function tagFormatter(value, row) {
                                            return "<span class='label' style='color:black;font-size:14px;'><b>" + value + "</b></span>"
                                        }

                                        function contentTitleFormatter(value, row) {
                                            return "<a href='/content/detail?contentId=" + row.contentId + "'>"
                                                + "<img src='" + row.mainImage + "' width='200' height='100' style='border: 3px solid navajowhite; border-radius: 10px;'/></a>"
                                                // + "<a style='color: black' href='/content/detail?contentId=" + row.contentId + "'>" + value + "</a>"
                                                ;
                                        }

                                        function contentTypeFormatter(value, row) {
                                            // if (value == "book") {
                                            //     return "<span class='label label-secondary'>" + "电子书籍" + "</span>";
                                            // } else if (value == "video") {
                                            //     return "<span class='label label-yellow'>" + "视频教程" + "</span>";
                                            // } else if (value == "code") {
                                            //     return "<span class='label label-dark'>" + "项目源码" + "</span>";
                                            // }
                                            return "<a  class='text text-dark' href='/content/detail?contentId=" + row.contentId + "'>" + value + "</a>";
                                        }


                                        $(".btn-search-content").click(function () {
                                            tableRefresh();
                                        });

                                        function tableRefresh() {
                                            var $table = $("#table");
                                            $table.bootstrapTable('refresh');
                                        }
                                    </script>
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

<%@include file="../common/footer.jsp" %>