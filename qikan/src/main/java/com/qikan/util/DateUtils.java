package com.qikan.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Yang.
 */
public class DateUtils {

    /**
     * 获取当前时间
     * @return
     */
    public static String getDate() throws Exception {
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = formatString(df.format(day),"yyyy-MM-dd HH:mm:ss");
       return df.format(day);
    }

    /**
     * 获取当前日期
     * @return
     */
    public static String getDateNow() throws Exception {
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date date = formatString(df.format(day),"yyyy-MM-dd");
        return df.format(day);
    }

    /**
     * 获取当前日期
     * @return
     */
    public static Date getdateNow() throws Exception {
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date date = formatString(df.format(day),"yyyy-MM-dd");
        return date;
    }

    /**
     * 日期对象转字符串
     * @param date
     * @param format
     * @return
     */
    public static String formatDate(Date date,String format){
        String result="";
        SimpleDateFormat sdf=new SimpleDateFormat(format);
        if(date!=null){
            result=sdf.format(date);
        }
        return result;
    }

    /**
     * 字符串转日期对象
     * @param str
     * @param format
     * @return
     * @throws Exception
     */
    public static Date formatString(String str,String format) throws Exception{
        if(StringUtil.isEmpty(str)){
            return null;
        }
        SimpleDateFormat sdf=new SimpleDateFormat(format);
        return sdf.parse(str);
    }

    public static String getCurrentDateStr()throws Exception{
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");
        return sdf.format(date);
    }
}
