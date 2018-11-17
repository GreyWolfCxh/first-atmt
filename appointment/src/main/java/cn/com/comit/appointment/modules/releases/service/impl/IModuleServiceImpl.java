package cn.com.comit.appointment.modules.releases.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.comit.appointment.modules.platform.dao.DeptMapper;
import cn.com.comit.appointment.modules.releases.dao.ModulesMapper;
import cn.com.comit.appointment.modules.releases.entity.Modules;
import cn.com.comit.appointment.modules.releases.service.IModuleService;
import cn.com.comit.appointment.modules.sys.utils.UserUtils;

@Service("IModuleServiceImpl")
public class IModuleServiceImpl implements IModuleService {
	
	@Autowired
	private ModulesMapper modulesMapper;
	@Autowired
	private DeptMapper deptMapper;

	@Override
	@Transactional
	public Map<String,String>  insertModules(List<Modules> modules) {
		Map<String,String>map=new HashMap<String,String> (8);
		//获取放号部门id
		Integer deptId=deptMapper.findDeptIdByUserId(UserUtils.getUser().getId());
		System.out.println("dept----->"+deptId);
		//获得版本数
		Integer version=modulesMapper.findMaxVersionByDeptId(deptId);
		System.out.println("vs-->"+version);
		if(version==null){
			version=0;
		}
		System.out.println("vs-->"+version);
		for(Modules record : modules){
			record.setDeptId(deptId);
			record.setVersion(version+1);
			System.out.println(record.toString());
			Integer id= modulesMapper.insertSelective(record);
			if(id<=0){
				map.put("error","新增模板失败");
			}
		}
		return map;
	}

	@Override
	@Transactional
	public Map<String,String> updateModules(List<Modules> modules) {
		Map<String,String>map=new HashMap<String,String>(8);
		for(Modules record:modules){
			System.out.println("ms--->"+record.toString());
			Integer id=modulesMapper.updateByPrimaryKeySelective(record);
			if(id<=0){
				String msg="修改模板编号:"+record.getId()+"的数据失败！";
				String key=""+record.getId();
				map.put(key,msg);
			}
		}
		
		return map;
	}

	@Override
	public Map<String,String> delModuleByDeptIdAndVersion(Integer version) {
		Map<String,String>map=new HashMap<String,String>(8);
		//获取放号部门id
		Integer deptId=deptMapper.findDeptIdByUserId(UserUtils.getUser().getId());
		Integer id=modulesMapper.delModuleByDeptIdAndVersion(deptId,version);
		if(id<=0){
			String msg="部门编号为"+deptId+"放号模板编号为"+version+"删除失败！";
			String key=deptId+"-"+version;
			map.put(key, msg);
		}
		return map;
	}

	@Override
	public List<Map<String,Object>> findModulesByDeptId() {
		//获取放号部门id
		Integer deptId=deptMapper.findDeptIdByUserId(UserUtils.getUser().getId());
		//获得版本数
		List<Integer> versionList=modulesMapper.findVersionsByDeptId(deptId);
		List<Map<String,Object>>list=new ArrayList<Map<String,Object>>();
		System.out.println("dept----->"+deptId);
		if(versionList.size()>0){
			for(Integer version : versionList){
				System.out.println("am--->"+modulesMapper.findModules(deptId,version,1));
				Map<String,Object>map=new HashMap<String,Object>(8);
				//获取上午模板,1上午，2下午
				map.put("amList", modulesMapper.findModules(deptId,version,1));
				//获取下午模板
				map.put("pmList", modulesMapper.findModules(deptId,version,2));
				map.put("version",version);
				//增加版本模板
				list.add(map);
			}
			System.out.println("list--->"+list.toString());
			return list;
		}
		
		System.out.println("LIST--ss->"+list.toString());
		return list;
	}

	@Override
	public Map<String, Object> getModulesByVersion(Integer version) {
		Map<String,Object>map=new HashMap<String,Object>(8);
		//获取放号部门id
		Integer deptId=deptMapper.findDeptIdByUserId(UserUtils.getUser().getId());
		//获取上午模板
		map.put("amList", modulesMapper.findModules(deptId,version,1));
		//获取下午模板
		map.put("pmList", modulesMapper.findModules(deptId,version,2));
		return map;
	}

}
