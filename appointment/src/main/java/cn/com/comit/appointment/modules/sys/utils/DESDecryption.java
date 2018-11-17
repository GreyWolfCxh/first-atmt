package cn.com.comit.appointment.modules.sys.utils;


import java.net.URLDecoder;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;

import org.apache.commons.lang3.StringUtils;

import cn.com.comit.appointment.common.config.Global;


/**
 * DES解密类
 * @author ZhengZongying
 * @version 2018-08-24
 */
public class DESDecryption {

    private static String decrypt(byte[] ciphertext, String key) throws Exception {
        Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
        DESKeySpec desKeySpec = new DESKeySpec(key.getBytes("UTF-8"));
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
        IvParameterSpec iv = new IvParameterSpec(key.getBytes("UTF-8"));
        cipher.init(Cipher.DECRYPT_MODE, secretKey, iv);
        return new String(cipher.doFinal(ciphertext));
    }
    
    public static byte[] toByteArray(String hexString) {
       if (StringUtils.isEmpty(hexString))
            return null;
        hexString = hexString.toLowerCase();
        final byte[] byteArray = new byte[hexString.length() >> 1];
        int index = 0;
        for (int i = 0; i < hexString.length(); i++) {
            if (index  > hexString.length() - 1)
                return byteArray;
            byte highDit = (byte) (Character.digit(hexString.charAt(index), 16) & 0xFF);
            byte lowDit = (byte) (Character.digit(hexString.charAt(index + 1), 16) & 0xFF);
            byteArray[i] = (byte) (highDit << 4 | lowDit);
            index += 2;
        }
        return byteArray;
    }
    
    public  static String DESDecrypt(String ciphertext) {
    	String plaintext = null;
        try {
        	ciphertext =  decrypt(toByteArray(ciphertext.toLowerCase()),Global.getConfig("secret_key"));
        	plaintext = URLDecoder.decode(ciphertext, "utf-8");
            return plaintext;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}

