<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/public/head.jspf" %>
<title>鲜花网后台</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',title:'山野烂漫后台管理',split:true"
		style="height: 34px;"></div>
	<div data-options="region:'west',title:'菜单',split:true"
		style="width: 200px;">
		<!-- 此处显示的是系统菜单 -->
		<div id="menu" class="easyui-accordion" style="height: 200px;">
			<div title="商品维护" data-options="iconCls:'icon-ok'">
				<ul>
					<li><a href="#" title="${baseUrl }/admin/queryCategories.jsp">类别管理</a>
					<li><a href="#" title="${baseUrl }/admin/queryGoods.jsp">商品管理</a>
					<li><a href="#" title="${baseUrl }/admin/queryOrders.jsp">订单查看</a>
					<li><a href="#" title="${baseUrl }/admin/queryUsers.jsp">用户查看</a>
				</ul>
			</div>
		</div>
	</div>
	<div data-options="region:'center',title:'操作'"
		style="padding: 5px; background: #eee;">
		<div id="tt" class="easyui-tabs" data-options="fit:true">
			<div title="欢迎" style="padding: 10px;"></div>
		</div>
	</div>
	<!-- 弹窗 -->
	<div id="win" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div> 
</body>
</html>