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
		.error{
			color:red;
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
		      <h2 class="pull-left">客服聊天表
	          <!-- page meta -->
	          <span class="page-meta"> 管理</span>
	        </h2>
	        <!-- 面包屑 -->
	        <div class="bread-crumb pull-right">
	          <a href="${pageContext.request.contextPath}/index.jsp"><i class="icon-home"></i>主页</a>
	          <!-- Divider -->
	          <span class="divider">/</span>
	          <a href="#" class="bread-current">客服聊天表</a>
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
							<input id="updateId" name="id" type="hidden">	
							<input name="isreply" value="0" type="hidden">
							<div class="form-group">
								<label class="control-label col-lg-3">提问</label>
								<input id="askupload" name="file" type="file">
								<div class="col-lg-6">
									
									<script id="askEditor" type="text/plain" style="width:800px;height:230px;"></script>
									<script type="text/javascript">
										//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
										//相见文档配置属于你自己的编译器
										var askUe = UE.getEditor('askEditor', {
										toolbars: [
											[
												'undo', //撤销
												'bold', //加粗
												'redo', //重做
												'underline', //下划线
												'horizontal', //分隔线
												'inserttitle', //插入标题
												'cleardoc', //清空文档
												'fontfamily', //字体
												'fontsize', //字号
												'paragraph', //段落格式
												'inserttable', //插入表格
												'justifyleft', //居左对齐
												'justifyright', //居右对齐
												'justifycenter', //居中对
												'justifyjustify', //两端对齐
												'forecolor', //字体颜色
												'fullscreen', //全屏
												'edittip ', //编辑提示
												'customstyle', //自定义标题
													]
											]
										});
									</script>
									<input type="hidden" name="ask" id="ask-input">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-lg-3">回复</label>
								<div class="col-lg-6">
									
									<script id="replyEditor" type="text/plain" style="width:800px;height:230px;"></script>
									<script type="text/javascript">
										//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
										//相见文档配置属于你自己的编译器
										var replyUe = UE.getEditor('replyEditor', {
										toolbars: [
											[
												'undo', //撤销
												'bold', //加粗
												'redo', //重做
												'underline', //下划线
												'horizontal', //分隔线
												'inserttitle', //插入标题
												'cleardoc', //清空文档
												'fontfamily', //字体
												'fontsize', //字号
												'paragraph', //段落格式
												'inserttable', //插入表格
												'justifyleft', //居左对齐
												'justifyright', //居右对齐
												'justifycenter', //居中对
												'justifyjustify', //两端对齐
												'forecolor', //字体颜色
												'fullscreen', //全屏
												'edittip ', //编辑提示
												'customstyle', //自定义标题
													]
											]
										});
									</script>
									<input type="hidden" name="reply" id="reply-input">
								</div>
							</div>
							<!-- 表单按钮 -->
							<div class="form-group">
								<div class="col-lg-6 col-lg-offset-1">
									<button id="submitBtn" type="button" class="btn btn-success">提交</button>
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
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
	<!-- Scroll to top -->
	<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span> 
	
	<script type="text/javascript">
		<%@ include file="../../utils/baseUrl.jsp"%>    
		<%@ include file="../../utils/menu.jsp"%>	
		var tableName = "chat";
		var pageType = "add-or-update";
		var updateId = "";
		var crossTableId = -1;
		var crossTableName = '';
		var ruleForm = {};
		var crossRuleForm = {};
								
		// 表单提交
		function submit() {
			if(validform() ==true){
				let data = {};
				getContent();
				let value = $('#addOrUpdateForm').serializeArray();
				$.each(value, function (index, item) { 
							data[item.name] = item.value;
						});
				var urlParam;
				var successMes = '';
				if(updateId !=null && updateId !="null" && updateId !=''){
					urlParam = 'update';
					successMes = '修改成功';
				}else{
					urlParam = 'save';
					successMes = '添加成功';
				}
				httpJson("chat/"+urlParam,"POST",data,(res)=>{
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
		// 填充富文本框
		function setContent(){
			if(ruleForm.ask != null && ruleForm.ask != 'null' && ruleForm.ask != ''){
				var askMes = '' + ruleForm.ask;
				var askUeditor = UE.getEditor('askEditor');
				askUeditor.ready(function() {
					askUeditor.setContent(askMes);
					askUeditor.setDisabled('fullscreen');
				});
			}
			if(ruleForm.reply != null && ruleForm.reply != 'null' && ruleForm.reply != ''){
				var replyMes = '' + ruleForm.reply;
				var replyUeditor = UE.getEditor('replyEditor');
				replyUeditor.ready(function() {
					replyUeditor.setContent(replyMes);
				});
			}
		}  
		// 获取富文本框内容
		function getContent(){
			//var askArr = [];
			//askArr.push(UE.getEditor('askEditor').getPlainTxt());
			if(UE.getEditor('askEditor').hasContents()){
				$('#ask-input').attr('value',UE.getEditor('askEditor').getPlainTxt());
			}
												//var replyArr = [];
			//replyArr.push(UE.getEditor('replyEditor').getPlainTxt());
			if(UE.getEditor('replyEditor').hasContents()){
				$('#reply-input').attr('value',UE.getEditor('replyEditor').getPlainTxt());
			}
		}

		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({ 
				rules: { },
				messages: { }
			}).form();
		}

		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if(id != null && id != "" && id != "null"){
				updateId = id;
				window.sessionStorage.removeItem('id');
				http("chat/info/" + id,"GET",{},(res)=>{
					if(res.code == 0){
						//window.sessionStorage.removeItem("id");
						ruleForm = res.data
						// 数据填充
						dataBind();
						// 富文本框回显	
						setContent();																																																																													
						//注册表单验证
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
			//添加表单校验信息文本
			addValidation();
			$('#submitBtn').on('click', function(e) {
			    e.preventDefault();
			    //console.log("点击了...提交按钮");
			    submit();
			});
			getDetails();
			<%@ include file="../../static/myInfo.js"%>
		}

		function dataBind(){
			$("#updateId").val(ruleForm.id);	
			$("#ask-input").val(ruleForm.ask);
			$("#reply-input").val(ruleForm.reply);
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
