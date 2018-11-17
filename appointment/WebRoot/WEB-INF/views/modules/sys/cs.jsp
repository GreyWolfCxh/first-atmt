<!-- 两单一库模块，地区列表 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="decorator" content="default"/>
	<title>预约平台</title>
	<script type="text/javascript">
	var isListen = true;
	var menuList = [{"parentIds":"30162462","permission":"_home","sort":5,"parentId":30162462,"isShow":1,"name":"首页","href":"null","id":30163045,"status":1},
	{"parentIds":"30162462","permission":"_wait_for_deal_module","sort":10,"parentId":30162462,"isShow":2,"name":"待办事项","href":"null","id":30162463,"status":1},
	{"parentIds":"30162462,30162463","permission":"_my_pre_generate_task","sort":10,"parentId":30162463,"isShow":1,"name":"我的待生成任务","href":"/checkPlan/toMyPreGenerateTaskItemList","id":30162661,"status":1},
	{"parentIds":"30162462,30162464","permission":"_market_object","sort":10,"parentId":30162464,"isShow":1,"name":"市场主体","href":"/marketObject/toMarketObjectList","id":30162665,"status":1},
	{"parentIds":"30162462,30162465","permission":"_un_audit_plan","sort":10,"parentId":30162465,"isShow":1,"name":"未审核计划","href":"/checkPlan/toUnAuditPlanList","id":30162667,"status":1},
	{"parentIds":"30162462,30162466","permission":"_my_task_item","sort":10,"parentId":30162466,"isShow":1,"name":"我的任务","href":"/taskItem/toMyTaskItemList","id":30162671,"status":1},
	{"parentIds":"30162462,30162468","permission":"_c_marketobject","sort":10,"parentId":30162468,"isShow":1,"name":"市场主体统计","href":"/statistic/toChartOfMarketObject","id":30162677,"status":1},
	{"parentIds":"30162462","permission":"_check_base","sort":20,"parentId":30162462,"isShow":1,"name":"两单一库","href":"/work/toWorks","id":30162464,"status":1},
	{"parentIds":"30162462,30162463","permission":"_my_pre_write_item","sort":20,"parentId":30162463,"isShow":1,"name":"我的待录入事项","href":"/taskItem/toMyPreWriteTaskItemList","id":30162662,"status":1},
	{"parentIds":"30162462,30162464","permission":"_check_item","sort":20,"parentId":30162464,"isShow":1,"name":"事项清单","href":"/checkItem/toCheckItemList","id":30162666,"status":1},
	{"parentIds":"30162462,30162468","permission":"_c_checkplan","sort":20,"parentId":30162468,"isShow":1,"name":"抽查情况统计","href":"/statistic/toChartOfCheckPlan","id":30162678,"status":1},
	{"parentIds":"30162462","permission":"_check_plan_module","sort":30,"parentId":30162462,"isShow":1,"name":"计划管理","href":"/work/toWorks","id":30162465,"status":1},
	{"parentIds":"30162462,30162465","permission":"_aft_audit_plan","sort":30,"parentId":30162465,"isShow":1,"name":"已审核计划","href":"/checkPlan/toAftAuditPlanList","id":30162669,"status":1},
	{"parentIds":"30162462","permission":"_check_task_module","sort":40,"parentId":30162462,"isShow":1,"name":"任务管理","href":"null","id":30162466,"status":1},
	{"parentIds":"30162462,30162465","permission":"_add_plan","sort":40,"parentId":30162465,"isShow":1,"name":"添加新计划","href":"/checkPlan/addCheckPlan","id":30162670,"status":1},
	{"parentIds":"30162462,30162464,30162665","permission":"_market_object_view","sort":40,"parentId":30162665,"isShow":2,"name":"查看","href":"null","id":30165823,"status":1},
	{"parentIds":"30162462,30162464,30162666","permission":"_check_item_view","sort":40,"parentId":30162666,"isShow":2,"name":"查看","href":"null","id":30165825,"status":1},
	{"parentIds":"30162462","permission":"_check_statistic_null","sort":60,"parentId":30162462,"isShow":1,"name":"统计","href":"null","id":30162468,"status":1},
	{"parentIds":"30162462","permission":"_do_check","sort":70,"parentId":30162462,"isShow":2,"name":"执行抽查","href":"null","id":30164167,"status":1}];
	$(document).ready(function(){
/* 		$(".color_option").click(function(){
			var newVal = $(this).attr("id");
	        $.cookie('theme', newVal, {
	            expires : 7,
	            path: '/' 
	        });
	        window.location.reload();
		}); */
		
		$.parser.parse($('#horizontal_nav'));
		$("#vertical_nav").hide();
		$("#content_div").hide();
		$(".hor_nav_but").css('background-color','transparent');
		$(".hor_nav_but").css('border','transparent');
		$($('#main_menu_span').children()[0]).css('background-color','#0188CC');
	});
	function doParse(){
		$.parser.parse();
	}
	
	
	function clickMainMenu(id){
		
		if(id==1){
			$("#home_div").show();
			$("#vertical_nav").hide();
			$("#home_div").css('z-index', 1);
			$("#content_div").hide();
			document.getElementById("home_iframe").src='${path}/workbench/toWork';
		}else if(id==2){
			$("#home_div").show();
			$("#vertical_nav").hide();
			$("#home_div").css('z-index', 1);
			$("#content_div").hide();
			document.getElementById("home_iframe").src='${path}/release/toReleases';
		}else if(id==3){
			 $("#home_div").hide();
			$("#vertical_nav").show();
			$("#content_div").css('z-index', 1);
			$("#content_div").show();
		document.getElementById("content_iframe").src='${path}/illegals/toIllegals'; 
		//document.getElementById("home_iframe").src='${path}/work/toIllegals';
		
		}
		
		$(".hor_nav_but").css('background-color','transparent');
		$(".hor_nav_but").css('border','transparent');
		$("#main_a_"+id).css('background-color','#0188CC');
	
	}
	
	
	function clickChirdMenu(id){
		
		if(id==4){
			document.getElementById("content_iframe").src='${path}/base/goPath/modules/platform/illegals';
		}else if(id==5){
			document.getElementById("content_iframe").src='${path}/window/toWindow';
		}
	
	}
	
	
	/* function closeIframe(){
		var tab=$('#content_tabs').tabs('getSelected');
	    var index=$('#content_tabs').tabs('getTabIndex',tab);
	    $('#content_tabs').tabs('close',index);
	} */
	/* window.onresize=function(){ 
		var tab=$('#content_tabs').tabs('getSelected');
 	    var index=$('#content_tabs').tabs('getTabIndex',tab);
		$.parser.parse();
		$('#content_tabs').tabs('resize',{
		     plain : false,
		     boder : false,
		     width:$(window).width(),
		     height:$(window).height()-50
	     }); 
        $('#content_tabs').tabs('select', index); 
	} */
	function logout(){
		$.messager.confirm('提示','确定要退出？',function(r){
			if(r){
				window.location = "${path}/sys/logout";
			}
		});
	}
	</script>
	<style type="text/css">
	html,body,div,span,a{
		margin:0px;
		padding:0px;
		border:0px;
	}
	html,body{
		width:100%;
		height:100%;
	}
	body{
		background-color: #D2EBFF;
	}
	#main_div{
	 	z-index:2; 
		position:absolute;
		width:100%;
		height:100%;
	}
	#horizontal_nav{
		width:100%;
		overflow:hidden;
		height:60px;
		background-size:cover;
    	background-image:url('${staticPath}/img/horizontal_nav_bg.png');filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='${staticPath}/img/horizontal_nav_bg.png', sizingMethod='scale'); 
		-ms-filter: progid:DXImageTransform.Microsoft.AlphaImageLoader( src='1.ipg', sizingMethod='scale'); 
	}
	#logo_img{
		float:left;
		margin-right:50px;
		margin-left:20px;
	}
	.hor_nav_but{
		width:100px;
		height:30px;
	}
	.hor_nav_but .l-btn-text{
		font-weight:700;	
		font-size:18px;
	}
	.content_iframe{
		overflow:auto;
		border:0px;
		width:100%; 
		height:100%;
	}
	#foot_div{
		width:100%;
		height:50px;
	}
	#content_tabs .tabs-panels>.panel>.panel-body {
		width:100%;
		height:100%;  
    	overflow: hidden;  
    } 
    #home_div{
     	z-index:3; 
		position:absolute;
    	top:60px;
    	bottom:0px;
    	width:100%;
    	padding-top:-60px;
    	background-color:#D2EBFF;
    }
    #loading{
		position:absolute;
    	top:60px;
    	left:165px;
    	bottom:0px;
    	width:100%;
    	padding-top:-60px;
    	background-color:white;
    }
    #main_menu_span{
    	float:left;
    	display:block;
	    position:relative;
	    top:30px;
	    transform:translateY(-50%);
    }
    #minor_menu_span{
    	float:right;
    	display:block;
	    position:relative;
	    top:30px;
	    transform:translateY(-50%);
    }
    .l-btn-focus{
    	outline:transparent;
    }
/*     .l-btn-plain:hover{
    	color:black;
    }
    .l-btn:hover{
    	color:black;
    } */
    .tree-node-selected{
    	background:#E6E6E6;
    	color:black;
    }
    #main_menu_span a{
    	text-align:center;
    	color:white;
    	font-family:SimSun;
    	font-size:12px; 
    }
    #minor_menu_span a{
    	text-align:center;
    	color:white;
    	font-family:SimSun;
    	font-size:12px; 
    }
    .layout-split-west{
    	border-top:3px solid #BBECFD;
    	border-right:5px solid #BBECFD;
    }
    .layout-panel-center{
    	border-top:3px solid #BBECFD;
    }
    #vertical_nav_tree .tree-indent{
    	display:none;
    }
    #vertical_nav_tree .tree-node{
    	padding-top:5px;
    	padding-left:3px;
    	padding-right:3px;
    	height:24px;
    }
    #vertical_nav_tree  .tree-node-selected{
    	background: -webkit-linear-gradient(#B4E1F4, #FEFFFF); /* Safari 5.1 - 6.0 */
  		background: -o-linear-gradient(#B4E1F4, #FEFFFF); /* Opera 11.1 - 12.0 */
  		background: -moz-linear-gradient(#B4E1F4, #FEFFFF); /* Firefox 3.6 - 15 */
  		background: linear-gradient(#B4E1F4, #FEFFFF); /* 标准的语法 */
  		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#B4E1F4', endColorstr='#FEFFFF',GradientType=0 );
  		border:1px solid #349EC8;
  		/* 
  		background-image:url('${staticPath}/img/arrow_right.png');
  		background-repeat:no-repeat;
  		background-position:right; */
    }
    :root .gradient{filter:none;} 
    .arrow_img{
    	position:relative; 
    	right:3px;
    	top:3px;
    	width:10px;
    	float:right;
    }
    #minor_menu_span span{
    	text-align:center;
    	color:white;
    	font-family:SimSun;
    	font-size:12px; 
    }
	</style>
</head>
<body>
	<div id="loading" style="z-index:10;visiabled:hidden;">
		<div class="loading-indicator" style="position:absolute;top:50%;left:40%;">
			<img src="${staticPath}/img/extanim32.gif" width="32" height="32" style="margin-right:8px;" align="absmiddle" alt="请稍候...">
			请稍候，我们正在努力为您加载...
		</div>
	</div>
	<div class="easyui-layout" id="main_div" border="false">
		<div class="easyui-panel" data-options="region:'north'" id="horizontal_nav"  border="false">
			<%-- <img src="${staticPath}/img/logo_title1.png" id="logo_img"> --%>
			<span id="main_menu_span">
				<a href="javascript:void(0)" class="easyui-linkbutton hor_nav_but l-btn l-btn-plain" id="main_a_1" data-options="plain:true" onclick="clickMainMenu(1)" style="background-color: rgb(1, 136, 204); border: transparent;"><span class="l-btn-left"><span class="l-btn-text">工作台</span></span></a>
				<a href="javascript:void(0)" class="easyui-linkbutton hor_nav_but l-btn l-btn-plain" id="main_a_2" data-options="plain:true" onclick="clickMainMenu(2)" style="background-color: transparent; border: transparent;"><span class="l-btn-left"><span class="l-btn-text">放号管理</span></span></a>
				<a href="javascript:void(0)" class="easyui-linkbutton hor_nav_but l-btn l-btn-plain" id="main_a_3" data-options="plain:true" onclick="clickMainMenu(3)" style="background-color: transparent; border: transparent;"><span class="l-btn-left"><span class="l-btn-text">平台管理</span></span></a>
			</span>
			<span id="minor_menu_span">  
				<span>欢迎您，&nbsp;${user.name}</span> 
				<a href="#" onclick="logout()" class="easyui-linkbutton hor_nav_but" data-options="plain:true" >退出</a>
			</span>
		</div>
		<div class="easyui-panel" data-options="region:'west',split:true,collapsed:false" id="vertical_nav" style="overflow:hidden;width:165px !important"  border="false">
		   <ul id="vertical_nav_tree" class="easyui-tree" data-options="iconCls:'icon-blank'">
				<%-- <a href="${path}/base/goPath/modules/platform/illegals" target="content_iframe" class="easyui-linkbutton hor_nav_but l-btn l-btn-plain"  data-options="plain:true"  style="background-color: red; border-color:red;"><span class="l-btn-left"><span class="l-btn-text">违章类型管理</span></span></a>
				<a href="${path}/window/toWindow" target="content_iframe"  class="easyui-linkbutton hor_nav_but l-btn l-btn-plain"  data-options="plain:true"  style="background-color: transparent; border-color:red;"><span class="l-btn-left"><span class="l-btn-text">处理窗口管理</span></span></a> --%>
				
				<a href="javascript:void(0)" class="easyui-linkbutton hor_nav_but l-btn l-btn-plain" id="main_a_4" data-options="plain:true" onclick="clickChirdMenu(4)" style="background-color: transparent; border: transparent;"><span class="l-btn-left"><span class="l-btn-text">违章类型管理</span></span></a>
				<a href="javascript:void(0)" class="easyui-linkbutton hor_nav_but l-btn l-btn-plain" id="main_a_5" data-options="plain:true" onclick="clickChirdMenu(5)" style="background-color: transparent; border: transparent;"><span class="l-btn-left"><span class="l-btn-text">处理窗口管理</span></span></a>
		    </ul> 
		</div>
		<div class="easyui-panel" data-options="region:'center'" id="content_div"  border="false" style="height: 600px;"> 
			<div style="height:0px; overflow:hidden; clear:both;"></div>
			<iframe  id="content_iframe" class="content_iframe" name="content_iframe" src="${path}/illegals/toIllegals" style="width:100%;height:100%;border:0px;"></iframe>
		</div>
	</div>
	<div id="home_div">
		<!-- <div style="height:0px; overflow:hidden; clear:both;"></div> -->
		<iframe  id="home_iframe" name="home_iframe"  src="${path}/workbench/toWork" style="width:100%;height:100%;border:0px;"></iframe>
	</div>
	<script type="text/javascript">
		closeLoading();
	</script>
</body>
</html>