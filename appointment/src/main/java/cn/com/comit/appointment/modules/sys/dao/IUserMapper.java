package cn.com.comit.appointment.modules.sys.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.comit.appointment.modules.sys.entity.User;


/**
 * 用户映射接口
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public interface IUserMapper {

	public User getUserByLoginName(User user);

	public User getUserById(User user);

	public Integer getUserTotalCount(User user);

	public List<User> getUserList(User user);

	public Integer numValidate(User user);

	public void insertUser(User user);

	public void updateUser(User user);

	public void delUser(User user);


	public void insertUserRole(User user);

	public Integer getUserCountByDepts(@Param("depts")Integer[] deptIds, @Param("currentUser")User user);

	public List<User> getUserListByDeptsAndRandom(@Param("depts")Integer[] deptIds, @Param("num")Integer num, @Param("currentUser")User user);
	
	public List<User> getUserListByRandom(@Param("num")Integer num, @Param("currentUser")User user);


	public User getUserByIdForLogin(User user);
	
	public User getUserByLoginNameForLogin(User user);
}
