package cn.com.comit.appointment.modules.wechat.controller;

import java.util.Map;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

import cn.com.comit.appointment.modules.workbench.entity.AppointmentRecords;

/**
 * 微信公众号控制层接口
 * @author ChenXiHua
 * @version 2018-11-2
 *
 */
public interface IWechatController {
	
	
	/**
	 * 跳转到我的预约记录页面
	 * @param modelMap
	 * @param appointmentRecords
	 * @return
	 */
	public String toMyAppoint(ModelMap modelMap,AppointmentRecords appointmentRecords);
	
	/**
	 * 根据【微信账号，和记录状态】查询我的预约记录
	 * @param status 【1待办理，2已办理，3已过期】
	 * @param userCode
	 * @return
	 */
	Map<String,Object> findMyAppoint(@RequestParam("status")Integer status,@RequestParam("userCode")String userCode);
	
	/**
	 * 取消预约记录
	 * @param appointmentRecords
	 * @return
	 */
	Map<String,String> delMyAppoint(AppointmentRecords appointmentRecords);
	
	/**
	 * 跳转到违章查询页面
	 * @return
	 */
	String findIllegal();

}
