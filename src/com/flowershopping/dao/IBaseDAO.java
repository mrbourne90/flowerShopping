package com.flowershopping.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.flowershopping.util.PageModel;

/**
 * 通用DAO接口
 * 
 * @author mrbourne 2016-9-21 08:42:54
 *
 */
public interface IBaseDAO<T> {

	/**
	 * 保存实体
	 * 
	 * @param entity
	 *            实体对象
	 * @return 实体主键
	 */
	public Object save(T entity);

	/**
	 * 删除实体
	 * 
	 * @param entity
	 *            实体对象
	 */
	public void delete(T entity);

	/**
	 * 更新实体
	 * 
	 * @param entity
	 *            实体对象
	 */
	public void update(T entity);

	/**
	 * 保存或更新实体，实体有主键时更新，否则保存
	 * 
	 * @param entity
	 *            实体对象
	 */
	public void saveOrUpdate(T entity);

	/**
	 * 获取单个实体，根据实体类类型和实体主键获取
	 * 
	 * @param entityClass
	 *            实体类
	 * @param id
	 *            实体主键
	 * @return 实体对象
	 */
	public T get(Class<T> entityClass, Serializable id);

	/**
	 * 获取单个实体，根据查询语句以及参数获取
	 * 
	 * @param queryString
	 *            查询语句
	 * @param params
	 *            可选查询参数
	 * @return 实体对象，如果查询结果有多个，只返回第一个
	 */
	public T get(String queryString, Map<String, Object> params);

	/**
	 * 查询实体列表
	 * 
	 * @param queryString
	 *            查询语句
	 * @param params
	 *            可选的查询参数
	 * @return 实体列表
	 */
	public List<T> findList(String queryString, Map<String, Object> params);

	/**
	 * 查询实体分页，并自定义查询总条数
	 * 
	 * @param queryString
	 *            查询语句
	 * @param countString
	 *            查询记录总条数语句
	 * @param params
	 *            可选查询参数
	 * @param pageIndex
	 *            当前页码
	 * @param pageSize
	 *            每页记录数
	 * @return 实体分页对象
	 */
	public PageModel<T> findPage(String queryString, String countString, Map<String, Object> params, int pageIndex,
			int pageSize);

}
