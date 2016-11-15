<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/public/head.jspf" %>
<script type="text/javascript">
	$(function() {
		$('#dg').datagrid({
			//请求数据的url地址，后面会改成请求我们自己的url  
			url : '${baseUrl}/goods_getJsonGoods',
			loadMsg : 'Loading......',
			queryParams : {
				type : ''
			},//参数  
			//width:300,  
			fitColumns : true,//水平自动展开，如果设置此属性，则不会有水平滚动条，演示冻结列时，该参数不要设置  
			//显示斑马线  
			striped : true,
			//当数据多的时候不换行  
			nowrap : true,
			singleSelect : true, //如果为真，只允许单行显示，全显功能失效  
			//设置分页  
			pagination : true,
			pageSize: 5,
			pageList: [5,10,15],
			//指定id为标识字段
			idFiled : 'id',
			rowStyler : function(index, row) {
				console.info("index" + index + "," + row)
				if (index % 2 == 0) {
					return 'background-color:#fff;';
				} else {
					return 'background-color:#e8e8e8;';
				}

			},
			//同列属性，但是这些列将会冻结在左侧,大小不会改变，当宽度大于250时，会显示滚动条，但是冻结的列不在滚动条内  
			frozenColumns : [ [ {
				field : 'checkbox',
				checkbox : true
			} ] ],
			//配置datagrid的列字段   
			//field：列字段的名称，与json的key捆绑  
			//title：列标题，是显示给人看的  
			columns : [ [ {
				field : 'imgUrl',
				title : '商品图片',
				width : 100,
				//用来格式化当前列的值，返回的是最终的数据  
				formatter : function(value, row, index) {
					return "<img width='110' height='120' src='${baseUrl}/img/"+ value +"'>";
				}
			},
			
			 {
				field : 'goodsName',
				title : '商品名称',
				width : 100,
				//用来格式化当前列的值，返回的是最终的数据  
				formatter : function(value, row, index) {
					return "<span title=" +　value + ">" + value + "</span>";
				}
			},{
				field : 'description',
				title : '商品描述',
				width : 100,
				//用来格式化当前列的值，返回的是最终的数据  
				formatter : function(value, row, index) {
					return "<span title=" +　value + ">" + value + "</span>";
				}
			},{
				field : 'price',
				title : '商品价格',
				width : 100,
				//用来格式化当前列的值，返回的是最终的数据  
				formatter : function(value, row, index) {
					return "<span title=" +　value + ">" + "￥ " + value + "</span>";
				}
			}] ],
			//配置toobar按钮
			toolbar : [ {
				iconCls : 'icon-add',
				text : '添加商品',
				handler : function() {
					 parent.$("#win").window({ //因为<div>放在了aindex.jsp中，所以这里创建窗口要先调用parent  
				            title:"添加商品",  
				            width:470,  
				            height:650,  
				            content:'<iframe src="${baseUrl}/admin/addGoods.jsp" frameborder="0" width="100%" height="100%"/>'  
				        });  
				}
			}, '-', {
				iconCls : 'icon-remove',
				text : '删除商品',
				handler : function() {
					//判断是否有选中行记录，使用getSelected获取选中行  
					var row = $("#dg").datagrid("getSelected");
					//返回被选中的行，如果没有任何行被选中，则返回空数组  
					if (row==null) {
						//弹出提示信息  
						$.messager.show({ //语法类似于java中的静态方法，直接对象调用  
							title : '错误提示',
							msg : '至少要选择一条记录',
							timeout : 2000,
							showType : 'slide',
						});
					} else {
						//提示是否确认删除，如果确认则执行删除的逻辑  
			            $.messager.confirm('删除的确认对话框', '您确定要删除此项吗？', function(r){  
			                if (r){  
			                    //发送ajax请求  
			                    $.post("${baseUrl}/goods_deleteById",{id:row.id},function(result){  
			                        if(result == "true") {  
			                            //将刚刚选中的记录删除，要不然会影响后面更新的操作  
			                            $("#dg").datagrid("uncheckAll");  
			                            //刷新当前页，查询的时候我们用的是load，刷新第一页，reload是刷新当前页  
			                            $("#dg").datagrid("reload");//不带参数默认为上面的queryParams  
			                        } else {  
			                            $.messager.show({   
			                                title:'删除异常',  
			                                msg:'删除失败，请检查操作',  
			                                timeout:2000,  
			                                showType:'slide',  
			                            });  
			                        }  
			                    },"text");  
			                }  
			            });  
					}

				}
			} ]
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<table id="dg"></table>
</body>
</html>