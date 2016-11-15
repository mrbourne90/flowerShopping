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
<script type="text/javascript" src="/FlowerShopping/js/cart.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
</head>
<body class="cart-flow">
	<s:action name="category_findCategories" namespace="/"
		executeResult="true"></s:action>
	<div class="container">
		<s:if test="#session.cart != null">
			<!-- 订单列表 -->
			<s:form action="/addOrder" method="post">
				<div class="cart-panel">
					<div class="hd">
						<ul class="order-title">
							<li class="product">商品名称</li>
							<li class="total-price">总价</li>
							<li class="order-price">单价</li>
							<li class="num">数量</li>
							<li class="operate">操作</li>
						</ul>
					</div>
					<div class="bd">
						<s:iterator value="#session.cart.items" var="item">
							<ul class="order-list">
								<li class="product"><a
									href="/FlowerShopping/goods_findOne?goodsId=<s:property value="key"/>"
									target="_blank"><span class="product-title"><s:property
												value="value.goodsName" /></span> </a></li>
								<li class="order-price"><span class="price-sign">¥</span> <span
									class="price-num"><s:property
											value="%{value.price*value.num}" /></span></li>
								<li class="order-price"><span class="price-sign">¥</span> <span
									class="price-num"><s:property value="%{value.price}" /></span></li>
								<li class="num">
									<div class="input-num">
										<a
											href="javascript:modifyNum(<s:property value="key"/>,<s:property value="%{value.num-1}"/>);"
											class="btn btn-default"><i class="ico ico-minus"></i></a> <input
											type="text" class="form-control input-sm"
											value="<s:property value='value.num'/>"
											onchange="$('#form1').submit();"> <a
											href="javascript:modifyNum(<s:property value="key"/>,<s:property value="%{value.num+1}"/>);"
											class="btn btn-default"><i class="ico ico-add"></i></a>
									</div>
								</li>
								<li class="operate"><a
									href="javascript:modifyNum(<s:property value="key"/>,0);">删除</a><br></li>
							</ul>
						</s:iterator>
					</div>
				</div>
				<div class="set-bar">
					<div class="set-info">
						<a class="back" href="/FlowerShopping" style="width: 90px;"><span
							class="ico ico-back"></span>继续挑选</a>
						<div class="set-stat">
							应付金额:
							<div class="price">
								<span class="price-sign">¥</span> <span class="price-num"><s:property
										value="#session.cart.getPrice" /></span>
							</div>
						</div>
					</div>
					<button class="btn btn-primary btn-lg" type="submit">提交订单</button>
				</div>
			</s:form>
		</s:if>
	</div>
	<jsp:include page="/index/footer.jsp"></jsp:include>
</body>
</html>