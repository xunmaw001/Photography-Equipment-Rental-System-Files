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

		<!-- Main bar -->
		<div class="mainbar" style="margin-left: 0;">
			<!-- Page heading -->
			<div class="page-head">
				<!-- Page heading -->
				<h2 class="pull-left">
					当前第 1 题，剩余 10 题，共 100 题
					<!-- page meta -->
				</h2>
				<!-- 面包屑 -->
				<div id="timeMsg" class="bread-crumb pull-right">
					<h3 style="color: red;">剩余 xx 分钟 xx秒</h3>
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
												<div class="form-group">
													<label class="control-label col-lg-4">题目</label>
													<div class="col-lg-8">
														<textarea id="questionname" name="questionname"
															class="form-control" rows="2" placeholder="试题"></textarea>
													</div>
												</div>
												<div id="optionsArea" class="form-group">
													<label class="control-label col-lg-3">选项</label>
													<div class="col-lg-8">
														<textarea class="form-control" rows="2" readonly></textarea>
													</div>
												</div>
												<div id="answerArea" class="form-group">
													<label class="control-label col-lg-3">答案</label>
												</div>
												<div id="yourAnswer" class="form-group" style="display: none;">
													<label class="control-label col-lg-3">你的答案</label>
													<div class="col-lg-4">
														<input readonly>
														<label style="color: red;">正确</label>
													</div>
												</div>
												<div id="analysis" class="form-group" style="display: none;">
													<label class="control-label col-lg-3">解析</label>
													<div class="col-lg-8">
														<textarea class="form-control" rows="2" placeholder="解析"
															readonly></textarea>
													</div>
												</div>
												<div id="result" class="form-group" style="display: none;">
													<label class="control-label col-lg-3">考试成绩</label>
													<div class="col-lg-4">
														<input readonly>
													</div>
												</div>


												<!-- 表单按钮 -->
												<div class="form-group">
													<div class="col-lg-6 col-lg-offset-1">
														<button id="submitBtn" type="button"
															class="btn btn-warning">提交</button>
														<button id="nextBtn" type="button"
															class="btn btn-success">下一题</button>
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

	<%@include file = "../../utils/baseUrl.jsp" %>
		
	<%@include file = "../../utils/menu.jsp" %>

		var updateId = "";
		var ruleForm = {};
		var questions = [];
		var current = 1;
		var total = 0;
		var paperId;
		var userId;
		var time = 0;
		var score = 0;

		// 表单提交
		function submit() {
			if (validform() == true) {
				let data = {};
				getContent();
				let value = $('#addOrUpdateForm').serializeArray();
				$.each(value, function (index, item) {
					data[item.name] = item.value;
				});
				let json = JSON.stringify(data);
				console.log('json : ', json);
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
					type: "POST",
					url: baseUrl + "exampaper/" + urlParam,
					contentType: "application/json",
					data: json,
					beforeSend: function (xhr) {
						xhr.setRequestHeader("token", window.sessionStorage
							.getItem('token'));
					},
					success: function (res) {
						if (res.code == 0) {
							alert(successMes);
							window.location.href = "list.jsp";
						} else if (res.code == 401) {
							<%@include file = "../../static/toLogin.jsp" %>
						} else {
							alert(res.msg)
						}
					},
				});
			} else {
				alert("表单未填完整或有错误");
			}
		}


		function ready() {
			$('ul li .dropdown-toggle').html("<i class=\"icon-user\"></i>" + window.sessionStorage.getItem('username') + "<b class=\"caret\"></b>")
				//设置导航栏菜单
				//setMenu();
				<%@include file = "../../static/menuStyle.js" %>
					$('#submitBtn').on('click', function (e) {
						e.preventDefault();
						//console.log("点击了...提交按钮");
						submitAnswer();
					});
			$('#nextBtn').on('click', function (e) {
				e.preventDefault();
				//console.log("点击了...提交按钮");
				next();
			});
			init();
			<%@include file = "../../static/myInfo.js" %>
		}

		//初始化准备
		function init() {
			//获取试卷id
			paperId = window.sessionStorage.getItem('paperid');
			//window.sessionStorage.removeItem('paperid');
			//获取当前用户id
			getUserId();
			//获取当前试卷题目
			getQuestions();

		}

		//获取当前用户id
		function getUserId() {
			var accountTableName = window.sessionStorage.getItem('accountTableName')
			$.ajax({
				type: "GET",
				url: baseUrl + accountTableName + "/session",
				beforeSend: function (xhr) { xhr.setRequestHeader("token", window.sessionStorage.getItem('token')); },
				success: function (res) {
					if (res.code == 0) {
						//将用户id保存到全局变量中
						userId = res.data.id
						//删除旧的考试记录
						reWrite();
					}
					else if (res.code == 401) {<%@include file = "../../static/toLogin.jsp" %>}
					else { alert(res.msg); }
				},
			});
		}

		//获取当前试卷题目
		function getQuestions() {
			$.ajax({
				type: "GET",
				url: baseUrl + "examquestion/page",
				data: {
					sort: "id",
					paperid: paperId,
				},
				beforeSend: function (xhr) { xhr.setRequestHeader("token", window.sessionStorage.getItem('token')); },
				success: function (res) {
					if (res.code == 0) {
						//将题目保存到全局变量						
						questions = res.data.list;
						total = questions.length;
						//获取时间
						getExamTime();
					} else if (res.code == 401) {<%@include file = "../../static/toLogin.jsp" %>}
					else { alert(res.msg); }
				},
			});
		}

		//渲染题目
		function showQuestion() {
			$('#nextBtn').hide();
			//更新考试进度信息
			setProgressMsg();
			//隐藏选项表单项
			$('#optionsArea').hide();
			var question = questions[current - 1];
			//将字符串转成json
			var answerOptions = $.parseJSON(question.options);
			//展示题目类型和分值
			var questionType = '';
			switch (question.type) {
				case 0:
					questionType = '(单选题';
					break;
				case 1:
					questionType = '(多选题';
					break;
				case 2:
					questionType = '(判断题';
					break;
				case 3:
					questionType = '(填空题';
					break;
				default:
					console.log('该题目类型未能识别');
			}
			$('#questionname').val(questionType + " " + question.score + " 分) " + question.questionname);
			//清空作答区域
			$('#answerArea div').remove()
			if (question.type == 0 || question.type == 2) {
				//单选题和判断题
				$('#answerArea').append("<div class=\"col-lg-6\"><select id=\"answerSelect\" class=\"form-control\"></select></div>");
				for (var i = 0; i < answerOptions.length; i++) {
					var option = document.createElement('option');
					option.setAttribute('class', 'answerOption');
					option.setAttribute('value', answerOptions[i].code);
					option.innerHTML = answerOptions[i].text;
					$('#answerSelect').append(option)
				}
			} else if (question.type == 1) {
				var str = ''
				for (var i = 0; i < answerOptions.length; i++) {
					str = str + answerOptions[i].code + '. ' + answerOptions[i].text + '  ';
				}
				$('#optionsArea div textarea').val(str)
				//展示选项表单
				$('#optionsArea').show();
				//渲染答案输入框			
				$('#answerArea').append("<div class=\"col-lg-6\"><input id=\"answer\" placeholder=\"多个答案用英文逗号隔开\"></div>")
			} else if (question.type == 3) {
				//渲染答案输入框	
				$('#answerArea').append("<div class=\"col-lg-8\"><textarea id=\"answer\" class=\"form-control\" rows=\"2\" placeholder=\"请输入答案\"></textarea></div>");
			}
			$('#answerArea').show();
		}
		//设置题目进度文本
		function setProgressMsg() {
			var remain = total - current;
			var msg = "当前第 " + current + " 题,剩余 " + remain + " 题,共 " + total + "题."
			$('.page-head h2').html(msg)
		}
		//获取考试时间
		function getExamTime() {
			$.ajax({
				type: "GET",
				url: baseUrl + "exampaper/info/" + paperId,
				contentType: "application/json",
				beforeSend: function (xhr) { xhr.setRequestHeader("token", window.sessionStorage.getItem('token')); },
				success: function (res) {
					if (res.code == 0) {
						//将考试时间保存到全局变量
						time = res.data.time;
						//每秒更新一次剩余时间
						self.setInterval("setTimeMsg()", 1000);
						console.log("time: " + time)
						//定时结束考试
						setTimeout(function () { examFinish() }, time * 1000);
						//渲染题目
						showQuestion();
					} else if (res.code == 401) {
						<%@include file = "../../static/toLogin.jsp" %>
					} else {
						alert(res.msg)
					}
				},
			});
		}
		//设置时间信息
		function setTimeMsg() {
			if (time > 0) {
				time--;
				var min = parseInt(time / 60);
				var second = time % 60;
				var str = "剩余 " + min + " 分钟, " + second + " 秒";
				$('#timeMsg h3').html(str);
			} else {
				$('#timeMsg h3').html('考试结束');
			}
		}
		//提交当前题目答案
		function submitAnswer() {
			var question = questions[current - 1];
			var answerStr = '';
			var myScore = 0;
			if (question.type == 0 || question.type == 2) {
				var index = document.getElementById("answerSelect").selectedIndex;
				var answerOptions = document.getElementById("answerSelect").options;
				answerStr = answerOptions[index].value
			} else {
				answerStr = $('#answer').val();
			}
			if (answerStr == question.answer) {
				myScore = question.score;
			}

			$.ajax({
				type: "POST",
				url: baseUrl + "examrecord/save",
				contentType: "application/json",
				data: JSON.stringify({
					analysis: question.analysis,
					answer: question.answer,
					myanswer: answerStr,
					myscore: myScore,
					options: question.options,
					paperid: paperId,
					papername: question.papername,
					questionid: question.id,
					questionname: question.questionname,
					score: question.score,
					userid: userId,
				}),
				beforeSend: function (xhr) { xhr.setRequestHeader("token", window.sessionStorage.getItem('token')); },
				success: function (res) {
					if (res.code == 0) {
						score += myScore;
						$('#yourAnswer div input').val(answerStr);
						if (answerStr == question.answer) {
							$('#yourAnswer div label').html("正确");
						} else {
							$('#yourAnswer div label').html("错误");
						}
						showResult();
					} else if (res.code == 401) {
						<%@include file = "../../static/toLogin.jsp" %>
					} else {
						alert(res.msg)
					}
				},

			});
		}
		//提交答案后显示结果和解析
		function showResult() {
			//隐藏选项表单项
			$('#optionsArea').hide();
			//隐藏作答区域
			$('#answerArea').hide();
			$('#analysis div textarea').html(questions[current - 1].analysis);
			$('#yourAnswer').show();
			$('#analysis').show();
			$('#nextBtn').show();
			$('#submitBtn').hide();
			if (current == total) {
				$('#nextBtn').html("查看考试成绩");
			}
		}
		//继续下一题
		function next() {
			if (current == total) {
				examFinish();
			} else {
				$('#nextBtn').hide();
				$('#submitBtn').show();
				//隐藏答案解析
				$('#yourAnswer').hide();
				$('#analysis').hide();
				current++;
				showQuestion();
			}
		}
		//考试结束，展示成绩
		function examFinish() {
			console.log("考试结束 ");
			$('form div').hide();
			$('#result div input').val(score + '分');
			$('#result div').show();
			$('#result').show();
			$('form').append("<button type=\"button\" onclick=\"exit()\">退出</button>")
		}
		//退出考试
		function exit() {
			window.location.href = baseUrl + "jsp/modules/kaoshijilu/list.jsp";
		}
		//重新考试，删除该份试卷之前的考试记录
		function reWrite() {
			$.ajax({
				type: "GET",
				url: baseUrl + "examrecord/deleteRecords",
				data: {
					userid: userId,
					paperid: paperId,
				},
				beforeSend: function (xhr) { xhr.setRequestHeader("token", window.sessionStorage.getItem('token')); },
				success: function (res) {
					if (res.code == 0) {

					} else if (res.code == 401) {<%@include file = "../../static/toLogin.jsp" %>}
					else {/*alert(res.msg)*/; }
				},
			});
		}

		// 渲染菜单
		<%@include file = "../../static/setMenu.js" %>
		// 用户登出
		<%@include file = "../../static/logout.jsp" %>
			// 生命周期函数
			document.addEventListener("DOMContentLoaded", ready);
	</script>

</body>

</html>