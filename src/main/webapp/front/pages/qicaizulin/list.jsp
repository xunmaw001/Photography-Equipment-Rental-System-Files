<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!-- 器材租赁 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>器材租赁</title>
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
	</head>
	<body>

		<div id="app">
			<!-- 轮播图 -->
			<div class="layui-carousel" id="swiper">
				<div carousel-item id="swiper-item">
					<div v-for="(item,index) in swiperList" v-bind:key="index">
						<img class="swiper-item" :src="item.img">
					</div>
				</div>
			</div>
			<!-- 轮播图 -->

			<!-- 图文列表 -->
			<div class="data-container layui-row">
				<h2 class="index-title"> DATA SHOW </h2>
				<div class="line-container">
					<p class="line"> 器材租赁展示 </p>
				</div>
				<fieldset class="search-container">
					<form class="layui-form">
						
                        
                                                                        <div class="layui-inline" style="margin-bottom: 10px;">
							<label class="layui-form-label">订单编号</label>
							<div class="layui-input-inline">
								<input type="text" name="dingdanbianhao" id="dingdanbianhao" placeholder="订单编号" autocomplete="off" class="layui-input">
							</div>
						</div>   
                                                                                                <div class="layui-inline" style="margin-bottom: 10px;">
							<label class="layui-form-label">器材编号</label>
							<div class="layui-input-inline">
								<input type="text" name="qicaibianhao" id="qicaibianhao" placeholder="器材编号" autocomplete="off" class="layui-input">
							</div>
						</div>   
                                                                                                <div class="layui-inline" style="margin-bottom: 10px;">
							<label class="layui-form-label">器材名称</label>
							<div class="layui-input-inline">
								<input type="text" name="qicaimingcheng" id="qicaimingcheng" placeholder="器材名称" autocomplete="off" class="layui-input">
							</div>
						</div>   
                                                                                                <div class="layui-inline" style="margin-bottom: 10px;">
							<label class="layui-form-label">器材类型</label>
							<div class="layui-input-inline">
								<input type="text" name="qicaileixing" id="qicaileixing" placeholder="器材类型" autocomplete="off" class="layui-input">
							</div>
						</div>   
                                                                                                <div class="layui-inline" style="margin-bottom: 10px;">
							<label class="layui-form-label">每天价格</label>
							<div class="layui-input-inline">
								<input type="text" name="meitianjiage" id="meitianjiage" placeholder="每天价格" autocomplete="off" class="layui-input">
							</div>
						</div>   
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
						<div class="layui-inline" style="margin-left: 30px;margin-bottom: 10px;">
							<button id="btn-search" type="button" class="layui-btn">
								<i class="layui-icon layui-icon-search"></i> 搜索
							</button>
							<button v-if="isAuth('qicaizulin','新增')" @click="jump('../qicaizulin/add.jsp')" type="button" class="layui-btn btn-theme">
								<i class="layui-icon">&#xe654;</i> 添加
							</button>
						</div>
					</form>
				</fieldset>
				<div class="data-list layui-col-md8 layui-col-md-offset2">
					<div @click="jump('../qicaizulin/detail.jsp?id='+item.id)" v-for="(item,index) in dataList" v-bind:key="index"
					 class="data-item layui-col-md3">
						
						                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                						
																																																																																																																																																																																				
						<div v-if="item.price" class="data">
							<span class="item price">{{item.price}} RMB</span>
						</div>
					</div>
				</div>
				<div class="pager" id="pager"></div>
			</div>
			<!-- 图文列表 -->
		</div>


		<!-- layui -->
		<script src="../../layui/layui.js"></script>
		<!-- vue -->
		<script src="../../js/vue.js"></script>
		<!-- 组件配置信息 -->
		<script src="../../js/config.js"></script>
		<!-- 扩展插件配置信息 -->
		<script src="../../modules/config.js"></script>
		<!-- 工具方法 -->
		<script src="../../js/utils.js"></script>
		<script>
			var vue = new Vue({
				el: '#app',
				data: {
					// 轮播图
					swiperList: [{
						img: '../../img/banner.jpg'
					}],
					dataList: []
				},
				methods: {
					isAuth(tablename, button) {
						return isFrontAuth(tablename, button)
					},
					jump(url) {
						jump(url)
					}
				}
			})

			layui.use(['layer', 'element', 'carousel', 'laypage', 'http', 'jquery'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var carousel = layui.carousel;
				var laypage = layui.laypage;
				var http = layui.http;
				var jquery = layui.jquery;

				var limit = 8;

				// 获取轮播图 数据
				http.request('config/list', 'get', {
					page: 1,
					limit: 5
				}, function(res) {
					if (res.data.list.length > 0) {
						var swiperItemHtml = '';
						for (let item of res.data.list) {
							if (item.name.indexOf('picture') >= 0 && item.value && item.value != "" && item.value != null) {
								swiperItemHtml +=
									'<div>' +
									'<img class="swiper-item" src="' + item.value + '">' +
									'</div>';
							}
						}
						jquery('#swiper-item').html(swiperItemHtml);
						// 轮播图
						carousel.render({
							elem: '#swiper',
							width: swiper.width,height:swiper.height,
							arrow: swiper.arrow,
							anim: swiper.anim,
							interval: swiper.interval,
							indicator: swiper.indicator
						});
					}
				});
				// 分页列表
				pageList();

				// 搜索按钮
				jquery('#btn-search').click(function(e) {
					pageList();
				});

				function pageList() {
					var param = {
						page: 1,
						limit: limit
					}
					
					                                        if (jquery('#dingdanbianhao').val()) {
						param['dingdanbianhao'] = jquery('#dingdanbianhao').val() ? '%' + jquery('#dingdanbianhao').val() + '%' : '';
					}  
                                                                                if (jquery('#qicaibianhao').val()) {
						param['qicaibianhao'] = jquery('#qicaibianhao').val() ? '%' + jquery('#qicaibianhao').val() + '%' : '';
					}  
                                                                                if (jquery('#qicaimingcheng').val()) {
						param['qicaimingcheng'] = jquery('#qicaimingcheng').val() ? '%' + jquery('#qicaimingcheng').val() + '%' : '';
					}  
                                                                                if (jquery('#qicaileixing').val()) {
						param['qicaileixing'] = jquery('#qicaileixing').val() ? '%' + jquery('#qicaileixing').val() + '%' : '';
					}  
                                                                                if (jquery('#meitianjiage').val()) {
						param['meitianjiage'] = jquery('#meitianjiage').val() ? '%' + jquery('#meitianjiage').val() + '%' : '';
					}  
                                                                                                                                                                                                                                                                                                                                                                                                                                    
					// 获取列表数据
					http.request('qicaizulin/list', 'get', param, function(res) {
						vue.dataList = res.data.list
						// 分页
						laypage.render({
							elem: 'pager',
							count: res.data.total,
							limit: limit,
							jump: function(obj, first) {
								//首次不执行
								if (!first) {
									http.request('qicaizulin/list', 'get', param, function(res) {
										vue.dataList = res.data.list
									})
								}
							}
						});
					})
				}
			});
		</script>
	</body>
</html>
