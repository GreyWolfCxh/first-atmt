package cn.com.comit.appointment.modules.sys.dao;
import java.util.List;

import cn.com.comit.appointment.modules.sys.entity.Menu;



/**
 * 登录菜单映射接口
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public interface IMenuMapper {

	List<Menu> findAllMenuList(Menu menu);

	List<Menu> findMenuByUserId(Menu menu);

	List<Menu> getMenuListByParentId(Menu menu);

}
