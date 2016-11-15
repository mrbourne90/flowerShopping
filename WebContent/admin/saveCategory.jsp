<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/public/head.jspf"%>
<script type="text/javascript">
	$(function() {
		$("input[name=categoryName]").validatebox({ //这里是“类别名称”的验证功能，如果用户没填好就提交的话，会有提示  
			required : true,
			missingMessage : '请输入类别名称' //提示的内容  
		});
		$("#btn").click(function(){  
            //开启验证  
            $("#ff").form("enableValidation");  
            //如果验证成功，则提交数据  
            if($("#ff").form("validate")) {  
                //调用submit方法提交数据  
                $("#ff").form('submit', {  
                    url: '${baseUrl}/category_add', //将请求提交给categoryAction中的save方法处理  
                    success: function(){ //成功后  
                        //如果成功了，关闭当前窗口  
                        parent.$("#win").window("close");  
                        //刷新页面，刚刚添加的就显示出来了。  
                        //获取datagrid  并刷新
                        parent.$("iframe[title='类别管理']").get(0).contentWindow.$("#dg").datagrid("reload");  
                    }  
                });  
            }  
        });  
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<form id="ff" method="post">
		<div>
			<label for="categoryName">类别名称:</label> <input type="text"
				name="categoryName" />
		</div>
		<div>
			<a id="btn" href="#" class="easyui-linkbutton"
				data-options="iconCls:'icon-add'">添加</a>
		</div>
	</form>
</body>
</html>