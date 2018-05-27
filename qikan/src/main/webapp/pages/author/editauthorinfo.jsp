<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>个人信息修改</title>
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
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="L_username" class="layui-form-label">
                <span class="we-red">*</span>用户名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="username" name="username" lay-verify="required|nikename" autocomplete="off" class="layui-input" value="${user.username}">
            </div>
            <div class="layui-form-mid layui-word-aux">
                请设置至少5个字符
            </div>
        </div>
        <div class="layui-form-item">
            <label for="authorName" class="layui-form-label">
                <span class="we-red">*</span>真实姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="rellname" name="rellname" lay-verify="required" autocomplete="off" class="layui-input" value="${user.rellname}">
            </div>
            <div class="layui-form-mid layui-word-aux">
                请填写真实的信息
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_sex" class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <select name="sex" id="sex" style="width: 40px;">
                    <c:choose>
                        <c:when test="${user.sex.equals('男')}">
                            <option value="男" selected>男</option>
                            <option value="女">女</option>
                        </c:when>

                        <c:otherwise>
                            <option value="男">男</option>
                            <option value="女" selected>女</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="authorName" class="layui-form-label">
                生日
            </label>
            <div class="layui-inline">
                <input class="layui-input" placeholder="如：2000-01-01" name="birthday" id="birthday" value="${user.birthday}">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="username" class="layui-form-label">
                学历
            </label>
            <div class="layui-input-inline">
                <select name="degreeid" id="degreeid">
                    <option value="1">小学</option>
                    <option value="2">初中</option>
                    <option value="3">高中</option>
                    <option value="4">大学</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_email" class="layui-form-label">
                <span class="we-red">*</span>手机
            </label>
            <div class="layui-input-inline">
                <input type="text" id="phonenumber" name="phonenumber" lay-verify="required|phone" autocomplete="" class="layui-input" value="${user.phonenumber}">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_email" class="layui-form-label">
                <span class="we-red">*</span>邮箱
            </label>
            <div class="layui-input-inline">
                <input type="text" id="email" name="email" lay-verify="email" lay-verify="required" autocomplete="off" class="layui-input" value="${user.email}">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="L_address" class="layui-form-label">
                <span class="we-red"></span>通讯地址
            </label>
            <div class="layui-input-inline">
                <input type="text" id="address" name="address" autocomplete="off" class="layui-input" value="${user.address}">
            </div>

        </div>

        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label">
            </label>
            <input type="text" name="" id="" class="layui-btn" lay-filter="add" lay-submit="" value="确定" readonly="readonly">
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
            nikename: function(value) {
                if(value.length < 4) {
                    return '用户名至少得4个字符';
                }
            }
        });
        //监听提交
        form.on('submit(add)', function() {
            var username = $("#username").val();
            var rellname = $("#rellname").val();
            var authorname = $("#authorname").val();
            var sex = $("#sex").val();
            var birthday = $("#birthday").val();
            var degreeid = $("#degreeid").val();
            var phonenumber = $("#phonenumber").val();
            var email = $("#email").val();
            var address = $("#address").val();

            console.log(username,rellname,sex,birthday,degreeid,phonenumber,email,address);
            $.post(
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/author/toEditauthorInfo.do",
                    async:true,
                    dataType: "json",
                    data:{
                        userid:${user.userid},
                        username:username,
                        rellname:rellname,
                        authorname:authorname,
                        sex:sex,
                        birthday:birthday,
                        degreeid:degreeid,
                        phonenumber:phonenumber,
                        email:email,
                        address:address
                    },
                    success:function(data) {
                        console.log(data);
                        if(data.code == 0) {
                            layer.alert(data.msg, {
                                icon: 6
                            }, function() {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                            });
                        }else {
                            layer.alert(data.msg, {
                                icon: 5
                            });
                        }
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