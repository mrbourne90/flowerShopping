package com.flowershopping.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.flowershopping.dao.ICategoryDAO;
import com.flowershopping.entity.Category;
import com.flowershopping.entity.PageParaModel;
import com.flowershopping.service.ICategoryService;

/**
 * 商品分类信息Service实现
 * 
 * @author mrbourne
 * 
 */
@Service
public class CategoryService implements ICategoryService {

	@Resource
	private ICategoryDAO categoryDAO;

	@SuppressWarnings("rawtypes")
	@Override
	public List findAllCategories() {

		return categoryDAO.findList("from Category", new HashMap<>());
	}

	@Override
	public void deleteById(PageParaModel pageParams) {
		int id = pageParams.getId();
		System.out.println("categoryId:" + id);
		Category category = categoryDAO.get(Category.class, id);
		categoryDAO.delete(category);

	}

	@Override
	public void add(PageParaModel pageParams) {
		Category category = new Category(pageParams.getCategoryName());
		categoryDAO.save(category);
	}

	public void setCategoryDAO(ICategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

}
