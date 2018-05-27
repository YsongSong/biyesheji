<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

	<head>
		<meta charset="UTF-8">
		<title>评审意见</title>
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
					
			<div class="layui-form-item">
				<label for="L_articleCNTitle" class="layui-form-label">
	                <span class="we-red"></span>作者
	            </label>
				<div class="layui-input-inline">
					<input type="text" readonly="readonly" id="author" name="author" autocomplete="off" class="layui-input" value="${checkArticle.articleInfo.author.rellname}">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="L_articleCNTitle" class="layui-form-label">
	                <span class="we-red"></span>中文标题
	            </label>
				<div class="layui-input-inline">
					<input type="text" readonly="readonly" id="articleCNTitle" name="articleCNTitle" autocomplete="off" class="layui-input" value="${checkArticle.articleInfo.articlecntitle}">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="L_articleENTitle" class="layui-form-label">
	                <span class="we-red"></span>英文标题
	            </label>
				<div class="layui-input-inline">
					<input type="text" readonly="readonly" id="articleENTitle" name="articleENTitle" autocomplete="off" class="layui-input" value="${checkArticle.articleInfo.articleentitle}">
				</div>
			</div>
			
			<div class="layui-form-item layui-form-text">
			    <label class="layui-form-label">中文摘要</label>
			    <div class="layui-input-block">
			      <textarea name="desc" readonly="readonly" placeholder="" class="layui-textarea">
					  ${checkArticle.articleInfo.articlecnsummary}
				  </textarea>
			    </div>
			</div>
			
			<div class="layui-form-item layui-form-text">
			    <label class="layui-form-label">英文摘要</label>
			    <div class="layui-input-block">
			      <textarea name="desc" readonly="readonly" placeholder="" class="layui-textarea">
					  ${checkArticle.articleInfo.articleensummary}
				  </textarea>
			    </div>
			</div>
			
			<div class="layui-form-item">
				<label for="L_articleCNKeywords" class="layui-form-label">
	                <span class="we-red"></span>中文关键字
	            </label>
				<div class="layui-input-inline">
					<input type="text" readonly="readonly" id="articleCNKeywords" name="articleCNKeywords" autocomplete="off" class="layui-input" value="${checkArticle.articleInfo.articlecnkeywords}">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="L_articleENKeywords" class="layui-form-label">
	                <span class="we-red"></span>英文关键字
	            </label>
				<div class="layui-input-inline">
					<input type="text" readonly="readonly" id="articleENKeywords" name="articleENKeywords" autocomplete="off" class="layui-input" value="${checkArticle.articleInfo.articleenkeywords}">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="L_articleCNTitle" class="layui-form-label">
	                <span class="we-red"></span>投稿时间
	            </label>
				<div class="layui-input-inline">
					<input type="text" readonly="readonly" id="receivearticletime" name="receivearticletime" autocomplete="off" class="layui-input" value="${checkArticle.articleInfo.receivearticletime}">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label for="L_articleCNTitle" class="layui-form-label">
	                <span class="we-red"></span>退稿时间
	            </label>
				<div class="layui-input-inline">
					<input type="text" readonly="readonly" id="updatearticletime" name="updatearticletime" autocomplete="off" class="layui-input" value="${checkArticle.articleInfo.updatearticletime}">
				</div>
			</div>
			
			
			<div class="layui-form-item layui-form-text">
			    <label class="layui-form-label">专家评审意见</label>
			    <div class="layui-input-block">
			      <textarea name="message" readonly="readonly" placeholder="" class="layui-textarea">${checkArticle.expertmessage}</textarea>
			    </div>
			</div>
			
			<div class="layui-form-item">
			    <label class="layui-form-label">主编评审意见</label>
			    <div class="layui-input-inline">
			      <input type="text" name="message" readonly="readonly" class="layui-textarea" value="审核不通过"/>
			    </div>
			</div>
			
		</div>
		<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript">
			
			layui.extend({
				admin: '${pageContext.request.contextPath}/static/js/admin'
			});

		</script>
	</body>

</html>