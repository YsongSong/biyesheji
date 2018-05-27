<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>稿件修改</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="weadmin-body">
    <form class="layui-form" action="${pageContext.request.contextPath}/editor/toAddNotice.do" method="post">
        <input hidden="hidden" name="typeId" value="${article.articleInfo.qikan.type.typeid}" />
        <input hidden="hidden" name="typename" value="${article.articleInfo.qikan.type.typename}" />
        <input hidden="hidden" name="articleid" value="${article.articleInfo.articleid}" />
        <input hidden="hidden" name="checkId" value="${article.cheekid}" />

        <div class="layui-form-item">
            <label for="L_articleCNTitle" class="layui-form-label">
                <span class="we-red"></span>中文标题
            </label>
            <div class="layui-input-inline">
                <input type="text" id="articleCNTitle" name="articlecntitle" readonly="readonly" class="layui-input" value="${article.articleInfo.articlecntitle}">
            </div>
            <div class="layui-form-mid layui-word-aux">
                稿件中文标题
            </div>
        </div>

        <div class="layui-form-item">
            <label for="L_articleENTitle" class="layui-form-label">
                <span class="we-red"></span>英文标题
            </label>
            <div class="layui-input-inline">
                <input type="text" id="articleENTitle" name="articleentitle" readonly="readonly" class="layui-input" value="${article.articleInfo.articleentitle}">
            </div>
            <div class="layui-form-mid layui-word-aux">
                稿件英文标题
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="we-red"></span>投稿作者
            </label>
            <div class="layui-input-inline">
                <input type="text" id="author" name="authorname" readonly="readonly" class="layui-input" value="${article.articleInfo.author.rellname}">
            </div>
            <div class="layui-form-mid layui-word-aux">
                稿件作者
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="we-red"></span>投稿期刊
            </label>
            <div class="layui-input-inline">
                <input type="text" id="qikan" name="qikanname" readonly="readonly" class="layui-input" value="${article.articleInfo.qikan.qikanname}">
            </div>
            <div class="layui-form-mid layui-word-aux">
                投稿期刊
            </div>
        </div>

        <div class="layui-form-item">
            <label for="L_articleCNKeywords" class="layui-form-label">
                <span class="we-red">*</span>拟发表日期
            </label>
            <div class="layui-input-inline">
                <input type="text" id="publishTime" name="publishTime" lay-verify="required|publishTime" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                如2018年6月
            </div>
        </div>


        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label">
            </label>
            <button class="layui-btn" lay-filter="add" lay-submit="">下一步</button>
        </div>
    </form>
</div>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">

    layui.extend({
        admin: '{/}../../static/js/admin'
    });
    layui.use(['form', 'jquery', 'admin','layer'], function() {
        var form = layui.form,
            $ = layui.jquery,
            admin = layui.admin,
            layer = layui.layer;


        //监听提交
        form.on('submit(add)', function() {

        });

    });
</script>
</body>

</html>