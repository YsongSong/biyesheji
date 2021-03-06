<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>主编未审核稿件页面</title>
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
		        <a href="">主编评审管理</a>
		        <a>
		          <cite>未审核</cite></a>
		      </span>
			<a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
				<i class="layui-icon" style="line-height:30px">&#x1002;</i></a>
		</div>
		<div class="weadmin-body">
			
			<span class="fr" style="line-height:40px; margin-top: -20px;">共有数据：88 条</span>
			
			<table class="layui-table" id="memberList">
				<thead>
					<tr>
						<th>ID</th>
						<th>标题</th>
						<th>关键词</th>
						<th>投稿期刊</th>
						<th>投稿时间</th>
						<th>审稿专家</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					
					<tr>
						<td>1</td>
						<td>第一篇文章</td>
						<td>文章</td>
						<td id="qikan">《经济之声》</td>
						<td id="receiveArticleTime">2018-04-26</td>
						<td id="editStatus">同意发表</td>
						<td class="td-manage" style="text-align: center;">
							<a onclick="fileload(this,'要下载的稿件编号路径')" href="javascript:;" title="下载">
								<i class="layui-icon">&#xe601;</i>
							</a>
							<a title="预览" onclick="WeAdminShow('预览','pdf.html',600,400)" href="javascript:;">
								<i class="layui-icon">&#xe60a;</i>
							</a>
							<a title="审核" onclick="WeAdminShow('审核','adminread.jsp',600,400)" href="javascript:;">
								<i class="layui-icon">&#xe60a;</i>
							</a>
						</td>
					</tr>
					
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
		<script src="${pageContext.request.contextPath}/static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
	</body>

</html>