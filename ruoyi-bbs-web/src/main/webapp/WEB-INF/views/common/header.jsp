<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="copyright" content="知识分享社区"/>
    <title>知识分享社区</title>
    <link rel="icon" href="/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="../../resources/admin/light/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../resources/admin/light/css/materialdesignicons.min.css">
    <link rel="stylesheet" type="text/css" href="../../resources/admin/light/css/style.min.css">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="../../resources/admin/bootstrap-table/bootstrap-table.min.css">

    <link href="../../resources/admin/light/css/animate.css" rel="stylesheet">


    <!-- include summernote css/js -->
    <link href="../../resources/admin/summernote/summernote.css" rel="stylesheet">

    <!--对话框-->
    <link rel="stylesheet" href="../../resources/admin/light/js/jconfirm/jquery-confirm.min.css">



    <script type="text/javascript" src="../../resources/admin/light/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../resources/admin/light/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../resources/admin/light/js/perfect-scrollbar.min.js"></script>
    <%--<script type="text/javascript" src="../../resources/admin/light/js/main.min.js"></script>--%>
    <!--图表插件-->
    <script type="text/javascript" src="../../resources/admin/light/js/Chart.js"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="../../resources/admin/bootstrap-table/bootstrap-table.min.js"></script>
    <!-- Latest compiled and minified Locales -->
    <script src="../../resources/admin/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

    <!--消息提示-->
    <script src="../../resources/admin/light/js/bootstrap-notify.min.js"></script>
    <script type="text/javascript" src="../../resources/admin/light/js/lightyear.js"></script>
    <script src="../../resources/admin/summernote/summernote.js"></script>
    <%--<script type="text/javascript" src="../../resources/admin/light/js/main.min.js"></script>--%>

    <!--对话框-->
    <script src="../../resources/admin/light/js/jconfirm/jquery-confirm.min.js"></script>



    <style type="text/css">
        .panel-group {
            margin-bottom: 10px;
        }
    </style>

    <style>
        .lyear-wrapper {
            position: relative;
        }

        .lyear-login {
            display: flex !important;
            min-height: 100vh;
            align-items: center !important;
            justify-content: center !important;
        }

        .login-center {
            background: #fff;
            min-width: 38.25rem;
            padding: 2.14286em 3.57143em;
            border-radius: 5px;
            margin: 2.85714em 0;
        }

        .login-header {
            margin-bottom: 1.5rem !important;
        }

        .login-center .has-feedback.feedback-left .form-control {
            padding-left: 38px;
            padding-right: 12px;
        }

        .login-center .has-feedback.feedback-left .form-control-feedback {
            left: 0;
            right: auto;
            width: 38px;
            height: 38px;
            line-height: 38px;
            z-index: 4;
            color: #dcdcdc;
        }

        .login-center .has-feedback.feedback-left.row .form-control-feedback {
            left: 15px;
        }

        .flexbox {
            display: -webkit-flex;
            display: flex;
            -webkit-align-items: center;
            align-items: center;
            -webkit-justify-content: center;
            justify-content: center;
        }
    </style>

    <style type="text/css">
        .progress {
            width: 600px;
            height: 10px;
            border: 1px solid #ccc;
            border-radius: 10px;
            margin: 10px 0px;
            overflow: hidden;
        }
        .progress_text {
            margin: 10px 5px;
            height: 10px;
            line-height: 10px;
        }

        /* 初始状态设置进度条宽度为0px */
        .progress > div {
            width: 0px;
            height: 100%;
            background-color: yellowgreen;
            transition: all .3s ease;
        }
    </style>
<body>