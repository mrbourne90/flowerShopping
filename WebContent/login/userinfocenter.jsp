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
<title>用户信息中心</title>
</head>
<body>
	<s:action name="category_findCategories" namespace="/" executeResult="true"></s:action>
	<div class="container">
		<div class="wrapper">
			<div class="content">
				<div class="login-box">
					<ul class="login-tabs">
						<li class="active"><a href="javascript:void(0)">用户信息中心</a></li>
					</ul>
					<form id="registerForm" action="/FlowerShopping/user_updateUser"
						method="post">
						<div class="tab-content">
							<div id="registerPane"
								class="tab-pane login-panel fade in active">
								<div class="login-notice">
									<!-- 更新成功显示 -->
									<s:if test="#request.userUpdated">
										<div class="notice-cont">
											<span class="ico ico-notice"></span> 用户信息更新成功！
										</div>
									</s:if>
								</div>
								<div class="form-group">
									<input id="userId" name="userId"
										value="<s:property value="#session.user.id"/>"
										placeholder="用户Id" type="hidden" class="form-control">
									<input id="userName" name="userName"
										value="<s:property value="#session.user.userName"/>"
										placeholder="用户名" type="text" class="form-control">
								</div>
								<div class="form-group">
									<input id="password" name="password" placeholder="密码"
										value="<s:property value="#session.user.password"/>"
										type="password" class="form-control">
								</div>
								<div class="form-group">
									<input id="validate" name="validatePassword"
										placeholder="再次输入密码"
										value="<s:property value="#session.user.password"/>"
										type="password" class="form-control">
								</div>
								<div class="form-group">
									<div class="email_autocomplete1">
										<input id="email" name="email" autocomplete="off"
											value="<s:property value="#session.user.email"/>"
											placeholder="请填写您的Email地址" type="text">
									</div>
								</div>
								<div class="form-group">
									<input id="phoneNo" name="phoneNo" placeholder="手机号码"
										value="<s:property value="#session.user.phoneNo"/>"
										type="text" class="form-control">
								</div>
								<div class="form-group">
									<input id="realName" name="realName" placeholder="真实姓名"
										value="<s:property value="#session.user.realName"/>"
										type="text" class="form-control">
								</div>
								<div class="form-group">
									<input id="address" name="address" placeholder="收货地址"
										value="<s:property value="#session.user.address"/>"
										type="text" class="form-control">
								</div>
								<div class="form-group">
									<input id="pwdQuestion" name="pwdQuestion" placeholder="密保问题"
										value="<s:property value="#session.user.pwdQuestion"/>"
										type="text" class="form-control">
								</div>
								<div class="form-group">
									<input id="pwdQuestionAnswer" name="pwdQuestionAnswer"
										value="<s:property value="#session.user.pwdQuestionAnswer"/>"
										placeholder="密保答案" type="text" class="form-control">
								</div>
								<div class="form-group">
									<button class="btn btn-primary btn-lg btn-block" type="button"
										onclick="return checkRegister();">修改</button>
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