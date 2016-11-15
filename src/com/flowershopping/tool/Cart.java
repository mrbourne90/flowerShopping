package com.flowershopping.tool;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import com.flowershopping.entity.Ordersdetails;

/**
 * 购物车类
 * 
 * @author mrbourne
 *
 */
public class Cart {

	// 商品列表
	@SuppressWarnings("rawtypes")
	private Map items;

	public Cart() {
		if (items == null) {
			items = new HashMap<Integer, Ordersdetails>();
		}
	}

	// 添加商品
	@SuppressWarnings("unchecked")
	public void addToCart(int goodsId, Ordersdetails ordersdetails) {
		// 购物车中已有同样商品时更新已有商品数量
		if (items.containsKey(goodsId)) {
			Ordersdetails _ordersdetail = (Ordersdetails) items.get(goodsId);
			_ordersdetail.setNum(_ordersdetail.getNum() + ordersdetails.getNum());
			items.put(goodsId, _ordersdetail);
		} else {
			items.put(goodsId, ordersdetails);
		}
	}

	// 更新购物车
	@SuppressWarnings("unchecked")
	public void updateCart(int goodsId, int quantity) {
		Ordersdetails ordersdetails = (Ordersdetails) items.get(goodsId);
		ordersdetails.setNum(quantity);
		items.put(goodsId, ordersdetails);
	}

	// 获取购物车中商品数量
	public int getQuantity() {

		int total = 0;
		for (Object object : items.values()) {
			Ordersdetails ordersdetails = (Ordersdetails) object;
			total += ordersdetails.getNum();
		}
		return total;
	}

	// 获取购物车总金额
	public BigDecimal getPrice() {
		BigDecimal total = BigDecimal.ZERO;
		for (Object object : items.values()) {
			Ordersdetails ordersdetails = (Ordersdetails) object;
			total = total.add(ordersdetails.getPrice().multiply(new BigDecimal(ordersdetails.getNum())));
		}
		return total;
	}

	@SuppressWarnings("rawtypes")
	public Map getItems() {
		return items;
	}

	@SuppressWarnings("rawtypes")
	public void setItems(Map items) {
		this.items = items;
	}

}
