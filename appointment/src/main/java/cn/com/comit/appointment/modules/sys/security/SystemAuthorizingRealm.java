package cn.com.comit.appointment.modules.sys.security;

import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import cn.com.comit.appointment.modules.sys.entity.Menu;
import cn.com.comit.appointment.modules.sys.entity.User;
import cn.com.comit.appointment.modules.sys.utils.UserUtils;




/**
 * Shiro授权类
 * @author ZhengZongying
 * @version 2018-6-12
 */

public class SystemAuthorizingRealm  extends AuthorizingRealm{
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		Object principal =  getAvailablePrincipal(principalCollection);
		User user = UserUtils.getUserByLoginName(principal.toString());
//		info.addRole(user.getRole().getEnname());
		List<Menu> list = UserUtils.getMenuList();
		for(Menu menu:list) {
			info.addStringPermission(menu.getPermission());
		}
		return info;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		Object principal = token.getPrincipal();
		User user = UserUtils.getUserByLoginName(principal.toString());
		/*String credentials = user.getPwd();
		String source = "adcdefg";
		ByteSource credentialsSalt = new Md5Hash(source);*/
		String realmName = getName(); 
		SimpleAuthenticationInfo info = 
				new SimpleAuthenticationInfo(principal, user.getPwd(), realmName);
		return info;
	}

	/*@PostConstruct
	public void setCredentialsMatcher(){
		HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher();
		credentialsMatcher.setHashAlgorithmName("MD5");
		credentialsMatcher.setHashIterations(1024);
		setCredentialsMatcher(credentialsMatcher);
	}*/
}
