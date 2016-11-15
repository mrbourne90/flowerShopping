<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/public/head.jspf"%>
<link rel="stylesheet" type="text/css"
	href="/FlowerShopping/css/flower.css">
<link rel="stylesheet" type="text/css"
	href="/FlowerShopping/css/main.css">
<script type="text/javascript">
	$(function() {
		$("#btn").click(
				function() {
					//调用submit方法提交数据  
					$("#ff")
							.form(
									'submit',
									{
										url : '${baseUrl}/addGoods', //将请求提交给addGoods方法处理  
										success : function() { //成功后  
											//如果成功了，关闭当前窗口  
											parent.$("#win").window("close");
											//刷新页面，刚刚添加的就显示出来了。  
											//获取datagrid  并刷新
											parent.$("iframe[title='商品管理']")
													.get(0).contentWindow.$(
													"#dg").datagrid("reload");
										}
									});

				});
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加商品</title>
</head>
<body>
	<div id="left">
		<div id="content">
			<div class="login-box">
				<s:action name="category_findCategories" namespace="/"
					executeResult="false"></s:action>
				<form id="ff" method="post" enctype="multipart/form-data">
					<div class="tab-content">
						<div id="registerPane" class="tab-pane login-panel fade in active">
							<div class="login-notice"></div>
							<div class="form-group">
								<input id="goodsName" name="goodsName" placeholder="商品名称"
									required="required" type="text" class="form-control">
							</div>
							<div class="form-group">
								<input id="description" name="description" placeholder="商品描述"
									required="required" type="text" class="form-control">
							</div>
							<div class="form-group">
								<input id="price" name="price" placeholder="商品价格" type="number"
									required="required" class="form-control">
							</div>
							<div class="form-group">
								选择分类：
								<s:select name="categoryId" list="#request.categories"
									listKey="id" listValue="categoryName" style="height: 34px;"></s:select>
							</div>
							<div class="form-group">
								上传图片：
								<s:file name="upload" style="height: 30px; width: auto;"></s:file>
							</div>

							<div class="form-group">
								<a id="btn" href="#" class="btn btn-primary btn-lg btn-block">添加</a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>