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

	<div class="content">
	  	<!-- 侧边导航栏 -->
	    <%@ include file="../../static/sidebar.jsp"%>
	  	<div class="mainbar">
		    <div class="page-head">
		      <h2 class="pull-left">聊天信息
	          <span class="page-meta"> 管理</span>
	        </h2>
	        <!-- 面包屑 -->
	        <div class="bread-crumb pull-right">
	          <a href="${pageContext.request.contextPath}/index.jsp"><i class="icon-home"></i>主页</a>
	          <!-- Divider -->
	          <span class="divider">/</span>
	          <a href="#" class="bread-current">聊天信息</a>
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
						<form class="form-horizontal" id="addOrUpdateForm" method="post">
							<input id="updateId" name="id" type="hidden">
										<div class="form-group">
										<label class="control-label col-lg-3">商家账号</label>
										<div class="col-lg-6">
											<select class="form-control" name="shangjiazhanghao" id="shangjiazhanghaoSelect" onchange="shangjiazhanghaoSelect2Change()">
											</select>
										</div>
									</div>		
											<div class="form-group">
										<label class="control-label col-lg-3">联系电话</label>
										<div class="col-lg-6">
											<input id="lianxidianhua" name="lianxidianhua" readonly>
										</div>
									</div>		
											<div class="form-group">
										<label class="control-label col-lg-3">聊天内容</label>
										<div class="col-lg-6">
											<textarea id="liaotianneirong" name="liaotianneirong" class="form-control" rows="3" placeholder="聊天内容"></textarea>
										</div>
									</div>
											<div class="form-group">
										<label class="control-label col-lg-3">发送日期</label>
										<div class="col-lg-6">	
											<div id="fasongriqi" class="input-append">
												<input id="fasongriqi-input" name="fasongriqi" data-format="yyyy-MM-dd" type="text" class="form-control dtpicker" style="max-width: 95px;">
												<span class="add-on">
													<i data-time-icon="icon-time" data-date-icon="icon-calendar" class="btn btn-info btn-lg"></i>
												</span>
											</div>
										</div>	
									</div>
											<div class="form-group">
										<label class="control-label col-lg-3">用户名</label>
										<div class="col-lg-6">
											<input id="yonghuming" name="yonghuming" placeholder="用户名">
										</div>
									</div>	
											<div class="form-group">
										<label class="control-label col-lg-3">姓名</label>
										<div class="col-lg-6">
											<input id="xingming" name="xingming" placeholder="姓名">
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

	    </div>    	
	   <div class="clearfix"></div>
	</div>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
	<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span> 
	
	<script type="text/javascript">
		<%@ include file="../../utils/baseUrl.jsp"%>    
		<%@ include file="../../utils/menu.jsp"%>	
		var tableName = "liaotianxinxi";
		var pageType = "add-or-update";
		var updateId = "";
		var crossTableId = -1;
		var crossTableName = '';
		var ruleForm = {};
		var crossRuleForm = {};

																																
						
					function shangjiazhanghaoSelect2(){
					var url = "option/shangjia/shangjiazhanghao";
					http(url,"GET",{},(res)=>{
						if(res.code == 0){
							var options = res.data;
							var option = document.createElement("option");
							$("#shangjiazhanghaoSelect").append(option)
							for(var i=0;i<options.length;i++){
								var shangjiazhanghaoOption = document.createElement("option");
								shangjiazhanghaoOption.setAttribute("value",options[i]);
								shangjiazhanghaoOption.setAttribute("class","shangjiazhanghaoOption");
								if(ruleForm.shangjiazhanghao == options[i]){
									shangjiazhanghaoOption.setAttribute("selected","selected");
								}
								shangjiazhanghaoOption.innerHTML = options[i];
								$("#shangjiazhanghaoSelect").append(shangjiazhanghaoOption);
							}
						}
					});					
				}
				function shangjiazhanghaoSelect2Change(){
					var options = document.getElementById("shangjiazhanghaoSelect").options;
					var index = document.getElementById("shangjiazhanghaoSelect").selectedIndex;
					var colVal = options[index].value;
					var url = "follow/shangjia/shangjiazhanghao";
					http(url,"GET",{
							tableName: "shangjia",
							columnName: "shangjiazhanghao",
							columnValue: colVal
						},(res)=>{
							if(res.code == 0){
																																												if(res.data != null && res.data.lianxidianhua != null){
											$("#lianxidianhua").val(res.data.lianxidianhua);
										}
																																																																																												}
					});
				}	
								
		var vm = new Vue({
		  el: '#addOrUpdateForm',
		  data:{
			  ruleForm : {},
			},
		  beforeCreate: function(){
			  var id = window.sessionStorage.getItem("id");
				if(id != null && id != "" && id != "null"){
					http("liaotianxinxi/info/" + id,"GET",{},(res)=>{
						if(res.code == 0){
							vm.ruleForm = res.data;
						}
					});
				}
			},
			methods: { }
	  });

		// 文件上传
		function upload(){
								}
		// 表单提交
		function submit() {
				if(validform() == true && compare() == true){
				let data = {};
				getContent();
				let value = $('#addOrUpdateForm').serializeArray();
				$.each(value, function (index, item) { 
							data[item.name] = item.value;
						});
				var urlParam;
				var successMes = '';
				let flag = true;
				if(updateId !=null && updateId !="null" && updateId !=''){
					urlParam = 'update';
					successMes = '修改成功';
				}else{
					urlParam = 'save';
					successMes = '添加成功';
				}
				httpJson("liaotianxinxi/"+urlParam,"POST",data,(res)=>{
					if(res.code == 0){
																																																																																										if(flag){
							alert(successMes);
						}
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
																																									}  
		// 获取富文本框内容
		function getContent(){
																																									}

		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({ 
				rules: {
					           				       			 	           										    lianxidianhua: {
														},
						       			 	           										    liaotianneirong: {
														},
						       			 	           										    fasongriqi: {
														},
						       			 	           										    yonghuming: {
														},
						       			 	           										    xingming: {
														},
						       			 					},
				messages: {
					
																													lianxidianhua: {
													},
																								liaotianneirong: {
													},
																								fasongriqi: {
													},
																								yonghuming: {
													},
																								xingming: {
													},
															}
			}).form();
		}
		// 添加表单校验方法
		function addValidation(){
			jQuery.validator.addMethod("isPhone", function(value, element) {
					var length = value.length;
					var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
					return this.optional(element) || (length == 11 && mobile.test(value));
			}, "请填写正确的手机号码");
			jQuery.validator.addMethod("isIdCardNo", function(value, element) {
				return this.optional(element) || idCardNoUtil.checkIdCardNo(value);
			}, "请正确输入您的身份证号码");
		}
		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if(id != null && id != "" && id != "null"){
				updateId = id;
				window.sessionStorage.removeItem('id');
				http("liaotianxinxi/info/" + id,"GET",{},(res)=>{
					if(res.code == 0){
						//window.sessionStorage.removeItem("id");
						ruleForm = res.data
						// 是/否下拉框回显
						setSelectOption();
						// 设置图片src
						showImg();
						// 数据填充
						dataBind();
						// 富文本框回显	
						setContent();						
																											shangjiazhanghaoSelect2();
																																																																																				//注册表单验证
						$(validform());
					}
				});
			}else{
															shangjiazhanghaoSelect2();	
																																																													 		fill()
								//注册表单验证
				$(validform());
			}
		}
		// 下拉框选项回显
		function setSelectOption(){
																																															}

		function ready() {
			$('ul li .dropdown-toggle').html("<i class=\"icon-user\"></i>" + window.sessionStorage.getItem('username')+ "<b class=\"caret\"></b>")
			//设置导航栏菜单
			setMenu();
			<%@ include file="../../static/menuStyle.js"%>
			//初始化上传按钮
			upload();
			//添加表单校验信息文本
			addValidation();
			
			$('#submitBtn').on('click', function(e) {
			    e.preventDefault();
			    //console.log("点击了...提交按钮");
			    submit();
			});
			//初始化日期插件
			datePick();
			getDetails();
			//单列求和
			calculationPre();
			//跨表
			crossTable();
			<%@ include file="../../static/myInfo.js"%>
			readonly();
		}
		// 关联下拉框改变
		function lvSelectChange(level){
			let data = {};
			let value = $('#addOrUpdateForm').serializeArray();
			$.each(value, function (index, item) { 
			            data[item.name] = item.value;
			        });
																																															}
		// 清除可能会重复渲染的下拉框Option
		function clear(className){
			var elements = document.getElementsByClassName(className);
        	for(var i = elements.length - 1; i >= 0; i--) { 
        	  elements[i].parentNode.removeChild(elements[i]); 
        	}
		}
		//计算
		function calculation(){
			//积
			var x = 0;
			//和
			var y = 0;
			var flag = 0;
																																															}
		function calculationSE(colName){
			//单列求和接口
			http("liaotianxinxi"+colName,"GET",{
				tableName: "liaotianxinxi",
				columnName: colName
			},(res)=>{
				if(res.code == 0){
						$("#"+colName).attr("value",res.data);
				}
			});
		}
		function calculationPre(){
			//进入该页面就填充"单列求和"的列
																																															}		
		
		
			//新增时填充字段
			function fill(){

				var username = window.sessionStorage.getItem('username');
				var accountTableName = window.sessionStorage.getItem('accountTableName');
				http(accountTableName+'/session','GET',{},(res)=>{
					if(res.code == 0){
						var myId = res.data.id;
											if(res.data !=null && res.data.yonghuming != null && res.data.yonghuming != ''){
							$('#yonghuming').val(res.data.yonghuming)
						}
								if(res.data !=null && res.data.xingming != null && res.data.xingming != ''){
							$('#xingming').val(res.data.xingming)
						}
							$(validform());
					}
				});
							
			}	
		
		function datePick(){
			$.fn.datetimepicker.dates['zh-CN'] = { 
				days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
	            daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
	            daysMin:  ["日", "一", "二", "三", "四", "五", "六", "日"],
	            months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
	            monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
	            today: "今天",
	            suffix: [],
	            meridiem: ["上午", "下午"]
			};
																																	$(function() { 
						$('#fasongriqi').datetimepicker({ 
						pickTime: false,
						pickDate: true,
						language:'zh-CN'
						});
					});
																							}	
		function dataBind(){
			$("#updateId").val(ruleForm.id);	
							
																				$("#lianxidianhua").val(ruleForm.lianxidianhua);	
																$("#liaotianneirong-input").val(ruleForm.liaotianneirong);
																$("#fasongriqi-input").val(ruleForm.fasongriqi);
																$("#yonghuming").val(ruleForm.yonghuming);	
																$("#xingming").val(ruleForm.xingming);	
									}
		//图片显示
		function showImg(){
																																															}

        //跨表
        function crossTable(){
            crossTableName = window.sessionStorage.getItem('crossTableName');
			crossTableId = window.sessionStorage.getItem('crossTableId');
            if(crossTableName != null && crossTableName != '' && crossTableId != null && crossTableId != '' && crossTableId != -1){
				http(crossTableName + "/info/" + crossTableId,"GET",{},(res)=>{
					if(res.code == 0){
						crossRuleForm = res.data;
						$('#updateId').val(crossTableId);
												if(res.data != null && res.data != '' && res.data.shangjiazhanghao != null && res.data.shangjiazhanghao != ''){

							
																				}
												if(res.data != null && res.data != '' && res.data.lianxidianhua != null && res.data.lianxidianhua != ''){

															$("#lianxidianhua").val(res.data.lianxidianhua);
													}
												if(res.data != null && res.data != '' && res.data.liaotianneirong != null && res.data.liaotianneirong != ''){

															$("#liaotianneirong-input").val(res.data.liaotianneirong);
													}
												if(res.data != null && res.data != '' && res.data.fasongriqi != null && res.data.fasongriqi != ''){

															$("#fasongriqi-input").val(res.data.fasongriqi);
								$('#fasongriqiFileName').val(res.data.fasongriqi)
													}
												if(res.data != null && res.data != '' && res.data.yonghuming != null && res.data.yonghuming != ''){

															$("#yonghuming").val(res.data.yonghuming);
													}
												if(res.data != null && res.data != '' && res.data.xingming != null && res.data.xingming != ''){

															$("#xingming").val(res.data.xingming);
													}
											}
				});  
            }
            window.sessionStorage.removeItem('crossTableName');
			window.sessionStorage.removeItem('crossTableId');
        }
		
		function crossTableUpdate(){
			let flag = crossTableUpdateValidation();
			if(flag){
				httpJson(crossTableName + "/update","POST",{
					id: crossTableId,
																																																																											},(res)=>{
					if(res.code == 0){
						console.log('跨表更新成功');
						return true;
					}
				});   
			}
			return false;
		}

		//跨表更新前验证
		function crossTableUpdateValidation(){
			//防止减法导致库存负值
																																																return true;
		}
		
		function readonly(){
			if(window.sessionStorage.getItem('role') != '管理员'){
				$('#jifen').attr('readonly','readonly');
				$('#money').attr('readonly','readonly');
			}
		}

		//比较大小
		function compare(){
			var largerVal = null;
			var smallerVal = null;
																																										if(largerVal !=null && smallerVal != null){
				if(largerVal<=smallerVal){
					alert(smallerName+'不能大于等于'+largerName);
					return false;
				}
			}
			return true;
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
