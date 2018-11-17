package cn.com.comit.appointment.modules.releases.controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

import cn.com.comit.appointment.modules.releases.entity.Modules;


/**
 * 放号管理控制器接口
 * @author admin
 *
 */
public interface IReleaseController {
	
	/**
	 * 跳转到放号管理页面
	 * @return
	 */
	public String toReleases(ModelMap modelMap);
	
	/**
	 * 批量放号
	 * @param module 时间段模板
	 * @param listDate 日期
	 * @return
	 */
	String batchReleaseNumber(ModelMap map,Modules module,@RequestParam("workDays")String workDays);

}
