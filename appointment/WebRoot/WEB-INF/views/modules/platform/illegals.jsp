<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="default"/>
<title>违章类型管理</title>
<script type="text/javascript">
$(document).ready(function(){
	var status="${status}";
	console.log("status-->"+status);
	if(status){
		$.messager.show({
		title:'提示',
		msg:'新增成功',
		timeout:2000,
		showType:'slide',
		  style:{
			top:document.body.clientHeight-400 // 与顶部的距离
	
    		}
	  });
	
	}

	doDisable();
	$('#dg').datagrid({
		url:"${path}/illegals/illegalList",
		pagination:true,
		toolbar:"#toolbar",
		singleSelect:true,
		border:false,
		fit:true, 
		columns:[[
			{
	            field : 'id',
	            title : '编号',
	            width : 100,
			},
			{
				field :	'illegalName',
				title : '违章类型名称',
				width : 200,
			},
			{
				field :	'illegalType',
				title : '描述',
				width : 150,
			},
			{
				field :	'illegalStatus',
				title : '状态',
				width : 150,
				formatter:formatStage
			},
			{
				field :	'updateTime',
				title : '更新时间',
				width : 250,
				formatter:formatTime
			},
			{
				field :	'sort',
				title : '排序',
				width : 150,
			}
		]],
		onClickRow: function(index,row){
			var rows = $('#dg').datagrid('getSelections');
			if(rows.length > 1){
				
			}else if(rows.length == 1){
				$("#find_btn").linkbutton('enable');
				$("#update_btn").linkbutton('enable');
				$("#del_btn").linkbutton('enable');
			}else{
				doDisable();
			}
		}
	});
});
function doDisable(){
	$("#update_btn").linkbutton('disable');
	$("#find_btn").linkbutton('disable');
	$("#del_btn").linkbutton('disable');
}
var formatStage = function(value,row){
	if(row.illegalStatus == 1){
		return "启用";
	}
	return "禁用";
}
var formatTime=function(value,row,index){
	  var da = value;
	    da = new Date(da);
	    var year = da.getFullYear()+'年';
	    var month = da.getMonth()+1+'月';
	    var date = da.getDate()+'日';
	    return ([year,month,date].join('-')); 
}

function reflesh(){
	$('#dg').datagrid('load',{
	});
	doDisable();
}
//新增违章类型
function addType(){
		parent.closeIframe3("新增违章类型",'<iframe class="content_iframe" name="content_iframe"  src="${path}/illegals/toAddIllegalType"></iframe>');
		//parent.openIframe("新增违章类型",'<iframe class="content_iframe" name="content_iframe"  src="${path}/illegals/toAddIllegalType"></iframe>');
}

//修改违章类型
function updateType(){
	var row = $('#dg').datagrid('getSelected');
	if(row){
		parent.closeIframe3('修改违章类型','<iframe class="content_iframe" name="content_iframe"  src="${path}/illegals/toEditIllegalType?id='+ row.id +'"></iframe>');
	}else{
		$.messager.show({
			title:"注意！",
			msg:'请先选中要修改的违章类型。'
		});
	}
}

//违章类型详情
function findType(){
	var row = $('#dg').datagrid('getSelected');
	console.log("id-->"+row.id);
	if(row){
		parent.closeIframe3("违章类型详情",'<iframe class="content_iframe" name="content_iframe"  src="${path}/illegals/toFindIllegalType?id='+ row.id +'"></iframe>');
	}else{
		$.messager.show({
			title:"注意！",
			msg:'请先选中要查看的违章类型。'
		});
	}
}

//删除违章类型
function delType(){
		var row = $('#dg').datagrid('getSelected');
		if(row){
			$.messager.confirm('删除违章类型','确定要删除该违章类型？',function(r){
				if(r){
					$.post('${path}/illegals/delIllegalType',{id:row.id},function(result){
						if(result.success){
							$.messager.show({
								title:"成功！",
								msg:"已完成删除操作。"
							});
							setTimeout('reflesh();',2000); 
						}else{
							$.messager.show({
								title:"错误！",
								msg:result.resultMsg
							});
						}
					},'json');
				}
			});
		}else{
			$.messager.show({
				title:"注意！",
				msg:'请先选中要删除的市场主体。'
			});
		}
	}

window.top["reflesh_myTaskList"]=function(){
	reflesh();
};
</script>
<style type="text/css">

</style>
</head>
<body>
	<div style="width:100%;height:405px;">
		<table id="dg">
		</table>
	</div>
	<!-- 表格工具栏 -->
	<div id="toolbar">
		<div >
			<a href="#" id="find_btn" class="easyui-linkbutton" iconCls="icon-detail" plain="true" onclick="findType()">详情</a>
			<a href="#" id="add_btn" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addType()">添加</a>
			<a href="#" id="update_btn" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="updateType()">修改</a>
			<a href="#" id="del_btn" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delType()">删除</a>
		</div>
	</div>
	
	<script type="text/javascript">
	closeLoading();
	</script>
</body>
</html>