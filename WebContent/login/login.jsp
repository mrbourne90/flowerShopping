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
<script type="text/javascript" src="/FlowerShopping/js/flower.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
</head>
<body>
	<s:action name="category_findCategories" namespace="/" executeResult="true"></s:action>
	<div class="container">
		<div class="wrapper">
			<div class="content">
				<div class="login-box">
					<ul class="login-tabs">
						<li class="active"><a href="javascript:void(0)">登录</a></li>
						<li><a href="/FlowerShopping/login/register.jsp">注册</a></li>
					</ul>
					<form id="loginForm" action="/FlowerShopping/user_checkUser"
						method="post">
						<div class="tab-content">
							<div id="loginPane" class="tab-pane login-panel fade in active">
								<div class="login-notice">
									<!-- 登录失败 -->
									<s:if test="#request.userNotExisted">
										<div class="notice-cont">
											<span class="ico ico-notice"></span> 用户名或密码错误，请重新输入
										</div>
									</s:if>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<span class="ico ico-user"></span>
										</div>
										<div class="email_autocomplete1">
											<input id="userName" name="userName" placeholder="用户名"
												type="text" class="form-control" style="width: 267px;">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<span class="ico ico-lock"></span>
										</div>
										<div class="email_autocomplete1">
											<input id="password" name="password" placeholder="密码"
												type="password" class="form-control" style="width: 267px;">
										</div>
									</div>
								</div>
								<div class="form-group">
									<button class="btn btn-primary btn-lg btn-block" type="button"
										onclick="return checkLogin();">登录</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
	<jsp:include page="/index/footer.jsp"></jsp:include>
</body>
</html>