package com.flowershopping.service;

import java.util.List;

import com.flowershopping.entity.Orders;
import com.flowershopping.tool.Cart;

/**
 * 订单Service实现
 * 
 * @author mrbourne
 *
 */
public interface IOrderService {

	// 添加一个订单
	public Orders addOrder(String userName, Cart cart);

	// 获取所有订单
	@SuppressWarnings("rawtypes")
	public List findAll();
}
