<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="decorator" content="default" /> 
<title>放号管理</title>
<script type="text/javascript">
	
</script>
<style type="text/css">
</style>
</head>
<body>

	<form method="post" name="form" action="${path}/release/batchReleaseNumber">
		<!--内容-->
		<div id="content" style="width: 100%; height: 410px;">
			<!--左边-->
			<div style="float: left;width:50%;height:300px;margin: auto;">
	<div align="center" style="width:50%;height:25px;border: solid #0081C2 1PX;margin: auto;"><span>9:41</span></div>
		<div id="cc" class="easyui-calendar"
					style="margin-left:160px;width: 322px; height: 250px;"></div>
		<div align="center" style="width:50%;height:25px;border: solid #0081C2 1PX;margin: auto;"><a href="#" onclick="cs()" >全选</a>
		<!-- </br>
		<input id="date" /><input id="date1" /><input id="date2" />
	</br>
	<input id="listDate" name="listDate" /> -->
		</div>
		</div>
			<!--left end-->


			<!--右边-->
			<div style="float: right; width: 50%; height: 300px;">
				<iframe src="${path}/base/goPath/modules/release/modules" style="width:100%;height:290px;border:0px;" id="moduleFrame" frameborder=0>
			</iframe>
				
			</div>
			<!--右边结束-->



		</div>
		<!--content end-->

		<div
			style="padding: 50px; width: 100%; height: 10px; margin-top: 0px;"></div>
		<div style="height: 50px; margin: auto;" align="center">
			<table id="table2" border="1" cellspacing="0" cellpadding="0"
				style="width: 700px; height: 50px; text-align: center;">
				<tr>
					<td><input type="submit" value="放号" /></td>
				</tr>
			</table>
		</div>


	</form>
	
	<!--回收框-->
	<div id="dlg" class="easyui-dialog" style="width:660px;height:480px;padding:10px 20px"
		closed="true" buttons="#dlg-buttons">
		<table border="1" cellspacing="0" cellpadding="0" style="width: 600px;height: 300px;text-align:center;">
			<h3>调整xx放号</h3>
			<tr>
				<th>上午
				<input  type="button" value="剩余回收"/>
				</th>
				<th>下午
				<input  type="button" value="剩余回收"/>
				</th>
			</tr>
			<tr>
				<td>
					8:00-9:00</br>
						办理：39/40
					
				</td>
				<td>
					13:00-14:00</br>
					办理：39/40
					
				</td>
			</tr>
			
			<tr>
				<td>
					9:00-10:00</br>
						办理：39/40
					
				</td>
				<td>
					14:00-15:00</br>
						办理：39/40
					
				</td>
			</tr>
			
			<tr>
				<td>
					10:00-11:00</br>
						办理：39/40
					
				</td>
				<td>
					15:00-16:00</br>
						办理：39/40
					
				</td>
			</tr>
		</table>
	</div>
	<div id="dlg-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveField()">Save</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
	</div>


<script type="text/javascript" >
		function cs(){
		alert("cs");
   			var startDate = new Date($("#date1").val());
			var endDate = new Date($("#date2").val());
			console.log("start--"+startDate);
			var festival = ["1-1","5-1","10-1"];//法定节假日
			var listDate=[];
			for (
			    var d = new Date(startDate.getTime());
			    d.getTime() <= endDate.getTime();
			    d.setDate(d.getDate()+1)
			) {
			    if (d.getDay()!=0 && d.getDay()!=6 && festival.indexOf((d.getMonth()+1)+"-"+d.getDate())==-1){
			        //console.log(d.toLocaleDateString());
			        listDate.push(d.toLocaleDateString());
			        //console.log("time--"+time);
			        var time=d.toLocaleDateString();
			        	
				}
			 }
			
			        			
			 for( var index = 0; index < listDate.length; index ++){
			        			 	console.log(listDate[index]+"==========");
			        	$('#cc').calendar({
			        		 current:new Date(listDate[index]),
			        		 styler:function (date) {
			        			console.log("sty-------"+date.toLocaleDateString());
					            if(date.toLocaleDateString()===listDate[index]|| date.toLocaleDateString()==='2018/10/18'){
					                 return "background-color:red";
					            }
					        },
			        	});
			        			 	
			    }
			        			 	
			        			 	
			        			 	
			console.log("date-->"+listDate);
			$("#listDate").val(listDate);

		}
	</script>



<script type="text/javascript">
		$(function() {
			$('#cc')
					.calendar(
							{
								current : new Date(),
								formatter : function(date) {
								
									  var MonthNextFirstDay = new Date(date.getFullYear(), date.getMonth(), 1);
						            	var FirstDay = new Date(date.getFullYear(), date.getMonth()-1, 1);
						        			var lastDay = new Date(MonthNextFirstDay - 86400000);
										console.log("date---"+date);
						            	$("#date").val(date.getFullYear()+"-"+date.getMonth());
						            	$("#date2").val(lastDay.toLocaleDateString());
						            	$("#date1").val(FirstDay.toLocaleDateString());
								}
									
			});
		});

		$('#cc').calendar(
				{
					onSelect : function(date) {
						/* alert(date.getFullYear() + ":" + (date.getMonth() + 1)
								+ ":" + date.getDate()); */
						window.location.href="${path}/work/toWork?date="+date;
					}
				});
	</script>

	<script type="text/javascript">
		function cs() {
			var startDate = new Date($("#date1").val());
			var endDate = new Date($("#date2").val());
			console.log("start--" + startDate);
			var festival = [ "1-1", "5-1", "10-1" ];//法定节假日
			var listDate=[];
			for (var d = new Date(startDate.getTime()); d.getTime() <= endDate
					.getTime(); d.setDate(d.getDate() + 1)) {
				if (d.getDay() != 0
						&& d.getDay() != 6
						&& festival.indexOf((d.getMonth() + 1) + "-"
								+ d.getDate()) == -1) {
					console.log(d.toLocaleString());
					 listDate.push(d.toLocaleString());
					
				}
			}
			console.log("date-->"+listDate);
			$("#listDate").val(listDate);
			$('#cc')
					.calendar(
							{
						
					});
			
		}
	</script>
	
	<script type="text/javascript">
		
	</script>
</body>
</html>