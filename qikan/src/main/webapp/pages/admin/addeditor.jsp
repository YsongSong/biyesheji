<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>添加专家</title>
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
		                <span class="we-red">*</span>用户名
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="username" name="username" lay-verify="required|nikename" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						请设置至少5个字符
					</div>
				</div>
				<div class="layui-form-item">
					<label for="authorName" class="layui-form-label">
		                <span class="we-red">*</span>真实姓名
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="authorname" name="authorname" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						请填写真实的信息
					</div>
				</div>
				<div class="layui-form-item">
				    <label for="L_sex" class="layui-form-label">性别</label>
				    <div class="layui-input-block">
				      <input type="radio" name="sex" value="男" id="sex" title="男" checked>
				      <input type="radio" name="sex" value="女" id="sex" title="女">
				    </div>
				</div>
				<div class="layui-form-item">
					<label for="authorName" class="layui-form-label">
						生日
		            </label>
					<div class="layui-inline">
							<input class="layui-input" placeholder="如：2000-01-01" name="birthday" id="birthday">
					</div>
				</div>
				<div class="layui-form-item">
	                <label for="username" class="layui-form-label">
	                	学历
	                </label>
	                <div class="layui-input-inline">
	                    <select name="degreeid" id="degreeid">
		                    <option value="1">小学</option>
		                    <option value="2">初中</option>
		                    <option value="3">高中</option>
		                    <option value="4">大学</option>
	                    </select>
	                </div>
	            </div>
				<div class="layui-form-item">
					<label for="L_email" class="layui-form-label">
		                <span class="we-red">*</span>手机
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="phonenumber" name="phonenumber" lay-verify="required|phone" autocomplete="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_email" class="layui-form-label">
		                <span class="we-red">*</span>邮箱
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="email" name="email" lay-verify="email" autocomplete="off" class="layui-input">
					</div>

				</div>
				<div class="layui-form-item">
					<label for="L_address" class="layui-form-label">
		                <span class="we-red"></span>通讯地址
		            </label>
					<div class="layui-input-inline">
						<input type="text" id="address" name="address" autocomplete="off" class="layui-input">
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
		
		<script>
			layui.extend({
				admin: '${pageContext.request.contextPath}/static/js/admin'
			});
			layui.use(['form', 'jquery','util','admin', 'layer'], function() {
				var form = layui.form,
					$ = layui.jquery,
					util = layui.util,
					admin = layui.admin,
					layer = layui.layer;

				//自定义验证规则
				form.verify({
					nikename: function(value) {
						if(value.length < 5) {
							return '昵称至少得5个字符啊';
						}
					},
					pass: [/(.+){6,12}$/, '密码必须6到12位'],
					repass: function(value) {
						if($('#L_pass').val() != $('#L_repass').val()) {
							return '两次密码不一致';
						}
					}
				});
				//失去焦点时判断值为空不验证，一旦填写必须验证
				$('input[name="email"]').blur(function(){
					//这里是失去焦点时的事件
					if($('input[name="email"]').val()){
						$('input[name="email"]').attr('lay-verify','email');
					}else{
						$('input[name="email"]').removeAttr('lay-verify');
					}
				});

				//监听提交
				form.on('submit(add)', function(data) {
					//console.log(data.field);
					var f = data.field;
					//console.log(f.username);
					//console.log(f.sex);				
					//var sex = $('input:radio[name="sex"]:checked').val();
					
					//发异步，把数据提交给php
					layer.alert("增加成功", {
						icon: 6
					}, function() {
						//获取提交成功的时间
						var time = new Date();
						var timeNow = util.toDateString(time);
						// 获得frame索引
						var index = parent.layer.getFrameIndex(window.name);
					
    					var _len = parent.$('#memberList tr').length;
    					alert(_len);
						parent.$('#memberList').append(						
							'<tr data-id="' + _len + '">' +
								'<td>'+
									'<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="' + _len + '"><i class="layui-icon">&#xe605;</i></div>'+
								'</td>'+
								'<td>' + _len + '</td>'+
								'<td>'+f.username+'</td>'+
								'<td>'+f.sex+'</td>'+
								'<td>'+f.phone+'</td>'+
								'<td>'+f.email+'</td>'+
								'<td>北京市西城区</td>'+
								'<td>'+timeNow+'</td>'+
								'<td class="td-status"><span class="layui-btn layui-btn-normal layui-btn-xs">已启用</span></td>'+
								'<td class="td-manage">'+
									'<a onclick="member_stop(this,\'10001\')" href="javascript:;" title="启用"><i class="layui-icon">&#xe601;</i></a>'+
									'<a title="编辑" onclick="WeAdminShow(\'编辑\',\'./edit.html\',600,400)" href="javascript:;"><i class="layui-icon">&#xe642;</i></a>'+
									'<a onclick="WeAdminShow(\'修改密码\',\'./password.html\',600,400)" title="修改密码" href="javascript:;"><i class="layui-icon">&#xe631;</i></a>'+
									'<a title="删除" onclick="member_del(this,\'要删除的id\')" href="javascript:;"><i class="layui-icon">&#xe640;</i></a>'+
								'</td>'+
							'</tr>'	
						);
						//关闭当前frame
						parent.layer.close(index);
					});
					return false;
				});

			});
		</script>
	</body>

</html>