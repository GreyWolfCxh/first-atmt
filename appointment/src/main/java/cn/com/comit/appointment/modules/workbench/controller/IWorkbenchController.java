package cn.com.comit.appointment.modules.workbench.controller;

import org.springframework.ui.ModelMap;

import cn.com.comit.appointment.modules.workbench.entity.AppointmentRecords;

/**
 * 工作台控制器接口
 * @author admin
 *
 */
public interface IWorkbenchController {
	
	/**
	 * 跳到工作台页面
	 * @param modelMap
	 * @return
	 */
	public String toWork(ModelMap modelMap);
	
	/**
	 * 跳到预约记录页面
	 * @return
	 */
	public String toAppointmentRecord(ModelMap modelMap,String time,String day);

}
