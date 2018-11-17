package cn.com.comit.appointment.modules.platform.controller;

import java.util.List;

import org.springframework.ui.ModelMap;

import cn.com.comit.appointment.modules.platform.paramVo.DeptVo;

/**
 * 处理窗口控制器接口
 * @author ChenXiHua
 * @version 2018-10-23
 *
 */
public interface IWindowController {
	
	/**
	 * 跳转到处理窗口管理页面
	 * @return
	 */
	public String toWindow(ModelMap map);
	
	/**
	 * 根据ID获取部门信息
	 * @param areaId 地区ID
	 * @return
	 */
	public List<DeptVo>findDeptByAreaId();
	
	/**
	 * 增加处理窗口
	 * @return
	 */
	public Integer insertWindow();
	
	/**
	 * 修改处理窗口
	 * @return
	 */
	public Integer updateWindow();

}
