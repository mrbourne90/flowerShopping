<%@page import="com.flowershopping.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
	<div class="container">
		<div class="wrapper">
			<div class="content">
				<s:action name="category_findCategories" namespace="/" executeResult="false"></s:action>
				<!-- 高级搜索 -->
				<s:form action="/goods_findGoodsByKeys" method="post">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td valign="middle">关键字：<input name="keyword" type="text" value="<s:property value="keyword"/>"
									value="" size="20" maxlength="30" style="height: 34px;"></td>
								<td valign="middle">分类：<s:select name="categoryId"
										list="#request.categories" listKey="id"
										listValue="categoryName" style="height: 34px;"></s:select></td>
								<td valign="middle">价格范围(¥)：<select name="priceRange"
									style="height: 34px;"><option
											<s:if test="priceRange==1">selected="true"</s:if> value="1">0-50</option>
										<option value="2"
											<s:if test="priceRange==2">selected="true"</s:if>>50-100</option>
										<option value="3"
											<s:if test="priceRange==3">selected="true"</s:if>>>100</option></select></td>
								<td valign="middle"><input class="btn btn-primary"
									type="submit" value="搜索" style="margin-bottom: 4px;"> *
									您可以按照关键字、分类名称、价格范围及其他关键词进入高级查找</td>
							</tr>
						</tbody>
					</table>
				</s:form>
				<!-- 筛选 -->
				<div class="filterbar">
					<ul class="filter-items list-inline">
						<s:if test='order=="default"'>
							<li class="active"><a href="/FlowerShopping/index/index.jsp">综合</a></li>
						</s:if>
						<s:else>
							<li><a href="/FlowerShopping/index/index.jsp">综合</a></li>
						</s:else>
						<s:if test='order=="id"'>
							<li class="active"><a
								href="/FlowerShopping/index/index.jsp?order=id">最新</a></li>
						</s:if>
						<s:else>
							<li><a href="/FlowerShopping/index/index.jsp?order=id">最新</a></li>
						</s:else>
						<s:if test='order=="price"'>
							<li class="active"><a
								href="/FlowerShopping/index/index.jsp?order=price">价格</a></li>
						</s:if>
						<s:else>
							<li><a href="/FlowerShopping/index/index.jsp?order=price">价格</a></li>
						</s:else>
					</ul>
					<ul class="pager">
						<li class="total-page"><strong class="text-primary"><s:property
									value="goods.pageNo" /></strong>/<s:property value="goods.pageCount" />
						</li>
						<s:if test="goods.hasPrevious">
							<li><a
								href="/FlowerShopping/index/index.jsp?order=<s:property value="order"/>&pageNo=<s:property value="goods.pageNo - 1"/>"><span
									class="glyphicon glyphicon-menu-left">&lt;</span></a></li>
						</s:if>
						<s:else>
							<li class="disabled"><a href="javascript:void(0)"><span
									class="glyphicon glyphicon-menu-left">&lt;</span></a></li>
						</s:else>
						<s:if test="goods.hasNext">
							<li><a
								href="/FlowerShopping/index/index.jsp?order=<s:property value="order"/>&pageNo=<s:property value="goods.pageNo + 1"/>"><span
									class="glyphicon glyphicon-menu-right">&gt;</span></a></li>
						</s:if>
						<s:else>
							<li class="disabled"><a href="javascript:void(0)"><span
									class="glyphicon glyphicon-menu-right">&gt;</span></a></li>
						</s:else>
					</ul>
				</div>
				<!-- 筛选 End -->
				<!-- 商品列表 -->
				<div class="grid-wrapper">
					<s:iterator value="goods.datas" var="good">
						<!-- 商品 -->
						<div class="grid-item">
							<div class="grid-panel">
								<div class="img-box">
									<a
										href="/FlowerShopping/goods_findOne?goodsId=<s:property value="#good.id"/>"
										target="_blank"><img width="220" height="240" alt=""
										src="/FlowerShopping/img/<s:property value='#good.imgUrl'/>"></a>
								</div>
								<div class="info-cont">
									<div class="price">
										<span class="price-sign">¥</span> <span class="price-num"><s:property
												value="#good.price" /></span>
									</div>
									<div class="title">
										<a
											href="/FlowerShopping/goods_findOne?goodsId=<s:property value="#good.id"/>"
											target="_blank"> <span class="product-title"><s:property
													value="#good.goodsName" /></span> <span class="feature"><s:property
													value="#good.description" /></span>
										</a>
									</div>
								</div>
							</div>
						</div>
						<!-- 商品 End -->
					</s:iterator>
				</div>
				<!-- 商品列表 End -->
				<!-- 分页 -->
				<div class="page-wrapper"></div>
				<!-- 分页 End -->
			</div>
		</div>

	</div>
</body>
</html>