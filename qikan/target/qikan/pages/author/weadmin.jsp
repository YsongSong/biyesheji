<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="shortcut icon" href="../../favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>

</head>

<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="#">投稿系统作者在线管理</a>
    </div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">${authorInfo.username}</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a class="loginout" href="${pageContext.request.contextPath}/author/logOut.do">退出</a>
                </dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index">
            <a href="${pageContext.request.contextPath}/index.do">去投稿</a>
        </li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">

            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe705;</i>
                    <cite>文章管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/author/auditingArticles.do">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>已投稿件</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="${pageContext.request.contextPath}/author/checkupArticles.do">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>已审核</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="${pageContext.request.contextPath}/author/publishedArticles.do">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>已发表稿件</cite>
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>个人中心</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/author/authorInfo.do">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>个人信息</cite>

                        </a>
                    </li>
                    <li>
                        <a _href="${pageContext.request.contextPath}/author/updatepassword.do">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>密码修改</cite>

                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont">&#xe70b;</i>
                            <cite>会员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a _href="./pages/member/addInput.html">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>输入框操作</cite>
                                </a>
                            </li>
                            <li>
                                <a _href="./pages/404.html">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>三级菜单演示</cite>
                                </a>
                            </li>
                            <li>
                                <a _href="./pages/404.html">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>导航菜单演示</cite>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>


        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="wenav_tab" id="WeTabTip" lay-allowclose="true">
        <ul class="layui-tab-title" id="tabName">
            <li>我的桌面</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='' frameborder="0" scrolling="yes" class="weIframe"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">Copyright ©2018 WeAdmin v1.0 All Rights Reserved</div>
</div>
<!-- 底部结束 -->
<script type="text/javascript">
    //			layui扩展模块的两种加载方式-示例
    //		    layui.extend({
    //			  admin: '{/}../../static/js/admin' // {/}的意思即代表采用自有路径，即不跟随 base 路径
    //			});
    //			//使用拓展模块
    //			layui.use('admin', function(){
    //			  var admin = layui.admin;
    //			});
    layui.config({
        base: '${pageContext.request.contextPath}/static/js/'
        ,version: '101100'
    }).use('admin');


</script>
</body>

</html>