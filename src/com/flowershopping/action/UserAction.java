package com.flowershopping.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.flowershopping.entity.Admin;
import com.flowershopping.entity.Users;
import com.opensymphony.xwork2.ActionContext;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends BaseAction {

	private static final long serialVersionUID = 1570349876684326958L;

	// 获取所有用户信息
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String findAllUsers() {

		List<Users> users = userService.findAll();
		// 将用户列表信息放入request中传递过去
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("users", users);
		return SUCCESS;
	}
	//获取json用户信息
	@SuppressWarnings("unchecked")
	public String getJsonUsers(){
		List<Users> users = userService.findAll();
		pageMap = new HashMap<>();
		pageMap.put("total", users.size());
		pageMap.put("rows", users);
		return "jsonMap";
	}

	// 检测用户是否存在
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String checkUser() {

		Users user = userService.checkUser(pageParas);
		if (null != user) {
			// 用户存在则将用户信息放入session中
			Map session = ActionContext.getContext().getSession();
			session.put("user", user);
			return "checkUser_success";
		} else {
			// 用户不存在则将提示放入request中
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("userNotExisted", true);
			return "checkUser_error";
		}
	}

	// 用户注销
	@SuppressWarnings("rawtypes")
	public String logout() {
		// 清空session中的user
		Map session = ActionContext.getContext().getSession();
		session.remove("user");
		return SUCCESS;
	}

	// 添加用户
	public String addUser() {
		userService.addUser(pageParas);
		// 注册后检查是否注册成功
		checkUser();
		return "addUser_success";
	}

	// 更新用户
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String updateUser() {
		userService.updateUser(pageParas);
		checkUser();
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("userUpdated", true);
		return "updateUser_success";
	}

	// 管理员用户验证
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String checkAdmin() {
		Admin admin = userService.checkAdmin(pageParas);
		// 管理员验证成功则进入页面 否则提示错误
		if (admin == null) {
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("adminNotExisted", true);
			return "checkAdmin_error";
		} else {
			Map session = ActionContext.getContext().getSession();
			session.put("admin", admin);
			return "checkAdmin_success";
		}
	}

}
