package com.flowershopping.service;

import java.util.List;

import com.flowershopping.entity.PageParaModel;

/**
 * 商品分类信息Service接口
 * 
 * @author mrbourne
 *
 */
public interface ICategoryService {

	// 获取所有商品分类信息
	@SuppressWarnings("rawtypes")
	public List findAllCategories();
	
	//删除某个商品分类
	public void deleteById(PageParaModel pageParams);
	
	//新增分类
	public void add(PageParaModel pageParams);
}
