<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>期刊类别</title>
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
        <a href="">期刊管理</a>
        <a>
          <cite>类别列表</cite></a>
      </span>
			<a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
				<i class="layui-icon" style="line-height:30px">&#x1002;</i></a>
		</div>
		<div class="weadmin-body">
			<button class="layui-btn" onclick="WeAdminShow('添加类别','addqikantype.jsp',600,400)"><i class="layui-icon"></i>添加</button>
			<table class="layui-table" id="memberList">
				<thead>
					<tr>
						<th>序号</th>
						<th>类别名称</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					
					<tr>
						<td>1</td>
						<td>教育期刊</td>
						<td class="td-manage">
							
							<a title="编辑" onclick="WeAdminShow('编辑','modifyqikantype.jsp',600,400)" href="javascript:;">
								<i class="layui-icon">&#xe642;</i>
							</a>
							
							<a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
								<i class="layui-icon">&#xe640;</i>
							</a>
						</td>
					</tr>
					
					
				</tbody>
			</table>
			<div class="page">
				<div>
					<a class="prev" href="">&lt;&lt;</a>
					<a class="num" href="">1</a>
					<span class="current">2</span>
					<a class="num" href="">3</a>
					<a class="num" href="">489</a>
					<a class="next" href="">&gt;&gt;</a>
				</div>
			</div>
		</div>
		<!--<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>-->
		<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
	</body>

</html>