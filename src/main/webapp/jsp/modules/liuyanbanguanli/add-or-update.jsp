<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../static/js-css.jsp"%>
</head>
<style>
.error {
	color: red;
}
</style>
<body>
	<%@ include file="../../static/banner.jsp"%>
	<%@ include file="../../static/header.jsp"%>

	<div class="content">
		<!-- 侧边导航栏 -->
		<%@ include file="../../static/sidebar.jsp"%>
		<div class="mainbar">
			<div class="page-head">
				<h2 class="pull-left">
					留言板管理 <span class="page-meta"> 管理</span>
				</h2>
				<!-- 面包屑 -->
				<div class="bread-crumb pull-right">
					<a href="${pageContext.request.contextPath}/index.jsp"><i
						class="icon-home"></i>主页</a>
					<!-- Divider -->
					<span class="divider">/</span> <a href="#" class="bread-current">留言板管理</a>
				</div>
				<div class="clearfix"></div>
			</div>

			<div class="matter">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="widget wred">
								<div class="widget-head">
									<div class="pull-left">编辑</div>
									<div class="clearfix"></div>
								</div>
								<div class="widget-content">
									<div class="padd">

										<!-- 新增/修改 表单 -->
										<div class="form profile">
											<form class="form-horizontal" id="addOrUpdateForm"
												method="post">
												<input id="updateId" name="id" type="hidden">
												<div class="form-group">
													<label class="control-label col-lg-4">留言人用户名</label>
													<div class="col-lg-6">
														<input id="username" name="username"
															placeholder="留言人用户名" readonly="readonly">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">留言内容</label>
													<div class="col-lg-6">
														<textarea id="content" name="content" class="form-control" rows="10" cols="10" placeholder="留言内容" readonly="readonly"></textarea>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">回复内容</label>
													<div class="col-lg-6">														
														<textarea id="reply" name="reply" class="form-control" rows="10" cols="10" placeholder="回复内容"></textarea>	
													</div>
												</div>

												<!-- 表单按钮 -->
												<div class="form-group">
													<div class="col-lg-6 col-lg-offset-1">
														<button id="submitBtn" type="button"
															class="btn btn-success">提交</button>
														<button type="reset" class="btn btn-default">重置</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="clearfix"></div>
	</div>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
	<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span>

	<script type="text/javascript">
		<%@ include file="../../utils/baseUrl.jsp"%>    
		<%@ include file="../../utils/menu.jsp"%>	
		var tableName = "liuyanbanguanli";
		var pageType = "add-or-update";
		var updateId = "";
		var crossTableId = -1;
		var crossTableName = '';
		var ruleForm = {};
		var crossRuleForm = {};
			
		var vm = new Vue({
		  el: '#addOrUpdateForm',
		  data:{
			  ruleForm : {},
			},
		  beforeCreate: function(){
			  var id = window.sessionStorage.getItem("id");
				if(id != null && id != "" && id != "null"){
					http("liuyanbanguanli/info/" + id,"GET",{},(res)=>{
						if(res.code == 0){
							vm.ruleForm = res.data;
						}
					});
				}
			},
			methods: { }
	  });

		// 表单提交
		function submit() {
				if(validform() == true){
				let data = {};
				let value = $('#addOrUpdateForm').serializeArray();
				$.each(value, function (index, item) { 
							data[item.name] = item.value;
						});
				var urlParam;
				var successMes = '';
				if(updateId !=null && updateId !="null" && updateId !=''){
					urlParam = 'update';
					successMes = '回复成功';
				}else{
					urlParam = 'save';
					successMes = '添加成功';
				}
				httpJson("messages/"+urlParam,"POST",data,(res)=>{
					if(res.code == 0){						
							alert(successMes);
						
						if(window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true"){
							window.sessionStorage.removeItem('onlyme');
							window.location.href="${pageContext.request.contextPath}/index.jsp";
						}else{
							window.location.href="list.jsp";
						}
					}
				});   
			}else{
				alert("表单未填完整或有错误");
			}
		}		

		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({ 
				rules: {},
				messages: {}
			}).form();
		}

		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if(id != null && id != "" && id != "null"){
				updateId = id;
				window.sessionStorage.removeItem('id');
				http("messages/info/" + id,"GET",{},(res)=>{
					if(res.code == 0){
						//window.sessionStorage.removeItem("id");
						ruleForm = res.data
						// 数据填充
						dataBind();																																																													//注册表单验证
						$(validform());
					}
				});
			}else{
				//注册表单验证
				$(validform());
			}
		}

		function ready() {
			$('ul li .dropdown-toggle').html("<i class=\"icon-user\"></i>" + window.sessionStorage.getItem('username')+ "<b class=\"caret\"></b>")
			//设置导航栏菜单
			setMenu();
			<%@ include file="../../static/menuStyle.js"%>

			
			$('#submitBtn').on('click', function(e) {
			    e.preventDefault();
			    //console.log("点击了...提交按钮");
			    submit();
			});
			getDetails();
			<%@ include file="../../static/myInfo.js"%>
			readonly();
		}

		function dataBind(){
			$("#updateId").val(ruleForm.id);	
			$("#username").val(ruleForm.username);	
			$("#content").val(ruleForm.content);	
			$("#reply").val(ruleForm.reply);	
		}

		
		function readonly(){
			if(window.sessionStorage.getItem('role') != '管理员'){
				$('#jifen').attr('readonly','readonly');
				$('#money').attr('readonly','readonly');
			}
		}

		// 渲染菜单
		<%@ include file="../../static/setMenu.js"%>
		// 清除没有权限使用的按钮
		<%@ include file="../../static/getRoleButtons.js"%>
		// 用户登出
        <%@ include file="../../static/logout.jsp"%>
		// 生命周期函数
		document.addEventListener("DOMContentLoaded", ready);
  	</script>

</body>
</html>
