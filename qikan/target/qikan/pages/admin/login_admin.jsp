<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <title>主编登录</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/forground/user/login.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

</head>

<body>
<div class="main" style="margin-left: 450px;margin-top: 100px">
    <div>
        <div class="login1">
            <div class="login2">
                <div class="loginTopDiv">
                    <span class="loginTop">主编登录</span>
                    <span>
                <a href="" class="registBtn"></a>
              </span>
                </div>
                <div>
                    <form target="_top" action="${pageContext.request.contextPath}/toAdminLogin.do" method="post" id="loginForm">
                        <input type="hidden" name="roleid" value="3" />
                        <table>
                            <tr>
                                <td width="50"></td>
                                <td><label class="error" id="msg">${msg}</label></td>
                            </tr>
                            <tr>
                                <td width="50">用户名</td>
                                <td><input class="input" type="text" name="username" id="loginname" value="${adminInfo.username}"/></td>
                            </tr>
                            <tr>
                                <td height="20">&nbsp;</td>
                                <td><label id="loginnameError" class="error"></label></td>
                            </tr>
                            <tr>
                                <td>密　码</td>
                                <td><input class="input" type="password" name="password" id="loginpass" value=""/></td>
                            </tr>
                            <tr>
                                <td height="20">&nbsp;</td>
                                <td><label id="loginpassError" class="error"></label></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="left">
                                    <input type="image" id="submit" src="${pageContext.request.contextPath}/img/login1.jpg" class="loginBtn" style="margin-left: 50px;"/>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script>

    $(function() {
        /*
         * 1. 让登录按钮在得到和失去焦点时切换图片
         */
        $("#submit").hover(
            function() {
                $("#submit").attr("src", "${pageContext.request.contextPath}/img/login2.jpg");
            },
            function() {
                $("#submit").attr("src", "${pageContext.request.contextPath}/img/login1.jpg");
            }
        );

        /*
         * 2. 给注册按钮添加submit()事件，完成表单校验
         */
        $("#submit").click('submit',(function(){
            $("#msg").text("");
            var bool = true;
            $(".input").each(function() {
                var inputName = $(this).attr("id");
                if(!invokeValidateFunction(inputName)) {
                    bool = false;
                }
            });
            return bool;
        }));

        /*
         * 3. 输入框得到焦点时隐藏错误信息
         */
        $(".input").focus(function() {
            var inputName = $(this).attr("id");
            $("#" + inputName + "Error").css("display", "none");
        });

        /*
         * 4. 输入框推动焦点时进行校验
         */
        $(".input").blur(function() {
            var inputName = $(this).attr("id");
            invokeValidateFunction(inputName);
        })
    });

    /*
     * 输入input名称，调用对应的validate方法。
     * 例如input名称为：loginname，那么调用validateLoginname()方法。
     */
    function invokeValidateFunction(inputName) {
        inputName = inputName.substring(0, 1).toUpperCase() + inputName.substring(1);
        var functionName = "validate" + inputName;
        return eval(functionName + "()");
    }

    /*
     * 校验登录名
     */
    function validateLoginname() {
        var bool = true;
        $("#loginnameError").css("display", "none");
        var value = $("#loginname").val();
        if(!value) {// 非空校验
            $("#loginnameError").css("display", "");
            $("#loginnameError").text("用户名不能为空！");
            bool = false;
        } else if(value.length < 3 || value.length > 20) {//长度校验
            $("#loginnameError").css("display", "");
            $("#loginnameError").text("用户名长度必须在3 ~ 20之间！");
            bool = false;
        }
        return bool;
    }

    /*
     * 校验密码
     */
    function validateLoginpass() {
        var bool = true;
        $("#loginpassError").css("display", "none");
        var value = $("#loginpass").val();
        if(!value) {// 非空校验
            $("#loginpassError").css("display", "");
            $("#loginpassError").text("密码不能为空！");
            bool = false;
        } else if(value.length < 3 || value.length > 20) {//长度校验
            $("#loginpassError").css("display", "");
            $("#loginpassError").text("密码长度必须在3 ~ 20之间！");
            bool = false;
        }
        return bool;
    }


</script>

</html>
