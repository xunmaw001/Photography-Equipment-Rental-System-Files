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
	                  <div class="pull-left">详情</div>
	                  <div class="clearfix"></div>
	                </div>
	                <div class="widget-content">
	                  <div class="padd">
	                    
	                    <!-- 新增/修改 表单 -->
						<div class="form profile">
						<form class="form-horizontal" id="addOrUpdateForm" method="post">
							<input type="hidden" name="id" v-model="ruleForm.id">
																								<div class="form-group">
																				<label class="control-label col-lg-3">用户id</label>
																				<div class="col-lg-6">
																			<input id="userid"  v-model="ruleForm.userid" readonly>
																			</div>
									</div>
																																<div class="form-group">
																				<label class="control-label col-lg-3">管理员id</label>
																				<div class="col-lg-6">
																			<input id="adminid"  v-model="ruleForm.adminid" readonly>
																			</div>
									</div>
																																																														<div class="form-group">
																				<label class="control-label col-lg-3">是否回复</label>
																				<div class="col-lg-6">
																			<input id="isreply"  v-model="ruleForm.isreply" readonly>
																			</div>
									</div>
															
																																																																																	<div class="form-group">
											<label class="control-label col-lg-3">提问</label>
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
												<input type="hidden" id="ask-input">
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
												<input type="hidden" id="reply-input">
											</div>
										</div>
																																																															<!-- 表单按钮 -->
							<div class="form-group">
								<div class="col-lg-6 col-lg-offset-1">
									<button id="exitBtn" type="button">返回</button>
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
		var pageType = "info";

		var ruleForm = {};
			  var vm = new Vue({
		  el: '#addOrUpdateForm',
		  data:{
			  ruleForm : {},
			},
		  beforeCreate: function(){
			  var id = window.sessionStorage.getItem("id");
				if(id != null && id != "" && id != "null"){
					$.ajax({ 
		                type: "GET",
		                url: baseUrl + "chat/info/" + id,
		                beforeSend: function(xhr) {xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));},
		                success: function(res){               	
		                	if(res.code == 0){
		                		vm.ruleForm = res.data;
				    		}else if(res.code == 401) {
				    			<%@ include file="../../static/toLogin.jsp"%>    
				    		}else{ alert(res.msg)}
		                },
		            });
				}
			},
			methods: { }
	  });


		
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
								replyUeditor.setDisabled('fullscreen');
							});
						}
									  									  				}  
		


		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if(id != null && id != "" && id != "null"){
				$.ajax({ 
	                type: "GET",
	                url: baseUrl + "chat/info/" + id,
	                beforeSend: function(xhr) {xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));},
	                success: function(res){           
	                	if(res.code == 0){
							//window.sessionStorage.removeItem("id");
	                		ruleForm = res.data
							showImg()
							setContent();
							setMediaUrl();
							setDownloadBtn();
			    		}else if(res.code ==401){
			    			 <%@ include file="../../static/toLogin.jsp"%>	
			    		}else{
							 alert(res.msg);
						}
	                },
	            });
			}
		}
		
		
		function ready() {
			$('ul li .dropdown-toggle').html("<i class=\"icon-user\"></i>" + window.sessionStorage.getItem('username')+ "<b class=\"caret\"></b>")
			setMenu();
			<%@ include file="../../static/menuStyle.js"%>
			$('#exitBtn').on('click', function(e) {
			    e.preventDefault();
				exit();
			});
			getDetails();
			<%@ include file="../../static/myInfo.js"%>
		}

		function exit(){
			window.sessionStorage.removeItem("id");
			window.location.href = "list.jsp";
		}

		function showImg(){
																																								}
		function fill(){
			//新增时填充字段
					}	
		// 下载
		function download(fileName){
			var url = baseUrl+'file/download?fileName='+fileName;
			window.open(url);
		}
		//设置下载
		function setDownloadBtn(){
																																								}
		//设置音视频播放链接
		function setMediaUrl(){
																																								}
		// 渲染菜单
		<%@ include file="../../static/setMenu.js"%>
		// 用户登出
        <%@ include file="../../static/logout.jsp"%>
		// 生命周期函数
		document.addEventListener("DOMContentLoaded", ready);
  	</script>

  </body>
</html>
