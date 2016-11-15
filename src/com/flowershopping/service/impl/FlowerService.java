package com.flowershopping.service.impl;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.flowershopping.dao.IFlowerDAO;
import com.flowershopping.entity.Goods;
import com.flowershopping.entity.PageParaModel;
import com.flowershopping.service.IFlowerService;
import com.flowershopping.util.PageModel;

/**
 * 商品信息Service实现
 * 
 * @author mrbourne
 *
 */
@Service
public class FlowerService implements IFlowerService {

	@Resource
	private IFlowerDAO flowerDAO;

	@Override
	public PageModel<Goods> findGoods(PageParaModel pageParas) {

		String hql = "select g from Goods g ";
		// 根据排序规则分别获取商品信息
		if (pageParas.getOrder().equals("price")) {
			hql += "order by g.price asc";
		} else {
			hql += "order by g.id desc";
		}
		String countHql = hql.replaceFirst("g", "count(g)");
		// 从easyUI传来的分页
		if (pageParas.getPage() != 0) {
			return flowerDAO.findPage(hql, countHql, new HashMap<>(), pageParas.getPage(), pageParas.getRows());
		}
		return flowerDAO.findPage(hql, countHql, new HashMap<>(), pageParas.getPageNo(), pageParas.getPageSize());
	}

	@Override
	public PageModel<Goods> findGoodsByCategory(PageParaModel pageParas) {

		String hql = "select g from Goods g where g.category.id = :categoryId ";
		// 根据排序规则分别获取商品信息
		if (pageParas.getOrder().equals("price")) {
			hql += "order by g.price asc ";
		} else {
			hql += "order by g.id desc";
		}
		Map<String, Object> params = new HashMap<>();
		params.put("categoryId", pageParas.getCategoryId());
		String countHql = hql.replaceFirst("g", "count(g)");
		return flowerDAO.findPage(hql, countHql, params, pageParas.getPageNo(), pageParas.getPageSize());
	}

	@Override
	public Goods findOne(PageParaModel pageParas) {

		return flowerDAO.get(Goods.class, pageParas.getGoodsId());
	}

	@Override
	public PageModel<Goods> findGoodsByKey(PageParaModel pageParas) {
		// 检索商品名称 商品描述中含关键字的商品
		String hql = "select g from Goods g where g.goodsName like :goodsName or g.description like :description ";
		// 根据排序规则分别获取商品信息
		if (pageParas.getOrder().equals("price")) {
			hql += "order by g.price asc ";
		} else {
			hql += "order by g.id desc";
		}
		Map<String, Object> params = new HashMap<>();
		params.put("goodsName", "%" + pageParas.getKeyword() + "%");
		params.put("description", "%" + pageParas.getKeyword() + "%");
		// 计算结果条数
		String countHql = hql.replaceFirst("g", "count(g)");

		return flowerDAO.findPage(hql, countHql, params, pageParas.getPageNo(), pageParas.getPageSize());
	}

	@Override
	public PageModel<Goods> findGoodsByKeys(PageParaModel pageParas) {
		// 检索商品名称 商品描述中含关键字的商品
		String hql = "select g from Goods g where (g.goodsName like :goodsName or g.description like :description) and g.category.id = :categoryId ";
		// 根据价格范围修改hql
		// 范围为1表示价格在0-50
		if (pageParas.getPriceRange() == 1) {
			hql += "and g.price between 0 and 50 ";
		}
		// 范围为1表示价格在50-100
		else if (pageParas.getPriceRange() == 2) {
			hql += "and g.price between 50 and 100 ";
		}
		// 范围为3表示100以上
		else {
			hql += "and g.price > 100 ";
		}
		// 根据排序规则分别获取商品信息
		if (pageParas.getOrder().equals("price")) {
			hql += "order by g.price asc ";
		} else {
			hql += "order by g.id desc";
		}
		System.out.println("最终hql语句：" + hql);
		// 计算结果条数
		String countHql = hql.replaceFirst("g", "count(g)");
		Map<String, Object> params = new HashMap<>();
		params.put("goodsName", "%" + pageParas.getKeyword() + "%");
		params.put("description", "%" + pageParas.getKeyword() + "%");
		params.put("categoryId", pageParas.getCategoryId());
		return flowerDAO.findPage(hql, countHql, params, pageParas.getPageNo(), pageParas.getPageSize());
	}

	@Override
	public Goods addGoods(Goods goods) {
		flowerDAO.save(goods);
		return goods;
	}

	@Override
	public void deleteById(PageParaModel pageParas) {
		Goods goods = flowerDAO.get(Goods.class, pageParas.getId());
		flowerDAO.delete(goods);

	}

	public void setFlowerDAO(IFlowerDAO flowerDAO) {
		this.flowerDAO = flowerDAO;
	}

}
