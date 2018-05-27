<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

	<head>
		<meta charset="UTF-8">
		<title>稿件详情</title>
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
			<form class="layui-form" action="localhost:8080/qikan/totest.do" method="post">

				<div class="layui-form-item">
					<label for="L_articleCNTitle" class="layui-form-label">
						<span class="we-red">*</span>作者
					</label>
					<div class="layui-input-inline">
						<input type="text" id="zuthor" name="author" readonly="readonly" class="layui-input" value="">
					</div>
					<div class="layui-form-mid layui-word-aux">
						作者
					</div>
				</div>

				<div class="layui-form-item">
					<label for="L_articleCNTitle" class="layui-form-label">
		                <span class="we-red">*</span>中文标题
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="articleCNTitle" name="articleCNTitle" readonly="readonly" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						中文标题
					</div>
				</div>
				
				<div class="layui-form-item">
					<label for="L_articleENTitle" class="layui-form-label">
		                <span class="we-red">*</span>英文标题
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="articleENTitle" name="articleENTitle" readonly="readonly" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						英文标题
					</div>
				</div>
				
				<div class="layui-form-item">
					<label for="L_articleCNSummary" class="layui-form-label">
		                <span class="we-red">*</span>中文摘要
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="articleCNSummary" name="articleCNSummary" readonly="readonly" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						中文摘要
					</div>
				</div>
				
				<div class="layui-form-item">
					<label for="L_articleENSummary" class="layui-form-label">
		                <span class="we-red">*</span>英文摘要
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="articleENSummary" name="articleENSummary" readonly="readonly" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						英文摘要
					</div>
				</div>
				
				<div class="layui-form-item">
					<label for="L_articleCNKeywords" class="layui-form-label">
		                <span class="we-red">*</span>中文关键字
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="articleCNKeywords" name="articleCNKeywords" readonly="readonly" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						中文关键字
					</div>
				</div>
				
				<div class="layui-form-item">
					<label for="L_articleENKeywords" class="layui-form-label">
		                <span class="we-red">*</span>英文关键字
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="articleENKeywords" name="articleENKeywords" readonly="readonly" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						英文关键字
					</div>
				</div>

				<div class="layui-form-item">
					<label for="L_articleENKeywords" class="layui-form-label">
						<span class="we-red"></span>投稿日期
					</label>
					<div class="layui-input-inline">
						<input type="text" id="time" name="time" readonly="readonly" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						投稿日期
					</div>
				</div>

				<div class="layui-form-item">
					<label for="L_articleENKeywords" class="layui-form-label">
						<span class="we-red"></span>专家意见
					</label>
					<div class="layui-input-inline">
						<input type="text" id="expertMessage" name="expertMessage" readonly="readonly" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						专家意见
					</div>
				</div>

				<div class="layui-form-item">
					<label for="L_articleENKeywords" class="layui-form-label">
						<span class="we-red"></span>发表日期
					</label>
					<div class="layui-input-inline">
						<input type="text" id="publishtime" name="publishtime" readonly="readonly" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						发表日期
					</div>
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
			});
		</script>
	</body>

</html>