<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" href="/FlowerShopping/img/favicon.ico"
	mce_href="/FlowerShopping/img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="/FlowerShopping/css/flower.css">
<script type="text/javascript" src="/FlowerShopping/js/jquery.js"></script>
<script type="text/javascript" src="/FlowerShopping/js/ajax.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>山野烂漫</title>
</head>
<body>
	<!-- 首页头部 -->
	<s:action name="category_findCategories" namespace="/" executeResult="true"></s:action>
	<!-- 首页内容 -->
	<s:action name="goods_findAllGoods" namespace="/" executeResult="true"></s:action>
	<!-- 首页尾部 -->
	<jsp:include page="/index/footer.jsp"></jsp:include>
</body>
</html>