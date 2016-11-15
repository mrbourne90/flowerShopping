package com.flowershopping.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.flowershopping.dao.IBaseDAO;
import com.flowershopping.util.PageModel;

/**
 * 泛型DAO实现
 * 
 * @author mrbourne 2016-9-21 09:19:28
 *
 * @param <T>
 */
@Repository
public class BaseDAO<T> implements IBaseDAO<T> {

	protected Class<T> clazz;

	@Resource
	protected SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public BaseDAO() {

		// 获取子类传递过来的实体类类型
		Type type = getClass().getGenericSuperclass();
		if (type instanceof ParameterizedType) {
			this.clazz = (Class<T>) ((ParameterizedType) type).getActualTypeArguments()[0];
		} else {
			this.clazz = null;
		}
	}

	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public T save(T entity) {
		return (T) getSession().save(entity);
	}

	@Transactional
	@Override
	public void delete(T entity) {
		getSession().delete(entity);
	}

	@Transactional
	@Override
	public void update(T entity) {
		getSession().update(entity);
	}

	@Transactional
	@Override
	public void saveOrUpdate(T entity) {
		getSession().saveOrUpdate(entity);
	}

	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public T get(Class<T> entityClass, Serializable id) {
		return (T) getSession().get(entityClass, id);
	}

	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public T get(String queryString, Map<String, Object> params) {
		Query query = getSession().createQuery(queryString);
		setParameter(query, params);
		@SuppressWarnings("rawtypes")
		List list = query.setMaxResults(1).list();
		if (list.isEmpty()) {
			return null;
		}
		return (T) list.get(0);
	}

	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public List<T> findList(String queryString, Map<String, Object> params) {
		Query query = getSession().createQuery(queryString);
		setParameter(query, params);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Transactional
	@Override
	public PageModel<T> findPage(String queryString, String countString, Map<String, Object> params, int pageIndex,
			int pageSize) {
		Query query = getSession().createQuery(queryString);

		if (pageIndex > 0 && pageSize > 0) {
			query.setFirstResult(pageIndex < 2 ? 0 : ((pageIndex - 1) * pageSize));
			query.setMaxResults(pageSize);
		}

		setParameter(query, params);
		@SuppressWarnings("rawtypes")
		List items = query.list();
		// 符合结果的记录数
		Long rowsCount = 0L;
		if (pageIndex > 0 && pageSize > 0) {
			rowsCount = ((Long) get(countString, params)).longValue();
		} else {
			rowsCount = (long) items.size();
		}
		PageModel<T> pageModel = new PageModel<>(pageIndex, pageSize);
		pageModel.setDatas(items);
		pageModel.setRecordCount(rowsCount.intValue());
		return pageModel;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	// 给Query设置参数
	protected Query setParameter(Query query, Map<String, Object> parameterMap) {
		for (@SuppressWarnings("rawtypes")
		Iterator iterator = parameterMap.keySet().iterator(); iterator.hasNext();) {
			String key = (String) iterator.next();
			query.setParameter(key, parameterMap.get(key));
		}
		return query;
	}
}
