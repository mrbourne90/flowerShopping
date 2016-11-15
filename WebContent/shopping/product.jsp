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
<title>商品详情</title>
</head>
<body>
	<s:action name="category_findCategories" namespace="/" executeResult="true"></s:action>
	<div class="container">
		<!-- 商品信息 -->
		<div class="product-wrapper">
			<div class="product-l">
				<!-- 商品图片 -->
				<div class="pro-preview">
					<div class="pro-bigimage">
						<img src="/FlowerShopping/img/<s:property value="good.imgUrl"/>"
							style="display: inline;">
					</div>
				</div>
				<!-- 商品图片 End-->
			</div>
			<div class="product-r">
				<div class="title">
					<h3 class="product-title">
						<s:property value="good.goodsName" />
					</h3>
				</div>
				<div class="attribute">
					<dl>
						<dt>类别：</dt>
						<dd>
							<s:property value="good.category.categoryName" />
						</dd>
					</dl>
					<dl>
						<dt>编号：</dt>
						<dd>
							<s:property value="good.id" />
						</dd>
					</dl>
					<dl>
						<dt>描述：</dt>
						<dd>
							<s:property value="good.description" />
						</dd>
					</dl>
					<dl>
						<dt>配 送：</dt>
						<dd>
							全国 （可配送至全国1000多城市，<span class="color_hong">市区免配送费</span>）
						</dd>
					</dl>
				</div>
				<div class="price" style="border: none;">
					<div class="price-sell">
						特惠价： <strong> <em class="price-sign">¥</em><em
							class="price-num"><s:property value="good.price" /></em>
						</strong>
					</div>
				</div>
				<div class="btn-buy">
					<a href="/FlowerShopping/orders_addToCart?goodsId=<s:property value="good.id"/>"
						class="btn btn-primary btn-lg"><span
						class="ico ico-cart-white"></span>加入购物车</a>
				</div>
			</div>
		</div>
		<!-- 商品信息 End -->
	</div>
	<jsp:include page="/index/footer.jsp"></jsp:include>
</body>
</html>