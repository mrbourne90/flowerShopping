package com.flowershopping.action;

import java.io.ByteArrayInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.json.annotations.JSON;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.flowershopping.entity.Category;
import com.opensymphony.xwork2.ActionContext;

@Controller("categoryAction")
@Scope("prototype")
public class CategoryAction extends BaseAction {

	private static final long serialVersionUID = 1711160750025559956L;

	// 商品分类信息
	private List<Category> categories;

	// 获取商品分类 信息
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String findCategories() {

		categories = categoryService.findAllCategories();
		// 将分类信息放入request中
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("categories", categories);
		return "findCategories_success";
	}
	//获取商品分类json数据
	@SuppressWarnings("rawtypes")
	public String getJsonCategories(){
		pageMap = new HashMap<String, Object>();
		List result = categoryService.findAllCategories();
		pageMap.put("total", result.size());
		pageMap.put("rows", result);
		return "jsonMap";
	}
	//根据id删除分类
	public String deleteById(){
		categoryService.deleteById(pageParas);
		inputStream = new ByteArrayInputStream("true".getBytes());
		return "stream";
	}
	
	//增加分类
	public void add(){
		
		System.out.println(pageParas.getCategoryName());
		categoryService.add(pageParas);
		
	}
	
	@JSON(serialize=false)
	public List<Category> getCategories() {
		return categories;
	}
	
	
	

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

}
