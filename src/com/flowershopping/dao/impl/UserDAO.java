package com.flowershopping.dao.impl;


import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.flowershopping.dao.IUserDAO;
import com.flowershopping.entity.Users;

/**
 * 用户信息DAO实现
 * 
 * @author mrbourne
 *
 */
@Repository
@Transactional
public class UserDAO extends BaseDAO<Users> implements IUserDAO {

}
