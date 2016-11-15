/**
 * 购物车相关js
 */

// 修改购物车数量
function modifyNum(goodsId, quantity) {
	// 传递两个参数 一是商品id 二是商品数量
	var params = {
		goodsId : goodsId,
		quantity : quantity,
	};
	$
			.ajax({
				type : "post",
				url : "/FlowerShopping/orders_updateCart",
				data : params,
				dataType : "json",
				success : function(ret) {
					// 这里order_list是DOM对象，而非jQuery对象
					var order_list = $("ul.order-list")[0];
					// 清空原有内容
					$(".bd").empty();
					// 遍历json返回的购物车数据中的items项 生成订单项
					for ( var key in ret["cart"]["items"]) {
						var item = ret["cart"]["items"][key];
						console.log(key);
						console.log(item);
						// 克隆已有节点
						var order_item = order_list.cloneNode(true);
						// 对子节点内容赋值
						var product = order_item.firstChild.nextSibling;
						var sum_price = product.nextSibling.nextSibling;
						var price = sum_price.nextSibling.nextSibling;
						var num = price.nextSibling.nextSibling;
						//给商品名和链接赋值
						product.firstChild.href = "/FlowerShopping/goods_findOne?goodsId="
								+ key;
						product.firstChild.firstChild.innerText = item["goodsName"];
						//给总价赋值
						sum_price.lastChild.innerText = (parseInt(item["num"]) * parseInt(item["price"]))
								+ ".00";
						//给单价赋值
						price.lastChild.innerText = (parseInt(item["price"]))
								+ ".00";
						//给数量赋值
						num.getElementsByTagName("input")[0].value = item["num"];
						//给减小按钮绑定事件
						num.getElementsByTagName("a")[0].href = "javascript:modifyNum("
								+ key
								+ ","
								+ (parseInt(item["num"]) - 1)
								+ ");";
						//给增大按钮绑定事件
						//给减小按钮绑定事件
						num.getElementsByTagName("a")[1].href = "javascript:modifyNum("
								+ key
								+ ","
								+ (parseInt(item["num"]) + 1)
								+ ");";
						//将订单项加载到容器中
						$(".bd").append(order_item);
					}
					//修改总价
					$(".set-stat .price span")[1].innerText = ret["cart"]["price"] + ".00";
				},
				error : function(ret) {
					console.log(ret);
					return false;
				}
			});
}