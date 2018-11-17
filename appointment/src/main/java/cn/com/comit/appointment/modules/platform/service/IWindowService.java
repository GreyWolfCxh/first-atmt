package cn.com.comit.appointment.modules.platform.service;

import java.util.List;

import cn.com.comit.appointment.modules.platform.entity.Windows;
import cn.com.comit.appointment.modules.platform.paramVo.DeptVo;
import cn.com.comit.appointment.modules.platform.paramVo.WinToDeptVo;
import cn.com.comit.appointment.modules.platform.paramVo.WindowVo;

/**
 * 处理窗口服务接口
 * @author ChenXiHua
 * @version 2018-10-23
 *
 */
public interface IWindowService {
	
	/**
	 * 新增处理窗口
	 * @param window
	 * @return
	 */
	Integer insertWindow(Windows window);
	
	/**
	 * 修改处理窗口
	 * @param window
	 * @return
	 */
	Integer updateWindow(Windows window);
	
	/**
	 * 获取【执法部门--处理窗口】信息
	 * @return
	 */
	List<WindowVo>getWindowVo();
	
	/**
	 * 根据id获取窗口信息
	 * @param id
	 * @return
	 */
	Windows findWindowById(Integer id);
	
	/**
	 * 新增窗口和部门关联表
	 * @param deptId 部门id
	 * @param windowId   窗口id
	 * @return
	 */
	boolean insertWindowAndDept(Integer deptId, Integer windowId);
	
	/**
	 * 获取窗口关联部门数据
	 * @param winToDeptVo
	 * @return
	 */
	List<WinToDeptVo> findDeptAndWindow(WinToDeptVo winToDeptVo);
	
	/**
	 * 获取窗口关联部门总数
	 * @param deptVo
	 * @return
	 */
	Integer findDeptAndWindowCount(WinToDeptVo winToDeptVo);
	
	/**
	 * 获取所有处理窗口信息
	 * @return
	 */
	List<DeptVo> findAllWindow();
	
	/**
	 * 修改处理窗口预约天数
	 * @param window
	 * @return
	 */
	boolean updateWindowDays(Windows window);
	
	/**
	 * 根据违章类型id获取窗口信息
	 * @param id
	 * @return
	 */
	List<Windows> findWindowsByIllegalId(Integer id);
	
	

}
