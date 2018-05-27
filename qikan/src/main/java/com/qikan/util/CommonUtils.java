package com.qikan.util;

import java.util.UUID;

/**
 * Created by Yang on 2018/4/25 0025.
 */
public class CommonUtils {
    /**
     * 返回一个不重复的字符串
     * @return
     */
    public static String uuid() {
        return UUID.randomUUID().toString().replace("-", "").toUpperCase();
    }
}
