package cn.com.comit.appointment.modules.platform.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.comit.appointment.modules.platform.dao.DeptMapper;
import cn.com.comit.appointment.modules.platform.dao.WindowsMapper;
import cn.com.comit.appointment.modules.platform.entity.Dept;
import cn.com.comit.appointment.modules.platform.entity.Windows;
import cn.com.comit.appointment.modules.platform.paramVo.DeptVo;
import cn.com.comit.appointment.modules.platform.paramVo.WinToDeptVo;
import cn.com.comit.appointment.modules.platform.paramVo.WindowVo;
import cn.com.comit.appointment.modules.platform.service.IWindowService;

/**
 * 处理窗口服务接口实现类
 * @author admin
 *
 */
@Service("IWindowServiceImpl")
public class IWindowServiceImpl implements IWindowService{
	
	@Autowired
	private WindowsMapper windowsMapper;
	@Autowired
	private DeptMapper deptMapper;

	@Override
	public Integer insertWindow(Windows window) {
		windowsMapper.insertSelective(window);
		return 1;
	}

	@Override
	public Integer updateWindow(Windows window) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WindowVo> getWindowVo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Windows findWindowById(Integer id) {
		return windowsMapper.selectByPrimaryKey(id);
	}


	@Override
	public List<WinToDeptVo> findDeptAndWindow(WinToDeptVo winToDeptVo) {
		return windowsMapper.findDeptAndWindow(winToDeptVo);
	}

	@Override
	public Integer findDeptAndWindowCount(WinToDeptVo winToDeptVo) {
		return windowsMapper.findDeptAndWindowCount(winToDeptVo);
	}

	@Override
	@Transactional
	public boolean insertWindowAndDept(Integer deptId, Integer windowId) {
		boolean flag=false;
		Map map=new HashMap(8);
		map.put("windowId",windowId);
		map.put("deptId",deptId);
		//查找是否已经存在该数据
		if(windowsMapper.findDeptAndWindowById(map)!=null){
			return flag;
		}
		//插入新数据
			int val=windowsMapper.insertWindowAndDept(map);
			System.out.println("val-->"+val);
			if(val>0){
				Windows win=deptMapper.findDeptById(windowId);
				System.out.println("wind-------->"+win.toString());
				//设置默认预约天数为6天
				win.setAppointmentDays(6);
				win.setTime(new Date());
				win.setUpdateTime(new Date());
				windowsMapper.insertSelective(win);
				flag=true;
			}
		return flag;
	}

	@Override
	public List<DeptVo> findAllWindow() {
		return windowsMapper.findAllWindow();
	}

	@Override
	@Transactional
	public boolean updateWindowDays(Windows window) {
		Integer id=windowsMapper.updateByPrimaryKeySelective(window);
		if(id>0){
			return true;
		}
		return false;
	}

	@Override
	public List<Windows> findWindowsByIllegalId(Integer id) {
		return windowsMapper.findWindowsByIllegalId(id);
	}


}
