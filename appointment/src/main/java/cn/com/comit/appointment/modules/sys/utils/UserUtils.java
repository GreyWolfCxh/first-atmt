package cn.com.comit.appointment.modules.sys.utils;


import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.alibaba.fastjson.JSONObject;

import cn.com.comit.appointment.common.config.Global;
import cn.com.comit.appointment.common.utils.CacheUtils;
import cn.com.comit.appointment.common.utils.SpringContextHolder;
import cn.com.comit.appointment.modules.sys.dao.IMenuMapper;
import cn.com.comit.appointment.modules.sys.dao.IUserMapper;
import cn.com.comit.appointment.modules.sys.entity.Menu;
import cn.com.comit.appointment.modules.sys.entity.User;



/**
 * 用户工具类
 * @author ZhengZongying
 * @version 2018-08-24
 */
public class UserUtils {
	
	private static IUserMapper userMapper = SpringContextHolder.getBean(IUserMapper.class);
//	private static IRoleDao roleDao = SpringContextHolder.getBean(IRoleDao.class);
	private static IMenuMapper menuMapper = SpringContextHolder.getBean(IMenuMapper.class);
	
	public static final String User_CACHE = "UserCache";
	public static final String User_CACHE_ID_ = "id_";
	public static final String User_CACHE_LOGIN_NAME_ = "ln";
	public static final String CACHE_MENU_LIST = "menuList";

		
	/**
	 * 根据ID获取用户 
	 * @param id
	 * @return 取不到返回null
	 */
	public static User get(Integer id){
		User user = (User)CacheUtils.get(User_CACHE, User_CACHE_ID_ + id);
		if(Global.isDeveloping()) {
			user = null;
		}
		if (user ==  null){
			user = userMapper.getUserByIdForLogin(new User(id));
			if (user == null){
				return null;
			}
//			user.setRole(roleDao.findRoleByUser(new Role(user)));
			CacheUtils.put(User_CACHE, User_CACHE_ID_ + user.getId(), user);
		}
		return user;
	}

	 /**
     * 获取当前用户
     *
     * @return 取不到返回 new User()
     */
    public static User getUser() {
        String principal = getPrincipal();
        if (principal != null) {
            User User = getUserByLoginName(principal);
            if (User != null) {
                return User;
            }
            return new User();
        }
        return new User();
    }
    
    public static String getUserJson() {
    	User user = null;
    	String principal = getPrincipal();
        if (principal != null) {
            user = getUserByLoginName(principal);
            if (user != null) {
            	return JSONObject.toJSONString(user);
            }
            return "";
        }
        return "";
    }
    
    public static String getPrincipal() {
        try {
            Subject subject = SecurityUtils.getSubject();
            String principal = (String) subject.getPrincipal();
            if (principal != null) {
                return principal;
            }
//			subject.logout();
		}catch (UnavailableSecurityManagerException e) {
			
		}catch (InvalidSessionException e){
			
		}
		return null;
	}
 	
	/**
	 * 根据登录名（对应Num字段），获取用户
	 * @param loginName
	 * @return 取不到返回null
	 */
	public static User getUserByLoginName(String loginName){
		User user = (User)CacheUtils.get(User_CACHE, User_CACHE_LOGIN_NAME_ + loginName);
		if(Global.isDeveloping()) {
			user = null;
		}
		if (user == null){
			user = userMapper.getUserByLoginNameForLogin(new User(loginName));
			if (user == null){
				return null;
			}
//			user.setRole(roleDao.findRoleByUser(new Role(user)));
			CacheUtils.put(User_CACHE, User_CACHE_ID_ + user.getId(), user);
			CacheUtils.put(User_CACHE, User_CACHE_LOGIN_NAME_ + user.getNum(), user);
		}
		return user;
	}
	
	/**
	 * 根据ID获取用户
	 */
	public static User getUserById(Integer id) {
		User user = (User)CacheUtils.get(User_CACHE,User_CACHE_ID_+id);
		if(user == null) {
			user = userMapper.getUserByIdForLogin(new User(id));
			if(user == null) {
				return null;
			}
			CacheUtils.put(User_CACHE, User_CACHE_ID_ + user.getId(), user);
			CacheUtils.put(User_CACHE, User_CACHE_LOGIN_NAME_ + user.getNum(), user);
		}
		return user;
	}
	
	/**
	 * 获取当前用户授权菜单
	 * @return
	 */
	public static List<Menu> getMenuList(){
		@SuppressWarnings("unchecked")
		List<Menu> menuList = (List<Menu>)getCache(CACHE_MENU_LIST);
		if(Global.isDeveloping()) {
			menuList = null;
		}
		if (menuList == null){
			User user = getUser();
			if (user.isAdmin()){
				menuList = menuMapper.findAllMenuList(new Menu(user));
			}else{
				Menu menu = new Menu(user);
				menuList = menuMapper.findMenuByUserId(menu);
			}
			putCache(CACHE_MENU_LIST, menuList);
		}
		return menuList;
	
	}

	public static Object getCache(String key) {
		return getCache(key, null);
	}
		
	public static Object getCache(String key, Object defaultValue) {
        Object obj = getSession().getAttribute(key);
        return obj == null ? defaultValue : obj;
    }

    public static void putCache(String key, Object value) {
        getSession().setAttribute(key, value);
    }

    public static void removeCache(String key) {
        getSession().removeAttribute(key);
    }

    public static Session getSession() {
        try {
            Subject subject = SecurityUtils.getSubject();
            Session session = subject.getSession(false);
            if (session == null) {
                session = subject.getSession();
            }
            if (session != null) {
                return session;
            }
        } catch (InvalidSessionException e) {

        }
        return null;
    }

    /**
     * 清除当前用户缓存
     */
    public static void clearCache() {
        removeCache(CACHE_MENU_LIST);
        UserUtils.clearCache(getUser());
    }

    /**
     * 清除指定用户缓存
     *
     * @param User
     */
    public static void clearCache(User User) {
        CacheUtils.remove(User_CACHE, User_CACHE_ID_ + User.getId());
        CacheUtils.remove(User_CACHE, User_CACHE_LOGIN_NAME_ + User.getNum());
    }

}

