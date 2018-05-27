<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>注册页面</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/forground/user/regist.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>

<body>
<div id="divMain" style="margin-left: 250px;margin-top: 50px">
    <div id="divTitle">
        <span id="spanTitle">新用户注册</span>
    </div>
    <div id="divBody">
        <form action="${pageContext.request.contextPath}/toRegister.do" method="post" id="registForm">

            <table id="tableForm">
                <tr>
                    <td class="tdText"></td>
                    <td class="tdInput">
                    </td>
                    <td class="tdError">
                        <label class="errorClass">${msg}</label>
                    </td>
                </tr>
                <tr>
                    <td class="tdText">用户名：</td>
                    <td class="tdInput">
                        <input class="inputClass" type="text" name="username" id="username" value=""/>
                    </td>
                    <td class="tdError">
                        <label class="errorClass" id="usernameError"></label>
                    </td>
                </tr>
                <tr>
                    <td class="tdText">登录密码：</td>
                    <td>
                        <input class="inputClass" type="password" name="password" id="password" value="${form.loginpass }"/>
                    </td>
                    <td>
                        <label class="errorClass" id="passwordError"></label>
                    </td>
                </tr>
                <tr>
                    <td class="tdText">真实姓名：</td>
                    <td>
                        <input class="inputClass" type="text" name="rellname" id="rellname" value=""/>
                    </td>
                    <td>
                        <label class="errorClass" id="rellnameError"></label>
                    </td>
                </tr>
                <tr>
                    <td class="tdText">性别：</td>
                    <td>
                        <select class="inputClass" name="sex">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="tdText">生日：</td>
                    <td>
                        <input class="inputClass" type="text" name="birthday" id="birthday" value=""/>
                    </td>
                    <td>
                        <label class="errorClass" id="birthdayError">如：2000-01-12</label>
                    </td>
                </tr>
                <tr>
                    <td class="tdText">学位：</td>
                    <td>
                        <select class="inputClass" name="degreeid">
                            <option value="1">小学</option>
                            <option value="2">初中</option>
                            <option value="3">高中</option>
                            <option value="4">本科</option>
                            <option value="5">研究生</option>
                            <option value="6">博士</option>
                        </select>
                    </td>
                    <td>
                        <label class="errorClass" id=""></label>
                    </td>
                </tr>
                <tr>
                    <td class="tdText">Email：</td>
                    <td>
                        <input class="inputClass" type="text" name="email" id="email" value=""/>
                    </td>
                    <td>
                        <label class="errorClass" id="emailError"></label>
                    </td>
                </tr>
                <tr>
                    <td class="tdText">电话：</td>
                    <td>
                        <input class="inputClass" type="text" name="phonenumber" id="phonenumber" value=""/>
                    </td>
                    <td>
                        <label class="errorClass" id="phonenumberError"></label>
                    </td>
                </tr>
                <tr>
                    <td class="tdText">通讯地址：</td>
                    <td>
                        <input class="inputClass" type="text" name="address" id="address" value=""/>
                    </td>
                    <td>
                        <label class="errorClass" id="addressError"></label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="image" src="${pageContext.request.contextPath}/img/regist1.jpg" id="submitBtn"/>
                    </td>
                    <td>
                        <label></label>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<script type="text/javascript">

    $(function() {
        /*
         * 1. 得到所有的错误信息，循环遍历之。调用一个方法来确定是否显示错误信息！
         */
        $(".errorClass").each(function() {
            showError($(this));//遍历每个元素，使用每个元素来调用showError方法
        });

        /*
         * 2. 切换注册按钮的图片
         */
        $("#submitBtn").hover(
            function() {
                $("#submitBtn").attr("src", "${pageContext.request.contextPath}/img/regist2.jpg");
            },
            function() {
                $("#submitBtn").attr("src", "${pageContext.request.contextPath}/img/regist1.jpg");
            }
        );

        /*
         * 3. 输入框得到焦点隐藏错误信息
         */
        $(".inputClass").focus(function() {
            var labelId = $(this).attr("id") + "Error";//通过输入框找到对应的label的id
            $("#" + labelId).text("");//把label的内容清空！
            showError($("#" + labelId));//隐藏没有信息的label
        });

        /*
         * 4. 输入框失去焦点进行校验
         */
        $(".inputClass").blur(function() {
            var id = $(this).attr("id");//获取当前输入框的id
            var funName = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";//得到对应的校验函数名
            eval(funName);//执行函数调用
        });

        /*
         * 5. 表单提交时进行校验
         */
        $("#registForm").submit(function() {
            var bool = true;//表示校验通过
            if(!validateUsername()) {
                bool = false;
            }
            if(!validatePassword()) {
                bool = false;
            }
            if(!validateRellname()) {
                bool = false;
            }
            if(!validatePhonenumber()) {
                bool = false;
            }
            if(!validateEmail()) {
                bool = false;
            }

            return bool;
        });
    });

    /*
     * 登录名校验方法
     */
    function validateUsername() {
        var id = "username";
        var value = $("#" + id).val();//获取输入框内容
        /*
         * 1. 非空校验
         */
        if(!value) {
            /*
             * 获取对应的label
             * 添加错误信息
             * 显示label
             */
            $("#" + id + "Error").text("用户名不能为空！");
            showError($("#" + id + "Error"));
            return false;
        }
        /*
         * 2. 长度校验
         */
        if(value.length < 3 || value.length > 20) {
            /*
             * 获取对应的label
             * 添加错误信息
             * 显示label
             */


            showError($("#" + id + "Error"));
            return false;
        }
        /*
         * 3. 是否注册校验
         */
        $.ajax({
            url:"/goods/UserServlet",//要请求的servlet
            data:{method:"ajaxValidateLoginname", loginname:value},//给服务器的参数
            type:"POST",
            dataType:"json",
            async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
            cache:false,
            success:function(result) {
                if(!result) {//如果校验失败
                    $("#" + id + "Error").text("用户名已被注册！");
                    showError($("#" + id + "Error"));
                    return false;
                }
            }
        });
        return true;
    }

    /*
     * 登录密码校验方法
     */
    function validatePassword() {
        var id = "password";
        var value = $("#" + id).val();//获取输入框内容
        /*
         * 1. 非空校验
         */
        if(!value) {
            /*
             * 获取对应的label
             * 添加错误信息
             * 显示label
             */
            $("#" + id + "Error").text("密码不能为空！");
            showError($("#" + id + "Error"));
            return false;
        }
        /*
         * 2. 长度校验
         */
        if(value.length < 3 || value.length > 20) {
            /*
             * 获取对应的label
             * 添加错误信息
             * 显示label
             */
            $("#" + id + "Error").text("密码长度必须在3 ~ 20之间！");
            showError($("#" + id + "Error"));
            false;
        }
        return true;
    }

    /*
     * 真实姓名校验
     */
    function validateRellname() {
        var id = "rellname";
        var value = $("#" + id).val();//获取输入框内容
        /*
         * 1. 非空校验
         */
        if(!value) {
            /*
             * 获取对应的label
             * 添加错误信息
             * 显示label
             */
            $("#" + id + "Error").text("真实姓名不能为空！");
            showError($("#" + id + "Error"));
            return false;
        }
        return true;
    }

    /*
     * 电话校验
     */
    function validatePhonenumber() {
        var id = "phonenumber";
        var value = $("#" + id).val();//获取输入框内容
        /*
         * 1. 非空校验
         */
        if(!value) {
            /*
             * 获取对应的label
             * 添加错误信息
             * 显示label
             */
            $("#" + id + "Error").text("电话号码不能为空！");
            showError($("#" + id + "Error"));
            return false;
        }
        if(value.length!=11) {
            /*
             * 获取对应的label
             * 添加错误信息
             * 显示label
             */
            $("#" + id + "Error").text("电话号码格式不正确！");
            showError($("#" + id + "Error"));
            return false;
        }
        return true;
    }


    /*
     * Email校验方法
     */
    function validateEmail() {
        var id = "email";
        var value = $("#" + id).val();//获取输入框内容
        /*
         * 1. 非空校验
         */
        if(!value) {
            /*
             * 获取对应的label
             * 添加错误信息
             * 显示label
             */
            $("#" + id + "Error").text("Email不能为空！");
            showError($("#" + id + "Error"));
            return false;
        }
        /*
         * 2. Email格式校验
         */
        if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(value)) {
            /*
             * 获取对应的label
             * 添加错误信息
             * 显示label
             */
            $("#" + id + "Error").text("错误的Email格式！");
            showError($("#" + id + "Error"));
            false;
        }
        /*
         * 3. 是否注册校验
         */
        $.ajax({
            url:"/goods/UserServlet",//要请求的servlet
            data:{method:"ajaxValidateEmail", email:value},//给服务器的参数
            type:"POST",
            dataType:"json",
            async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
            cache:false,
            success:function(result) {
                if(!result) {//如果校验失败
                    $("#" + id + "Error").text("Email已被注册！");
                    showError($("#" + id + "Error"));
                    return false;
                }
            }
        });
        return true;
    }

    /*
     * 判断当前元素是否存在内容，如果存在显示，不页面不显示！
     */
    function showError(ele) {
        var text = ele.text();//获取元素的内容
        if(!text) {//如果没有内容
            ele.css("display", "none");//隐藏元素
        } else {//如果有内容
            ele.css("display", "");//显示元素
        }
    }


</script>

</body>
</html>
