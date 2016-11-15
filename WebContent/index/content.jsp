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
					<!-- 隐藏的input用于保存页码和排序参数 -->
					<input id="pageNo" type="hidden"
						value="<s:property
									value='goods.pageNo' />"> <input
						id="order" type="hidden" value="<s:property value='order'/>">
					<ul class="pager">
						<li class="total-page"><strong class="text-primary"><s:property
									value="goods.pageNo" /></strong>/<s:property value="goods.pageCount" />
						</li>
						<s:if test="goods.hasPrevious">
							<li><a id="btn-pre"
								href="/FlowerShopping/index/index.jsp?order=<s:property value="order"/>&pageNo=<s:property value="goods.pageNo - 1"/>"><span
									class="glyphicon glyphicon-menu-left">&lt;</span></a></li>
						</s:if>
						<s:else>
							<li class="disabled"><a href="javascript:void(0)"><span
									class="glyphicon glyphicon-menu-left">&lt;</span></a></li>
						</s:else>	
						<s:if test="goods.hasNext">
							<li><a id="btn-next"
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