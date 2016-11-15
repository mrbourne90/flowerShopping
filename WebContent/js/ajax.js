/**
 * 用于处理ajax请求
 */

$(function() {
	// 下一页按钮绑定事件
	$('#btn-next').click(function(e) {
		e.preventDefault();
		// 传递两个参数 一是排序规则order 二是页码 pageNo
		var params = {
			order : $('#order').val(),
			pageNo : $('#pageNo').val() * 1 + 1,
		};
		$.ajax({
			type : "post",
			url : "/FlowerShopping/goods_getJsonGoods",
			data : params,
			dataType : "json",
			success : function(ret) {
				var page = ret["page"];
				var datas = page["datas"];
				// 生成商品列表
				createItems(datas);
				// 根据分页其他数据控制按钮
				setBtn(page);
			},
			error : function(ret) {
				console.log(ret);
				return false;
			}
		});
	});

});
// 上一页按钮绑定事件 
function goPre() {
	// 传递两个参数 一是排序规则order 二是页码 pageNo
	console.log(parseInt($('.pager .text-primary')[0].innerHTML) - 1);
	var params = {
		order : $('#order').val(),
		pageNo : parseInt($('.pager .text-primary')[0].innerHTML) - 1,
	};
	$.ajax({
		type : "post",
		url : "/FlowerShopping/goods_getJsonGoods",
		data : params,
		dataType : "json",
		success : function(ret) {
			var page = ret["page"];
			var datas = page["datas"];
			// 生成商品列表
			createItems(datas);
			// 根据分页其他数据控制按钮
			setBtn(page);
		},
		error : function(ret) {
			console.log(ret);
			return false;
		}
	});
}
// 下一页按钮绑定事件 
function goNext() {
	// 传递两个参数 一是排序规则order 二是页码 pageNo
	console.log(parseInt($('.pager .text-primary')[0].innerHTML) + 1);
	var params = {
			order : $('#order').val(),
			pageNo : parseInt($('.pager .text-primary')[0].innerHTML) + 1,
	};
	$.ajax({
		type : "post",
		url : "/FlowerShopping/goods_getJsonGoods",
		data : params,
		dataType : "json",
		success : function(ret) {
			var page = ret["page"];
			var datas = page["datas"];
			// 生成商品列表
			createItems(datas);
			// 根据分页其他数据控制按钮
			setBtn(page);
		},
		error : function(ret) {
			console.log(ret);
			return false;
		}
	});
}
// 根据商品信息生成商品列表元素
function createItems(datas) {
	var wrapper = $('.grid-wrapper');
	wrapper.empty();
	for (var i = 0; i < datas.length; ++i) {
		var grid_item = $("<div class='grid-item'></div>");
		var grid_panel = $("<div class='grid-panel'></div>");
		var img_box = $("<div class='img-box'><a href='/FlowerShopping/goods_findOne?goodsId="
				+ datas[i]["id"]
				+ "' target='_blank'><img width='220' height='240' alt='' src='/FlowerShopping/img/"
				+ datas[i]["imgUrl"] + "'></a></div>");
		var info_cont = $("<div class='info-cont'><div class='price'><span class='price-sign'>¥ </span> <span class='price-num'>"
				+ datas[i]["price"]
				+ " </span></div><div class='title'><a href='/FlowerShopping/goods_findOne?goodsId="
				+ datas[i]["id"]
				+ "'target='_blank'> <span class='product-title'>"
				+ datas[i]["goodsName"]
				+ "</span> <span class='feature'>"
				+ datas[i]["description"] + "</span></a></div></div>");
		grid_panel.append(img_box);
		grid_panel.append(info_cont);
		grid_item.append(grid_panel);
		grid_item.hide();
		grid_item.fadeIn(1000);
		wrapper.append(grid_item);
		
	}
}
// 根据分页信息设置按钮
function setBtn(page) {
	console.log(page);
	var filterItems = $('.filter-items');
	var pager = $('.pager');
	pager.empty();
	pager.append("<li class='total-page'><strong class='text-primary'>"
			+ page["pageNo"] + "</strong>/" + page["pageCount"] + "</li>");
	if (page["hasPrevious"] == true) {
		pager
				.append("<li><a id='btn-pre' href='javascript:goPre();'><span class='glyphicon glyphicon-menu-left'>&lt;</span></a></li>");
	} else {
		pager
				.append("<li class='disabled'><a id='btn-pre' href='javascript:void(0);'><span class='glyphicon glyphicon-menu-left'>&lt;</span></a></li>");
	}
	if (page["hasNext"] == true) {
		pager
				.append("<li><a id='btn-next' href='javascript:goNext();'><span class='glyphicon glyphicon-menu-left'>&gt;</span></a></li>");
	} else {
		pager
				.append("<li class='disabled'><a id='btn-pre' href='javascript:void(0);'><span class='glyphicon glyphicon-menu-left'>&gt;</span></a></li>");
	}
}