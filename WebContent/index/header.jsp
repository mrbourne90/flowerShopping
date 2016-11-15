<%@page import="com.flowershopping.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<!-- 顶部导航 -->
	<div class="site-nav">
		<div class="container">
			<ul class="site-nav-l">
				<li class="menu"><a href="/FlowerShopping/index/index.jsp">
						<span class="ico ico-star"></span> 首页
				</a></li>
			</ul>
			<ul class="site-nav-r">
				<!-- 登录状态显示 -->
				<li class="menu login" id="LoginInfo">
					<!-- 用户未登录的情况下显示的菜单 --> <s:if test="#session.user==null">
						<a href="/FlowerShopping/login/login.jsp">你好，请登录</a>
						<a href="/FlowerShopping/login/register.jsp">注册</a>
					</s:if> <!-- 用户登录后显示的菜单按钮 --> <s:else>
						<a href="/FlowerShopping/login/userinfocenter.jsp">你好，<s:property
								value="#session.user.userName" /></a>
						<a href="/FlowerShopping/logout">退出</a>
					</s:else>
				</li>
				<li class="site-nav-pipe">|</li>
				<li class="menu"><a
					href="/FlowerShopping/login/admin.jsp" target="_blank">管理员登录 </a></li>
				<li class="site-nav-pipe">|</li>
				<li class="menu"><a
					href="/FlowerShopping/shopping/showCart.jsp"> <span
						class="ico ico-cart"></span>购物车 <span class="text-primary"
						id="gwcCount">(<s:if test="#session.cart == null">0</s:if>
							<s:if test="#session.cart != null">
								<s:property value="#session.cart.getQuantity" />
							</s:if>)
					</span>
				</a></li>
				<li class="site-nav-pipe">|</li>
				<li class="menu">最美丽的花，只开在山野烂漫处...</li>
			</ul>
		</div>
	</div>
	<!-- 顶部导航 End -->
	<!-- 头部 -->
	<header>
	<div class="logo">
		<h1>
			<a href="/FlowerShopping/index/index.jsp" class="logo-bd">山野烂漫鲜花网</a>
		</h1>
		<i></i>
		<h2>山野烂漫鲜花网，始于2016@JKXY</h2>
	</div>
	<div class="search">
		<s:form action="/goods_findGoodsByKey" method="post">
			<div class="input-group">
				<input name="keyword" type="text" class="form-control"
					required="required" placeholder="请输入关键词"> <span
					class="input-group-btn">
					<button class="btn btn-primary" type="submit">搜索</button>
				</span>
			</div>
		</s:form>
	</div>
	</header>
	<!-- 头部 End -->
	<!-- 导航 -->
	<nav class="common">
	<div class="container">
		<div class="categorys dropdown">
			<h3 class="categorys-title">鲜花导购</h3>
		</div>

		<ul class="nav">
			<li><a href="/FlowerShopping/index/index.jsp">首页</a></li>
			<s:iterator value="categories" var="category">
				<li><a
					href="/FlowerShopping/index/flowersByCategory.jsp?categoryId=<s:property value="#category.id"/>"><s:property
							value="#category.categoryName" /></a></li>
			</s:iterator>
		</ul>
	</div>
	</nav>
</body>
</html>