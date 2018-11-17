<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="decorator" content="default"/>
	<title>预约系统</title>
	<script type="text/javascript">
	var isListen = true;
	var menuList = jQuery.parseJSON('${menuList}');
	//console.log("me---"+jQuery.parseJSON('${menuList}'));
	$(document).ready(function(){

		var $html = '';
		for(var i = 0; i < menuList.length; i++){ 
			if(menuList[i].parentId == '129901316' && menuList[i].isShow == '1'){
				$html += ('<a href="javascript:void(0)" class="easyui-linkbutton hor_nav_but" id="main_a_'+ menuList[i].id +'" data-options="plain:true" onclick="clickMainMenu('+ menuList[i].id +')">'+ menuList[i].name +'</a>');
			}
		}
		$("#main_menu_span").html($html);
		$.parser.parse($('#horizontal_nav'));
		$("#vertical_nav").hide();
		$("#content_div").hide();
		$('#content_tabs').tabs({
			 onBeforeClose: function(title,index){
					var target = this;
					if(!isListen){
						return true;
					}
			 },
			 onSelect:function(title,index){
					var nodes = $('#vertical_nav_tree').tree('getRoots');
					$('.tree-node-selected').removeClass('tree-node-selected');
					$('.arrow_img').remove();
					for(var i = 0; i < nodes.length; i++){
						if(nodes[i].text.indexOf(title) >= 0){
							$(nodes[i].target).addClass('tree-node-selected');
							$(nodes[i].target).append('<img class="arrow_img" src="${staticPath}/img/arrow_right.png"></img>');
						}
					}
			 }
		});
		$(".hor_nav_but").css('background-color','transparent');
		$(".hor_nav_but").css('border','transparent');
		$($('#main_menu_span').children()[0]).css('background-color','#0188CC');
	});
	function doParse(){
		$.parser.parse();
	}
	function clickMainMenu(id){
	
		if(id == 129901317){
		closeIframe();
			//工作台id
			$("#home_div").show();
			$("#vertical_nav").hide();
			$("#home_div").css('z-index', 99);
			$("#content_div").hide();
			document.getElementById("home_iframe").src='${path}/workbench/toWork';
			//document.getElementById('home_iframe').contentWindow.location.reload(true);
			$(".hor_nav_but").css('background-color','transparent');
			$(".hor_nav_but").css('border','transparent');
			$("#main_a_"+id).css('background-color','#0188CC');
			return true;
		}else if(id==129901318){
			closeIframe();
			//放号管理id
			$("#home_div").show();
			$("#vertical_nav").hide();
			$("#home_div").css('z-index', 99);
			$("#content_div").hide();
			document.getElementById("home_iframe").src='${path}/release/toReleases';
			//document.getElementById('home_iframe').contentWindow.location.reload(true);
			$(".hor_nav_but").css('background-color','transparent');
			$(".hor_nav_but").css('border','transparent');
			$("#main_a_"+id).css('background-color','#0188CC');
			return true;
		}
		
		else{
		//平台管理id
		$("#home_div").css('z-index', 1);
		$("#vertical_nav").show();
		$("#content_div").show();
		var nodes = [];
			for(var i = 0; i < menuList.length; i++){
			if($.trim(menuList[i].parentId) == $.trim(id)){
			if(menuList[i].id==129902107){
				var node = {
							id:menuList[i].id,
							text:menuList[i].name,
							iconCls: 'icon-undo',//图标
							attributes:{
								url:'<iframe class="content_iframe" name="content_iframe" style="width:100%;height:100%" src="${path}'+ menuList[i].href +'" ></iframe>'
							}};
			}else{
				var node = {
							id:menuList[i].id,
							text:menuList[i].name,
							iconCls: 'icon-undo2',//图标
							attributes:{
								url:'<iframe class="content_iframe" name="content_iframe" style="width:100%;height:100%" src="${path}'+ menuList[i].href +'" ></iframe>'
							}};
			
			}
					nodes.push(node);
				}
			}
		
		
		$('#vertical_nav_tree').tree({
				data:nodes,
				onClick:function(node){
					if(node.attributes){
						//openIframe(node.text,node.attributes.url);
						closeIframe3(node.text,node.attributes.url);
					}
					$('.arrow_img').remove();
					$(node.target).append('<img class="arrow_img" src="${staticPath}/img/arrow_right.png"></img>');
				}
		});
		
			var firstNode = $('#vertical_nav_tree').tree('getRoot');
			//console.log("fi--"+firstNode);
		//	$(firstNode.target).trigger("click");
			openIframe(firstNode.text,firstNode.attributes.url);
			//closeIframe3(firstNode.text,firstNode.attributes.url);
		}
	//	doParse();
		$(".hor_nav_but").css('background-color','transparent');
		$(".hor_nav_but").css('border','transparent');
		$("#main_a_"+id).css('background-color','#0188CC'); 

	}
	/* function createFrame(url){ 
	    return '<iframe class="content_iframe" name="content_iframe"  src="${path}/' + url + '" ></iframe>'; 
	} */
	function openIframe(text, url) {
		/* console.log(text);
		console.log(url); */
	
		if(text.indexOf('）') == (text.length - 1)){
			text = text.slice(0,text.indexOf('（'));
		}
	    if ($("#content_tabs").tabs('exists', text)) {  
	        $('#content_tabs').tabs('select', text); 
	        var tab = $('#content_tabs').tabs('getSelected');
	        tab.panel('refresh');
	    } else {  
	    	//openLoading();
	        $('#content_tabs').tabs('add', {  
	            title : text,  
	            closable : true,  
	            content : url
	        });  
	    }
	}
	function reopenIframe(text) { 
	    if ($("#content_tabs").tabs('exists', text)) {  
	        $('#content_tabs').tabs('select', text); 
	    } 
	}
	function cancelTabsCloseListener(){
		$('#content_tabs').tabs({
			 onBeforeClose: function(title,index){
					return true;
			 }
		});
	}
	function openTabsCloseListener(){
		$('#content_tabs').tabs({
			 onBeforeClose: function(title,index){
					var target = this;
					$.messager.confirm('提示','本次编辑信息未保存，确定要退出？',function(r){
						if (r){
							var opts = $(target).tabs('options');
							var bc = opts.onBeforeClose;
							opts.onBeforeClose = function(){};  // allowed to close now
							$(target).tabs('close',index);
							opts.onBeforeClose = bc;  // restore the event function
						}
					});
					return false;	// prevent from closing
			 }
		});
	}
	function closeIframe(){
		var tab=$('#content_tabs').tabs('getSelected');
	    var index=$('#content_tabs').tabs('getTabIndex',tab);
	    $('#content_tabs').tabs('close',index);
	}
	
	
	function closeIframe2(){
		var tab=$('#content_tabs').tabs('getSelected');
	    var index=$('#content_tabs').tabs('getTabIndex',tab);
	    $('#content_tabs').tabs('close',index);
	    //console.log("------------------");
	    openIframe("违章类型管理",'<iframe class="content_iframe" name="content_iframe"  src="${path}/illegals/toIllegals"></iframe>');
	}
	
	
	function closeIframe3(text,url){
		var tab=$('#content_tabs').tabs('getSelected');
	    var index=$('#content_tabs').tabs('getTabIndex',tab);
	    $('#content_tabs').tabs('close',index);
	    //console.log("------------------"+url);
	    openIframe(text, url);
	}
	
	
	
	function reloadTab(title, method)
    {
		
//		cancelTabsCloseListener();
		isListen = false;
		closeIframe();
	    if ($("#content_tabs" ).tabs('exists', title)) {
	    	$( '#content_tabs').tabs('select' , title);
	   	   	eval("window.top."+ method +".call();");
	  	}
	    isListen = true;
//	    openTabsCloseListener();
    }
	window.onresize=function(){ 
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
	}
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
		/* background-color: #D2EBFF; */
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
    	background-image:url('${staticPath}/img/horizontal_nav_ba2.png');filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='${staticPath}/img/horizontal_nav_ba2.png', sizingMethod='scale'); 
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
		width:100% !important;
		height:50px  !important;
		 margin-top: 100px !important;
		position: relative !important;
	    background:url('${staticPath}/img/all2.png') !important; 
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
    	background-color:white;
    	padding-bottom:100px;
    	
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
    /* 左边图片 */
    #vertical_nav{
		overflow:hidden;
		height:100%;
		background-size:cover;
    	background-image:url('${staticPath}/img/left2.png') !important;
    }
    /* 树形背景图片 */
    #vertical_nav_tree{
    	height:160px !important;
		 background:url('${staticPath}/img/ul.png') !important;
		background-size：cover; 
    }
    
    #vertical_nav_tree .tree-indent{
    	display:none;
    }
    #vertical_nav_tree .tree-node{
    	padding-top:8px;
    	padding-left:8px;
    	padding-right:5px;
    	height:35px;
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
    
    .footer{
      z-index:99; 
     width:100% !important;
     height:50px !important;
     background:url('${staticPath}/img/horizontal_nav_ba2.png') !important;
	background-size：cover !important;
    position:fixed !important; bottom:0 !important; 
    }
    
    /* 图标 */
    .icon-undo {
    background:url('${staticPath}/img/illegal.png') no-repeat center center !important;
	}
	 .icon-undo2 {
    background:url('${staticPath}/img/window.png') no-repeat center center !important;
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
			<img src="${staticPath}/img/logo.png" id="logo_img">
			<span id="main_menu_span">
			</span>
			<span id="minor_menu_span">  
				<span>欢迎您，&nbsp;${user.name}</span> 
				<a href="#" onclick="logout()" class="easyui-linkbutton hor_nav_but" data-options="plain:true" >退出</a>
			</span>
		</div>
		<div class="easyui-panel" data-options="region:'west',split:true,collapsed:false" id="vertical_nav" style="overflow:hidden;width:165px !important"  border="false">
		   <ul id="vertical_nav_tree" class="easyui-tree" data-options="iconCls:'icon-blank'">
		    </ul> 
		</div>
		<div class="easyui-panel" data-options="region:'center'" id="content_div"  border="false"> 
			<div class="easyui-tabs"  border="false" id="content_tabs" fit="true"> 
		    </div>
		</div>
	
	</div>
	
	<div id="home_div">
		<div style="height:0px; overflow:hidden; clear:both;"></div>
		<iframe  id="home_iframe" allowTransparency="true" src="${path}/workbench/toWork" style="width:100%;height:100%;border:0px;"></iframe>
	</div> 
	
	
	<div class="footer"  >
	<div align="center" style="width:100%;height:100px;text-align:center;line-height:30px;margin: auto;color:white;">
			 	 <P>@版权所有：深圳交通运输执法   &nbsp;&nbsp;&nbsp;技术支持：广州通易科技有限公司</P>
	</div>
	</div>
	<script type="text/javascript">
		closeLoading();
	</script>
</body>
</html>