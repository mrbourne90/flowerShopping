package com.flowershopping.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.flowershopping.dao.IAdminDAO;
import com.flowershopping.dao.IUserDAO;
import com.flowershopping.entity.Admin;
import com.flowershopping.entity.PageParaModel;
import com.flowershopping.entity.Users;
import com.flowershopping.service.IUserService;

/**
 * 用户信息Service实现
 * 
 * @author Administrator
 *
 */
@Service
public class UesrService implements IUserService {

	@Resource
	private IUserDAO userDAO;
	@Resource
	private IAdminDAO adminDAO;

	public void setAdminDAO(IAdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	@Override
	public Users checkUser(PageParaModel pageParas) {
		String hql = "select u from Users u where u.userName=:userName and u.password = :password";
		Map<String, Object> params = new HashMap<>();
		params.put("userName", pageParas.getUserName());
		params.put("password", pageParas.getPassword());
		return userDAO.get(hql, params);
	}

	@Override
	public Users addUser(PageParaModel pageParas) {
		Users users = new Users(pageParas.getUserName(), pageParas.getRealName(), pageParas.getPassword(),
				pageParas.getPwdQuestion(), pageParas.getPwdQuestionAnswer(), pageParas.getAddress(),
				pageParas.getPhoneNo(), pageParas.getEmail());
		userDAO.save(users);
		return users;
	}

	@Override
	public Users updateUser(PageParaModel pageParas) {
		Users users = new Users(pageParas.getUserName(), pageParas.getRealName(), pageParas.getPassword(),
				pageParas.getPwdQuestion(), pageParas.getPwdQuestionAnswer(), pageParas.getAddress(),
				pageParas.getPhoneNo(), pageParas.getEmail());
		users.setId(pageParas.getUserId());
		userDAO.update(users);
		return users;
	}

	@Override
	public Admin checkAdmin(PageParaModel pageParas) {
		String hql = "select a from Admin a where a.username=:userName and a.password = :password";
		Map<String, Object> params = new HashMap<>();
		params.put("userName", pageParas.getUserName());
		params.put("password", pageParas.getPassword());
		return adminDAO.get(hql, params);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List findAll() {
		return userDAO.findList("from Users", new HashMap<>());
	}

	public IUserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(IUserDAO userDAO) {
		this.userDAO = userDAO;
	}

}
