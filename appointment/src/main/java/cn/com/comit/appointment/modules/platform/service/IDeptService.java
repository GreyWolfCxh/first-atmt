package cn.com.comit.appointment.modules.platform.service;

import java.util.List;

import cn.com.comit.appointment.modules.platform.entity.Dept;
import cn.com.comit.appointment.modules.platform.paramVo.DeptVo;
import cn.com.comit.appointment.modules.sys.entity.User;


/**
 * 部门服务接口
 * @author ChenXiHua
 * @version 2018-10-23
 *
 */
public interface IDeptService {

	List<Dept> getDeptList(Dept dept);

	Integer getDeptTotalCount(Dept dept);


	Dept getDeptById(Dept dept);


	List<Dept> getDeptByAreaId(Dept dept);
	
	List<DeptVo> findDeptByAreaId(Integer areaId);

	DeptVo findDeptByDeptId(Integer id);
	
	//根据用户id获取部门id
	Dept findDeptByUserId(User user);


}
