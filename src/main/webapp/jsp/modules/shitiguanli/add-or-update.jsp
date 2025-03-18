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

	<!-- Main content starts -->
	<div class="content">

		<!-- 侧边导航栏 -->
		<%@ include file="../../static/sidebar.jsp"%>
		<!-- Main bar -->
		<div class="mainbar">
			<!-- Page heading -->
			<div class="page-head">
				<!-- Page heading -->
				<h2 class="pull-left">
					试题
					<!-- page meta -->
					<span class="page-meta"> 管理</span>
				</h2>
				<!-- 面包屑 -->
				<div class="bread-crumb pull-right">
					<a href="${pageContext.request.contextPath}/index.jsp"><i
						class="icon-home"></i>主页</a>
					<!-- Divider -->
					<span class="divider">/</span> <a href="#" class="bread-current">试题管理</a>
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
											<form class="form-horizontal" id="addOrUpdateForm"
												method="post">
												<input id="updateId" name="id" type="hidden">
												<div class="form-group">
													<label class="control-label col-lg-3">试卷</label>
													<div class="col-lg-6">
														<select id="papernameSelect" name="papername" onchange="setPaperId()">
															<option value="">请选择试卷</option>
														</select>
													</div>
												</div>
												
												<input type="hidden" name="paperid" id="paperId">
												
												<div class="form-group">
													<label class="control-label col-lg-4">试题</label>
													<div class="col-lg-8">
					                                    <textarea id="questionname" name="questionname" class="form-control" rows="2" placeholder="试题"></textarea>
				                                    </div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">类型</label>
													<div class="col-lg-6">
														<select id="typeSelect" name="type" onchange="setQuestionOption()">
															<option value="">请选择类型</option>
															<option class="typeOption" value="0">单选题</option>
															<option class="typeOption" value="1">多选题</option>
															<option class="typeOption" value="2">判断题</option>
															<option class="typeOption" value="3">填空题</option>
														</select>
													</div>
												</div>
												<div id="optionsParent" class="form-group" style="display: none;">
													<label class="control-label col-lg-3">选项</label>
													<div class="col-lg-6">
														<button id="addBtn" type="button" class="btn btn-xs btn btn-primary">添加</button>
														<button id="deleteBtn" type="button" class="btn btn-xs btn btn-warning">删除</button>
														<input id="options-input" name="options" type="hidden">
													</div>
												</div>
												
												<div id="answerParent" class="form-group">
													<label class="control-label col-lg-3">答案</label>
													<div class="col-lg-6">
														<input id="answer" name="answer" type="text">
													</div>
												</div>
												
												<div class="form-group">
													<label class="control-label col-lg-3">分数</label>
													<div class="col-lg-6">
														<input id="score" name="score" type="number" placeholder="分数">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-4">分析</label>
													<div class="col-lg-8">
					                                    <textarea id="analysis" name="analysis" class="form-control" rows="2" placeholder="分析"></textarea>
				                                    </div>													
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">排序</label>
													<div class="col-lg-6">
														<input id="sequence" name="sequence" type="number" placeholder="数值越大越靠前">
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
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
	<!-- Scroll to top -->
	<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span>

	<script type="text/javascript">
		
		<%@ include file="../../utils/baseUrl.jsp"%>		
		<%@ include file="../../utils/menu.jsp"%>
		
		var tableName = "examquestion";
		var pageType = "add-or-update";
		var updateId = "";
		var questionType = '';
		var optionCount = 4;

		var papernameOptions = [];

		//普通下拉框渲染
		function papernameSelect() {
			$.ajax({
				type : "GET",
				url : baseUrl + "option/exampaper/name",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("token", window.sessionStorage
							.getItem('token'));
				},
				success : function(res) {
					if (res.code == 0) {
						papernameOptions = res.data;
						var papernameSelect = document
								.getElementById('papernameSelect');
						for (var i = 0; i < papernameOptions.length; i++) {
							var papernameOption = document
									.createElement('option');
							papernameOption.setAttribute('class',
									'papernameOption');
							papernameOption.setAttribute('value',
									papernameOptions[i]);
							papernameOption.innerHTML = papernameOptions[i];						
							if (ruleForm.papername == papernameOptions[i]) {
								papernameOption.setAttribute('selected',
										'selected');
							}
							papernameSelect.appendChild(papernameOption);
						}
					} else if (res.code == 401) {
						<%@ include file="../../static/toLogin.jsp"%>
					} else {
						alert(res.msg);
					}
				},
			});
		}
		var ruleForm = {};
		var vm = new Vue({
			el : '#addOrUpdateForm',
			data : {
				ruleForm : {},
			},
			beforeCreate : function() {
				var id = window.sessionStorage.getItem("id");
				if (id != null && id != "" && id != "null") {
					$.ajax({
						type : "GET",
						url : baseUrl + "examquestion/info/" + id,
						beforeSend : function(xhr) {xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));},
						success : function(res) {
							if (res.code == 0) {
								vm.ruleForm = res.data;
							} else if (res.code == 401) {
								<%@ include file="../../static/toLogin.jsp"%>
							} else {
								alert(res.msg)
							}
						},
					});
				}
			},
			methods : {}
		});

		// 表单提交
		function submit() {
			if (validform() == true && setOptionJson() == true) {				
				let data = {};
				let value = $('#addOrUpdateForm').serializeArray();
				$.each(value, function(index, item) {
					data[item.name] = item.value;
				});
				let json = JSON.stringify(data);
				//console.log('json : ', json);
				var urlParam;
				var successMes = '';
				if (updateId != null && updateId != "null" && updateId != '') {
					urlParam = 'update';
					successMes = '修改成功';
				} else {
					urlParam = 'save';
					successMes = '添加成功';
				}
				$.ajax({
					type : "POST",
					url : baseUrl + "examquestion/" + urlParam,
					contentType : "application/json",
					data : json,
					beforeSend : function(xhr) {
						xhr.setRequestHeader("token", window.sessionStorage
								.getItem('token'));
					},
					success : function(res) {
						if (res.code == 0) {
							alert(successMes);
							window.location.href = "list.jsp";
						} else if (res.code == 401) {
							<%@ include file="../../static/toLogin.jsp"%>
						} else {
							alert(res.msg)
						}
					},
				});
			} else {
				alert("表单未填完整或有错误");
			}
		}

		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({
				rules : {
					questionname : {
						required : true,
					},
					type : {},
					options : {},
					score : {
						required : true,
					},
					analysis : {
						required : true,
					},
					sequence : {
						required : true,
					},
				},
				messages : {

					questionname : {
						required : "试题不能为空",
					},
					type : {},
					options : {},
					score : {
						required : "分数不能为空",
					},
					analysis : {
						required : "分析不能为空",
					},
					sequence : {
						required : "排序不能为空",
					},
				}
			}).form();
		}
		// 添加表单校验方法
		function addValidation() {
			jQuery.validator
					.addMethod(
							"isPhone",
							function(value, element) {
								var length = value.length;
								var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
								return this.optional(element)
										|| (length == 11 && mobile.test(value));
							}, "请填写正确的手机号码");
			jQuery.validator.addMethod("isIdCardNo", function(value, element) {
				return this.optional(element)
						|| idCardNoUtil.checkIdCardNo(value);
			}, "请正确输入您的身份证号码");
		}
		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if (id != null && id != "" && id != "null") {
				updateId = id;
				window.sessionStorage.removeItem('id');
				$.ajax({
					type : "GET",
					url : baseUrl + "examquestion/info/" + id,
					beforeSend : function(xhr) {
						xhr.setRequestHeader("token", window.sessionStorage
								.getItem('token'));
					},
					success : function(res) {
						if (res.code == 0) {
							//window.sessionStorage.removeItem("id");
							ruleForm = res.data
							// 数据填充
							dataBind();
							//注册表单验证
							$(validform());
							papernameSelect();
						} else if (res.code == 401) {
							<%@ include file="../../static/toLogin.jsp"%>
						} else {
							alert(res.msg);
						}
					},
				});
			} else {
				papernameSelect();
				$('#answerParent').hide();
				//注册表单验证
				$(validform());
			}
		}
		// 下拉框选项回显
		function setSelectOption() {
		}

		function ready() {
			$('ul li .dropdown-toggle').html("<i class=\"icon-user\"></i>"+ window.sessionStorage.getItem('username')+ "<b class=\"caret\"></b>")
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
			$('#addBtn').on('click', function(e) {
				e.preventDefault();
				addOption();
			});
			$('#deleteBtn').on('click', function(e) {
				e.preventDefault();
				deleteOption();
			});
			getDetails();
		}

		// 清除可能会重复渲染的下拉框Option
		function clear(className) {
			var elements = document.getElementsByClassName(className);
			for (var i = elements.length - 1; i >= 0; i--) {
				elements[i].parentNode.removeChild(elements[i]);
			}
		}

		function dataBind() {
			$("#updateId").val(ruleForm.id);
			$("#paperId").val(ruleForm.paperid);
			$('#questionname').val(ruleForm.questionname)
					
			var typeOptions = document.getElementsByClassName('typeOption')
			for(var i=0;i<typeOptions.length;i++){
				if(typeOptions[i].value == ruleForm.type){
					typeOptions[i].selected = true
				}
			}
			
			//选择题选项回显
			if(ruleForm.type < 2){
				setOptions();
			}
			
			$("#options-input").val(ruleForm.options);
			if(ruleForm.type != 2){
				if(questionType == 3){
					// 删除包含答案输入框的div
					$('#answer').val('')
					$('#answer').parent().hide()
					// 重新渲染答案输入框
					$('#answerParent div').remove()
					$('#answerParent').append("<div class=\"col-lg-8\"><textarea id=\"answer\" name=\"answer\" class=\"form-control\" rows=\"2\" placeholder=\"答案\"></textarea></div>")
					//展示填空输入框
					$('#answerParent').show()
				}
				$('#answer').val(ruleForm.answer)
			}else{
				//隐藏选项框
				$('#optionsParent').hide()	
				$("#options-input").val("[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]")
				// 删除包含答案输入框的div
				$('#answer').val('')
				$('#answer').parent().hide()				
				// 重新渲染答案输入框
				$('#answerParent div').remove()
				$('#answerParent').append("<div class=\"col-lg-6\"><select id=\"answer\" name=\"answer\"><option class=\"answerOption\" value=\"A\">A.对</option><option class=\"answerOption\" value=\"B\">B.错</option></select></div>")	
				$('#answerParent').show()
				var answerOptions = document.getElementsByClassName('answerOption')
				for(var i=0;i<answerOptions.length;i++){
					if(answerOptions[i].value == ruleForm.answer){
						answerOptions[i].selected = true
					}
				}
			}
			$("#options-input").val(ruleForm.options);
			$("#score").val(ruleForm.score);
			$("#analysis").val(ruleForm.analysis);
			$("#sequence").val(ruleForm.sequence);
		}

		function setQuestionOption(){					
			var index = document.getElementById("typeSelect").selectedIndex
			var options = document.getElementById("typeSelect").options
			//设置题目类型	
			questionType = options[index].value
			console.log("questionType: "+questionType)
			
			
			// 选择题至少有两项
			if(questionType == 0 || questionType == 1){
				optionCount = 0;
			
				//展示选项框
				$('#optionsParent').show()
				// 清除旧的选项
				$('#optionsParent div').children().remove()
				$('#optionsParent div').append("<button id=\"addBtn\" onclick=\"addOption()\" class=\"btn btn-xs btn btn-primary\">添加</button>")		
				$('#optionsParent div').append("<button id=\"deleteBtn\" onclick=\"deleteOption()\" class=\"btn btn-xs btn btn-warning\">删除</button>")
				$('#optionsParent div').append("<input id=\"options-input\" name=\"options\" type=\"hidden\">")
				$('#addBtn').before("<label id=\"labelA\">A. </label><input id=\"optionA\" class=\"option\" type=\"text\"><br><br>")
				$('#addBtn').before("<label id=\"labelB\">B. </label><input id=\"optionB\" class=\"option\" type=\"text\"><br><br>")
				$('#addBtn').before("<label id=\"labelC\">C. </label><input id=\"optionC\" class=\"option\" type=\"text\"><br><br>")
				$('#addBtn').before("<label id=\"labelD\">D. </label><input id=\"optionD\" class=\"option\" type=\"text\"><br><br>")
				//重新渲染答案表单项
				$('#answerParent div').remove()
				$('#answerParent').append("<div class=\"col-lg-6\"><input id=\"answer\" name=\"answer\" type=\"text\" placeholder=\"多选用逗号隔开\"></div>")
				$('#answerParent div input').attr('maxlength',questionType*6+1)
				$('#answerParent').show()
				//隐藏添加按钮
				$("#addBtn").hide()
			}else if(questionType == 2){
				//隐藏选项框
				$('#optionsParent').hide()	
				$("#options-input").val("[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]")
				// 删除包含答案输入框的div
				$('#answer').val('')
				$('#answer').parent().hide()				
				// 重新渲染答案输入框
				$('#answerParent div').remove()
				$('#answerParent').append("<div class=\"col-lg-6\"><select id=\"answer\" name=\"answer\"><option class=\"answerOption\" value=\"A\">A.对</option><option class=\"answerOption\" value=\"B\">B.错</option></select></div>")	
				$('#answerParent').show()
			}else if(questionType == 3){
				//隐藏选项框
				$('#optionsParent').hide()
				// 删除包含答案输入框的div
				$('#answer').val('')
				$('#answer').parent().hide()
				//选项留空
				$('#options-input').val("[]")		
				// 重新渲染答案输入框
				$('#answerParent div').remove()
				$('#answerParent').append("<div class=\"col-lg-8\"><textarea id=\"answer\" name=\"answer\" class=\"form-control\" rows=\"2\" placeholder=\"答案\"></textarea></div>")
				//展示填空输入框
				$('#answerParent').show()
			}
			
		}
		//添加选择题选项
		function addOption(){
			if(optionCount == 4){
				$('#addBtn').before("<label id=\"labelA\">A. </label><input id=\"optionA\" class=\"option\"><br><br>")
				optionCount--
				$('#deleteBtn').hide()
			}else if(optionCount == 3){
				$('#addBtn').before("<label id=\"labelB\">B. </label><input id=\"optionB\" class=\"option\"><br><br>")				
				optionCount--
				$('#deleteBtn').hide()
			}else if(optionCount == 2){
				$('#addBtn').before("<label id=\"labelC\">C. </label><input id=\"optionC\" class=\"option\"><br><br>")				
				optionCount--	
				$('#deleteBtn').show()
			}else if(optionCount == 1){
				$('#addBtn').before("<label id=\"labelD\">D. </label><input id=\"optionD\" class=\"option\"><br><br>")
				optionCount--
				$('#addBtn').hide()
				$('#deleteBtn').show()
			}	
		}
		// 删除选择题选项
		function deleteOption(){
			var options = document.getElementsByClassName('option')
			var inputId = '#' + options[options.length-1].getAttribute("id")
				
			$(inputId).prev().remove()
			$(inputId).next().remove()
			$(inputId).next().remove()
			$(inputId).remove()
					
			optionCount++
			if(optionCount != 0){
				$('#addBtn').show()
			}
			// 如果只剩两个选项就不给删除
			if(options.length <= 2){
				$('#deleteBtn').hide()
			}
		}
		// 设置选项json串
		function setOptionJson(){			
			if(questionType == 0 || questionType == 1){
				var str = "["
				var options = document.getElementsByClassName('option')
				for(var i=0;i<options.length;i++){
					var id =  'option' + String.fromCharCode(65+i);
					if($('#'+id).val() ==null || $('#'+id).val() == '' || $('#'+id).val().trim() == ''){
						alert('还有选项没填!')
						return false
					}else{
						str = str + "{\"text\":\"" +  $('#'+id).val() + "\",\"code\":\"" + String.fromCharCode(65+i) + "\"}"
						if(i != options.length-1){
							str = str + ","
						}else{
							str = str + "]"
						}		
					}													
				}
				$('#options-input').val(str)
			}			
			return true
		}
		//回显选择题选项
		function setOptions(){
			var options = $.parseJSON(ruleForm.options);
			//展示选项框
			$('#optionsParent').show()
			if(options.length == 4){
				$('#addBtn').hide();
			}else if(options.length == 2){
				$('deleteBtn').hide();
			}
			for(var i=0;i<options.length;i++){
				var code = options[i].code
				var text = options[i].text
				$('#addBtn').before("<label id=\"label"+ code +"\">"+ code +". </label><input id=\"option"+ code +"\" class=\"option\" type=\"text\"><br><br>")
				$('#option'+code).val(text)
			}
		}
		//设置paperid
		function setPaperId(){
			var index = document.getElementById("papernameSelect").selectedIndex;
		    var options = document.getElementById("papernameSelect").options;
			$.ajax({
				type : "GET",
				url : baseUrl + "exampaper/page",
				data : {name : options[index].value },
				beforeSend : function(xhr) {xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));},
				success : function(res) {
					if (res.code == 0) {
						$('#paperId').val(res.data.list[0].id);
					} else if (res.code == 401) {
						<%@ include file="../../static/toLogin.jsp"%>
					} else {
						alert(res.msg);
					}
				},
			});
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
