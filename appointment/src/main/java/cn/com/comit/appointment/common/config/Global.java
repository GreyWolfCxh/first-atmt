package cn.com.comit.appointment.common.config;



import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.io.DefaultResourceLoader;

import com.google.common.collect.Maps;

import cn.com.comit.appointment.common.utils.PropertiesLoader;


/**
 * 全局配置类
 */
public class Global {

	/**
	 * 当前对象实例
	 */
	private static Global global = new Global();
	
	/**
	 * 保存全局属性值
	 */
	private static Map<String, String> map = Maps.newHashMap();
	
	/**
	 * 属性文件加载对象
	 */
	private static PropertiesLoader loader = new PropertiesLoader("global.properties");

	public static Global getInstance() {
		return global;
	}
	
	public static String getConfig(String key) {
		String value = map.get(key);
		if (value == null){
			value = loader.getProperty(key);
			map.put(key, value != null ? value : StringUtils.EMPTY);
		}
		return value;
	}

    public static boolean isDeveloping() {
    	return loader.getBoolean("developing");
    }
	
    public static boolean isFreeLogin() {
    	return loader.getBoolean("free_login");
    }
    
    public static int getEffectiveTime() {
    	return loader.getInteger("effective_time");
    }
}


