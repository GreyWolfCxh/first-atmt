<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="decorator" content="default" />
		<title>增加违章类型</title>
		<script src="${staticPath}/jquery/upload2.js"></script>
		<script src="${staticPath}/js/calendar/jquery.js" type="text/javascript"></script>
		<style type="text/css">
 			html {
				overflow-y: auto !important;
			}
			
			.content_div {
				width: 1000px !important;
				margin-right: auto;
				margin-left: auto;
				margin-bottom: 40px;
			}
			
			.title_div {
				width: 100%;
				height: 30px;
				font-size: 16px;
			}
			
			.title_content_div {
				width: 100%;
				height: 27px;
				line-height: 27px;
				font-size: 18px;
			}
			
			.title_bottom_border_div {
				width: 100%;
				height: 3px;
				background: -webkit-linear-gradient(#B0D9F3, #379EE1);
				/* Safari 5.1 - 6.0 */
				background: -o-linear-gradient(#B0D9F3, #379EE1);
				/* Opera 11.1 - 12.0 */
				background: -moz-linear-gradient(#B0D9F3, #379EE1);
				/* Firefox 3.6 - 15 */
				background: linear-gradient(#B0D9F3, #379EE1);
				/* 标准的语法 */
				filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#B0D9F3', endColorstr='#379EE1', GradientType=0);
			}
			
 			.form_div {
				margin-top: 3px;
				width: 100%;
			}
			
			.form_table {
				width: 100%;
				padding-bottom: 8px;
			} 
			
		/* 	.part_title_td {
				background-color: #9FE0FF;
				height: 20px;
				line-height: 20px;
				padding-left: 20px;
			} */
			
			/*  td {
				height: 24px;
				width: 214px;
				vertical-align: middle;
			}  */
			
			 .right_td {
				width: 60px !important;
				text-align: right;
				padding-right: 5px;
			}
			/*
			.center_td {
				text-align: center !important;
				background-color: white !important;
			}
			
			.form_buttom_td {
				height: 40px;
				text-align: center;
				border: 0px;
			} */
			
			.title_td {
				height: 40px;
				width: 95%;
				color:blue;
				font-size:18px;
				border-top: 1px solid white;
				border-left: 1px solid white;
				border-right: 1px solid white;
				padding-left: 0px;
			}
			
			.head_td{
				height: 40px;
				width: 95%;
				color:#000000;
				font-weight:bold;
				font-size:18px;
				border-top: 1px solid white;
				border-left: 1px solid white;
				border-right: 1px solid white;
				padding-left: 0px;
			}
			
			/* .center_span {
				display: inline-block;
				width: 100%;
				text-align: center;
			}  */
			#submitR{
			width:88px !important;
			height:36px !important;
			background:url('${staticPath}/img/save.png') !important;
			background-size：cover;
			border: none;
			}
			#enable,#searchs,#addData{
			width:36px ;
			height:16px ;
			background:url('${staticPath}/img/open2.png') no-repeat;
			background-size：cover;
			border: none;
			}
			
			#window{
			width:36px !important;
			height:16px !important;
			background:url('${staticPath}/img/close2.png') no-repeat;
			background-size：cover;
			border: none;
			}
			
			#delBtn{
			float:right;
			padding-left:10px;
			padding-top:10px;
			margin:0 auto;
			vertical-align: middle;
			position: relative;
			z-index: 1;
			-webkit-backface-visibility: hidden;
			-moz-osx-font-smoothing: grayscale;
			text-align:center;
			width:21px !important;
			height:21px !important;
			background:url('${staticPath}/img/close3.png') no-repeat;
			background-size：cover;
			border: none;
			}
			
			
		</style>
		<script type="text/javascript">
		$(document).ready(function(){
		
			$.ajax({
			dataType:'json',
			async:true,
			url:"${path}/window/findAllWindow",
			success:function(result){
				$("#combobox").combobox({valueField:'id',textField: 'text'});
				$("#combobox").combobox('loadData',result);
				}
			});
			
			
			//启用
			$("#enable").click(function(){
				var val=$("#illegalStatus").val();
				console.log("val-->"+val);
				if(val==1){
					 $("#illegalStatus").val(0);
					  $("#enable").css("backgroundImage","url('${staticPath}/img/close2.png')");
				}else{
					 $("#illegalStatus").val(1);
					  $("#enable").css("backgroundImage","url('${staticPath}/img/open2.png')");
				}
				            		 
			});
				            		 
			//公众号配置：查询违章
			$("#searchs").click(function(){
			console.log("查询违章");
			if($('#searchtable').is(':hidden')){//如果当前隐藏
			    $('#searchtable').show();//那么就显示div
				$('#windowtable').hide();//就隐藏div
				$("#searchStatus").val(1);
				$("#windowStatus").val(0); 
				 $("#searchs").css("backgroundImage","url('${staticPath}/img/open2.png')");
				 $("#window").css("backgroundImage","url('${staticPath}/img/close2.png')");
			}else{//否则
				$('#searchtable').hide();//就隐藏div
				$('#windowtable').show();//那么就显示div
				$("#searchStatus").val(0);
				$("#windowStatus").val(1);
				 $("#searchs").css("backgroundImage","url('${staticPath}/img/close2.png')");
				  $("#window").css("backgroundImage","url('${staticPath}/img/open2.png')");
			}
			});
			//固定窗口
			$("#window").click(function(){
			console.log("固定窗口");
				if($('#windowtable').is(':hidden')){//如果当前隐藏
				   $('#windowtable').show();//那么就显示div
					$('#searchtable').hide();//就隐藏div
					$("#searchStatus").val(0);
					$("#windowStatus").val(1);
					 $("#window").css("backgroundImage","url('${staticPath}/img/open2.png')");
					  $("#searchs").css("backgroundImage","url('${staticPath}/img/close2.png')");
				}else{//否则
					$('#windowtable').hide();//就隐藏div
					$('#searchtable').show();//那么就显示div
					$("#searchStatus").val(1);
					$("#windowStatus").val(0);
					 $("#window").css("backgroundImage","url('${staticPath}/img/close2.png')");
					  $("#searchs").css("backgroundImage","url('${staticPath}/img/open2.png')");
				 }
				});
			//补充资料
			$("#addData").click(function(){
			console.log("补充资料");
				 if($('#datatable').is(':hidden')){//如果当前隐藏
				 $('#datatable').show();//那么就显示div
					$("#adDataStatus").val(1);
					 $("#addData").css("backgroundImage","url('${staticPath}/img/open2.png')");
				}else{//否则
				 $('#datatable').hide();//就隐藏div
				 $("#adDataStatus").val(0);
				  $("#addData").css("backgroundImage","url('${staticPath}/img/close2.png')");
				}
				});
				
				
			//数据源单选
			$('#addSCDialog').find('input[type=checkbox]').bind('click', function(){  
		          var id = $(this).attr("id");
		        
		        //当前的checkbox是否选中
		        if(this.checked){
		            //除当前的checkbox其他的都不选中
		            $("#addSCDialog").find('input[type=checkbox]').not(this).attr("checked", false); 
		            
		            //选中的checkbox数量
		            var selectleng = $("input[type='checkbox']:checked").length;
		            console.log("选中的checkbox数量"+selectleng);
		        }else{
		            //未选中的处理
		            console.log("未选中的处理");
		        }
		    }); 	
				
				
			
		});
		//返回
		function back() {
				parent.closeIframe();
			}
			
			//进度条
			function showProcess(isShow, title, msg) {
			    if (!isShow) {
			        $.messager.progress('close');
			        return;
			    }
			    var win = $.messager.progress({
			        title: title,
			        msg: msg
			    });
			}
			
			//新增
		function add_ok(){
		//console.log("submit");
		$("#illegalForm").form({
			url:'${path }/illegals/addIllegalTypes',
			onSubmit:function(){
				var flag = $(this).form('validate');
				//console.log("isAble"+flag);
				 if (flag) {
                	showProcess(true, '提示', '正在提交数据...');
           		 }
				return flag;
			},
			success:function(result){
				var result = eval('('+result+')');
				console.log("result-->"+result);
				if(result.success){
					$.messager.show({
						title:"提示",
						msg:'新增成功',
						timeout:2000,
						style:{
						top:document.body.clientHeight-400 // 与顶部的距离
				
			    		}
					});
					parent.closeIframe3("违章类型管理",'<iframe class="content_iframe" name="content_iframe"  src="${path}/illegals/toIllegal?status='+result.success+'"></iframe>');
				}else{
					$.messager.show({
						title:"错误！",
						msg:result.resultMsg,
						timeout:2000,
						style:{
						top:document.body.clientHeight-400 // 与顶部的距离
				
			    		}
					});
					$.messager.progress('close');
				}
				$('.easyui-linkbutton').linkbutton('enable');
			}
			/* success:function(result){
			console.log("rsss----->"+result);
					$.messager.show({
					title:"提示！",
					msg : "新增成功",
					timeout:5000,
					showType:'slide'
					});
					$.messager.progress('close');	// 如果提交成功则隐藏进度条
					//location.replace('${path}/illegals/toIllegals');//成功之后用js进行跳转
					parent.closeIframe3("违章类型管理",'<iframe class="content_iframe" name="content_iframe"  src="${path}/illegals/toIllegal?status='+result+'"></iframe>');
					//parent.openIframe("违章类型管理",'<iframe class="content_iframe" name="content_iframe"  src="${path}/illegals/toIllegals"></iframe>');
				} */
		});
		$('#illegalForm').submit(); 
	}	
			
 	

 
		/*增加查询字段*/
		function saveField(){
		//$("#allFields tr").empty();
			 $.each($('input[name=field]:checkbox'),function(){
		                if(this.checked){
		                	if($('input[name=field]:checked')){
		                		var val=$(this).val();
		                		if(val!==null || val!=undefined){
					                
					                var trcomp="<tr><td><input id='filed' name='filed' value='"+val+"'/><button type='button' id='delBtn' onclick='deleteCurrentRow1(this);'/></td></tr>";
									$("#allFields tr:last-child").after(trcomp);
		                		}
		                	}
		                }
		            });
		   closeSDialog();
		
		}
				 //删除查询字段 
				function deleteCurrentRow1(obj)
				{
					var isDelete=confirm("真的要删除吗？");
					if(isDelete)
					{
						var tr=obj.parentNode.parentNode;
						var tbody=tr.parentNode;
						tbody.removeChild(tr);
					}
				}
				function deleteCurrentRow2(obj)
				{
					var isDelete=confirm("真的要删除吗？");
					if(isDelete)
					{
						var tr=obj.parentNode.parentNode;
						var tbody=tr.parentNode;
						tbody.removeChild(tr);
					}
				}
				function deleteCurrentRow3(obj)
				{
					var isDelete=confirm("真的要删除吗？");
					if(isDelete)
					{
						var tr=obj.parentNode.parentNode;
						var tbody=tr.parentNode;
						tbody.removeChild(tr);
					}
				}
 
		/*增加补充字段*/
		function saveAField(){
		//$("#allAfields tr").empty();
		 $.each($('input[name=afield]:checkbox'),function(){
		                if(this.checked){
		                	if($('input[name=afield]:checked')){
		                		
		                		var val=$(this).val();
		                		if(val!==null || val!=undefined){
					                 var trcomp="<tr><td><input id='addField' name='addField' value='"+val+"'/><button type='button' id='delBtn' onclick='deleteCurrentRow2(this);'/></td></tr>";
									$("#allAfields tr:last-child").after(trcomp);
		                		}
		                	}
		                }
		            });
		             closeFDialog();
		}

	
		/*增加数据源*/
		function saveDataSource(){
			$("#datas").html("");
			 $.each($('input[name=data]:checkbox'),function(){
		                if(this.checked){
		                	if($('input[name=data]:checked')){
		                		
		                		var val=$(this).val();
		                		if(val!==null || val!=undefined){
		                			
		                			 var str='<input style="width:220px;height:30px;" id="dataSources" name="dataSources" value="'+val+'"/>';
					                var oimgbox=document.getElementById("datas");
					                var ndiv=document.createElement("div");
					                ndiv.innerHTML=str;
					                 ndiv.className="img-div";
					                oimgbox.appendChild(ndiv); 
		                		}
		                	}
		                }
		            });
		      closeSCDialog();
		}
		 	
			
			
			//隐藏页面上验证不通过的红框，验证在提交时触发
			function setValid(){
				var invalidInputs = $(".validatebox-invalid");
				for(var i = 0; i < invalidInputs.length; i++){
					$(invalidInputs[i]).removeClass("validatebox-invalid");
					$(invalidInputs[i]).addClass("validatebox-valid"); 
				}
			}
			
			
			
				/*弹出设置表单*/
function  addSDialog(){
	//全不选
	$('#addSDialog').dialog('open').dialog('setTitle','增加查询字段');
	$("input[name=field]:checkbox").each(function () {
	                $(this).prop("checked", false);
	            }); 
	
}
//关闭处理窗口
function closeSDialog() {
    $('#addSDialog').dialog('close');
}

function  addSCDialog(){
		//全不选
			 /*  $("input[name=data]:checkbox").each(function () {
			                $(this).prop("checked", false);
			            }); */
	$('#addSCDialog').dialog('open').dialog('setTitle','增加数据源');
}
//关闭处理窗口
function closeSCDialog() {
    $('#addSCDialog').dialog('close');
}

function  addFDialog(){
	$('#addFDialog').dialog('open').dialog('setTitle','增加补充字段');
	$("input[name=afield]:checkbox").each(function () {
			                $(this).prop("checked", false);
			            });
}
//关闭处理窗口
function closeFDialog() {
    $('#addFDialog').dialog('close');
}
			
		
		</script>
		
		
		<!-- 公众号配置状态改变 -->
		<script type="text/javascript">
				            		 
			 </script>
	</head>
	<body>
		<div class="content_div"  border="false"  >
		<!-- action="${path }/illegals/addIllegalTypes" enctype="multipart/form-data"  target="content_iframe"-->
		<form name="illegalForm" id="illegalForm"  method="post"  enctype="multipart/form-data">
			
						<table class="form_table">
						<tr>
								<td colspan="4" class="title_td">
									<div class="title_div">
										<div class="head_td">新增违章类型信息</div>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="4" class="title_td">
									<div class="title_div">
										<div class="title_content_div">基础信息
										<img src="${staticPath}/img/add_title.png" width="39" height="16" style="margin-right:8px;">
										</div>
									</div>
								</td>
							</tr>
							 <tr >
								<td ><label>违章类型名称：</label><input class="easyui-textbox easyui-validatebox" name="illegalName" id="illegalName"  data-options="panelHeight:'auto',required:true"></td>
								<td style="padding-left: 28px;">排序 ：<input class="easyui-textbox easyui-validatebox" name="sort" id="sort"  data-options="panelHeight:'auto',required:true"></td>
							</tr> 
							<tr>
								<td style="padding-left: 42px;" >描述 ：<input class="easyui-textbox easyui-validatebox" name="illegalType" id="illegalType"  data-options="panelHeight:'auto',required:true"></td>
							</tr>
							<tr style="margin-top: 25px;">&nbsp;</tr>
							<tr>
								<td style="padding-left: 25px;" >是否启用：
								<button id="enable" type="button" style="padding-top: 6px;"></button>
			               			<input class="easyui-textbox easyui-validatebox" type="hidden" name="illegalStatus" id="illegalStatus" value="1" data-options="panelHeight:'auto',required:true">
								</td>
								<td style="width:600px;">公众号配置：
									<label>查询违章<button id="searchs" type="button" style="padding-top: 5px;"></button></label> 
									 <label>固定窗口<button id="window" type="button" style="padding-top: 5px;"></button></label>
									 <label>补充资料<button id="addData" type="button" style="padding-top: 5px;"></button></label>
								</td>
							</tr>
							<tr style="display: none;">
								<td class="right_td">公众号配置状态：</td>
								<td>
									查询违章：<input id="searchStatus" name="searchStatus" value="1"/></br>
									固定窗口：<input id="windowStatus" name="windowStatus" value="0"/></br>
									补充资料：<input id="adDataStatus" name="adDataStatus" value="1"/></br>
								</td>
							</tr>
							
						</table>
			
			
						<table class="form_table">
							<tr>
								<td colspan="4" class="title_td">
									<div class="title_div">
										<div class="title_content_div">办理提示
										<img src="${staticPath}/img/add_title.png" width="39" height="16" style="margin-right:8px;">
										</div>
									</div>
								</td>
							</tr>
							
							<tr>
								<td style="width: 40px !important;">办理提示：
								</td>
								<td style="padding-left: 18px;">
								<textarea class="easyui-textbox easyui-validatebox" name="tips" id="tips" required="true" data-options="validType:['length[2,3000]']" style="width:500px!important;height:100px;overflow-y:hidden;"></textarea>
								</td>
							</tr>
						</table>
						
						
						<table class="form_table">
							<tr>
								<td colspan="4" class="title_td">
									<div class="title_div">
										<div class="title_content_div">上传文件 
										<img src="${staticPath}/img/add_title.png" width="39" height="16" style="margin-right:8px;">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td >上传文件：</td>
								<td>
								 <div class="easyui-panel" style="width:700px;height:100px;padding:10px;">
											<table id="allFiles" >
											<tr></tr>
											</table>
											<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:addCurrentRow();">添加</a>
									</div>
								</td>
							</tr>
						</table>
			<script>
			/*上传文件  */
				function addCurrentRow()
				{
					var trcomp="<tr><td><input type='file' name='files'/><button type='button' id='delBtn' onclick='deleteCurrentRow(this);'/></td></tr>";
					$("#allFiles tr:last-child").after(trcomp);
				}
				  
				function deleteCurrentRow(obj)
				{
					var isDelete=confirm("真的要删除吗？");
					if(isDelete)
					{
						var tr=obj.parentNode.parentNode;
						var tbody=tr.parentNode;
						tbody.removeChild(tr);
					}
				}
			</script>
			
			
						<table class="form_table" id="searchtable">
							<tr>
								<td colspan="4" class="title_td">
									<div class="title_div">
										<div class="title_content_div">查询配置
										<img src="${staticPath}/img/add_title.png" width="39" height="16" style="margin-right:8px;">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td >查询字段：</td>
								<td>
											<div class="easyui-panel" style="width:700px;height:60px;padding:10px;">
											<!-- <ul id="fields">
											</ul> -->
											<table id="allFields" >
											<tr></tr>
											</table>
											    	<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addSDialog()">添加</a>
									</div>
				    			</td>
				    			</tr>
				    			<tr>
								<td  style="padding-left: 10px;">数据源：</td>
								<td>
										<div class="easyui-panel" style="width:700px;height:60px;padding:10px;">
										<ul id="datas"> 
										</ul> 
										<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addSCDialog()">添加</a>
									</div>
				    			</td>
							</tr>
							
						</table>
						
						<!--处理窗口  -->
						<table class="form_table" id="windowtable" style="display: none;">
							<tr>
								<td colspan="4" class="title_td">
									<div class="title_div">
										<div class="title_content_div">固定窗口
										<img src="${staticPath}/img/add_title.png" width="39" height="16" style="margin-right:8px;">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td >选择窗口：
								<select id="combobox" name="windowIds" data-options="multiple:true,panelHeight:'auto'"  class="esayui-combobox" style="width:200px;"/>
								</td>
				    			</tr>
							
						</table>
						
						<!-- 补充资料 -->
						<table class="form_table" id="datatable">
							<tr>
								<td colspan="4" class="title_td">
									<div class="title_div">
										<div class="title_content_div">补充资料
										<img src="${staticPath}/img/add_title.png" width="39" height="16" style="margin-right:8px;">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td >补充字段：</td>
								<td>
											<div class="easyui-panel" style="width:700px;height:60px;padding:10px;">
										<!-- <ul id="afields">
										</ul> -->
											<table id="allAfields" >
												<tr></tr>
											</table>
											<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addFDialog()">添加</a>
									</div>
				    			</td>
							</tr>
							
						</table>
						
				<table class="form_table">
					<tr>
						<td>
						<input type="button"  id="submitR" onclick="add_ok()"/>
						  <!-- <input name="submit" type="submit" value="提交"/> -->
							<!-- <a href="javascript:void(0);" id="ok" class="easyui-linkbutton" iconCls="icon-ok" onclick="add_ok()">确定</a> 
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-back" onclick="back()">返回</a> -->
						</td>
					</tr>
				</table>
				
				<table class="form_table" style="margin-top: 50px !important;" >
					<tr >
						<td colspan="6" class="form_buttom_td" style="display: none;">
							&nbsp;<a href="javascript:void(0);" id="ok" class="easyui-linkbutton" iconCls="icon-ok" ></a>
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-back" ></a>
						</td>
					</tr>
				</table>
			
			</form>
			
		</div>
	
	
<!-- 增加字段表单 -->
	<div id="addSDialog" class="easyui-dialog" closed="true" buttons="#dlg-buttons" title="标题" style="width:600px;height:350px;">
		<input type="checkbox" name="field" value="车牌号,carNum">车牌号,carNum</input></br>
		<input type="checkbox" name="field" value="通知书号码,inform">通知书号码,inform</input></br>
		<input type="checkbox" name="field" value="违法时间,illegalTime">违法时间,illegalTime</input></br>
		<input type="checkbox" name="field" value="协查验证码,identityCode">协查验证码,identityCode</input></br>
		<input type="checkbox" name="field" value="当事人姓名,userName">当事人姓名,userName</input></br>
	</div> 
    <div id="dlg-buttons">
        <a href="#" class="easyui-linkbutton" onclick="saveField();">Save</a> <a href="#"
            class="easyui-linkbutton" onclick="closeSDialog();">Close</a>
    </div>	
	
	<!-- 增加数据源表单 -->
	<div id="addSCDialog" class="easyui-dialog" closed="true" buttons="#dlg-buttons2" title="标题" style="width:600px;height:350px;">
		<input type="checkbox" name="data" value="违章处理预约,table1">违章处理预约,table1</input><br>
		<input type="checkbox" name="data" value="高速公路收费站协查预约,table2">高速公路收费站协查预约,table2</input><br>
		<input type="checkbox" name="data" value="综合检测逾期处理预约,table3">综合检测逾期处理预约,table3</input><br>
		<input type="checkbox" name="data" value="路面违停上客协查预约,table4">路面违停上客协查预约,table4</input><br>
		<input type="checkbox" name="data" value="普通公路超限超重协查预约,table5">普通公路超限超重协查预约,table5</input><br>
	</div> 
    <div id="dlg-buttons2">
        <a href="#" class="easyui-linkbutton" onclick="saveDataSource();">Save</a> <a href="#"
            class="easyui-linkbutton" onclick="closeSCDialog();">Close</a>
    </div>	

<!-- 增加补充字段表单 -->
	<div id="addFDialog" class="easyui-dialog" closed="true" buttons="#dlg-buttons3" title="标题" style="width:600px;height:350px;">
		<input type="checkbox" name="afield" value="姓名,userName">姓名,USER_NAME</input><br>
		<input type="checkbox" name="afield" value="身份证号码,userCardid">身份证号码,USER_CARDID</input><br>
		<input type="checkbox" name="afield" value="联系地址,userAddress">联系地址,USER_ADDRESS</input><br>
		<input type="checkbox" name="afield" value="手机号码,userPhone">手机号码,USER_PHONE</input><br>
		<input type="checkbox" name="afield" value="车牌号码,carNumber">车牌号码,CAR_NUMBER</input><br>
	</div> 
    <div id="dlg-buttons3">
        <a href="#" class="easyui-linkbutton" onclick="saveAField();">Save</a> 
        <a href="#"
            class="easyui-linkbutton" onclick="closeFDialog();">Close</a>
    </div>		
	

	
<!--  <script type="text/javascript">
 
</script> -->
	
	</body>

</html>