<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

	<head>
		<meta charset="UTF-8">
		<title>专家分派</title>
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
		                <span class="we-red"></span>中文标题
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="title" name="title" readonly="readonly" class="layui-input" value="${article.articlecntitle}">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="authorName" class="layui-form-label">
		                <span class="we-red"></span>作者姓名
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="authorname" name="authorname" readonly="readonly" class="layui-input" value="${article.author.rellname}">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="authorName" class="layui-form-label">
		                <span class="we-red"></span>投稿期刊
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="qikan" name="qikan" autocomplete="off" readonly="readonly" class="layui-input" value="${article.qikan.qikanname}">
					</div>
				</div>
				<div class="layui-form-item">
	                <label for="expert" class="layui-form-label">
	                	专家分派
	                </label>
	                <div class="layui-input-inline">
	                    <select name="expertId" id="expertId">

							<c:forEach var="expert" items="${experts}">
								<option value="${expert.userid}">${expert.rellname}</option>
							</c:forEach>

	                    </select>
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
						if(value.length < 5) {
							return '用户名至少得5个字符';
						}
					}
				});
				//监听提交
				form.on('submit(add)', function() {
					var articleId = ${article.articleid};
					var expertId = $("#expertId").val();
					
					console.log(articleId, expertId);

					$.post(
						$.ajax({
							type:"post",
							url:"${pageContext.request.contextPath}/editor/sendExpert.do",
							async:true,
							dataType: "json",
							data:{
								articleId : articleId,
								expertId : expertId
							},
							success:function(data) {
								console.log(data);
								if(data.code == 0) {
                                    layer.alert("分派成功", {
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