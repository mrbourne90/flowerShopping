package com.flowershopping.service.impl;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.flowershopping.dao.IOrderDAO;
import com.flowershopping.entity.Orders;
import com.flowershopping.entity.Ordersdetails;
import com.flowershopping.service.IOrderService;
import com.flowershopping.tool.Cart;

/**
 * 订单Service实现
 * 
 * @author mrbourne
 *
 */
@Service
public class OrderService implements IOrderService {

	@Resource
	private IOrderDAO orderDAO;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Orders addOrder(String userName, Cart cart) {
		Orders orders = new Orders();
		orders.setUsername(userName);
		orders.setNum(cart.getQuantity());
		orders.setSum(cart.getPrice());
		orders.setCreateTime(new Timestamp(System.currentTimeMillis()));

		Collection orderdetails = cart.getItems().values();
		for (Object object : orderdetails) {
			Ordersdetails ordersdetail = (Ordersdetails) object;
			ordersdetail.setOrders(orders);
		}
		orders.setOrdersdetailses(new HashSet<>(orderdetails));
		orderDAO.save(orders);
		return orders;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List findAll() {
		return orderDAO.findList("from Orders", new HashMap<>());
	}

	public IOrderDAO getOrderDAO() {
		return orderDAO;
	}

	public void setOrderDAO(IOrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

}
