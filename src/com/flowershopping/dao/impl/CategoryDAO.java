package com.flowershopping.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.flowershopping.dao.ICategoryDAO;
import com.flowershopping.entity.Category;

/**
 * 商品分类信息DAO实现
 * 
 * @author mrbourne
 *
 */
@Repository
@Transactional
public class CategoryDAO extends BaseDAO<Category> implements ICategoryDAO {

}
