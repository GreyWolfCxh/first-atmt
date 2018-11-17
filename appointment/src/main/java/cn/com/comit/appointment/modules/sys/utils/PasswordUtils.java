package cn.com.comit.appointment.modules.sys.utils;

import java.net.URLEncoder;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.SimpleHash;

/**
 * 加密工具类
 * @author ZhengZongying
 * @date 2018年6月13日
 */
public class PasswordUtils {
	
    public static String encrypt(String plainPassword) {
        String saltSource = "adcdefg";
        String hashAlgorithmName = "MD5";
        Object salt = new Md5Hash(saltSource);
        int hashIterations = 1024;
        Object result = new SimpleHash(hashAlgorithmName, plainPassword, salt, hashIterations);
        return result.toString();
    }
  
}
