/**
 *
 */
package edu.ahut.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import org.apache.commons.codec.binary.Base64;

/**
 * @author Haven
 * @date 2013-3-22
 *
 */
public class ServiceUtils {

    public static String md5(String msg) {
        try {
            MessageDigest md = MessageDigest.getInstance("md5");
            byte[] digest = md.digest(msg.getBytes());
            // System.out.println(new String(digest));
            return new Base64().encodeAsString(digest);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    public static String generateID() {
        return UUID.randomUUID().toString();
    }

    /**
     * 验证string不为空
     */
    public static boolean checkStringParam(String... strs) {
        boolean b = true;
        for (String string : strs) {
            //空字符
            if (string == null || string.trim().length() <= 0) {
                b = false;
                break;
            }
        }
        return b;
    }
}
