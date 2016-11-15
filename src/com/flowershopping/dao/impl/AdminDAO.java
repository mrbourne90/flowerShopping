package com.flowershopping.dao.impl;


import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.flowershopping.dao.IAdminDAO;
import com.flowershopping.entity.Admin;

/**
 * 管理员DAO实现
 * 
 * @author mrbourne
 *
 */
@Repository
@Transactional
public class AdminDAO extends BaseDAO<Admin> implements IAdminDAO {

}
