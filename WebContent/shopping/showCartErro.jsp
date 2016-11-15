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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>错误</title>
</head>
<body class="cart-flow">
	<s:action name="category_findCategories" namespace="/" executeResult="true"></s:action>
	<div class="container" style="height: 350px;">
		<h3 style="margin: 150px 0 0 150px;">
			商品数量不能小于0.
		</h3>
	</div>
	<jsp:include page="/index/footer.jsp"></jsp:include>
</body>
</html>