package com.flowershopping.dao.impl;


import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.flowershopping.dao.IFlowerDAO;
import com.flowershopping.entity.Goods;

/**
 * 商品信息DAO实现
 * 
 * @author mrbourne
 *
 */
@Repository
@Transactional
public class FlowerDAO extends BaseDAO<Goods> implements IFlowerDAO {

}
