<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

	<head>
		<meta charset="UTF-8">
		<title>稿件审核</title>
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
				<input hidden="hidden" id="checkId" name="checkId" value="${check.cheekid}" />
				<div class="layui-form-item">
					<label for="L_articleCNTitle" class="layui-form-label">
		                <span class="we-red"></span>中文标题
		            </label>
					<div class="layui-input-inline">
						<input type="text" readonly="readonly" id="articleCNTitle" name="articleCNTitle" autocomplete="off" class="layui-input" value="${check.articleInfo.articlecntitle}">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label for="L_articleENTitle" class="layui-form-label">
		                <span class="we-red"></span>英文标题
		            </label>
					<div class="layui-input-inline">
						<input type="text" readonly="readonly" id="articleENTitle" name="articleENTitle" autocomplete="off" class="layui-input" value="${check.articleInfo.articleentitle}">
					</div>
				</div>
				
				<div class="layui-form-item layui-form-text">
				    <label class="layui-form-label">中文摘要</label>
				    <div class="layui-input-block">
				      <textarea name="desc" readonly="readonly" placeholder="" class="layui-textarea">${check.articleInfo.articlecnsummary}</textarea>
				    </div>
				</div>
				
				<div class="layui-form-item layui-form-text">
				    <label class="layui-form-label">英文摘要</label>
				    <div class="layui-input-block">
				      <textarea name="desc" readonly="readonly" placeholder="" class="layui-textarea">${check.articleInfo.articleensummary}</textarea>
				    </div>
				</div>
				
				<div class="layui-form-item">
					<label for="L_articleCNKeywords" class="layui-form-label">
		                <span class="we-red"></span>中文关键字
		            </label>
					<div class="layui-input-inline">
						<input type="text" readonly="readonly" id="articleCNKeywords" name="articleCNKeywords" autocomplete="off" class="layui-input" value="${check.articleInfo.articlecnkeywords}">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label for="L_articleENKeywords" class="layui-form-label">
		                <span class="we-red"></span>英文关键字
		            </label>
					<div class="layui-input-inline">
						<input type="text" readonly="readonly" id="articleENKeywords" name="articleENKeywords" autocomplete="off" class="layui-input" value="${check.articleInfo.articleenkeywords}">
					</div>
				</div>
				
				
				<div class="layui-form-item layui-form-text">
				    <label class="layui-form-label">
				    	<span class="we-red">*</span>评审意见
				    </label>
				    <div class="layui-input-block">
				      <textarea name="expertMessage" id="expertMessage" placeholder="请填写评审意见" lay-verify="required" class="layui-textarea"></textarea>
				    </div>
				</div>
				
				
				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label"></label>
					<input type="text" class="layui-btn" lay-filter="add" lay-submit="" value="确定并提交" />
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


				//监听提交
				form.on('submit(add)', function() {
					var expertMessage = $("#expertMessage").val();
					var checkId = $("#checkId").val();

					console.log(expertMessage,checkId);
					$.post(
						$.ajax({
							type:"post",
							url:"${pageContext.request.contextPath}/expert/expertEditorArticle.do",
                    async:true,
							dataType: "json",
							data:{
                                expertMessage:expertMessage,
								checkId:checkId
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