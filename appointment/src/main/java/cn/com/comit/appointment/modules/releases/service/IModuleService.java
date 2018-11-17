package cn.com.comit.appointment.modules.releases.service;

import java.util.List;
import java.util.Map;

import cn.com.comit.appointment.modules.releases.entity.Modules;

public interface IModuleService {
	
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
	Map<String,String> updateModules(List<Modules>modules);
	
	/**
	 * 根据部门编号和模板版本号删除
	 * @param module【deptId，version】
	 * @return
	 */
	Map<String,String> delModuleByDeptIdAndVersion(Integer version);
	
	/**
	 * 根据部门编号获取模板
	 * @return
	 */
	List<Map<String,Object>> findModulesByDeptId();

	/**
	 * 根据版本获取放号模板
	 * @param version
	 * @return
	 */
	Map<String,Object> getModulesByVersion(Integer version);
	

}
