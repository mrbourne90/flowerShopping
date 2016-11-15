//生成通知元素
function makeNotice(msg) {
	var notice = "<div class='notice-cont'><span class='ico ico-notice'></span>"
			+ msg + "</div>";
	return notice;
}
// 登录表单验证
function checkLogin() {
	// 用户名为空则提示
	if ($('#userName').val() == '') {
		msg = "请输入用户名";
		$('.login-notice').empty();
		$('.login-notice').append(makeNotice(msg));
		return false;
	}
	// 密码为空则提示
	if ($('#password').val() == '') {
		msg = "请输入密码";
		$('.login-notice').empty();
		$('.login-notice').append(makeNotice(msg));
		return false;
	}
	// 用户名密码都不为空则提交表单
	$('#loginForm').submit();
}
// 注册表单验证
function checkRegister() {
	// 用户名为空则提示
	if ($('#userName').val() == '') {
		msg = "请输入用户名";
		$('.login-notice').empty();
		$('.login-notice').append(makeNotice(msg));
		return false;
	}
	// 密码为空则提示
	if ($('#password').val() == '') {
		msg = "请输入密码";
		$('.login-notice').empty();
		$('.login-notice').append(makeNotice(msg));
		return false;
	}
	// 检查两次密码是否一致
	if ($('#validate').val() != $('#password').val()) {
		msg = "两次密码不一致，请重新输入";
		$('.login-notice').empty();
		$('.login-notice').append(makeNotice(msg));
		return false;
	}
	// email为空则提示
	if ($('#email').val() == '') {
		msg = "请输入email";
		$('.login-notice').empty();
		$('.login-notice').append(makeNotice(msg));
		return false;
	}
	// 电话号码为空则提示
	if ($('#phoneNo').val() == '') {
		msg = "请输入电话号码";
		$('.login-notice').empty();
		$('.login-notice').append(makeNotice(msg));
		return false;
	}
	// 真实姓名为空则提示
	if ($('#realName').val() == '') {
		msg = "请输入真实姓名";
		$('.login-notice').empty();
		$('.login-notice').append(makeNotice(msg));
		return false;
	}
	// 送货地址为空则提示
	if ($('#address').val() == '') {
		msg = "请输入收货地址";
		$('.login-notice').empty();
		$('.login-notice').append(makeNotice(msg));
		return false;
	}
	// 密保问题为空则提示
	if ($('#pwdQuestion').val() == '') {
		msg = "请输入密保问题";
		$('.login-notice').empty();
		$('.login-notice').append(makeNotice(msg));
		return false;
	}
	// 密保问题答案为空则提示
	if ($('#pwdQuestionAnswer').val() == '') {
		msg = "请输入密保问题答案";
		$('.login-notice').empty();
		$('.login-notice').append(makeNotice(msg));
		return false;
	}
	//满足条件提交表单
	$('#registerForm').submit();
}