<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>修改密码</title>
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
		          <cite>密码修改</cite></a>
		      </span>
</div>
<div class="weadmin-body" style="margin-left: 200px; margin-top: 100px;">
	<form class="layui-form">
		<div class="layui-form-item">
			<label for="L_username" class="layui-form-label">
				<span class="we-red">*</span>旧密码
			</label>
			<div class="layui-input-inline">
				<input type="password" id="oldpassword" name="oldpassword" lay-verify="required|oldpassword" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux">
				请输入旧密码
			</div>
		</div>
		<div class="layui-form-item">
			<label for="authorName" class="layui-form-label">
				<span class="we-red">*</span>新密码
			</label>
			<div class="layui-input-inline">
				<input type="password" id="newpassword" name="newpassword" lay-verify="required|newpassword" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux">
				请输入新密码
			</div>
		</div>

		<div class="layui-form-item">
			<label for="L_repass" class="layui-form-label">
			</label>
			<input type="text" class="layui-btn" lay-filter="add" lay-submit="" value="确定" />
		</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">

    layui.extend({
        admin: '${pageContext.request.contextPath}/static/js/admin'
    });
    layui.use(['form', 'jquery', 'admin','layer'], function() {
        var form = layui.form,
            $ = layui.jquery,
            admin = layui.admin,
            layer = layui.layer;

        //自定义验证规则
        form.verify({
            oldpassword: function(value) {
                if(value.length < 6) {
                    return '密码至少得6个字符';
                }
            },

            newpassword: function(value) {
                if(value.length < 6) {
                    return '密码至少得6个字符';
                }
            }
        });
        //监听提交
        form.on('submit(add)', function() {
            var oldpassword = $("#oldpassword").val();
            var newpassword = $("#newpassword").val();
            console.log(oldpassword,newpassword);
            $.post(
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/expert/toUpdatePassword.do",
                    async:true,
                    dataType: "json",
                    data:{
                        oldpassword:oldpassword,
                        newpassword:newpassword
                    },
                    success:function(result) {
                        console.log(result);
                        if(result.code == 0) {
                            layer.alert("修改成功", {
                                icon: 6
                            });
                        }else {
                            layer.alert(result.msg, {
                                icon: 5
                            });
                        }
                    },
                    error:function(){
                        layer.alert("修改失败，请重试", {
                            icon: 5
                        });
                    }
                })
            );
//					layer.alert("增加成功", {
//						icon: 6
//					}, function() {
//						// 获得frame索引
//						var index = parent.layer.getFrameIndex(window.name);
//						//关闭当前frame
//						parent.layer.close(index);
//					});
//					return false;
        });

    });
</script>
</body>

</html>