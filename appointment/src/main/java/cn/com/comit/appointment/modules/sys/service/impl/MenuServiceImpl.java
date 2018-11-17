package cn.com.comit.appointment.modules.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.comit.appointment.modules.sys.dao.IMenuMapper;
import cn.com.comit.appointment.modules.sys.dao.IUserMapper;
import cn.com.comit.appointment.modules.sys.entity.Menu;
import cn.com.comit.appointment.modules.sys.entity.User;
import cn.com.comit.appointment.modules.sys.service.IMenuService;

@Service("MenuServiceImpl")
public class MenuServiceImpl implements IMenuService {

	@Autowired
	private IMenuMapper menuMapper;
	
	@Autowired
	private IUserMapper userMapper;
	
	
	public void getUser(){
		User user=new User();
		user.setNum("ATMTADMIN");
		User us=userMapper.getUserByLoginName(user);
		System.out.println("us-->"+us.toString());
	}

	
	public List<Menu> getMenuListByParentId(Menu menu) {
		return menuMapper.getMenuListByParentId(menu);
	}

}
