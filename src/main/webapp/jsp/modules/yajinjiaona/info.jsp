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
		      <h2 class="pull-left">押金缴纳
	          <!-- page meta -->
	          <span class="page-meta"> 管理</span>
	        </h2>
	        <!-- 面包屑 -->
	        <div class="bread-crumb pull-right">
	          <a href="${pageContext.request.contextPath}/index.jsp"><i class="icon-home"></i>主页</a>
	          <!-- Divider -->
	          <span class="divider">/</span>
	          <a href="#" class="bread-current">押金缴纳</a>
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
																				<label class="control-label col-lg-3">用户名</label>
																				<div class="col-lg-6">
																			<input id="yonghuming"  v-model="ruleForm.yonghuming" readonly>
																			</div>
									</div>
																																<div class="form-group">
																				<label class="control-label col-lg-3">姓名</label>
																				<div class="col-lg-6">
																			<input id="xingming"  v-model="ruleForm.xingming" readonly>
																			</div>
									</div>
																																<div class="form-group">
																				<label class="control-label col-lg-3">押金</label>
																				<div class="col-lg-6">
																			<input id="yajin"  v-model="ruleForm.yajin" readonly>
																			</div>
									</div>
																																															<div class="form-group">
																				<label class="control-label col-lg-3">是否审核</label>
																				<div class="col-lg-6">
																			<input id="sfsh"  v-model="ruleForm.sfsh" readonly>
																			</div>
									</div>
																																															<div class="form-group">
																				<label class="control-label col-lg-3">是否支付</label>
																				<div class="col-lg-6">
																			<input id="ispay"  v-model="ruleForm.ispay" readonly>
																			</div>
									</div>
															
																																																																																																																	<div class="form-group">
											<label class="control-label col-lg-3">备注</label>
											<div class="col-lg-6">
												
												<script id="beizhuEditor" type="text/plain" style="width:800px;height:230px;"></script>
												<script type="text/javascript">
												    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
												   //相见文档配置属于你自己的编译器
												 var beizhuUe = UE.getEditor('beizhuEditor', {
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
												<input type="hidden" id="beizhu-input">
											</div>
										</div>
																																																																																			<div class="form-group">
											<label class="control-label col-lg-3">审核回复</label>
											<div class="col-lg-6">
												
												<script id="shhfEditor" type="text/plain" style="width:800px;height:230px;"></script>
												<script type="text/javascript">
												    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
												   //相见文档配置属于你自己的编译器
												 var shhfUe = UE.getEditor('shhfEditor', {
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
												<input type="hidden" id="shhf-input">
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
		var tableName = "yajinjiaona";
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
		                url: baseUrl + "yajinjiaona/info/" + id,
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
				  									  									  									  											if(ruleForm.beizhu != null && ruleForm.beizhu != 'null' && ruleForm.beizhu != ''){
							var beizhuMes = '' + ruleForm.beizhu;
							var beizhuUeditor = UE.getEditor('beizhuEditor');
							beizhuUeditor.ready(function() {
								beizhuUeditor.setContent(beizhuMes);
								beizhuUeditor.setDisabled('fullscreen');
							});
						}
									  									  											if(ruleForm.shhf != null && ruleForm.shhf != 'null' && ruleForm.shhf != ''){
							var shhfMes = '' + ruleForm.shhf;
							var shhfUeditor = UE.getEditor('shhfEditor');
							shhfUeditor.ready(function() {
								shhfUeditor.setContent(shhfMes);
								shhfUeditor.setDisabled('fullscreen');
							});
						}
									  									  				}  
		


		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if(id != null && id != "" && id != "null"){
				$.ajax({ 
	                type: "GET",
	                url: baseUrl + "yajinjiaona/info/" + id,
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
