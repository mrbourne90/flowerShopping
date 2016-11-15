package com.flowershopping.service;

import java.util.List;

import com.flowershopping.entity.Admin;
import com.flowershopping.entity.PageParaModel;
import com.flowershopping.entity.Users;

/**
 * 用户信息Service接口
 * 
 * @author mrbourne
 *
 */
public interface IUserService {

	// 检测用户是否存在
	public Users checkUser(PageParaModel pageParas);

	// 添加新用户
	public Users addUser(PageParaModel pageParas);

	// 更新用户信息
	public Users updateUser(PageParaModel pageParas);

	// 检测管理员是否存在
	public Admin checkAdmin(PageParaModel pageParas);

	// 获取所有用户
	@SuppressWarnings("rawtypes")
	public List findAll();
}
