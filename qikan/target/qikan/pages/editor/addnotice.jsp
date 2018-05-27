<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>录用通知编辑</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">

    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>

    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="weadmin-body">

    <form class="layui-form">

        <input hidden="hidden" id="noticetitle" name="noticetitle" value="《${typename}》录用通知书" />
        <input hidden="hidden" id="typeId" name="typeId" value="${typeId}" />
        <input hidden="hidden" id="articleId" name="articleId" value="${articleInfo.articleid}" />
        <input hidden="hidden" id="checkId" name="checkId" value="${checkId}" />

        <div align="center">

            <div style="margin-bottom: 20px;">
                <font style="font-size: 18px; color: red;">请核对录用通知单</font>
            </div>

            <script id="editor" type="text/plain" style="width:600px;height:300px;">

                <center>

                    <span style="font-family:宋体;color:#FF0000;font-size:22.0000pt;">录用通知书</span><span style="font-family:宋体;color:#FF0000;font-size:22.0000pt;"></span>

                </center>
                </p>
                <p>
                    <b><span style="font-family:宋体;font-size:16pt;">${authorname}</span></b><span style="font-family:宋体;font-size:16pt;">同志：</span>
                </p>
                <p>
                    <span style="font-family:宋体;font-size:16.0000pt;"></span>
                </p>
                <p style="text-indent:32.0000pt;">
                    <span style="font-family:宋体;font-size:16.0000pt;">您撰写的文章《</span><b><span style="font-family:宋体;font-size:16pt;">${articleInfo.articleentitle}</span></b><span style="font-family:宋体;font-size:16.0000pt;">》经专家指导委员会审阅，符合我刊录用标准，拟于</span><b><span style="font-family:宋体;font-size:16pt;">${publishTime}</span></b><span style="font-family:宋体;font-size:16.0000pt;">发表，出刊后编辑部邮寄当期样刊，以供用途。</span><b><span style="font-family:宋体;font-size:16pt;"></span></b>
                </p>
                <p style="text-indent:0px;">
                    <span style="font-family:宋体;font-size:16.0000pt;">&nbsp; 特此通知，请勿他投。</span><span style="font-family:宋体;font-size:16.0000pt;"></span>
                </p>
                <p>
                    <span style="font-family:宋体;font-size:16.0000pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="font-family:宋体;font-size:16pt;text-align:right;">${qikanname}</span>
                </p>
                <p align="right" style="text-align:right;">
                    <span style="font-family:宋体;font-size:16.0000pt;"></span>
                </p>
                <p style="text-indent:272.0000pt;">
                    <span style="font-family:宋体;font-size:16.0000pt;">${typename}编辑部</span><span style="font-family:宋体;font-size:16.0000pt;"></span>
                </p>
                <p style="text-indent:264.0000pt;">
                    <span style="font-family:宋体;font-size:16.0000pt;">&nbsp;&nbsp;${nowDate}</span>
                </p>

            </script>

        </div>

            <div style="margin-top: 20px;" align="center">
                <div class="layui-form-item">
                <input type="text" class="layui-btn" lay-filter="add" lay-submit="" value="确定"></input>
                </div>
                </div>

                </form>
                </div>
                <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
            <script type="text/javascript">
                //实例化编辑器
                //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                var ue = UE.getEditor('editor',{
                    toolbars:[
                        ['fullscreen', 'source', 'undo', 'redo'],
                        ['bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc']
                    ]
                });

                layui.extend({
                    admin: '${pageContext.request.contextPath}/static/js/admin'
                });
                layui.use(['form', 'jquery', 'admin','layer'], function() {
                    var form = layui.form,
                        $ = layui.jquery,
                        admin = layui.admin,
                        layer = layui.layer;

                    //监听提交
                    form.on('submit(add)', function() {
                        var noticecontent = ue.getContent();
                        var noticetext = ue.getContentTxt();
                        var noticetitle = $("#noticetitle").val();
                        var typeId = $("#typeId").val();
                        var articleId = $("#articleId").val();
                        var checkId = $("#checkId").val();

                        $.post(
                            $.ajax({
                                type:"post",
                                url:"${pageContext.request.contextPath}/editor/fabiao.do",
                                async:true,
                                dataType: "json",
                                data:{
                                    noticecontent : noticecontent,
                                    noticetext : noticetext,
                                    noticetitle : noticetitle,
                                    typeId : typeId,
                                    articleId : articleId,
                                    checkId : checkId
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
                    });

                });

            </script>
</body>

</html>