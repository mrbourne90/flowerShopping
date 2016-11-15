package com.flowershopping.service;

import com.flowershopping.entity.Goods;
import com.flowershopping.entity.PageParaModel;
import com.flowershopping.util.PageModel;

/**
 * 商品信息Service接口
 * 
 * @author mrbourne
 *
 */
public interface IFlowerService {

	// 获取商品信息
	public PageModel<Goods> findGoods(PageParaModel pageParas);

	// 获取分类中的商品信息
	public PageModel<Goods> findGoodsByCategory(PageParaModel pageParas);

	// 获取单个商品
	public Goods findOne(PageParaModel pageParas);

	// 获取根据关键字检索的商品信息
	public PageModel<Goods> findGoodsByKey(PageParaModel pageParas);

	// 根据关键字 分类 价格范围进行商品信息高级查询
	public PageModel<Goods> findGoodsByKeys(PageParaModel pageParas);

	// 添加商品
	public Goods addGoods(Goods goods);
	
	//删除商品
	
	public void deleteById(PageParaModel pageParas);
}
