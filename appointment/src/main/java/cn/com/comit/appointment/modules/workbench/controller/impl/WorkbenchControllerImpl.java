package cn.com.comit.appointment.modules.workbench.controller.impl;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import cn.com.comit.appointment.common.utils.DateUtils;
import cn.com.comit.appointment.modules.releases.entity.Releases;
import cn.com.comit.appointment.modules.releases.service.IReleaseServer;
import cn.com.comit.appointment.modules.sys.utils.UserUtils;
import cn.com.comit.appointment.modules.workbench.controller.IWorkbenchController;
import cn.com.comit.appointment.modules.workbench.entity.AppointmentRecords;

/**
 * 工作台控制器
 * @author ChenXiHua
 * @version 2018-10-26
 */

@Controller
@RequestMapping("/workbench")
public class WorkbenchControllerImpl implements IWorkbenchController {
	
	@Autowired
	private IReleaseServer releaseServer;
	
	@Override
	@RequestMapping("/toWork")
	public String toWork(ModelMap modelMap) {
		return "modules/workbench/work";
	}
	
	
	@RequestMapping("/getRelease")
	@ResponseBody
	public Map<String,Object> getRelease( @RequestParam("date")String date) {
		System.out.println("工作台页面-------------"+date);
		Map map=new HashMap<String,Object>(8);
		List<Releases> list=releaseServer.getReleasesByDateAndPeriod(date,1);
		List<Releases> list2=releaseServer.getReleasesByDateAndPeriod(date,2);
		System.out.println("list"+list.toString());
		map.put("resultSet",list);
		map.put("resultSet2",list2);
		return map;
	}
	
	
	
	@RequestMapping("/toAppointmentRecord")
	public String toAppointmentRecord(ModelMap modelMap, @RequestParam("timeItersal") String time,@RequestParam("day")String day) {
		if(day!=null){
			System.out.println("day--->"+day);
			System.out.println("dat---"+DateUtils.timeStamp2Date(day));
				List<String>timeItersal=releaseServer.findAppointTimeByDate(DateUtils.timeStamp2Date(day));
				System.out.println("sss=---->"+timeItersal.toString());
				System.out.println("sss=---->"+time);
				Object timeItersals = JSONObject.toJSON(timeItersal);
				modelMap.put("time", time);
				modelMap.put("timeItersals", timeItersals);
				modelMap.put("day", DateUtils.timeStamp2Date(day));
		}
		return "modules/workbench/appointment1";
	}
	
	
	@RequestMapping("/toAppointmentRecord1")
	public String toAppointmentRecord1(ModelMap modelMap, AppointmentRecords appointmentRecords) {
		System.out.println("appointmentRecords-->"+appointmentRecords.toString());
		Object appointRecords = JSONObject.toJSON(appointmentRecords);
		modelMap.put("appointRecords", appointRecords);
		return "modules/workbench/appointment2";
	}
	

}
