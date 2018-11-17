<!-- 首页   -->
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html> 
<head>
<meta name="decorator" content="default"/>
<title>预约系统</title>
<script type="text/javascript">
$(document).ready(function(){
  	$.ajax({
		url:'${path}/getHomeDetail',
		cache:false,
		success:function(result){
			result = eval('('+result+')');
			if(result.success){
				links = result.datas.links;
				var htm = '';
				var image = '';
				for(var i = 0; i < links.length; i++){
					switch(links[i].href){
					case '/checkPlan/toMyPreGenerateTaskItemList':image='link_bg_1.png';break;
					case '/taskItem/toMyPreWriteTaskItemList':image='link_bg_2.png';break;
					case '/checkPlan/toMyPreAuditPlanList':image='link_bg_3.png';break;
					case '/checkTask/toMyPreAuditTaskList':image='link_bg_4.png';break;
					default:image='link_bg_1.png';
					}
					//htm += ('<span><a href="javascript:openTodoList(\'' + links[i].name +'\',\''+ links[i].href +'\');">'+ links[i].backup1 +'</a></span>');
					htm += ('<td  align="center"><a href="javascript:openTodoList(\'' + links[i].name +'\',\''+ links[i].href +'\');"><div class="link_son_div" style="background-image:url(\'${staticPath}/img/'+ image +'\');"><span>'+ links[i].backup1 +'</span></div></a></td>')
				}
				$('#link_tr').append(htm);
				if(links.length == 0){
					$("#title_div").css({'display':'block'});
				}
			}
		}
	}); 
});
function openTodoList(text,url){
	parent.clickMainMenu(30162463);
	parent.openIframe(text,'<iframe class="content_iframe" name="content_iframe"  src="${path}'+ url +'"></iframe>');
}
</script>
<style type="text/css">
#title_div{
	width:300px;
	height:400px;
	margin-top:200px;
	margin-left:auto;
	margin-right:auto;
	display:none;
}
#link_parent_div{
	width:920px;
	margin-top:350px;
	margin-left:auto;
	margin-right:auto;
}
#link_parent_div table,tr{
	width:920px;
}
.link_son_div{
/* 	background-image:url('${staticPath}/img/home_btn_pre_generate_plan.png'); */
	background-size:cover;
    background-size:100% 100% ;
    -ms-behavior: url('${path}/static/css/backgroundsize.min.htc');
    behavior: url('${path}/static/css/backgroundsize.min.htc');
	width:190px;
	height:150px;
	margin:10px;
}
.link_son_div span{
	position:relative;
	left:10px;
	top:100px;
	font-size:12px;
	color:white;
}
#link_parent_div a{
	text-decoration:none;
}
span{
	margin-left:8px;
	margin-right:8px;
}
td{
	border:0px;
}
</style>
</head>
<body>
 	<div id="title_div">
		<img src="${path}/static/img/computer.png">
	</div>
	<div id="link_parent_div">
		<table>
			<tr id="link_tr">
			</tr>
		</table>
	</div>
</body>
</html>