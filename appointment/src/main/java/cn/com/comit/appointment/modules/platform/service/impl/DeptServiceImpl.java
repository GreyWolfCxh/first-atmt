package cn.com.comit.appointment.modules.platform.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.com.comit.appointment.modules.platform.dao.DeptMapper;
import cn.com.comit.appointment.modules.platform.entity.Dept;
import cn.com.comit.appointment.modules.platform.paramVo.DeptVo;
import cn.com.comit.appointment.modules.platform.service.IDeptService;
import cn.com.comit.appointment.modules.sys.entity.User;


/**
 * 部门Service
 */
@Service("DeptServiceImpl")
@Transactional(readOnly = true)
public class DeptServiceImpl implements IDeptService{
	
	@Autowired
	private DeptMapper deptMapper;

	@Override
	public List<Dept> getDeptList(Dept dept) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer getDeptTotalCount(Dept dept) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Dept getDeptById(Dept dept) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Dept> getDeptByAreaId(Dept dept) {
		return deptMapper.getDeptByAreaId(dept);
	}

	@Override
	public List<DeptVo> findDeptByAreaId(Integer areaId) {
		System.out.println("DEPT-------->"+deptMapper.findDeptByAreaId(areaId));
		return deptMapper.findDeptByAreaId(areaId);
	}

	@Override
	public DeptVo findDeptByDeptId(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Dept findDeptByUserId(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	

	
}
