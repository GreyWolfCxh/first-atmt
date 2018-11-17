package cn.com.comit.appointment.modules.workbench.controller.impl;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.comit.appointment.modules.platform.controller.impl.WindowControllerImpl;
import cn.com.comit.appointment.modules.platform.paramVo.WinToDeptVo;
import cn.com.comit.appointment.modules.workbench.controller.IAppointmentRecordController;
import cn.com.comit.appointment.modules.workbench.entity.AppointmentRecords;
import cn.com.comit.appointment.modules.workbench.service.IAppointmentRecordService;

/**
 * 预约记录控制器
 * @author ChenXiHua
 * @version 2018-10-29
 *
 */
@Controller
@RequestMapping("/appointmentRecord")
public class AppointmentRecordController implements IAppointmentRecordController {
	
	public Logger log=LoggerFactory.getLogger(WindowControllerImpl.class);
	
	@Autowired
	private IAppointmentRecordService appointmentRecordService;
	
	@RequestMapping("/findAppointmentRecord")
	@ResponseBody
	public  Map<String,Object> findAppointmentRecord(AppointmentRecords appointmentRecords){
		Map map=new HashMap<String,Object>(8);
		System.out.println("cs--->"+appointmentRecords.toString());
		map.put("rows", appointmentRecordService.findAppointmentRecord(appointmentRecords));
		map.put("total", appointmentRecordService.findAppointmentRecordCount(appointmentRecords));
		System.out.println("-----"+map.toString());
		return map;
	}
	
	
	@RequestMapping("/findAppointmentRecord1")
	@ResponseBody
	public  Map<String,Object> findAppointmentRecord1(AppointmentRecords appointmentRecords){
		log.info("处理窗口---》显示执法部门对应处理窗口");
		Map map=new HashMap<String,Object>(8);
		System.out.println("cs--->"+appointmentRecords.toString());
		map.put("rows", appointmentRecordService.findAppointmentRecord1(appointmentRecords));
		map.put("total", appointmentRecordService.findAppointmentRecordCount1(appointmentRecords));
		System.out.println("-----"+map.toString());
		return map;
	}
	
	

}
