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
		      <h2 class="pull-left">器材信息
	          <span class="page-meta"> 管理</span>
	        </h2>
	        <!-- 面包屑 -->
	        <div class="bread-crumb pull-right">
	          <a href="${pageContext.request.contextPath}/index.jsp"><i class="icon-home"></i>主页</a>
	          <!-- Divider -->
	          <span class="divider">/</span>
	          <a href="#" class="bread-current">器材信息</a>
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
										<label class="control-label col-lg-3">器材编号</label>
										<div class="col-lg-6">
											<input id="qicaibianhao" name="qicaibianhao" placeholder="器材编号">
										</div>
									</div>	
											<div class="form-group">
										<label class="control-label col-lg-3">器材名称</label>
										<div class="col-lg-6">
											<input id="qicaimingcheng" name="qicaimingcheng" placeholder="器材名称">
										</div>
									</div>	
											<div class="form-group">
										<label class="control-label col-lg-3">器材类型</label>
										<div class="col-lg-6">
											<select id="qicaileixingSelect" name="qicaileixing">
																						</select>
										</div>
									</div>
											<div class="form-group">
																					<label class="control-label col-lg-3">图片</label>
																				<div class="col-lg-6">							
											<img id="tupianImg" src="" width="100" height="100">
											<input  name="file" type="file" id="tupianupload">
											<label id="tupianFileName">{{ruleForm.tupian}}</label>
											<input name="tupian" id="tupian-input" type="hidden">
										</div>
									</div>
													<div class="form-group">
										<label class="control-label col-lg-3">租赁规则</label>
										<div class="col-lg-6">
											<textarea id="zulinguize" name="zulinguize" class="form-control" rows="3" placeholder="租赁规则"></textarea>
										</div>
									</div>
											<div class="form-group">
										<label class="control-label col-lg-3">数量</label>
										<div class="col-lg-6">
											<input id="shuliang" name="shuliang" placeholder="数量">
										</div>
									</div>	
											<div class="form-group">
										<label class="control-label col-lg-3">每天价格</label>
										<div class="col-lg-6">
											<input id="meitianjiage" name="meitianjiage" placeholder="每天价格">
										</div>
									</div>	
											<div class="form-group">
										<label class="control-label col-lg-3">商家账号</label>
										<div class="col-lg-6">
											<input id="shangjiazhanghao" name="shangjiazhanghao" placeholder="商家账号">
										</div>
									</div>	
											<div class="form-group">
										<label class="control-label col-lg-3">商家名称</label>
										<div class="col-lg-6">
											<input id="shangjiamingcheng" name="shangjiamingcheng" placeholder="商家名称">
										</div>
									</div>	
											<div class="form-group">
										<label class="control-label col-lg-3">详细地址</label>
										<div class="col-lg-6">
											<input id="xiangxidizhi" name="xiangxidizhi" placeholder="详细地址">
										</div>
									</div>	
	
																																																																																																																																																	<div class="form-group">
											<label class="control-label col-lg-3">简介</label>
											<div class="col-lg-6">
												<input id="jianjieupload" name="file" type="file">
												<script id="jianjieEditor" type="text/plain" style="width:800px;height:230px;"></script>
												<script type="text/javascript">
												    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
												   //相见文档配置属于你自己的编译器
												 var jianjieUe = UE.getEditor('jianjieEditor', {
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
												<input type="hidden" name="jianjie" id="jianjie-input">
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
		var tableName = "qicaixinxi";
		var pageType = "add-or-update";
		var updateId = "";
		var crossTableId = -1;
		var crossTableName = '';
		var ruleForm = {};
		var crossRuleForm = {};

																																																									
						var qicaileixingOptions = [];
									
							//普通下拉框渲染
				function qicaileixingSelect(){	
					var url = "option/qicaifenlei/qicaileixing";
					http(url,"GET",{},(res)=>{
						if(res.code == 0){
							qicaileixingOptions = res.data;
							var qicaileixingSelect = document.getElementById('qicaileixingSelect');
							for(var i=0;i<qicaileixingOptions.length;i++){
								var qicaileixingOption = document.createElement('option');
								qicaileixingOption.setAttribute('name','qicaileixingOption');
								qicaileixingOption.setAttribute('value',qicaileixingOptions[i]);
								qicaileixingOption.innerHTML = qicaileixingOptions[i];									
								if(ruleForm.qicaileixing == qicaileixingOptions[i]){
									qicaileixingOption.setAttribute('selected','selected');
								}
								qicaileixingSelect.appendChild(qicaileixingOption);
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
					http("qicaixinxi/info/" + id,"GET",{},(res)=>{
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
									$('#tupianupload').fileupload({
						url: baseUrl + 'file/upload',
						headers:{ token: window.sessionStorage.getItem("token")},
						dataType: 'json',
						done: function (e, data) {							
							document.getElementById('tupian-input').setAttribute('value',baseUrl+"upload/"+data.result.file);
							document.getElementById('tupianFileName').innerHTML = data.result.file +"";
							$("#tupianImg").attr("src",baseUrl+"upload/"+data.result.file);
						}
					});
							$('#jianjieupload').fileupload({
						url: baseUrl + 'file/upload',
						headers:{ token: window.sessionStorage.getItem("token")},
						dataType: 'json',
						done: function (e, data) {	
							UE.getEditor('jianjieEditor').execCommand('insertHtml','<img src=\"'+ baseUrl +'upload/'+ data.result.file + '\" width=100 height=100>');					
						}
					});
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
				httpJson("qicaixinxi/"+urlParam,"POST",data,(res)=>{
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
																																		if(ruleForm.jianjie != null && ruleForm.jianjie != 'null' && ruleForm.jianjie != ''){
						var jianjieMes = '' + ruleForm.jianjie;
						var jianjieUeditor = UE.getEditor('jianjieEditor');
						jianjieUeditor.ready(function() {
							jianjieUeditor.setContent(jianjieMes);
						});
				}	
																																												}  
		// 获取富文本框内容
		function getContent(){
																																		if(UE.getEditor('jianjieEditor').hasContents()){
					$('#jianjie-input').attr('value',UE.getEditor('jianjieEditor').getPlainTxt());
				}	
																																												}

		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({ 
				rules: {
					           				       			 	           										    qicaimingcheng: {
														},
						       			 	           										    qicaileixing: {
														},
						       			 	           										    tupian: {
														},
						       			 	           										    jianjie: {
														},
						       			 	           										    zulinguize: {
														},
						       			 	           										    shuliang: {
															digits: true,
														},
						       			 	           										    meitianjiage: {
															required: true,
														},
						       			 	           										    shangjiazhanghao: {
														},
						       			 	           										    shangjiamingcheng: {
														},
						       			 	           										    xiangxidizhi: {
														},
						       			 					},
				messages: {
					
																													qicaimingcheng: {
													},
																								qicaileixing: {
													},
																								tupian: {
													},
																								jianjie: {
													},
																								zulinguize: {
													},
																								shuliang: {
														digits: "请输入整数",
														},
																								meitianjiage: {
														required: "每天价格不能为空",
														},
																								shangjiazhanghao: {
													},
																								shangjiamingcheng: {
													},
																								xiangxidizhi: {
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
				http("qicaixinxi/info/" + id,"GET",{},(res)=>{
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
																																																					qicaileixingSelect();
																																																																																																																											//注册表单验证
						$(validform());
					}
				});
			}else{
																																	qicaileixingSelect();	
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
			http("qicaixinxi"+colName,"GET",{
				tableName: "qicaixinxi",
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
															if(res.data !=null && res.data.shangjiazhanghao != null && res.data.shangjiazhanghao != ''){
							$('#shangjiazhanghao').val(res.data.shangjiazhanghao)
						}
								if(res.data !=null && res.data.shangjiamingcheng != null && res.data.shangjiamingcheng != ''){
							$('#shangjiamingcheng').val(res.data.shangjiamingcheng)
						}
								if(res.data !=null && res.data.xiangxidizhi != null && res.data.xiangxidizhi != ''){
							$('#xiangxidizhi').val(res.data.xiangxidizhi)
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
																																																																																		}	
		function dataBind(){
			$("#updateId").val(ruleForm.id);	
												$("#qicaibianhao").val(ruleForm.qicaibianhao);	
																$("#qicaimingcheng").val(ruleForm.qicaimingcheng);	
																var qicaileixingOptions = document.getElementsByClassName("qicaileixingOption");
					for(var qicaileixingCount = 0; qicaileixingCount < qicaileixingOptions.length;qicaileixingCount++){
						if(qicaileixingOptions[qicaileixingCount].getAttribute('value') == ruleForm.qicaileixing){
							qicaileixingOptions[qicaileixingCount].setAttribute('selected','selected');
						}
					}

																$("#tupian-input").val(ruleForm.tupian);
																$("#jianjie").val(ruleForm.jianjie);	
																$("#zulinguize-input").val(ruleForm.zulinguize);
																$("#shuliang").val(ruleForm.shuliang);	
																$("#meitianjiage").val(ruleForm.meitianjiage);	
																$("#shangjiazhanghao").val(ruleForm.shangjiazhanghao);	
																$("#shangjiamingcheng").val(ruleForm.shangjiamingcheng);	
																$("#xiangxidizhi").val(ruleForm.xiangxidizhi);	
									}
		//图片显示
		function showImg(){
																																	var tupianFileName = "\"" + ruleForm.tupian + "\"";
					$("#tupianImg").attr("src",ruleForm.tupian);
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
												if(res.data != null && res.data != '' && res.data.qicaibianhao != null && res.data.qicaibianhao != ''){

															$("#qicaibianhao").val(res.data.qicaibianhao);
													}
												if(res.data != null && res.data != '' && res.data.qicaimingcheng != null && res.data.qicaimingcheng != ''){

															$("#qicaimingcheng").val(res.data.qicaimingcheng);
													}
												if(res.data != null && res.data != '' && res.data.qicaileixing != null && res.data.qicaileixing != ''){

															var qicaileixingOptions = document.getElementsByClassName("qicaileixingOption");
								for(var qicaileixingCount = 0; qicaileixingCount < qicaileixingOptions.length;qicaileixingCount++){
									if(qicaileixingOptions[qicaileixingCount].getAttribute('value') == res.data.qicaileixing){
										qicaileixingOptions[qicaileixingCount].setAttribute('selected','selected');
									}
								}
													}
												if(res.data != null && res.data != '' && res.data.tupian != null && res.data.tupian != ''){

															$("#tupianImg").attr("src",res.data.tupian);
								$("#tupian-input").val(res.data.tupian);
													}
												if(res.data != null && res.data != '' && res.data.jianjie != null && res.data.jianjie != ''){

															$("#jianjie").val(res.data.jianjie);
													}
												if(res.data != null && res.data != '' && res.data.zulinguize != null && res.data.zulinguize != ''){

															$("#zulinguize-input").val(res.data.zulinguize);
													}
												if(res.data != null && res.data != '' && res.data.shuliang != null && res.data.shuliang != ''){

															$("#shuliang").val(res.data.shuliang);
													}
												if(res.data != null && res.data != '' && res.data.meitianjiage != null && res.data.meitianjiage != ''){

															$("#meitianjiage").val(res.data.meitianjiage);
													}
												if(res.data != null && res.data != '' && res.data.shangjiazhanghao != null && res.data.shangjiazhanghao != ''){

															$("#shangjiazhanghao").val(res.data.shangjiazhanghao);
													}
												if(res.data != null && res.data != '' && res.data.shangjiamingcheng != null && res.data.shangjiamingcheng != ''){

															$("#shangjiamingcheng").val(res.data.shangjiamingcheng);
													}
												if(res.data != null && res.data != '' && res.data.xiangxidizhi != null && res.data.xiangxidizhi != ''){

															$("#xiangxidizhi").val(res.data.xiangxidizhi);
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
