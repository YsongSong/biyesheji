<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>退稿信息</title>
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
		        <a href="">消息管理</a>
		        <a>
		          <cite>退稿信息</cite></a>
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
						<th>关键词</th>
						<th>投稿期刊</th>
						<th>投稿时间</th>
						<th>退稿时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

					<c:choose>

						<c:when test="${pb.tr == 0}">
							<tr>
								<td colspan="7">
									没有数据!
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="article" items="${pb.beanList}" varStatus="status">
								<tr>
									<td>${status.index + 1}</td>
									<td>${article.articleentitle}</td>
									<td>${article.articlecnkeywords}</td>
									<td>${article.qikan.qikanname}</td>
									<td>${article.receivearticletime}</td>
									<td>${article.updatearticletime}</td>
									<td class="td-manage" style="text-align: center;">
										<a title="预览" onclick="WeAdminShow('预览','${pageContext.request.contextPath}/onlinePreview.do?url=${article.articlepath}&userId=${article.author.userid}',600,400)" href="javascript:;">
											<i class="layui-icon">&#xe60a;</i>
										</a>
										<a title="查看详情" onclick="WeAdminShow('查看详情','${pageContext.request.contextPath}/editor/toTuiGaoDetail.do?articleId=${article.articleid}',600,400)" href="javascript:;">
											<i class="layui-icon">&#xe60a;</i>
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

					<c:choose>
						<c:when test="${pb.pc eq 1 }"><span class="current">上一页</span></c:when>
						<c:otherwise><a href="${pb.url }&pc=${pb.pc-1}" class="num">上一页</a></c:otherwise>
					</c:choose>

					<%--我们需要计算页码列表的开始和结束位置，即两个变量begin和end
                        计算它们需要通过当前页码！
                        1. 总页数不足6页--> begin=1, end=最大页
                        2. 通过公式设置begin和end，begin=当前页-1，end=当前页+3
                        3. 如果begin<1，那么让begin=1，end=6
                        4. 如果end>tp, 让begin=tp-5, end=tp
                     --%>

					<c:choose>
						<c:when test="${pb.tp <= 6 }">
							<c:set var="begin" value="1"/>
							<c:set var="end" value="${pb.tp }"/>
						</c:when>
						<c:otherwise>
							<c:set var="begin" value="${pb.pc-2 }"/>
							<c:set var="end" value="${pb.pc + 3}"/>
							<c:if test="${begin < 1 }">
								<c:set var="begin" value="1"/>
								<c:set var="end" value="6"/>
							</c:if>
							<c:if test="${end > pb.tp }">
								<c:set var="begin" value="${pb.tp-5 }"/>
								<c:set var="end" value="${pb.tp }"/>
							</c:if>
						</c:otherwise>
					</c:choose>

					<c:forEach begin="${begin }" end="${end }" var="i">
						<c:choose>
							<c:when test="${i eq pb.pc }">
								<span class="current">${i}</span>
							</c:when>
							<c:otherwise>
								<a href="${pb.url }&pc=${i}" class="num">${i }</a>
							</c:otherwise>
						</c:choose>

					</c:forEach>
					<%-- 计算begin和end --%>
					<%-- 如果总页数<=6，那么显示所有页码，即begin=1 end=${pb.tp} --%>
					<%-- 设置begin=当前页码-2，end=当前页码+3 --%>
					<%-- 如果begin<1，那么让begin=1 end=6 --%>
					<%-- 如果end>最大页，那么begin=最大页-5 end=最大页 --%>

					<%-- 显示点点点 --%>
					<c:if test="${end < pb.tp }">
						<a class="num" href="">...</a>
					</c:if>

					<%--下一页 --%>
					<c:choose>
						<c:when test="${pb.pc eq pb.tp }"><span class="current">下一页</span></c:when>
						<c:otherwise><a href="${pb.url }&pc=${pb.pc+1}" class="num">下一页</a></c:otherwise>
					</c:choose>


				</div>
			</div>
			
		</div>
		<!--<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>-->
		<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
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


            });
		</script>

	</body>

</html>