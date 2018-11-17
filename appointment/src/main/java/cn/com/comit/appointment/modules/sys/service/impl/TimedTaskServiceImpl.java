package cn.com.comit.appointment.modules.sys.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sun.tools.extcheck.Main;

import cn.com.comit.appointment.common.utils.DateUtils;
import cn.com.comit.appointment.modules.sys.service.TimedTaskService;
import cn.com.comit.appointment.modules.wechat.entity.TemplateData;
import cn.com.comit.appointment.modules.wechat.utils.WX_TemplateMsgUtil;
import cn.com.comit.appointment.modules.workbench.dao.AppointmentRecordsMapper;
import cn.com.comit.appointment.modules.workbench.entity.AppointmentRecords;


/**
 * 定时任务实现类
 * @author admin
 *
 */
@Service("TimedTaskServiceImpl")
public class TimedTaskServiceImpl implements TimedTaskService{
	
	public Logger log=LoggerFactory.getLogger(TimedTaskServiceImpl.class);
	
	@Autowired
	private AppointmentRecordsMapper appointmentRecordsMapper;

	@Override
	public void sendMessageToInform() {
		System.out.println("定时任务：发送推送信息和短信信息");
		log.info("定时任务：发送推送信息和短信信息 start ....");
	       try {
	           //取当前小时减一个小时
	           Calendar calendar = Calendar.getInstance();
	           //calendar.set(Calendar.HOUR_OF_DAY, calendar.get(Calendar.HOUR_OF_DAY) - 1);
	           SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	           SimpleDateFormat df1 = new SimpleDateFormat("HH:mm");
	           //前一个小时
	           String frontTime = df.format(getNextDay(new Date()));
	           String time = df1.format(getNextDay(new Date()));
				//然后根据时间去数据库匹配
	           System.out.println("测试时间-------"+frontTime);
	           System.out.println("测试时间-------"+time);
	           
	           Map<String,TemplateData> param = new HashMap<>();
	            param.put("first",new TemplateData("恭喜预约成功！","#696969"));
	            param.put("keyword1",new TemplateData(DateUtils.getDate(),"#696969"));
	            param.put("keyword2",new TemplateData("宝安处理窗口","#696969"));
	            param.put("keyword3",new TemplateData("深圳市","#696969"));
	            param.put("remark",new TemplateData("很高兴为你服务，预约当天请记得来哦！","#696969"));
	            //注册的微信-模板Id
	           // String regTempId =  WX_TemplateMsgUtil.getWXTemplateMsgId("ywBb70467vr18");
	            String openId="ozCNi1tFuR6PGG-SFAbCGgRADvZI";
	            String moduleId="I-pGWBLif2upnmsanxCHq15n1XlwFl6O7HVTZbYGnJc";
	            JSON.toJSONString(param);
	            JSONObject jsonObject = JSONObject.parseObject(JSON.toJSONString(param));
	            System.out.println("jsonObject-->"+jsonObject);
	            //调用发送微信消息给用户的接口
	          WX_TemplateMsgUtil.sendWechatMsgToUser(openId,moduleId, "", 
	                  "#000000", jsonObject);
	           
	           
	           
	           
	       }catch (Exception e){
	    	   log.error("定时任务：发送推送信息和短信信息错误: " + e.getMessage() + e);
	       }

	       log.info("定时任务：发送推送信息和短信信息  end ....");
	}
	
	
	public static Date getNextDay(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, 1);
		date = calendar.getTime();
		return date;
	}
	

	@Override
	public void updateAppointmentStatus() {
		 try {
		System.out.println("定时任务：修改预约状态");
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
         //前一个小时
         String frontTime = df.format(getNextDay(new Date()));
       //然后根据时间去数据库匹配
         System.out.println("测试时间-------"+frontTime);
         log.info("定时任务：改变预约记录状态  end ....");
         
         List<AppointmentRecords>list=appointmentRecordsMapper.findAppointmentFailRecord(DateUtils.getDate());
         System.out.println("改变预约记录状态---》"+list.toString());
         //修改状态为已过期 1--》3
         for(AppointmentRecords record:list){
        	 record.setStatus(3);
        	 appointmentRecordsMapper.updateByPrimaryKeySelective(record);
         }
         
		 }catch (Exception e){
	    	   log.error("定时任务：改变预约记录状态 : " + e.getMessage() + e);
	       }

	       log.info("定时任务：改变预约记录状态   end ....");
	}
	
	public static void main(String []args){
		String time=DateUtils.getDate();
		System.out.println("d-->"+time);
	}

}
