package cn.com.comit.appointment.modules.releases.controller;

import java.util.List;
import java.util.Map;

import org.springframework.ui.ModelMap;

import cn.com.comit.appointment.modules.releases.entity.Modules;

public interface IModuleController {
	
	
	
	/**
	 * 新增放号模板
	 * @param module
	 * @return
	 */
	Map<String,String>  insertModules(List<Modules>modules);
	
	/**
	 * 修改放号模板
	 * @param module
	 * @return
	 */
	Map<String,String>  updateModules(List<Modules>modules);
	
	/**
	 * 根据部门编号和模板版本号删除
	 * @param module【deptId，version】
	 * @return
	 */
	Map<String,String> delModuleByDeptIdAndVersion(Integer version);

}
