package cn.com.comit.appointment.modules.platform.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.comit.appointment.modules.platform.entity.Windows;
import cn.com.comit.appointment.modules.platform.paramVo.DeptVo;
import cn.com.comit.appointment.modules.platform.paramVo.WinToDeptVo;

/**
 * 处理窗口映射接口
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public interface WindowsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Windows record);

    int insertSelective(Windows record);

    Windows selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Windows record);

    int updateByPrimaryKey(Windows record);

    //新增窗口管理部门记录
	int insertWindowAndDept(Map map);
	//窗口关联部门信息
	List<WinToDeptVo> findDeptAndWindow(WinToDeptVo winToDeptVo);
	//窗口关联部门总数
	Integer findDeptAndWindowCount(WinToDeptVo winToDeptVo);
	//根据id查找窗口管理部门表
	Integer findDeptAndWindowById(Map map);
	//根据窗口id获取设置可预约天数
	Integer findDaysByWindowId(Integer windowId);
	//获取所有处理窗口信息
	List<DeptVo> findAllWindow();
	//根据违章类型获取窗口信息
	List<Windows> findWindowsByIllegalId(Integer id);
	//获取所有处理
	List<DeptVo> getAllWindows();
	//根据部门id获取窗口信息
	Windows findWindowsByDeptId(Integer deptId);
}