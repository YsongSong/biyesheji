<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>待审核</title>
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
		        <a href="">评审管理</a>
		        <a>
		          <cite>待审核稿件</cite></a>
		      </span>
			<a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
				<i class="layui-icon" style="line-height:30px">&#x1002;</i></a>
		</div>
		<div class="weadmin-body">
			
			<span class="fr" style="line-height:40px; margin-top: -20px;">共有数据：${pb.tr} 条</span>
			
			<table class="layui-table" id="memberList">
				<thead>
					<tr>
						<th>ID</th>
						<th>标题</th>
						<th>作者</th>
						<th>关键词</th>
						<th>投稿期刊</th>
						<th>投稿时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

					<c:choose>

						<c:when test="${pb.tr == 0}">
							<tr>
								<td>
									没有数据!
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="check" items="${pb.beanList}" varStatus="status">
								<tr>
									<td>${status.index + 1}</td>
									<td>${check.articleInfo.articleentitle}</td>
									<td>${check.articleInfo.author.username}</td>
									<td>${check.articleInfo.articlecnkeywords}</td>
									<td id="qikan">${check.articleInfo.qikan.qikanname}</td>
									<td id="receiveArticleTime">${check.articleInfo.receivearticletime}</td>
									<td class="td-manage" style="text-align: center;">
										<a href="${pageContext.request.contextPath}/download.do?filename=${check.articleInfo.articlepath}&authorId=${check.articleInfo.author.userid}" title="下载">
											<i class="layui-icon">&#xe601;</i>
										</a>
										<a title="预览" onclick="WeAdminShow('预览','${pageContext.request.contextPath}/onlinePreview.do?url=${check.articleInfo.articlepath}&userId=${check.articleInfo.author.userid}',600,400)" href="javascript:;">
											<i class="layui-icon">&#xe60a;</i>
										</a>
										<!--
											<a onclick="modifyArticle(this,'要修改的文章url如：modify.do?articleId=1')" href="javascript:;" title="修改">
                                            	<i class="layui-icon">&#xe642;</i>
                                        	</a>
                                        -->
											<a onclick="WeAdminShow('稿件评审','${pageContext.request.contextPath}/expert/toExpertEditorArticle.do?checkId=${check.cheekid}',600,420)" href="javascript:;" title="评审">
												<i class="layui-icon">&#xe6b2;</i>
											</a>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>

					</c:choose>

					
				</tbody>
			</table>
			
			<div class="page">
				<div>
					<span class="current">上一页</span>
					<a class="num" href="">上一页</a>
					
					<a class="num" href="">1</a>
					<span class="current">2</span>
					<a class="num" href="">3</a>
					<a class="num" href="">...</a>
					
					<a class="num" href="">下一页</a>
					<span class="current">下一页</span>
				</div>
			</div>
			
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