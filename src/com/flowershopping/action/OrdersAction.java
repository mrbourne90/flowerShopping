package com.flowershopping.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.flowershopping.entity.Goods;
import com.flowershopping.entity.Orders;
import com.flowershopping.entity.Ordersdetails;
import com.flowershopping.entity.Users;
import com.flowershopping.tool.Cart;
import com.opensymphony.xwork2.ActionContext;

@Controller("ordersAction")
@Scope("prototype")
public class OrdersAction extends BaseAction {

	private static final long serialVersionUID = -2386328861506764485L;

	// 将商品添加到购物车
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String addToCart() {

		// 购物项
		int myGoodId = pageParas.getGoodsId();
		System.out.println("购物Id:" + myGoodId);
		Goods myGood = flowerService.findOne(pageParas);
		Ordersdetails ordersdetails = new Ordersdetails();
		ordersdetails.setGoodsName(myGood.getGoodsName());
		ordersdetails.setNum(1);
		ordersdetails.setPrice(myGood.getPrice());
		// 购物车为空则新建购物车
		Map session = ActionContext.getContext().getSession();
		Cart cart = (Cart) session.get("cart");
		if (cart == null) {
			cart = new Cart();
		}
		cart.addToCart(myGoodId, ordersdetails);
		session.put("cart", cart);
		return "addToCart_success";
	}

	// 更新购物车
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String updateCart() {

		Map session = ActionContext.getContext().getSession();
		Cart myCart = (Cart) session.get("cart");
		pageMap = new HashMap<String, Object>();
		// 数量大于零直接更新数量
		if (pageParas.getQuantity() > 0) {
			Ordersdetails ordersdetails = (Ordersdetails) myCart.getItems().get(pageParas.getGoodsId());
			ordersdetails.setNum(pageParas.getQuantity());
			session.put("cart", myCart);
			pageMap.put("cart", myCart);
			return "jsonMap";
		}
		
		// 等于0则删除订单项
		else if (pageParas.getQuantity() == 0) {
			myCart.getItems().remove(pageParas.getGoodsId());
			session.put("cart", myCart);
			pageMap.put("cart", myCart);
			return "jsonMap";
		}
		// 小于0错误
		else {
			return "updateCart_error";
		}

	}

	// 添加订单
	@SuppressWarnings("rawtypes")
	public String addOrder() {

		Map session = ActionContext.getContext().getSession();
		Users myUser = (Users) session.get("user");
		Cart myCart = (Cart) session.get("cart");
		orderService.addOrder(myUser.getUserName(), myCart);
		// 成功添加后清空购物车
		session.remove("cart");
		return SUCCESS;
	}

	// 获取所有订单信息
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String findAllOrders() {

		List<Orders> orders = orderService.findAll();
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("orders", orders);
		return SUCCESS;
	}
	
	//获取订单Json数据
	@SuppressWarnings("unchecked")
	public String getJsonOrders(){
		List<Orders> orders = orderService.findAll();
		pageMap = new HashMap<>();
		pageMap.put("total", orders.size());
		pageMap.put("rows", orders);
		return "jsonMap";
	}
}
