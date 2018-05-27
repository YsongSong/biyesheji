<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>返回信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forground/home.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forground/index.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forground/loginDialog.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forground/qikan.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js" ></script>



</head>
<body>
<!-- 顶部登录注册 start  -->
<div class="top_nav">
    <div class="w1060 clearfix">
        <div class="fl">期刊在线投稿</div>
        <c:choose>
            <c:when test="${authorInfo!= null}">
                <div class="help">
                    <span class="red">${authorInfo.username}</span><span>|</span><a href="${pageContext.request.contextPath}/author/admin.do">个人中心</a><span>|</span><a href="${pageContext.request.contextPath}/author/logOut.do">退出登录</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="help">
                    <a href="${pageContext.request.contextPath}/login.do?systemId=333" class="red">{登录}</a><span>|</span><a href="${pageContext.request.contextPath}/pages/author/regist.jsp">{注册}</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<!-- 顶部登录注册  end  -->

<!-- 搜索栏 start -->
<div class="header">
    <div class="logo clearfix">
        <a href="http://www.24zazhi.com/"><img src="${pageContext.request.contextPath}/img/logo1.jpg"></a>
    </div>
    <div class="header_txt"></div>
    <div class="search">
        <form>
            <input type="text" class="search_text" id="search_t" value="请输入搜索内容" onfocus="this.value=&#39;&#39;">
            <input type="button" class="search_btn s" value="搜索" onclick="opsearch()" id="search_btn"><br>
            <font style="color:#aeaeae; font-size:12px;">商业文化 &nbsp;&nbsp;|&nbsp; 工程建设与设计 &nbsp;| &nbsp;中小企业管理与科技</font>
        </form>
    </div>
    <div class="tel">
        <img src="${pageContext.request.contextPath}/img/logo2.jpg">
    </div>
</div>
<!-- 搜索栏 end -->

<!-- 导航栏 start -->

<!-- 导航 start -->
<div class="w1060 clearfix pos_r">

    <div id="nav">
        <ul>
            <li><a href="${pageContext.request.contextPath}/index.do" target="_blank"><em></em>首页</a></li>
            <li><a href="${pageContext.request.contextPath}/qikan.jsp" target="_blank">关于我们</a></li>
            <li><a href="#" target="_blank">学术期刊</a></li>
            <li><a href="#" target="_blank">学术论文</a></li>

            <li><a href="#" target="_blank">联系我们</a></li>
            <li><a href="#" target="_blank">帮助中心</a></li>
            <li><a href="${pageContext.request.contextPath}/contributePage/tougao.do" target="_blank">在线投稿</a></li>
        </ul>
    </div>
</div>
<!-- 导航 end -->

<!-- 主要 -->

<div class="w1060 pos_r">

    <div class="product_sort fl">
        <div class="hd">在线办公</div>
        <div class="bd  hide">
            <div class="item">
                <div class="title one">
                    <!--<em class="book_icon"></em>-->
                    <a target="_blank" href="${pageContext.request.contextPath}/contributePage/tougao.do">在线投稿</a>
                </div>
            </div>
            <div class="item">
                <div class="title one">
                    <!--<em class="book_icon"></em>-->
                    <a target="_blank" href="${pageContext.request.contextPath}/login.do?systemId=222">在线审稿</a>
                </div>
            </div>
            <div class="item">
                <div class="title one">
                    <!--<em class="book_icon"></em>-->
                    <a target="_blank" href="${pageContext.request.contextPath}/login.do?systemId=111">编辑办公</a>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- 返回信息 start -->

<div class="w1060" style="width: 100%; height: 300px">
    <center>

        <font size="14" color="red">${msg}</font>

    </center>
</div>

<!-- 返回信息 end -->

<!-- 底部 start -->
<div id="footer">
    <div class="w1060">
        <div class="footer_link">
            <p>版权所有：长江大学计算机科学学院软工2班LWAITING</p>
            <a href="https://ysongsong.github.io/qikan/" target="_blank">项目地址：https://ysongsong.github.io/qikan/</a>
            <p>联系地址：湖北荆州市南环路1号 长江大学计算机科学学院 434023</p>
        </div>

        <div class="left">
            <p class="admin_login">
                <span id="btnLogin"><a href="#">管理登录</a></span>
            </p>
        </div>

    </div>
</div>
<!-- 底部 end -->

</body>
</html>
