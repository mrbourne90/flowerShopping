package com.flowershopping.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.flowershopping.dao.IOrderDAO;
import com.flowershopping.entity.Orders;

/**
 * 订单DAO实现
 * 
 * @author mrbourne
 *
 */
@Repository
@Transactional
public class OrderDAO extends BaseDAO<Orders> implements IOrderDAO {

}
