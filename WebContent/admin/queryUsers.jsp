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
			url : '${baseUrl}/user_getJsonUsers',
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
			}, {
				field : 'id',
				title : '用户编号',
				width : 200
			} ] ],
			//配置datagrid的列字段   
			//field：列字段的名称，与json的key捆绑  
			//title：列标题，是显示给人看的  
			columns : [ [ {
				field : 'userName',
				title : '用户名',
				width : 100,
				//用来格式化当前列的值，返回的是最终的数据  
				formatter : function(value, row, index) {
					return "<span title=" +　value + ">" + value + "</span>";
				}
			},
			{
				field : 'realName',
				title : '真实姓名',
				width : 100,
				//用来格式化当前列的值，返回的是最终的数据  
				formatter : function(value, row, index) {
					return "<span title=" +　value + ">" + value + "</span>";
				}
			}
			,{
				field : 'phoneNo',
				title : '电话',
				width : 100,
				//用来格式化当前列的值，返回的是最终的数据  
				formatter : function(value, row, index) {
					return "<span title=" +　value + ">" + value + "</span>";
				}
			},
			{
				field : 'address',
				title : '地址',
				width : 100,
				//用来格式化当前列的值，返回的是最终的数据  
				formatter : function(value, row, index) {
					return "<span title=" +　value + ">" + value + "</span>";
				}
			}
			 ] ]
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<table id="dg"></table>
</body>
</html>