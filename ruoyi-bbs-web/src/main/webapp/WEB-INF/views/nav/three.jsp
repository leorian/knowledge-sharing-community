<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="card">
    <div class="card-header"><h4><span class="label label-secondary">优秀组织</span></h4></div>
    <div class="card-body">
        <div class="row">

            <%--Alibaba 开始--%>
            <div class="col-md-3">
                <a href="https://github.com/alibaba" target="_blank" class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/alibaba.jpg"
                                        class="navigation_img"><b class="navigation_title">Alibaba</b>
                                </div>
                                <div class="navigation_introduction">
                                    Alibaba Open Source
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--Alibaba 结束--%>

            <%--Alipay 开始--%>
            <div class="col-md-3">
                <a href="https://github.com/alipay" target="_blank"
                   class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/1299356.jpg"
                                        class="navigation_img"><b class="navigation_title">Alipay</b>
                                </div>
                                <div class="navigation_introduction">
                                    Ant Financial Open Source
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--Alipay 结束--%>

            <%--Google 开始--%>
            <div class="col-md-3">
                <a href="https://github.com/google" target="_blank"
                   class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/1342004.png"
                                        class="navigation_img"><b class="navigation_title">Google</b>
                                </div>
                                <div class="navigation_introduction">
                                    Google heart Open Source
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--Google 结束--%>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--baomidou 开始--%>
                <div class="col-md-3">
                    <a href="https://gitee.com/baomidou" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/groups_995973.png"
                                            class="navigation_img"><b class="navigation_title">baomidou</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        苞米豆
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--baomidou 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

        </div>

        <div class="row">
            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--xuxueli 开始--%>
                <div class="col-md-3">
                    <a href="http://www.xuxueli.com/index.html" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/10633817.jpg"
                                            class="navigation_img"><b class="navigation_title">xuxueli</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        许雪里 XXL 社区
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--xuxueli 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <%--ReactiveX 开始--%>
            <div class="col-md-3">
                <a href="https://github.com/ReactiveX" target="_blank"
                   class="text-dark">
                    <div class="card">
                        <div class="card-body clearfix navigation_container">
                            <div class="pull-left">
                                <div><img
                                        src="/resources/images/navigation/6407041.png"
                                        class="navigation_img"><b class="navigation_title">ReactiveX</b>
                                </div>
                                <div class="navigation_introduction">
                                    Reactive Extensions for Async Programming
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--ReactiveX 结束--%>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--玩安卓 开始--%>
                <div class="col-md-3">
                    <a href="https://docs.justauth.whnb.wang/#/" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/wangandroid.png"
                                            class="navigation_img"><b class="navigation_title">玩安卓</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        你可以自己写一个app , 分享文章给大家 , 看看面试题 , 学习每日一问 , 领取极客时间大礼包 , 还能速查一些信息 。
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--玩安卓 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>


            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--程序猿DD 开始--%>
                <div class="col-md-3">
                    <a href="http://blog.didispace.com/" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/437188_didispace.png"
                                            class="navigation_img"><b class="navigation_title">程序猿DD</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        本博客主要维护人翟永超 ，毕业于东华大学硕士研究生，现任职于永辉云创架构师，主要负责基于Spring Cloud的微服务架构落地。《Spring
                                        Cloud微服务实战》作者，SpringCloud中文社区创始人（bbs.springcloud.com.cn），Spring4All社区联合发起人（spring4all.com）。
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--程序猿DD 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>


        </div>

        <div class="row">
            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--贾鹏辉 开始--%>
                <div class="col-md-3">
                    <a href="http://www.devio.org/" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/jiapenghui.png"
                                            class="navigation_img"><b class="navigation_title">贾鹏辉</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        嘿，我是贾鹏辉，Android&iOS架构师 & 技术经理 & 移动端负责人 ，CSDN 博客专家。
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--贾鹏辉 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--小柒2012 开始--%>
                <div class="col-md-3">
                    <a href="https://gitee.com/52itstyle" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/87650_52itstyle.png"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">小柒2012</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        凡事预则立 不预则废。 邮箱：345849402@qq.com 欢迎骚扰~~~
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--小柒2012 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--stylefeng 开始--%>
                <div class="col-md-3">
                    <a href="https://www.stylefeng.cn/" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/551203_naan1993.png"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">stylefeng</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        开源是信仰，Guns是情怀
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--stylefeng 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--周立 开始--%>
                <div class="col-md-3">
                    <a href="http://www.itmuch.com" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/zhouli.jpg"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">周立</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        8年+软件开发&系统架构经验，历任Java高级开发、架构师、高级架构师、技术专家；目前在杭州阿里巴巴，花名里目 （欲穷千里目，更上一层楼）。对Spring Cloud、微服务、容器相关生态技术有较深的见解。著有《Spring Cloud与Docker微服务架构实战》。
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--周立 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>
        </div>

        <div class="row">
            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--泥瓦匠 开始--%>
                <div class="col-md-3">
                    <a href="https://github.com/JeffLi1993" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/6890948.png"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">泥瓦匠</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        JeffLi1993
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--泥瓦匠 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--iView 开始--%>
                <div class="col-md-3">
                    <a href="http://iview.talkingdata.com/#/" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/e1cf12c07bf6458992569e67927d767e.png"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">iView</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        一套基于 Vue.js 的高质量UI 组件库
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--iView 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--binaryshao 开始--%>
                <div class="col-md-3">
                    <a href="https://github.com/binaryshao" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/13177207.jpg"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">binaryshao</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        WangAndroid Flutter,ReactNative,Kotlin-MVVM
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--binaryshao 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--Goweii 开始--%>
                <div class="col-md-3">
                    <a href="https://github.com/goweii" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/5456892.jpg"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">Goweii</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        goweii@163.com
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--Goweii 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>
        </div>

        <div class="row">
            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--Shuyu Guo 开始--%>
                <div class="col-md-3">
                    <a href="https://github.com/CarGuo" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/10770362.png"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">Shuyu Guo</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        一个爱猫的程序猿老司机。一个兴趣使然的攻城喵。Android、React Native、Flutter、Weex、Cordova、小程序。 偶尔撸下SpringBoot、vue。
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--Shuyu Guo 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--123lxw123 开始--%>
                <div class="col-md-3">
                    <a href="https://github.com/123lxw123" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/20809823.jpg"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">123lxw123</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        VideoWorld Android VideoWorld Java
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--123lxw123 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>


            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--张鸿洋 开始--%>
                <div class="col-md-3">
                    <a href="https://github.com/hongyangAndroid" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/10704521.png"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">张鸿洋</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        hongyangAndroid
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--张鸿洋 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--Jake Wharton 开始--%>
                <div class="col-md-3">
                    <a href="https://github.com/JakeWharton" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/66577.jpg"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">Jake Wharton</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        JakeWharton
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--Jake Wharton 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>
        </div>

        <div class="row">
            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--低调小熊猫 开始--%>
                <div class="col-md-3">
                    <a href="https://github.com/java-aodeng" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/35907367.jpg"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">低调小熊猫</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        读万卷书，行万里路，赚很多钱egg
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--低调小熊猫 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--薛翔 开始--%>
                <div class="col-md-3">
                    <a href="https://github.com/xuexiangjys" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/15059629.jpg"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">薛翔</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        一位爱好敲键盘的“作家”、“艺术家”，“演奏家”。QQ群:602082750
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--薛翔 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--MiBird 开始--%>
                <div class="col-md-3">
                    <a href="https://github.com/wuyouzhuguli" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/16661027.jpg"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">MiBird</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        wuyouzhuguli
                                        https://mrbird.cc/
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--MiBird 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--设计模式 开始--%>
                <div class="col-md-3">
                    <a href="https://github.com/iluwatar" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/582346.jpg"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">设计模式</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        Ilkka Seppälä
                                        iluwatar
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--设计模式 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>
        </div>

        <div class="row">
            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--Binary Wang 开始--%>
                <div class="col-md-3">
                    <a href="https://github.com/binarywang" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/1343140.jpg"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">Binary Wang</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        binarywang
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--Binary Wang 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--尤雨溪 开始--%>
                <div class="col-md-3">
                    <a href="https://evanyou.me/" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/499550.jpg"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">尤雨溪</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        Hello.
                                        My name is Evan You.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--尤雨溪 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>

            <c:if test="${bbsSessionUser != null  && bbsSessionUser.userType==1}">
                <%--Minbo.He 开始--%>
                <div class="col-md-3">
                    <a href="https://github.com/hemin1003" target="_blank"
                       class="text-dark">
                        <div class="card">
                            <div class="card-body clearfix navigation_container">
                                <div class="pull-left">
                                    <div><img
                                            src="/resources/images/navigation/12532310.jpg"
                                            style="background-color: #7c7c7c"
                                            class="navigation_img"><b class="navigation_title">Minbo.He</b>
                                    </div>
                                    <div class="navigation_introduction">
                                        hemin1003
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%--尤雨溪 结束--%>
            </c:if>
            <c:if test="${bbsSessionUser == null || bbsSessionUser.userType==0}">
                <%@include file="vip.jsp" %>
            </c:if>
        </div>
    </div>
</div>