package cn.com.comit.appointment.modules.sys.service;

import java.util.List;

import cn.com.comit.appointment.modules.sys.entity.User;


/**
 * 用户服务接口
 * @author ChenXiHua
 * @version 2018-10-23
 *
 */
public interface IUserService {

	public Integer getUserTotalCount(User user);

	public List getUserList(User user);

	public void insertUser(User user);

	public void delUser(User user);

	public User getUserById(User user);


	public boolean numValidate(User user);

	public void insertMoreUser(List<User> list);


}
