package com.qikan.test;

import com.qikan.util.CommonUtils;
import com.qikan.util.DateUtils;
import org.junit.Test;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Yang on 2018/4/25 0025.
 */
public class TestCase {
    @Test
    public void testUUID(){
        String uuid = CommonUtils.uuid();
        System.out.println(uuid);
    }

    @Test
    public void testDate(){
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(df.format(day));
    }
}
