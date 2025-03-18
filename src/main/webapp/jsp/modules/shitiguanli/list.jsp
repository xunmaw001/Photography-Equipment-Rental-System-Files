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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/style/font-awesome.min.css">
</head>

<body>
	<%@ include file="../../static/banner.jsp"%>
	<%@ include file="../../static/header.jsp"%>

	<!-- Main content starts -->

	<div class="content">

		<!-- 导航栏 -->
		<%@ include file="../../static/sidebar.jsp"%>


		<!-- Main bar -->
		<div class="mainbar">

			<!-- Page heading -->
			<div class="page-head">
				<h2 class="pull-left">试题管理管理</h2>

				<!-- Breadcrumb -->
				<div class="bread-crumb pull-right">
					<a href="index.html"><i class="icon-home"></i> 主页</a>
					<!-- Divider -->
					<span class="divider">/</span> <a href="#" class="bread-current">试题管理</a>
				</div>

				<div class="clearfix"></div>

			</div>
			<!-- Page heading ends -->

			<!-- Matter -->

			<div class="matter">
				<div class="container">

					<!-- Table -->

					<div class="row">

						<div class="col-md-12">

							<div class="widget">

								<div class="widget-head">
									<div class="pull-left">试题管理列表</div>
									<div class="widget-icons pull-right">								
										<form class="navbar-form navbar-left" id="searchForm"
											name="searchForm" role="search"
											style="margin: 3px 0 3px 0; white-space: nowrap;"
											onsubmit="saveSearchForm()">
											<div class="form-group" id="form-item-group">
												<label>试卷名称</label> <input name="papername" placeholder="试卷名称">
												<label>试题名称</label> <input name="questionname" placeholder="试题名称">
											</div>
										</form>
										<button class="btn btn-primary" onclick="saveSearchForm()">查询</button>
										<button class="btn btn-danger 删除" onclick="deleteMore()">批量删除</button>
										<button id="addBtn" class="btn btn-success 新增"
											onclick="window.location.href='add-or-update.jsp'">添加</button>

									</div>
									<div class="clearfix"></div>
								</div>

								<div id="widget-content" class="widget-content">
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th style="width: 40px;"><input type="checkbox" onclick="chooseAll()" /></th>
												<th onclick="sort('papername')">试卷<i id="papernameIcon"
													class="fa fa-sort"></i></th>
												<th onclick="sort('questionname')">试题名称<i id="questionnameIcon"
													class="fa fa-sort"></i></th>
												<th onclick="sort('type')">类型<i id="typeIcon"
													class="fa fa-sort"></i></th>
												<th onclick="sort('score')">分数<i id="scoreIcon"
													class="fa fa-sort"></i></th>
												<th onclick="sort('answer')">答案<i id="answerIcon"
													class="fa fa-sort"></i></th>

												<th>操作</th>
											</tr>
										</thead>
										<tbody id="tbMain">
										</tbody>
									</table>

									<div class="widget-foot">

										<div class="pagination pull-left" id="paginationLeft">
											<select id="selectPageSize" onchange="changePageSize()">
												<option value="10" selected="selected">10</option>
												<option value="25">25</option>
												<option value="50">50</option>
												<option value="100">100</option>
											</select> <label>条每页</label>
										</div>
										<ul class="pagination pull-right" id="pageUl">
											<li><input type="number" id="pageIndexInput"
												style="width: 60px; margin-left: 10px;">
											<button onclick="toThatPage()">跳转</button></li>
										</ul>
										<div class="clearfix"></div>

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
		
	<%@ include file="../../utils/menu.jsp"%>
		// 清除没有权限使用的按钮
	<%@ include file="../../static/getRoleButtons.js"%>
		// 渲染菜单
	<%@ include file="../../static/setMenu.js"%>
		
	<%@ include file="../../utils/baseUrl.jsp"%>
		
	<%@ include file="../../static/crossBtnControl.js"%>
		var tableName = "examquestion";
		var pageType = "list";
		var searchForm = {
			key : ""
		};
		var pageIndex = 1;
		var pageSize = 10;
		var totalPage = 0;
		var dataList = [];
		var sortColumn = '';
		var sortOrder = '';
		var ids = [];
		var checkAll = false;

		var papernameOptions = [];

		function init() {
			// 满足条件渲染提醒接口
		}
		// 改变每页记录条数
		function changePageSize() {
			var selection = document.getElementById('selectPageSize');
			var index = selection.selectedIndex;
			pageSize = selection.options[index].value;
			getDataList();
		}
		//排序
		function sort(columnName) {
			var iconId = '#' + columnName + 'Icon'
			$('th i').attr('class', 'fa fa-sort');
			if (sortColumn == '' || sortColumn != columnName) {
				sortColumn = columnName;
				sortOrder = 'asc';
				$(iconId).attr('class', 'fa fa-sort-asc');
			}
			if (sortColumn == columnName) {
				if (sortOrder == 'asc') {
					sortOrder = 'desc';
					$(iconId).attr('class', 'fa fa-sort-desc');
				} else {
					sortOrder = 'asc';
					$(iconId).attr('class', 'fa fa-sort-asc');
				}
			}
			pageIndex = 1;
			getDataList();
		}
		// 获取数据列表
		function getDataList() {
			$.ajax({
				type : "GET",
				url : baseUrl + "examquestion/page",
				data : {
					page : pageIndex,
					limit : pageSize,
					sort : sortColumn,
					order : sortOrder,
					papername : searchForm.papername,
					questionname : searchForm.questionname,
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader("token", window.sessionStorage
							.getItem('token'));
				},
				success : function(res) {
					clear();
					if (res.code == 0) {
						dataList = res.data.list;
						totalPage = res.data.totalPage;
						var tbody = document.getElementById('tbMain');
						for (var i = 0; i < dataList.length; i++) { //遍历一下表格数据  
							var trow = setDataRow(dataList[i]); //定义一个方法,返回tr数据 
							tbody.appendChild(trow);
						}
						getRoleButtons();//权限按钮控制
						pagination(); //渲染翻页组件
					} else if (res.code == 401) {
						<%@ include file="../../static/toLogin.jsp"%>
					} else {
						alert(res.msg);
						dataList = [];
						totalPage = 0;
					}
				},
			});
		}
		// 渲染表格数据
		function setDataRow(item) {
			var row = document.createElement('tr'); //创建行 
			row.setAttribute('class', 'useOnce');
			var chkTd = document.createElement('td');
			var checkbox = document.createElement('input'); //创建勾选框
			checkbox.setAttribute('type', 'checkbox');
			checkbox.setAttribute('value', item.id);
			checkbox.setAttribute('name', 'chk');
			chkTd.appendChild(checkbox);
			row.appendChild(chkTd);

			var papernameCell = document.createElement('td');
			papernameCell.innerHTML = item.papername;
			row.appendChild(papernameCell);

			var questionnameCell = document.createElement('td');
			questionnameCell.innerHTML = item.questionname;
			row.appendChild(questionnameCell);

			var typeCell = document.createElement('td');
			if(item.type == 0){
				typeCell.innerHTML = "<span class=\"label label-danger\">" + "单选题" + "</span>"
			}else if(item.type == 1){
				typeCell.innerHTML = "<span class=\"label label-success\">" + "多选题" + "</span>"
			}else if(item.type == 2){
				typeCell.innerHTML = "<span class=\"label label-warning\">" + "判断题" + "</span>"
			}else if(item.type == 3){
				typeCell.innerHTML = "<span class=\"label label-info\">" + "填空题" + "</span>"
			}
			row.appendChild(typeCell);

			var scoreCell = document.createElement('td');
			scoreCell.innerHTML = item.score;
			row.appendChild(scoreCell);

			var answerCell = document.createElement('td');
			answerCell.innerHTML = item.answer;
			row.appendChild(answerCell);

			var btnTd = document.createElement('td');
			var btnGroup = document.createElement('div');
			btnGroup.setAttribute('class', 'btn-group1');
		
			//修改按钮
			var editBtn = document.createElement('button');
			editBtn.innerHTML = "修改";
			var editAttr = 'edit(' + item.id + ')';
			editBtn.setAttribute('class', 'btn btn-xs btn-warning 修改');
			editBtn.setAttribute('onclick', editAttr);
			var editIcon = document.createElement('i');
			editIcon.setAttribute('class', 'icon-pencil');
			editBtn.appendChild(editIcon);
			btnGroup.appendChild(editBtn);
			//删除按钮
			var deleteBtn = document.createElement('button');
			deleteBtn.innerHTML = "删除";
			deleteBtn.setAttribute('class', 'btn btn-xs btn-danger 删除');
			var deleteBtnAttri = 'remove(' + item.id + ')';
			deleteBtn.setAttribute('onclick', deleteBtnAttri);
			var deleteIcon = document.createElement('i');
			deleteIcon.setAttribute('class', 'icon-remove');
			deleteBtn.appendChild(deleteIcon);
			btnGroup.appendChild(deleteBtn);

			btnTd.appendChild(btnGroup)
			row.appendChild(btnTd);
			return row;
		}
		// 翻页
		function pageNumChange(val) {
			if (val == 'pre') {
				pageIndex--;
			} else if (val == 'next') {
				pageIndex++;
			} else {
				pageIndex = val;
			}
			getDataList();
		}
		// 跳转到指定页
		function toThatPage() {
			var index = document.getElementById('pageIndexInput').value;
			if (index<0 || index>totalPage) {
				alert('请输入正确的页码');
			} else {
				pageNumChange(index);
			}
		}

		// 渲染翻页组件
		function pagination() {
			var beginIndex = pageIndex;
			var endIndex = pageIndex;
			var point = 4;
			for (var i = 0; i < 3; i++) {
				if (endIndex == totalPage) {
					break;
				}
				endIndex++;
				point--;
			}
			for (var i = 0; i < 3; i++) {
				if (beginIndex == 1) {
					break;
				}
				beginIndex--;
				point--;
			}
			if (point > 0) {
				while (point > 0) {
					if (endIndex == totalPage) {
						break;
					}
					endIndex++;
					point--;
				}
				while (point > 0) {
					if (beginIndex == 1) {
						break;
					}
					beginIndex--;
					point--
				}
			}
			// 渲染前一页按钮
			if (beginIndex > 1) {
				var prePage = document.createElement('li');
				prePage.setAttribute('class', 'useOnce');
				var preHref = document.createElement('a');
				preHref.setAttribute('href', '#');
				preHref.setAttribute('onclick', "pageNumChange('pre')");
				preHref.innerHTML = '上一页';
				prePage.appendChild(preHref);
				$("#pageUl").append(prePage);
			}
			// 渲染页码按钮
			for (var i = beginIndex; i <= endIndex; i++) {
				var pageNum = document.createElement('li');
				pageNum.setAttribute('class', 'useOnce');
				var pageHref = document.createElement('a');
				pageHref.setAttribute('href', '#');
				if (i == pageIndex) {
					pageHref.setAttribute('style', 'background-color: #eee;');
				}
				pageHref.innerHTML = i;
				pageNum.appendChild(pageHref);
				$("#pageUl").append(pageNum);
			}
			//渲染下一页按钮
			if (endIndex != totalPage) {
				var nextPage = document.createElement('li');
				nextPage.setAttribute('class', 'useOnce');
				var nextHref = document.createElement('a');
				nextHref.setAttribute('href', '#');
				nextHref.innerHTML = '下一页';
				nextPage.appendChild(nextHref);
				$("#pageUl").append(nextPage);
			}
			//渲染当前x页 共y页
			var currentPageLabel = document.createElement('label');
			currentPageLabel.setAttribute('class', 'useOnce');
			var labelMes = '当前第 ' + pageIndex + ' 页,' + '共 ' + totalPage + ' 页';
			currentPageLabel.innerHTML = labelMes;
			$("#paginationLeft").append(currentPageLabel);
		}
		// 全选/全不选
		function chooseAll() {
			checkAll = !checkAll;
			var boxs = document.getElementsByName("chk");
			for (var i = 0; i < boxs.length; i++) {
				boxs[i].checked = checkAll;
			}
		}
		// 批量删除
		function deleteMore() {
			ids = []
			var boxs = document.getElementsByName("chk");
			for (var i = 0; i < boxs.length; i++) {
				if (boxs[i].checked) {
					ids.push(boxs[i].value)
				}
			}
			if (ids.length == 0) {
				alert('请勾选要删除的记录');
			} else {
				remove(ids);
			}
		}
		// 删除
		function remove(id) {
			var mymessage = confirm("真的要删除吗？");
			if (mymessage == true) {
				var paramArray = [];
				if (id == ids) {
					paramArray = id;
				} else {
					paramArray.push(id);
				}
				$.ajax({
					type : "POST",
					url : baseUrl + "examquestion/delete",
					contentType : "application/json",
					data : JSON.stringify(paramArray),
					beforeSend : function(xhr) {
						xhr.setRequestHeader("token", window.sessionStorage
								.getItem('token'));
					},
					success : function(res) {
						if (res.code == 0) {
							alert('删除成功');
							getDataList();
						} else if (res.code == 401) {
							<%@ include file="../../static/toLogin.jsp"%>
						} else {
							alert(res.mes);
						}
					},
				});
			} else {
				alert("已取消操作");
			}
		}
		//渲染查询表单所需属性和组件
		function setSearchForm() {
			//设置查询表单的url
			var url = baseUrl + 'questionnameguanli/page';
			var searchForm = document.getElementById('searchForm');
			searchForm.setAttribute('action', url);
			var fromGroup = document.getElementById('form-item-group');
			// 渲染当前页码
			var pageItem = document.createElement('input');
			pageItem.setAttribute('type', 'hidden');
			pageItem.setAttribute('value', 1);
			pageItem.setAttribute('name', 'page');
			fromGroup.appendChild(pageItem);
			// 渲染每页大小
			var limitItem = document.createElement('input');
			limitItem.setAttribute('type', 'hidden');
			limitItem.setAttribute('value', pageSize);
			limitItem.setAttribute('name', 'limit');
			fromGroup.appendChild(limitItem);
		}
		// 第一次查询后保存查询表单的数据
		function saveSearchForm() {
			searchForm = {
				key : ""
			};
			pageIndex = 1;
			var papername = document.forms["searchForm"]["papername"].value;
			if (papername != null && papername.trim() != "") {
				searchForm.papername = "%" + papername + "%"
			}
			var questionname = document.forms["searchForm"]["questionname"].value;
			if (questionname != null && questionname.trim() != "") {
				searchForm.questionname = "%" + questionname + "%"
			}
			getDataList();
		}
		function ready() {
			$('ul li .dropdown-toggle').html("<i class=\"icon-user\"></i>"+ window.sessionStorage.getItem('username')+ "<b class=\"caret\"></b>")
			setMenu();
			<%@ include file="../../static/menuStyle.js"%>		
			getDataList();
		}
		
		// 用户登出
		<%@ include file="../../static/logout.jsp"%>
		
		//保存id到session中并跳转到修改页
		function edit(id) {
			window.sessionStorage.setItem('id', id)
			window.location.href = "add-or-update.jsp"
		}
		//清除会重复渲染的节点
		function clear() {
			var elements = document.getElementsByClassName('useOnce');
			for (var i = elements.length - 1; i >= 0; i--) {
				elements[i].parentNode.removeChild(elements[i]);
			}
		}

		document.addEventListener("DOMContentLoaded", ready);
	</script>
</body>
</html>
