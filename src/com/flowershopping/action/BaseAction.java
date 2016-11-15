package com.flowershopping.action;

import java.io.File;
import java.io.InputStream;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.flowershopping.entity.PageParaModel;
import com.flowershopping.service.ICategoryService;
import com.flowershopping.service.IFlowerService;
import com.flowershopping.service.IOrderService;
import com.flowershopping.service.IUserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 基础Action所有Action父类，将共用的service,模型驱动等引入，减少重复代码
 * 
 * @author mrbourne
 *
 */
@Controller
@Scope("prototype")
public class BaseAction extends ActionSupport implements ModelDriven<PageParaModel> {

	private static final long serialVersionUID = -1649140502256717480L;

	protected PageParaModel pageParas = new PageParaModel();
	// 子类需要的service
	@Resource
	protected ICategoryService categoryService;
	@Resource
	protected IFlowerService flowerService;
	@Resource
	protected IUserService userService;
	@Resource
	protected IOrderService orderService;

	// 文件上传
	protected File upload;
	protected String uploadFileName;

	// 用于存放json数据的map
	protected Map<String, Object> pageMap = null;
	//流数据返回前台
	protected InputStream inputStream;

	@Override
	public PageParaModel getModel() {
		return pageParas;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public Map<String, Object> getPageMap() {
		return pageMap;
	}

	public void setPageMap(Map<String, Object> pageMap) {
		this.pageMap = pageMap;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

}
