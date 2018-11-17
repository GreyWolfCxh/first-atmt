<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%  
    String root = request.getContextPath(); 
    String webPath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort();
    String webRootPath = webPath + request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
	<meta name="decorator" content="default"/>
	<title>放号管理</title>
	<%-- <script src="${staticPath}/js/calendar/jquery-1.8.3.min.js" type="text/javascript"></script> --%>
    <script src="${staticPath}/js/calendar/calendar.js" type="text/javascript"></script>
    <%-- <script src="${staticPath}/js/calendar/index.js" type="text/javascript"></script> --%>
    
    <link rel="stylesheet" href="${staticPath}/css/calendar/jquery.range.css">

	<script type="text/javascript" src="${staticPath}/js/calendar/jquery.range.js"></script>
    
  <%-- <script type="text/javascript">var path="${path}";
  </script >
  <script type="text/javascript">var ctx= "<%=root%>";</script > --%>
  <script type="text/javascript">
		
	$(document).ready(function(){
	var status="${status}";
	console.log("status-->"+status);
	if(status>0){
		$.messager.show({
		title:'提示',
		msg:'放号成功',
		timeout:3000,
		showType:'slide'
	  });
	
	}
	if(status==402){
		$.messager.show({
		title:'提示',
		msg:'你没有权限放号',
		timeout:3000,
		showType:'slide'
	  });
	
	}
		//var date="2018-10";
		var date=new Date();
		var mon=date.getFullYear()+"-"+(date.getMonth()+1);
		var day=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
		var d=date.getDate();
		if(d<10){
			d="0"+d;
			}
		var day2=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+d;
		
		var json={};//日历json
		var appointmentNumber=0;//放号总数
		var operationNumber=0;//剩余总数
		var sums={};
		//按月份获取放号日期
		//按天查预约数据
		$.ajax({
			dataType:'json',
			async:false,
			data:{"mon":mon,"day":day},
			url:"${path}/release/getReleasesByDate",
			//url:"${path}/release/getReleasesByDate?mon="+mon+"&day="+day,
			beforeSend: function(){
				    $.messager.progress({
			        	title: "提示",
			        	msg: "正在加载数据"
			   		 });
				    },
		   complete: function(){
				    $.messager.progress('close');
				    },
			success:function(result){
				console.log("count-----》"+result);
				console.log("cs--"+result.monDays);
				if(result.monDays!=null){
				 json=result.monDays;
				}else{
				json={};
				}
				if(result.dayNum!=null){
	    					sums=result.dayNum ;
	    					appointmentNumber=sums.appointmentNumber;
	    					operationNumber=sums.operationNumber;
	    					console.log("sums-->"+sums.appointmentNumber);
    				}
			},
			error:function(){
				console.log("失败--");
			}
		});
		//放号日期数据
		if(JSON.stringify(json) == "{}"){
		var data={};
		}else{
		var data = eval('(' + json + ')');
		}
		//var data = eval('(' + json + ')'); 
		 $("#calendar").calendar({
	        /*
	         * 传入今天的时间
	         * 默认：客户端时间
	         * 可传入一个服务器的时间
	         */
	        date: new Date(),
	        width: 720,
	        height: 400,
	        /* 左右框显示的比例 */
	        rate: 0.69,
	        /*
	         * 休假和加班设置
	         * JSON格式：Y加年-M加月-D加日
	         * 0表示休假 1表示加吧
	         */
	        week: true, // 是否开启单双休
	        week_walue: "2016/9/17", // 双休对应的周六
	        isclick: true,
	        total:appointmentNumber,//总数
	        retotal:operationNumber,//剩余数
	        configDay:data // 系统配置放号日期
	    });
			
			
			
		});
		//检查form
		function checkForm(){
		//放号日期
			var workDays=$("#workDays").val();
			console.log("ss->"+workDays);
			if(workDays==null||workDays==undefined||workDays==""){
				alert("请先选中放号日期！");
				return false;
			}
			//放号模板版本
			 var version=$('input:radio[name="version"]:checked').val();
            if(version==null){
                alert("请先选中放号模板!");
                return false;
            }
            
			return true;
		}
		//放号提交
		function submitForm(){
		var workDays=$("#workDays").val();
		var version=$('input[name="version"]:checked').val();
		var flag=checkForm();
		console.log("workDays:"+workDays);
		console.log("version:"+version);
		if(flag){
		$.ajax({
    	type:"post",
    	dataType:'json',
    	//contentType: "application/json;charset=UTF-8",//指定消息请求类型
    	data:{"version":version,"workDays":workDays},
		async:false,
		url:"${path}/release/batchReleaseNumber2",
		success:function(result){
			console.log("ajax执行成功--"+JSON.stringify(result));
			if(JSON.stringify(result)=="{}"){
				$.messager.show({
					title:'提示',
					msg:'放号成功',
					timeout:3000,
					showType:'slide'
				  });
				  //刷新页面
				  window.location.href="${path}/release/toReleases";
				}else{
					alert("放号失败，请重新尝试！");
				}
			},
		error:function(result){
				$.messager.show({
					title:'提示',
					msg:'放号失败，请重新尝试！',
					timeout:3000,
					showType:'slide'
				  });
			}
		});
			//$("#form1").submit();
		}
		}
		
    </script>
	
	<!--日历-->
	<link href="${staticPath}/css/calendar/calendar.css" rel="stylesheet" />
	<style type="text/css">
		#YL,#ML{
		background:url('${staticPath}/img/left.png') !important;
		background-size：cover;
		}
		#YR,#MR{
		background:url('${staticPath}/img/right.png') !important;
		background-size：cover;
		}
		
		#totalBtn{
		width:66px !important;
		height:26px !important;
		background:url('${staticPath}/img/all2.png') !important;
		background-size：cover;
		border: none;
		}
		
		#submitR{
		width:150px !important;
		height:42px !important;
		background:url('${staticPath}/img/submit.png') !important;
		background-size：cover;
		border: none;
		}
		
		#add{
		width:133px !important;
		height:86px !important;
		background:url('${staticPath}/img/addModule.png') !important;
		background-size：cover;
		border: none;
		}
		
		.e1{
		width:24px !important;
		height:24px !important;
		background:url('${staticPath}/img/sub2.png') !important;
		background-size：cover;
		border: none;
		}
		
		.e2{
		width:24px !important;
		height:24px !important;
		background:url('${staticPath}/img/add2.png') !important;
		background-size：cover;
		border: none;
		}
		
		.eAll{
		width:80px !important;
		height:30px !important;
		background:url('${staticPath}/img/eAll.png') !important;
		background-size：cover;
		border: none;
		}
		
        /* 回收，新增模板，修改模板框样式 */
        .ws{ 
		margin-left:50px;
		position:absolute;
		width:640px;
		height:600px;
		background-color:#fff !important;
		box-shadow: 0 0 120px #ccc !important;
		left:20%;
		 z-index:100; 
		}  
		
		/*回收，新增模板，修改模板框外面div样式  */
		.hs{
		position:absolute;
		width:100%;
		height:600px;
		/* background: #FFFFFF; */
		background-color: rgba(255, 255, 255, 0.15);
		filter:alpha(opacity=10);
		filter:progid:DXImageTransform.Microsoft.Alpha(opacity=10);
		 background-color:#fff; 
		/* box-shadow: 0 0 120px #ccc; */
	/* 	background-color:rgba(255,255,255,0.15);  */
		top:30px;
		/* z-index:100; */
		}  
		
		
		
		/* 右边面板 */
		#panel{
		position:absolute;
		background-color:#fff;
		box-shadow: 0 0 120px #ccc;
		}
		/* 放号模板 */
		.modules{ 
		margin-right:50px;
		position:absolute;
		width:640px;
		height:600px;
		background-color:#fff;
		box-shadow: 0 0 120px #ccc;
		right:30px;
		top:30px;
		z-index:100;
		} 
		
	  #table{
	  	margin-top: 20px;
	  }
	  #table tr{
	  width:300px !important;
	  height:100px  !important;
	  }
	  
	  #table tr td{
	  width:300px  !important;
	  height:100px;
	  text-align:center;
	  color:#000000 !important;
	  	font-size: 16px;
	  	background-color:white;
	  }
	  
	   #am{
	  	 background-color:white ;
	  }
	  #pm{
	  background-color:white ;
	  }
		
		#submitS{
		width:88px !important;
		height:36px !important;
		background:url('${staticPath}/img/save.png') !important;
		background-size：cover;
		border: none;
		}
		/*修改按钮 */
		.edit2{
		width:88px !important;
		height:36px !important;
		background:url('${staticPath}/img/edit3.png') !important;
		background-size：cover;
		border: none;
		}
		
		/*删除按钮 */
		.del2{
		width:88px !important;
		height:36px !important;
		background:url('${staticPath}/img/del3.png') !important;
		background-size：cover;
		border: none;
		}
		
		/* 添加放号时间按钮 */
		#g2{
		width:88px !important;
		height:36px !important;
		background:url('${staticPath}/img/add4.png') !important;
		background-size：cover;
		border: none;
		}
		/* 删除按钮 */
		#delBtn{
		width:21px !important;
		height:21px !important;
		background:url('${staticPath}/img/close3.png') !important;
		background-size：cover;
		border: none;
		}
		
	</style>
	
	
	
</head>
<body>
		<div style="margin-top: 30px;"></div>
		<form id="form1" runat="server" method="post" action="${path }/release/batchReleaseNumber"  onSubmit="return checkForm()">
			 <div id="content">
			 	<!--左边-->
			 	<div id="left" style="width: 60%;height: 400px;float: left;">
	        	<div id="calendar" >
	       		 </div>
       		 </div>
       		 <!--右边-->
		       <div id="right" style="height:400px;width: 40%;float: left;">	
		       
		       <div class="easyui-panel" id="panel" style="width:40%;height:400px"
			data-options="fit:true,border:false">
		       
		       
		       <table id="table1" name="table1"  cellspacing="0" cellpadding="0" style="width: 400px !important;height:auto;">
		       <tr><td>
		       <!-- 内容 -->
		       <!--固定模板  -->
				<div style="float: left;padding-left: 30px;">
				<table id="table1" name="table1" border="1" cellspacing="0" cellpadding="0" style="width: 200px;height: 200px;text-align:center;">
					<tr>
						<th>上午</th>
						<th>下午</th>
					</tr>
					
					<tr>
						<td>
							9:00-10:00</br>
								<span >50个</span>
							
						</td>
						<td>
							14:00-15:00</br>
								<span >50个</span>
							
						</td>
					</tr>
					
					<tr>
						<td>
							10:00-11:00</br>
								<span >50个</span>
							
						</td>
						<td>
							15:00-16:00</br>
								<span >50个</span>
							
						</td>
					</tr>
					<tr>
						<td>
							11:00-12:00</br>
								<span >50个</span>
							
						</td>
						<td>
							16:00-17:00</br>
								<span >50个</span>
							
						</td>
					</tr>
				</table>
				
				<div style="text-align: center;"><input type="radio" style="width:50px;" name="version"  id="module" value="11111">模板m1</input></div>
				</div>
				
				</td>
				
				<td >
			 <div  style="float: left;padding-left: 30px;padding-top: 104px;">
				
			<table id="table1" name="table1"border="1" cellspacing="0" cellpadding="0" style="width: 200px;height: 100px;text-align:center;">
					<tr>
						<th>上午</th>
						<th>下午</th>
					</tr>
					<tr>
						<td>
							8:00-12:00</br>
								<span >150个</span>
							
						</td>
						<td>
							14:00-17:00</br>
							<span >150个</span>
							
						</td>
					</tr>
					
					
				</table> 
				<div style="text-align: center;"><input type="radio" style="width:50px;" name="version" value="11112" >模板m2</input></div>
				 </div>
				</td>
				
				<!--自定义模板  -->
				<c:choose>
				<c:when test="${modulesList.size()>0 }">
				<tr><td style="padding-top: 20px;padding-left: 30px;font-size:20px;"> 自定义放号模板：</td></tr>
				<tr>
				<c:forEach items="${ modulesList}" var="mt" varStatus="mts">
				<td >
				<div style="float: left;width: 100px;padding-left: 30px;">
				<table id="table1" name="table1"border="1" cellspacing="0" cellpadding="0"  style="width: 100px;height: 200px;text-align:center;" >
					<tr>
						<th style="height:64px !important;">上午</th>
					</tr>
						<c:choose >
						<c:when test="${mt.amList.size()>0 }">
						<c:forEach items="${mt.amList }" var="at">
						<tr>
						<td>${at.timeIterval }</br>
							${at.appointmentNumber }个
						</td>
						</tr>
					</c:forEach>
						</c:when>
						<c:otherwise>
						<tr>
						<td style="height:130px !important;">暂无记录
						</td>
						</tr>
						
						</c:otherwise>
						</c:choose>
					</table>
					</div>
					
					<div style="float: left;width: 100px;">
					<table id="table1" name="table1"border="1" cellspacing="0" cellpadding="0" style="width: 100px;height: 200px;text-align:center;" >
					<tr>
						<th style="height:64px !important;">下午</th>
					</tr>
					<c:choose>
					<c:when test="${ mt.pmList.size()>0 }">
					<c:forEach items="${mt.pmList }" var="pt">
						<tr>
						<td>${pt.timeIterval }</br>
							${pt.appointmentNumber }个
						</td>
						</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
					<tr><td style="height:130px !important;">暂无记录
					</td>
					</tr>
					</c:otherwise>
					</c:choose>
					
					</table>
					</br>
					</div>
					
					<div style="margin-top: 50px;text-align: center;padding-top:20px;   padding-left: 30px;">
					<p></p>
					</br></br>
					<input type="button" class="edit2" onclick="toEditModule(${mt.version})"></input>&nbsp;&nbsp;<input type="button"  class="del2" onclick="delModule(${mt.version})"></input>
					</br></br>
					<input type="radio" style="width:50px;" name="version" value="${mt.version }" >模板${mts.count  }</input>
					</br></br>
					</div>
					</td>
					<c:if test="${mts.count%2==0 }"></tr><tr></c:if>
				</c:forEach>
				</c:when>
				
				</c:choose>
				<!--end 自定义模板  -->
				
				
				</table>
				<!--table end  -->
  				
  				<!--添加自定义模板按钮  -->
  				<div style="margin-top:60px;padding-left: 30px;" id="addModule">
  					<input type="button" id="add" onclick="addModule();"/>
  				</div>
  				
  				</div>
  				<!-- panel end -->
			</div>
	<!--right end-->
	
	
	
	</div>
	<!--content end-->
	
	
	<div style="padding:250px;width:100%;height: 10px;margin-top: 0px;"></div>
	<!--放号div -->
	<div style="height:50px;margin: auto;" align="center">
		<table id="table2"  cellspacing="0" cellpadding="0" style="width: 700px;height: 50px;text-align:center;">
			<tr>
			<!--记录放号日期列表  -->
					<input id="workDays"  type="hidden" name="workDays"/>
				<td>
					<input type="button"  id="submitR" onclick="submitForm();"/>
				</td>
			</tr>
		</table>
	</div>
    </form>
		
		
	
	<!--回收  -->	
	<div id="hs" class="hs" style="float: left;display:none;  ">
		<div class="ws" id="ws" style="border:1px solid #000;" >
		<span id="tit" style="font-size:22px;padding-top: 50px;padding-left: 20px;" ></span></br>
		<div id="leftTable" style="float: left;width:300px;padding-left: 20px;">
		</div>
		<div id="rightTable" style="float: left;width:300px;">
		</div>
		<div style="padding-top: 50px;margin-top: 400px;text-align: center;">
		<!-- 记录上下午时间 -->
			<input type="hidden" id="amIds" /></br>
			<input type="hidden" id="pmIds"/></br>
			<input type="button" id="submitS" onclick="submitForms()" />
		</div>
		</div>
	</div>
	<!-- end -->		
	
	<!--放号模板  -->
	<div class="hs" id="modules" style="display: none;">
	
	<div class="ws" id="ws" style="border:1px solid #000;" >
	<span style="font-size:20px;">制作自定义放号模板</span></br>
		<div class="demo" style="margin: 5opx;padding-top: 50px;padding-left: 50px;">
		<span style="padding-left: 50px;"><input class="range-slider" type="hidden" value="0,1440"/></br></span>
		
		</div>
		<div style="text-align: center;margin-top: 55px;">	<input type="button" id="g2"></input></div>
		<div id="mTDiv" style="display: none;text-align: center;">
		<p style="font-size:20px;color:red;">请按照时间顺序来设置时间，并选择正确的上午，下午标识！</p>
			<!--放号模板table  -->
			<table id="allFiles" style="margin: auto;" >
					<tr></tr>
			</table>
			<div  style="text-align: center;">
			<input type="hidden" id="arrM"  /></br>
			<input type="button" id="submitS" onclick="addModuleForm()" />
			</div>
		</div>
		
		</div>
		
	</div>
	
	<!-- end -->
	
	
	<!--修改放号模板  -->		
	<div id="editModules" class="hs" style="float: left;display: none;">
	
		<div class="ws" id="ws"  style="border:1px solid #000;">
		<span id="tit" style="font-size:22px;padding-top: 30px;padding-left: 20px;margin-top: 20px;" >修改放号模板 </span></br>
		<div id="leftMTable" style="float: left;width:300px;padding-left: 20px;">
		</div>
		<div id="rightMTable" style="float: left;width:300px;">
		</div>
		<div style="padding-top: 50px;margin-top: 400px;text-align: center;">
			<input type="hidden" id="amMIds" /></br>
			<input type="hidden" id="pmMIds"/></br>
			<input type="button" id="submitS" onclick="editModule()" />
		</div>
		</div>
	
	</div>
	<!-- end -->	
	
	
  <script type="text/javascript">
  /*滑动时间轴  */
	$(function(){
	$('.range-slider').jRange({
		from: 0, to: 1440, step:30,
		scale: ['00:00','04:00','08:00','12:00','16:00','20:00','24:00'],
		format: '%s',
		width: 500,
		showLabels: true,
		isRange : true
	});
	
	/*添加时间区间  */
	$("#g2").click(function(){
		var aa = $(".range-slider").val();
		console.log(aa);
		var arr=new Array();
		arr=aa.split(",");
		
		for(var i=0;i<arr.length;i++){
			var time=times(arr[i]);
		console.log(time);
		}
		var time=times(arr[0])+"-"+times(arr[1]);
		var time1="p"+arr[0]+arr[1];
		var time2=arr[0]+arr[1];
		var time3="a"+arr[0]+arr[1];
		//显示模板信息表格
		$("#mTDiv").show();
		solution();
		//查找重复元素
		var arrM=new Array();
		var aVal=$("#arrM").val();
		if(isNulls(aVal)){
		arrM=aVal.split(",");
		}
		console.log("av-->"+aVal);
		var index = arrM.indexOf(time2);
		console.log("i-->"+index);
		if (index > -1) {
			alert("已存在该时间区间！请不要配置重复时间区间！");
		}else{
		arrM.push(time2);
		$("#arrM").val(arrM);
		var trcomp="<tr><td>"
		+"<select id='"+time1+"'><option value='1'>上午</option><option value='2'>下午</option></select> "
		+"<input type='text'  value='"+time+"'  id='"+time2+"'  />"
		+"<input type='text' placeholder='输入放号数量（整数）' value='输入放号数量（整数）'    id='"+time3+"' onblur='inpNum(this)' onclick=javascript:this.value=''   />"
		+"<button type='button' lang='"+time2+"'  id='delBtn' onclick='deleteCurrentRow(this);'></button>"
		+"</td></tr>";
		$("#allFiles tr:last-child").after(trcomp);
		}
	});
	
	
	function times(value){
			var hours = Math.floor( value / 60 );
			var mins = ( value - hours*60 );
			return (hours < 10 ? "0"+hours : hours) + ":" + ( mins == 0 ? "00" : mins );
		}
	
});

function deleteCurrentRow(obj)
				{
					var isDelete=confirm("真的要删除吗？");
					if(isDelete)
					{
					var val=$(obj).attr("lang");
						var tr=obj.parentNode.parentNode;
						var tbody=tr.parentNode;
						tbody.removeChild(tr);
						
						var arrM=new Array();
						var aVal=$("#arrM").val();
						arrM=aVal.split(",");
						solution();
						//按元素名称删除
			        	var index = arrM.indexOf(val);
			        	console.log("i-->"+index);
			        	if (index > -1) {
						    arrM.splice(index, 1);
						}
						$("#arrM").val(arrM);
					}
				}
				
	function solution(){
			//兼容ie8

				if (!Array.prototype.indexOf){
				  		Array.prototype.indexOf = function(elt /*, from*/){
					    var len = this.length >>> 0;
					    var from = Number(arguments[1]) || 0;
					    from = (from < 0)
					         ? Math.ceil(from)
					         : Math.floor(from);
					    if (from < 0)
					      from += len;
					    for (; from < len; from++)
					    {
					      if (from in this &&
					          this[from] === elt)
					        return from;
					    }
					    return -1;
					  };
					}
	}			
		
	function placeholder(){

	  <!--兼容ie8 input输入框提示输入  --> 
  if( !('placeholder' in document.createElement('input')) ){   

    $('input[placeholder],textarea[placeholder]').each(function(){    
      var that = $(this),    
      text= that.attr('placeholder');    
      if(that.val()===""){    
        that.val(text).addClass('placeholder');    
      }    
      that.focus(function(){    
        if(that.val()===text){    
          that.val("").removeClass('placeholder');    
        }    
      })    
      .blur(function(){    
        if(that.val()===""){    
          that.val(text).addClass('placeholder');    
        }    
      })    
      .closest('form').submit(function(){    
        if(that.val() === text){    
          that.val('');    
        }    
      });    
    });    
  }   
  }
			
			
	//新增模板
	function addModule(){
		$("#modules").show();
		placeholder();
	}	
	
	//input输入
    function inpNum(obj){
	    var val=$(obj).val();
	    var num=parseInt(val);
	    if(num>=0){
	    	
	    }else{
	    	$(obj).val(0);
	    }
    }
	
	//显示修改模板
	function toEditModule(version){
		$.ajax({
    		dataType:'json',
    		async:true,
    		data:{"version":version},
    		url:"${path}/modules/getModulesByVersion",
    		success:function(result){
    			console.log(result);
    		
    			var	am="background-color:white;";
    			
    			
    			var	pm="background-color:white;";
    			
    				//上午		
    				var tableStr = "<table id='table' border='1' cellspacing='0' cellpadding='0'>";  
    		    	tableStr = tableStr  
    		            + "<tr class='list-header'>"  
    		            +"<td id='am' style='"+am+"'>上午</br></br>" 
    		            +"</td>"
    		            +"</tr>";  
    		    var len = result.amList.length;  
    		    //记录id的数组
    		    var amIds=new Array();
    		    for ( var i = 0; i < len; i++) {  
    		    	var time=result.amList[i].timeIterval.substring(0,2);
    		    	 if(time.indexOf(":") != -1 ){
					      	time=time.substring(0, 1);
					      }
    		    	  var ch=result.amList[i].appointmentNumber+"个";
				   		 var num=result.amList[i].appointmentNumber;
				   		  var color="background-color:white;";
				   		  var id=result.amList[i].id;
				   		var id2="e"+id;
				   		amIds.push(id2);
				   		  var e1="e1-"+id2;
				   		  var e2="e2-"+id2;
				   		 var html = "<div style='float:right;border:1px solid #000;'><div id='"+e1+"' class=\"e1\" onclick='sub2(this)'  style='float:left;' ></div>";
				          html+="<div style='float:left;'><input id='"+id2+"' type='text' value='"+num+"' lang='"+num+"' style='width:30px;height:24px;' onblur='inpNum(this)'  /></div>";
				          html += "<div style='float:left;' id='"+e2+"' class=\"e2\" onclick='add2(this)' ></div></div>";
				   		  
    		        tableStr = tableStr + "<tr>"  
    		        		+"<td id='"+time+"' style='"+color+"'>"
    		        		+"<span style='font-size:14px;'>"
    		        		+result.amList[i].timeIterval
    		                +"&nbsp;&nbsp;"+ch+"</span></br></br>"
			                +"<span id='"+result.amList[i].id+"'>"+html+"</span>"
    		                +"</td>"  
    		                +"</tr>";  
    		    }  
    		    if(len==0){  
    		        tableStr = tableStr + "<tr style='text-align: center'>"  
    		        +"<td colspan='6'><font color='#F0F0F0;'>暂无记录" + "</font></td>"  
    		        +"</tr>";  
    		    }  
    		    $("#amMIds").val(amIds);
    		    tableStr = tableStr + "</table>";  
    		    
    		    
    		    //下午
    		    		
    				var tableStr2 = "<table id='table' border='1' cellspacing='0' cellpadding='0' >";  
    		    	tableStr2 = tableStr2  
    		            + "<tr class='list-header'>"  
    		            +"<td id='pm' style='"+pm+"'>下午</br></br>"
    		            +"</td>"
    		            +"</tr>";  
    		    var len2 = result.pmList.length;  
    		    //记录id的数组
    		    var pmIds=new Array();
    		    for ( var i = 0; i < len2; i++) {  
    		    	 var time=result.pmList[i].timeIterval.substring(0,2);
    		    	 if(time.indexOf(":") != -1 ){
					      	time=time.substring(0, 1);
					      }
    		    	 var ch=result.pmList[i].appointmentNumber+"个";
			   		 var num=result.pmList[i].appointmentNumber;
			   	 var color2="background-color:white;";
		   		  var id=result.pmList[i].id;
			   		var id2="e"+id;
			   		//增加id
			   		pmIds.push(id2);
			   		  var e1="e1-"+id2;
			   		  var e2="e2-"+id2;
			   		 var html = "<div style='float:right;border:1px solid #000;'><div id='"+e1+"' class=\"e1\" onclick='sub2(this)'  style='float:left;' ></div>";
			          html+="<div style='float:left;'><input id='"+id2+"' type='text' value='"+num+"' lang='"+num+"' style='width:30px;height:24px;'  onblur='inpNum(this)'  /></div>";
			          html += "<div style='float:left;' id='"+e2+"' class=\"e2\" onclick='add2(this)' ></div></div>";
		   		  
    		        tableStr2 = tableStr2 + "<tr>"  
    		        		+"<td id='"+time+"'  style='"+color2+"'   >"
    		        		+"<span style='font-size:14px;'>"
    		        		+result.pmList[i].timeIterval
    		        		 +"&nbsp;&nbsp;"
    		               +ch+"</span></br></br>"
			                +"<span id='"+result.pmList[i].id+"'>"+html+"</span>"
    		                +"</td>"  
    		                +"</tr>";  
    		    }  
    		    if(len2==0){  
    		        tableStr2 = tableStr2 + "<tr style='text-align: center'>"  
    		        +"<td colspan='6'><font color='#F0F0F0;'>暂无记录"+ "</font></td>"  
    		        +"</tr>";  
    		    }  
    		    //存放下午id数组
    		    $("#pmMIds").val(pmIds);
    		    tableStr2 = tableStr2 + "</table>"; 
    		    
    		    //添加到div中  
    		    $("#leftMTable").html(tableStr);  
    		    $("#rightMTable").html(tableStr2);  
    		    
    				$("#editModules").show();
    		}
    	});
        	
	
	}	
	
	//减少
    function sub2(obj){
    	var id=obj.id;
    	
    	var arr=new Array();
    	arr=id.split("-");
    	var mId=arr[1];
    	var num=$('#'+mId).val();
    		var lang=$('#'+mId).attr("lang");
    	var num2=num-1;
    	if(num2>=0){
    		$("#"+mId).val(num2);
    	}
    	
    }
    //增加
     function add2(obj){
    	var id=obj.id;
    	
    	var arr=new Array();
    	arr=id.split("-");
    	var mId=arr[1];
    	var num=$('#'+mId).val();
    	var lang=$('#'+mId).attr("lang");
    	console.log("add0-->"+num);
    	var pa=1;
    	var a=parseInt(num);
        var b=parseInt(pa);
        b=b+a;
    	console.log("add0-->"+b);
    		$("#"+mId).val(b);
    	
    }
    
	
	
	//修改模板数据
	function editModule(){
		//组装json数据
    	var data="[";
    	//上午的数据
    	 var amIds=$("#amMIds").val();
	    console.log("am-->"+amIds);
	     //下午的数据
	     var pmIds=$("#pmMIds").val();
	    console.log("pm-->"+pmIds);
	    if(isNulls(amIds)){
	    var arr=new Array();
	    arr=amIds.split(",");
	    if(arr.length>0){
	     var id="id";
		 var id2="appointmentNumber";
		 //判断下午是否有值
		    if(isNulls(pmIds)){
			    for(var i=0;i<arr.length;i++){
				    var idV=arr[i].substring(1,arr[i].length);
				    var id2V=$("#"+arr[i]).val();
				     console.log("id--"+id);
				    data+='{"'+id+'":"'+idV+'",';
				     data+='"'+id2+'":"'+id2V+'"';
				     data+="},";
			    }
		    }else{
		    	 for(var i=0;i<arr.length-1;i++){
				    var idV=arr[i].substring(1,arr[i].length);
				    var id2V=$("#"+arr[i]).val();
				     console.log("id--"+id);
				    data+='{"'+id+'":"'+idV+'",';
				     data+='"'+id2+'":"'+id2V+'"';
				     data+="},";
			    }
			    
			    var idV=arr[arr.length-1].substring(1,arr[arr.length-1].length);
			    var id2V=$("#"+arr[arr.length-1]).val();
			    data+='{"'+id+'":"'+idV+'",'
			    data+='"'+id2+'":"'+id2V+'"';
			    data+="}";
		    }
	     }
	    }
	    if(isNulls(pmIds)){
	    console.log("ps-->"+isNulls(pmIds));
	     console.log("ps-->"+isNulls(null));
	    var arr2=new Array();
	    arr2=pmIds.split(",");
	    if(arr2.length>0){
	    console.log("cc--"+arr2.length);
	     var id="id";
		 var id2="appointmentNumber";
	    for(var i=0;i<arr2.length-1;i++){
		    var idV=arr2[i].substring(1,arr2[i].length);
		    var id2V=$("#"+arr2[i]).val();
		    data+='{"'+id+'":"'+idV+'",';
		     data+='"'+id2+'":"'+id2V+'"';
		     data+="},";
	    // data+='"'+arr2[i]+'":"'+$("#"+arr2[i]).val()+'",';
	    }
	    var idV=arr2[arr2.length-1].substring(1,arr2[arr2.length-1].length);
		    var id2V=$("#"+arr2[arr2.length-1]).val();
	    data+='{"'+id+'":"'+idV+'",'
	     data+='"'+id2+'":"'+id2V+'"';
	      data+="}";
	    }
	    
	    }
	data+="]";
  	console.log("data"+data);
  	//传参
  	//var datas= $.parseJSON( data );
  	var datas=data;
  	console.log("data-->"+datas);
  		$.ajax({
    	type:"post",
    	dataType:'json',
    	contentType: "application/json;charset=UTF-8",//指定消息请求类型
    	data:datas,
			async:false,
			url:"${path}/modules/updateModules",
			success:function(result){
			console.log("ajax执行成功--"+JSON.stringify(result));
			if(JSON.stringify(result)=="{}"){
				$("#editModules").hide();
				$.messager.show({
					title:'提示',
					msg:'修改模板成功',
					timeout:3000,
					showType:'slide'
				  });
				  window.location.href="${path}/release/toReleases";
				}else{
					$("#editModules").hide();
					alert("修改模板失败，请重新尝试！");
				}
			},
			error:function(result){
				$.messager.show({
					title:'提示',
					msg:'修改模板失败，请重新尝试！',
					timeout:3000,
					showType:'slide'
				  });
			}
		});
	    
	
	}
	//判断非空
	function isNulls(val){
		if (val == null || val == undefined || val == '') { 
			return false;
		} 
		return true;
	}
	//删除放号模板
	function delModule(version){
	console.log("version-->"+version);
		var isDelete=confirm("真的要删除吗？");
		if(isDelete)
		{
		$.ajax({
    	type:"post",
    	dataType:'json',
    	data:{"version":version},
			async:false,
			url:"${path}/modules/delModuleByDeptIdAndVersion",
			success:function(result){
			console.log("ajax执行成功--"+JSON.stringify(result));
			if(JSON.stringify(result)=="{}"){
				$.messager.show({
					title:'提示',
					msg:'删除模板成功',
					timeout:3000,
					showType:'slide'
				  });
				   window.location.href="${path}/release/toReleases";
				}else{
					alert("删除模板失败，请重新尝试！");
				}
			},
			error:function(result){
				$.messager.show({
					title:'提示',
					msg:'删除模板失败，请重新尝试！',
					timeout:3000,
					showType:'slide'
				  });
			}
		});
	  }
	}	
</script>
    
    <script type="text/javascript">
    	
    	
    	//减少
    	 function sub(obj){
    	var id=obj.id;
    	
    	var arr=new Array();
    	arr=id.split("-");
    	var mId=arr[1];
    	var num=$('#'+mId).val();
    		var lang=$('#'+mId).attr("lang");
    	var num2=num-1;
    	if(num2>=0){
    		$("#"+mId).val(num2);
    	}else{
    		alert("已达到回收放号数量最小值！");
    	}
    	
    }
    //增加
     function add(obj){
    	var id=obj.id;
    	
    	var arr=new Array();
    	arr=id.split("-");
    	var mId=arr[1];
    	var num=$('#'+mId).val();
    	var lang=$('#'+mId).attr("lang");
    	console.log("add0-->"+num);
    	var pa=1;
    	var a=parseInt(num);
        var b=parseInt(pa);
        b=b+a;
    	console.log("add0-->"+b);
    	if(b<=lang){
    		$("#"+mId).val(b);
    	}else{
    		alert("已达到可回收放号数量最大值！");
    	}
    }
    
    //input输入
    function inp(obj){
	    var val=$(obj).val();
	    var lang=$(obj).attr("lang");
	    var num=parseInt(val);
	    if(num>=0&&num<=lang){
	    	
	    }else{
	    	$(obj).val(0);
	    }
    }
      
    //剩余回收
    function eAll1(){
	    var amIds=$("#amIds").val();
	    console.log("am-->"+amIds);
	    var arr=new Array();
	    arr=amIds.split(",");
	    if(arr.length>0){
	    for(var i=0;i<arr.length;i++){
	    	$('#'+arr[i]).val($('#'+arr[i]).attr("lang"));
	    }
	    }
    }
    
    //剩余回收
    function eAll2(){
	    var pmIds=$("#pmIds").val();
	    console.log("pm-->"+pmIds);
	    var arr=new Array();
	    arr=pmIds.split(",");
	    if(arr.length>0){
	    for(var i=0;i<arr.length;i++){
	    	$('#'+arr[i]).val($('#'+arr[i]).attr("lang"));
	    }
	    }
    }
    
    //回收提交
    function submitForms(){
    	//组装json数据
    	var data="[";
    	//上午的数据
    	 var amIds=$("#amIds").val();
	    console.log("am-->"+amIds);
	      //下午的数据
	     var pmIds=$("#pmIds").val();
	    console.log("pm-->"+pmIds);
	    if(isNulls(amIds)){
	    
	    var arr=new Array();
	    arr=amIds.split(",");
	    if(arr.length>0){
	    var id="id";
	    var id2="operationNumber";
	    //下午是否有值
		     if(isNulls(pmIds)){
			    for(var i=0;i<arr.length;i++){
			    var idV=arr[i].substring(1,arr[i].length);
			    var id2V=$("#"+arr[i]).val();
			     console.log("id--"+id);
			    data+='{"'+id+'":"'+idV+'",';
			     data+='"'+id2+'":"'+id2V+'"';
			     data+="},";
			    }
		    }else{
		    for(var i=0;i<arr.length-1;i++){
			    var idV=arr[i].substring(1,arr[i].length);
			    var id2V=$("#"+arr[i]).val();
			     console.log("id--"+id);
			    data+='{"'+id+'":"'+idV+'",';
			     data+='"'+id2+'":"'+id2V+'"';
			     data+="},";
			    }
		    	 var idV=arr[arr.length-1].substring(1,arr[arr.length-1].length);
			    var id2V=$("#"+arr[arr.length-1]).val();
		   		 data+='{"'+id+'":"'+idV+'",'
		    	 data+='"'+id2+'":"'+id2V+'"';
		     	 data+="}";
		    }
	     }
	    }
	    
	    if(isNulls(pmIds)){
	    var arr2=new Array();
	    arr2=pmIds.split(",");
	    if(arr2.length>0){
	     var id="id";
		 var id2="operationNumber";
	    for(var i=0;i<arr2.length-1;i++){
		    var idV=arr2[i].substring(1,arr2[i].length);
		    var id2V=$("#"+arr2[i]).val();
		    data+='{"'+id+'":"'+idV+'",';
		     data+='"'+id2+'":"'+id2V+'"';
		     data+="},";
	    // data+='"'+arr2[i]+'":"'+$("#"+arr2[i]).val()+'",';
	    }
	    var idV=arr2[arr2.length-1].substring(1,arr2[arr2.length-1].length);
		    var id2V=$("#"+arr2[arr2.length-1]).val();
	    data+='{"'+id+'":"'+idV+'",'
	     data+='"'+id2+'":"'+id2V+'"';
	      data+="}";
	    }
	    
	    }
	data+="]";
  	console.log("data"+data);
  	//传参
  	//var datas= $.parseJSON( data );
  	var datas=data;
  	console.log("data-->"+datas);
  		$.ajax({
    	type:"post",
    	dataType:'json',
    	contentType: "application/json;charset=UTF-8",//指定消息请求类型
    	data:datas,
			async:false,
			url:"${path}/release/callBackReleaseNumber",
			success:function(result){
			console.log("ajax执行成功--"+JSON.stringify(result));
			if(JSON.stringify(result)=="{}"){
				$("#ws").hide();
				$.messager.show({
					title:'提示',
					msg:'回收成功',
					timeout:3000,
					showType:'slide'
				  });
				  window.location.href="${path}/release/toReleases";
				}else{
					$("#ws").hide();
					alert("部分时间段回收失败！原因：此时有用户已经预约，造成回收数量大于可预约数量！请重新回收！");
				}
			},
			error:function(result){
				$.messager.show({
					title:'提示',
					msg:'回收失败，请重新尝试！',
					timeout:3000,
					showType:'slide'
				  });
			}
		});
	    
	    
    }	
    	
    //增加放号模板	
   function addModuleForm(){
   //组装json数据
    	var data="[";
    	
	    //模板的数据
	     var arrM=$("#arrM").val();
	    console.log("arrM-->"+arrM);
	    var arr=new Array();
	    arr=arrM.split(",");
	    if(arr.length>0){
	    	var id="period";
	    	 var id2="timeIterval";
		    var id3="appointmentNumber";
	    for(var i=0;i<arr.length-1;i++){
		   var idV=$("#p"+arr[i]).val();
		    var id2V=$("#"+arr[i]).val();
		    var id3V=$("#a"+arr[i]).val();
		      console.log("idV-->"+idV);
		        console.log("id2V-->"+id2V);
		          console.log("id3V-->"+id3V);
		    data+='{"'+id+'":"'+idV+'",';
		     data+='"'+id2+'":"'+id2V+'",';
		      data+='"'+id3+'":"'+id3V+'"';
		     data+="},";
	    // data+='"'+arr2[i]+'":"'+$("#"+arr2[i]).val()+'",';
	    }
	    var idV=$("#p"+arr[arr.length-1]).val();
		    var id2V=$("#"+arr[arr.length-1]).val();
		     var id3V=$("#a"+arr[arr.length-1]).val();
	    data+='{"'+id+'":"'+idV+'",'
	     data+='"'+id2+'":"'+id2V+'",';
	        data+='"'+id3+'":"'+id3V+'"';
	      data+="}";
	    }
	data+="]";
  	console.log("data"+data);
  	//传参
  	//var datas= $.parseJSON( data );
  	var datas=data;
  	console.log("data-->"+datas);
  		$.ajax({
    	type:"post",
    	dataType:'json',
    	contentType: "application/json;charset=UTF-8",//指定消息请求类型
    	data:datas,
			async:false,
			url:"${path}/modules/insertModules",
			success:function(result){
			console.log("ajax执行成功--"+JSON.stringify(result));
			if(JSON.stringify(result)=="{}"){
				$("#modules").hide();
				$.messager.show({
					title:'提示',
					msg:'新增模板成功',
					timeout:3000,
					showType:'slide'
				  });
				   window.location.href="${path}/release/toReleases";
				}else{
					$("#modules").hide();
					alert("新增模板失败！请重新新增！");
				}
			},
			error:function(result){
				$.messager.show({
					title:'提示',
					msg:'新增失败，请重新尝试！',
					timeout:3000,
					showType:'slide'
				  });
			}
		});
	    
	    
    }	
    	
    	
    </script>
</body>
</html>