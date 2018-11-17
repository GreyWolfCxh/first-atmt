package cn.com.comit.appointment.modules.platform.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.comit.appointment.modules.platform.entity.Dept;
import cn.com.comit.appointment.modules.platform.entity.Windows;
import cn.com.comit.appointment.modules.platform.paramVo.DeptVo;
import cn.com.comit.appointment.modules.sys.entity.User;


/**
 * 部门映射接口
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public interface DeptMapper {

	List<Dept> getDeptList(Dept dept);

	Integer getDeptTotalCount(Dept dept);


	Dept getDeptById(Dept dept);


	List<Dept> getDeptByAreaId(Dept dept);

	Dept getDeptByNameAndAreaId(Dept dept);


	List<Dept> getDeptByAreaIds(@Param("areaIds")String[] areaIds,@Param("currentUser")User user);
	
	List<Dept> getAllDeptList(Dept dept);
	//获取部门信息根据地区id
	List<DeptVo> findDeptByAreaId(Integer areaId);
	//根据用户id获取部门id
	Integer findDeptIdByUserId(@Param("userId")Integer userId);
	//根据违章类型id获取窗口部门信息
	List<Dept> getWindowByIllegalId(Integer id);
	//根据id获取部门信息
	Windows findDeptById(Integer windowId);
}
