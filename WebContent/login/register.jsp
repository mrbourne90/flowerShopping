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
<title>用户注册</title>
</head>
<body>
	<s:action name="category_findCategories" namespace="/" executeResult="true"></s:action>
	<div class="container">
		<div class="wrapper">
			<div class="content">
				<div class="login-box">
					<ul class="login-tabs">
						<li><a href="/FlowerShopping/login/login.jsp">登录</a></li>
						<li class="active"><a href="javascript:void(0)">注册</a></li>
					</ul>
					<form id="registerForm" action="/FlowerShopping/user_addUser" method="post">
						<div class="tab-content">
							<div id="registerPane"
								class="tab-pane login-panel fade in active">
								<div class="login-notice"></div>
								<div class="form-group">
									<input id="userName" name="userName" placeholder="用户名"
										type="text" class="form-control">
								</div>
								<div class="form-group">
									<input id="password" name="password" placeholder="密码"
										type="password" class="form-control">
								</div>
								<div class="form-group">
									<input id="validate" name="validatePassword"
										placeholder="再次输入密码" type="password" class="form-control">
								</div>
								<div class="form-group">
									<div class="email_autocomplete1">
										<input id="email" name="email" autocomplete="off"
											placeholder="请填写您的Email地址" type="text">
									</div>
								</div>
								<div class="form-group">
									<input id="phoneNo" name="phoneNo" placeholder="手机号码"
										type="text" class="form-control">
								</div>
								<div class="form-group">
									<input id="realName" name="realName" placeholder="真实姓名"
										type="text" class="form-control">
								</div>
								<div class="form-group">
									<input id="address" name="address" placeholder="收货地址"
										type="text" class="form-control">
								</div>
								<div class="form-group">
									<input id="pwdQuestion" name="pwdQuestion" placeholder="密保问题"
										type="text" class="form-control">
								</div>
								<div class="form-group">
									<input id="pwdQuestionAnswer" name="pwdQuestionAnswer"
										placeholder="密保答案" type="text" class="form-control">
								</div>
								<div class="form-group">
									<button class="btn btn-primary btn-lg btn-block" type="button"
										onclick="return checkRegister();">立即注册</button>
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