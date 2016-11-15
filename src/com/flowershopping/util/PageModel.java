package com.flowershopping.util;

import java.util.List;

/**
 * 用于保存分页数据的页面模型
 * @author mrbourne
 *
 * @param <T>
 */
public class PageModel<T> {

	// 当前页号
	private int pageNo = 1;
	// 每页记录数
	private int pageSize = 10;
	// 总记录数
	private int recordCount;
	// 总页数
	private int pageCount;
	// 存放分页数据的集合
	private List<T> datas;

	@SuppressWarnings("unused")
	private Boolean hasNext;
	@SuppressWarnings("unused")
	private Boolean hasPrevious;
	@SuppressWarnings("unused")
	private Boolean hasFirst;
	@SuppressWarnings("unused")
	private Boolean hasLast;

	public PageModel() {

	}

	public PageModel(int pageNo, int pageSize) {
		this.pageNo = pageNo;
		this.pageSize = pageSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}

	public int getPageCount() {
		if (this.getRecordCount() <= 0) {
			return 0;
		} else {
			pageCount = (recordCount + pageSize - 1) / pageSize;
			return pageCount;
		}
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public List<T> getDatas() {
		return datas;
	}

	public void setDatas(List<T> datas) {
		this.datas = datas;
	}

	public Boolean getHasNext() {
		if (pageNo != getPageCount()) {
			return true;
		} else {
			return false;
		}
	}

	public void setHasNext(Boolean hasNext) {
		this.hasNext = hasNext;
	}

	public Boolean getHasPrevious() {
		if (pageNo != 1) {
			return true;
		} else {
			return false;
		}
	}

	public void setHasPrevious(Boolean hasPrevious) {
		this.hasPrevious = hasPrevious;
	}

	public Boolean getHasFirst() {
		if (pageNo != 1) {
			return true;
		} else {
			return false;
		}
	}

	public void setHasFirst(Boolean hasFirst) {
		this.hasFirst = hasFirst;
	}

	public Boolean getHasLast() {
		if (pageNo != getPageCount()) {
			return true;
		} else {
			return false;
		}
	}

	public void setHasLast(Boolean hasLast) {
		this.hasLast = hasLast;
	}

}
