package com.flowershopping.action;

import java.io.ByteArrayInputStream;
import java.math.BigDecimal;
import java.util.HashMap;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.flowershopping.entity.Category;
import com.flowershopping.entity.Goods;
import com.flowershopping.util.PageModel;
import com.flowershopping.util.Uploading;

@Controller("goodsAction")
@Scope("prototype")
public class GoodsAction extends BaseAction {

	private static final long serialVersionUID = -912174068460711788L;

	// 商品信息分页
	private PageModel<Goods> goods;

	// 单个商品信息
	private Goods good;

	// 获取全部商品信息
	public String findAllGoods() {

		setGoods(flowerService.findGoods(pageParas));
		return "findAllGoods_success";
	}

	// 获取json格式商品信息
	public String getJsonGoods() {
		setGoods(flowerService.findGoods(pageParas));
		pageMap = new HashMap<String, Object>();
		pageMap.put("page", goods);
		pageMap.put("total", goods.getRecordCount());
		pageMap.put("rows", goods.getDatas());
		return "jsonMap";
	}

	// 获取大类下的的商品信息
	public String findGoodsByCategory() {
		setGoods(flowerService.findGoodsByCategory(pageParas));
		return "findGoodsByCategory_success";
	}

	// 获取单个商品
	public String findOne() {
		setGood(flowerService.findOne(pageParas));
		return "findOne_success";
	}

	// 根据关键字检索商品
	public String findGoodsByKey() {
		setGoods(flowerService.findGoodsByKey(pageParas));
		return "findGoodsByKey_success";
	}

	// 高级检索
	public String findGoodsByKeys() {
		System.out.println(pageParas.getCategoryId());
		System.out.println(pageParas.getKeyword());
		System.out.println(pageParas.getPriceRange());
		setGoods(flowerService.findGoodsByKeys(pageParas));
		return "findGoodsByKeys_success";
	}

	// 添加商品
	public void addGoods() {

		// 上传图片
		// 获取pic目录在服务器上的的实际路径
		String path = ServletActionContext.getServletContext().getRealPath("/img");
		System.out.println(path);
		// 修改path得到完整存放路径
		path += "\\" + getUploadFileName();
		System.out.println(path);
		// 上传
		Uploading.upload(getUpload(), path);
		// 新建商品
		Goods goods = new Goods();
		goods.setGoodsName(pageParas.getGoodsName());
		goods.setDescription(pageParas.getDescription());
		goods.setPrice(new BigDecimal(pageParas.getPrice()));
		Category category = new Category();
		category.setId(pageParas.getCategoryId());
		goods.setCategory(category);
		goods.setImgUrl(getUploadFileName());
		// 持久化商品
		flowerService.addGoods(goods);

	}

	// 删除商品
	public String deleteById() {
		flowerService.deleteById(pageParas);
		inputStream = new ByteArrayInputStream("true".getBytes());
		return "stream";
	}

	@JSON(serialize = false)
	public PageModel<Goods> getGoods() {
		return goods;
	}

	public void setGoods(PageModel<Goods> goods) {
		this.goods = goods;
	}

	@JSON(serialize = false)
	public Goods getGood() {
		return good;
	}

	public void setGood(Goods good) {
		this.good = good;
	}

}
