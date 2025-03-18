<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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

	<!-- Main content starts -->
	<div class="content">

		<!-- 侧边导航栏 -->
		<%@ include file="../../static/sidebar.jsp"%>
		<!-- Main bar -->
		<div class="mainbar">
			<!-- Page heading -->
			<div class="page-head">
				<!-- Page heading -->
				<h2 class="pull-left">换图
					<!-- page meta -->
					<span class="page-meta"> 管理</span>
				</h2>
				<!-- 面包屑 -->
				<div class="bread-crumb pull-right">
					<a href="${pageContext.request.contextPath}/index.jsp"><i class="icon-home"></i>主页</a>
					<!-- Divider -->
					<span class="divider">/</span>
					<a href="#" class="bread-current">换图信息</a>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- Page heading ends -->

			<!-- Matter -->
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
											<form class="form-horizontal" id="addOrUpdateForm" method="post">
												<input type="hidden" id="updateId" name="id">
												<div class="form-group">
													<label class="control-label col-lg-3">name</label>
													<div class="col-lg-6">
														<input id="name" name="name" placeholder="name">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">value</label>
													<div class="col-lg-6">
														<img id="valueImg" src="" width="100" height="100">
														<input name="file" type="file" id="valueUpload">
														<input name="value" id="value-input" type="hidden">
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
			<!-- Matter ends -->
		</div>
		<!-- Mainbar ends -->
		<div class="clearfix"></div>
	</div>
	<!-- Content ends -->
	<!-- Scroll to top -->
	<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span>

	<script type="text/javascript">
		<%@include file = "../../utils/baseUrl.jsp" %>    
		<%@include file = "../../utils/menu.jsp" %>	
		var tableName = "users";
		var pageType = "add-or-update";
		var ruleForm = {};

		// 表单提交
		function submit() {
			if (validform() == true) {
				let data = {};
				let value = $('#addOrUpdateForm').serializeArray();
				$.each(value, function (index, item) {
					data[item.name] = item.value;
				});
				var id = window.sessionStorage.getItem("id");
				var urlParam;
				var successMes = '';
				if (id == null || id == "null" || id == '') {
					urlParam = 'save';
					successMes = '添加成功';
				} else {
					urlParam = 'update';
					successMes = '修改成功';
				}
				httpJson("config/" + urlParam, "POST", data, (res) => {
					if (res.code == 0) {
						window.sessionStorage.removeItem('id');
						window.location.href = "list.jsp";
						alert(successMes);
					}
				});
			} else {
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
			if (id != null && id != "" && id != "null") {
				http("config/info/" + id, "GET", {}, (res) => {
					if (res.code == 0) {
						ruleForm = res.data;
						dataBind();
						showImg();
						//注册表单验证
						$(validform());
					}
				});
			} else {
				//注册表单验证
				$(validform());
			}
		}
		function ready() {
			setMenu();
			<%@include file = "../../static/menuStyle.js" %>
				$('#submitBtn').on('click', function (e) {
					e.preventDefault();
					//console.log("点击了...提交按钮");
					submit();
				});
			upload();
			getDetails();
		}
		// 清除可能会重复渲染的selection
		function clear(className) {
			var elements = document.getElementsByClassName(className);
			for (var i = elements.length - 1; i >= 0; i--) {
				elements[i].parentNode.removeChild(elements[i]);
			}
		}
		//图片显示
		function showImg() {
			var valueFileName = "\"" + ruleForm.value + "\"";
			$("#valueImg").attr("src", ruleForm.value);
		}
		function dataBind() {
			$('#updateId').val(ruleForm.id);
			$('#name').val(ruleForm.name);
			$('#value-input').val(ruleForm.value);
		}
		function upload() {
			$('#valueUpload').fileupload({
				url: baseUrl + 'file/upload',
				headers: { token: window.sessionStorage.getItem("token") },
				dataType: 'json',
				done: function (e, data) {
					document.getElementById('value-input').setAttribute('value', baseUrl + "upload/" + data.result.file);
					$("#valueImg").attr("src", baseUrl + "upload/" + data.result.file);
				}
			});
		}
		// 渲染菜单
		<%@include file = "../../static/setMenu.js" %>
		// 清除没有权限使用的按钮
		<%@include file = "../../static/getRoleButtons.js" %>
			// 生命周期函数
			document.addEventListener("DOMContentLoaded", ready);
	</script>

</body>

</html>