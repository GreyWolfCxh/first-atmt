package cn.com.comit.appointment.modules.wechat.utils;

import java.net.URLDecoder;
import java.net.URLEncoder;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;


/**
 * 加密类
 * @author ChenXiHua
 * @version 2018-11-9
 *
 */
public class DESEncryption {

    //密钥设置,可根据服务器传过来的密钥设置。达到动态的效果。
    private static String SECRET_KEY = "fxc@Key1";
      
    //加密数据
    private static  byte[] encrypt(String message, String key) throws Exception {
        Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
        DESKeySpec desKeySpec = new DESKeySpec(key.getBytes("UTF-8"));
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
        IvParameterSpec iv = new IvParameterSpec(key.getBytes("UTF-8"));
        cipher.init(Cipher.ENCRYPT_MODE, secretKey, iv);
        return cipher.doFinal(message.getBytes("UTF-8"));
    }

    private static String toHexString(byte b[]) {
        StringBuffer hexString = new StringBuffer();
        for (int i = 0; i < b.length; i++) {
            String plainText = Integer.toHexString(0xff & b[i]);
            if (plainText.length() < 2)
                plainText = "0" + plainText;
            hexString.append(plainText);
        }
        return hexString.toString();
    }
	
	//带密钥加密方法调用
    public static String DESEncrypt(String msg) {
        String encryt_data;
        String encryt_code;
        try {
            encryt_data = URLEncoder.encode(msg, "utf-8").toLowerCase();
            encryt_code = toHexString(encrypt(encryt_data, SECRET_KEY)).toUpperCase();
            return encryt_code;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
