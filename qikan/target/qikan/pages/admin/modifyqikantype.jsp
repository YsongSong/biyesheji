<!doctype html>
<html lang="en">

	<head>
		<meta charset="UTF-8">
		<title>期刊类别修改</title>
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
					<label for="L_username" class="layui-form-label">
		                <span class="we-red"></span>期刊名称
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="typename" name="typename" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						请修改期刊名称
					</div>
				</div>
				
				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label">
              </label>
					<button class="layui-btn" lay-filter="add" lay-submit="">确定</button>
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
					var username = $("#username").val();
					var authorname = $("#authorname").val();
					var sex = $("#sex").val();
					var birthday = $("#birthday").val();
					var degreeid = $("#degreeid").val();
					var phonenumber = $("#phonenumber").val();
					var email = $("#email").val();
					var address = $("#address").val();
					
					console.log(username,authorname,sex,birthday,degreeid,phonenumber,email,address);
					$.post(
						$.ajax({
							type:"post",
							url:"/qikan/totest.do",
							async:true,
							dataType: "json",
							data:{
								username:username,
								authorname:authorname,
								sex:sex,
								birthday:birthday,
								degreeid:degreeid,
								phonenumber:phonenumber,
								email:email,
								address:address
							},
							success:function(data) {
								console.log(data);
								if(data.code == 0) {
                                    layer.alert("修改成功", {
                                        icon: 6
                                    }, function() {
                                        // 获得frame索引
                                        var index = parent.layer.getFrameIndex(window.name);
                                        //关闭当前frame
                                        parent.layer.close(index);
                                    });
								}else {
                                    layer.alert("修改失败，请重试", {
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