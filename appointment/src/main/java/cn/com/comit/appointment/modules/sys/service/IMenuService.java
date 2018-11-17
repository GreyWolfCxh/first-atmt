package cn.com.comit.appointment.modules.sys.service;

import java.util.List;

import cn.com.comit.appointment.modules.sys.entity.Menu;

/**
 * 菜单服务接口
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public interface IMenuService {
	
	/**
	 * 获取菜单 
	 * @param menu
	 * @return
	 */
	public List<Menu> getMenuListByParentId(Menu menu);
	
	
	public void getUser();
}
