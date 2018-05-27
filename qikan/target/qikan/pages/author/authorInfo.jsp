<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
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
<div class="weadmin-nav">
			<span class="layui-breadcrumb">
		        <a href="">首页</a>
		        <a href="">个人信息管理</a>
		        <a>
		          <cite>个人信息</cite></a>
		      </span>
    <a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">&#x1002;</i></a>
</div>
<div class="weadmin-body">

    <table class="layui-table" id="memberList">
        <thead>
        <tr>
            <th colspan="2" scope="col">个人信息</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td width="30%">用户名</td>
            <td>${user.username}</td>
        </tr>
        <tr>
            <td>真实姓名</td>
            <td>${user.rellname}</td>
        </tr>
        <tr>
            <td>性别</td>
            <td>${user.sex}</td>
        </tr>
        <tr>
            <td>生日</td>
            <td>${user.birthday}</td>
        </tr>
        <tr>
            <td>学历</td>
            <td>${user.degreeid}</td>
        </tr>
        <tr>
            <td>手机号码</td>
            <td>${user.phonenumber}</td>
        </tr>
        <tr>
            <td>邮箱</td>
            <td>${user.email}</td>
        </tr>
        <tr>
            <td>通讯地址</td>
            <td>${user.address}</td>
        </tr>
        </tbody>
    </table>

    <a class="layui-btn" title="编辑" onclick="WeAdminEdit('编辑','${pageContext.request.contextPath}/author/editauthorinfo.do?userid=${user.userid}', 2, 600, 400)" href="javascript:;">修改</a>
</div>
<!--<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>-->

<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script>
    layui.extend({
        admin: '${pageContext.request.contextPath}/static/js/admin'
    });
    layui.use(['laydate', 'jquery', 'admin'], function() {
        var laydate = layui.laydate,
            $ = layui.jquery,
            admin = layui.admin;
        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });
        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });


        /*用户-删除*/
        window.member_del = function (obj, id) {
            layer.confirm('确认要删除吗？', function(index) {
                //发异步删除数据
                $(obj).parents("tr").remove();
                layer.msg('已删除!', {
                    icon: 1,
                    time: 1000
                });
            });
        }

        /*用户-文件下载*/
        window.fileload = function (obj, id) {
            layer.confirm('确认要下载文件吗？', function(index) {
                //发异步删除数据
                layer.msg('已下载!', {
                    icon: 1,
                    time: 1000
                });
            });
        }

    });
</script>
</body>

</html>