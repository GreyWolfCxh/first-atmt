<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="${staticPath}/css/wechat/weui.css"/>
    <link rel="stylesheet" href="${staticPath}/css/wechat/weuix.css"/>
    
<%-- <script type="text/javascript" src="${staticPath}/jquery-easyui/jquery-1.8.0.min.js"></script> --%>
<script type="text/javascript" src="${staticPath}/jquery/jquery.form.js"></script>


     <script src="${staticPath}/js/wechat/zepto.js"></script>
    <script type="text/javascript" src="${staticPath}/js/wechat/jweixin-1.0.0.js"></script>
    <script src="${staticPath}/js/wechat/weui.min.js"></script>
    <!--<script src="js/example.js"></script>-->
    <script>
        $(function(){


        });

    </script>
    <style>
   
   #icon{
        font-size: 24px;
        line-height: 40px;
        margin: 5px 0;
        color:#10AEFF;
        -webkit-transition: font-size 0.5s ease-out 0s;
        -moz-transition: font-size 0.5s ease-out 0s;
        transition: font-size 0.5s ease-out 0s;

    }
</style>
 <style>
     #cs #w{height:50px;width:100px;margin:5px 15px;
        float: left;
        }
        
       p{
       	padding-left: 20px;
       } 
    </style>
    <script type="text/javascript">
    
    
    </script>

</head>

<body ontouchstart class="page-bg">
	
  <div class="icon-box" align="center">
            <i class="weui-icon-success weui-icon_msg"></i>
           </br>
           <h3>预约成功</h3></br>
           <!-- <p>你的预约号码为：88888888|${map.files }</p> -->
           <p>你的预约号码为：${map.appointCode }</p>
          <a href="${path }/wechat/toAppointment?userCode=${map.userCode }" class="weui-btn weui-btn_mini weui-btn_primary">继续下一个预约</a>
           	<a href="${path }/wechat/toMyAppoint?userCode=${map.userCode }" class="weui-btn weui-btn_mini weui-btn_primary">我的预约</a>
            
  </div>
	<div class="weui-panel__ft" style="margin-top: 50px;">
		<h3 style="padding-left: 10px;">温馨提示</h3>
		<p>您好!为节约您宝贵的时间，顺利办理违章业务，请您仔细阅读本提示及《深圳市交通运输委员会违法行为通知书》(以下简称“通知书”)，并提前自行备齐所签收的执法文书及以下材料(原件和复议件)后，再前往违章处理窗口接受处理。</p>
  <p style="font-weight: bolder;">一、《通知书》记载的当事人为公民的案件</p>
  <p>(一)《通知书》记载的当事人本人处理:
  带齐本人身份证、涉案司机驾驶证、涉案车辆行驶证(以上资料验原件留复印件)和银行卡，共4种材料。</p>
 <p> (二)《通知书》记载的当事人委托他人处理(一般案件):  带齐当事人身份证、受托人身份证、涉案司机驾驶证、涉案车辆行驶证(以上资料验原件留复印件)、公民委托书(须由当事人签名并捺手印)和银行卡，共6种材料。
 <p style="font-weight: bolder;"> 二、《通知书》记载的当事人为法人/其他组织的案件</p>
  <p>(一)《通知书》记载的当事人为法人的:  带齐公司营业执照、受托人身份证、涉案司机驾驶证、涉案车辆行驶证(以上资料验原件留复印件)、公司授权委托书(盖公章)和银行卡，共6种材料。</p>
 <p> (二)《通知书》记载的当事人为个体工商户、个人独资企业:  1、经营者本人前来处理的，带齐个体工商户或企业营业执照、经营者身份证、涉案司机驾驶证、涉案车辆行驶证(以上资料验原件留复印件)和银行卡，共5种材料。  2、委托他人前来处理的，带齐个体工商户或企业营业执照、受托人身份证、涉案司机驾驶证、涉案车辆行驶证(以上资料验原件留复印件)、经营者授权委托书(须由经营者签名并捺手印)和银行卡，共6种材料。</p>
<p style="font-weight: bolder;">  三、其他提示 </p>
 <p> (一)根据《深圳经济特区道路交通安全管理条例》第一百二十条的规定:违反本条例第四十九条第一款、第二款规定，驾驶非营运车辆从事营运活动的，除由市交通运输管理部门依法处罚外，由市公安机关交通管理部门暂扣其机动车驾驶证六个月。一年内再次违反本条例第四十九条第一款、第二款规定的，由市公安机关交通管理部门吊销其机动车驾驶证。  </p>
 <p> (二)根据财政部门的要求，违章处理窗口不接受现金缴交业务，请使用银行卡缴交罚款。确需以现金形式缴交的，可到附近银行机构缴交。</p>
 <p> (三)请根据执法人员提示，前往相应违章处理窗口处理:</p>
 <p> 南山违章处理窗口南山区关口路50号   0755-26087904  </p>
  <p>宝安违章处理窗口宝安区宝民一路37号 0755-29660721</p>
 <p>龙岗违章处理窗口龙岗区龙岗街道深汕路7号(龙东汽车站对面) 0755-28922538	</p>	
	</div>




<br>
<br>

</body>
</html>