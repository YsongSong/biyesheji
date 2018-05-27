package com.qikan.service.impl;

import com.qikan.entitys.IndexPageBean;
import com.qikan.entitys.Notice;
import com.qikan.entitys.Type;
import com.qikan.service.NoticeService;
import com.qikan.service.QikanService;
import com.qikan.service.TypeService;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Yang.
 */
public class InitComponent implements ApplicationContextAware,ServletContextListener {

    private static ApplicationContext applicationContext;

    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        // TODO Auto-generated method stub
        this.applicationContext=applicationContext;
        System.out.println(this);
    }

    /**
     * 刷新application缓存方法
     * @param application
     */
    public void refreshSystem(ServletContext application){
        /* 获取类别列表 */
        TypeService typeService = (TypeService)applicationContext.getBean("typeService");
        List<Type> typeList = typeService.getAllType();

        /* 按类别获取通告、期刊分类 */
        NoticeService noticeService = (NoticeService) applicationContext.getBean("noticeService");
        QikanService qikanService = (QikanService) applicationContext.getBean("qikanService");
        List<IndexPageBean> indexPageBeans = new ArrayList<>();
        if(typeList != null && typeList.size() != 0) {
            for (int i = 0; i < typeList.size(); i++) {
                IndexPageBean pageBean = new IndexPageBean();
                pageBean.setType(typeList.get(i));  //设置类别
                pageBean.setNoticeList(noticeService.getNoticeListByTypeId(typeList.get(i).getTypeid()));   //  设置10条通告信息
                pageBean.setQikanList(qikanService.getIndex8(typeList.get(i).getTypeid()));
                indexPageBeans.add(pageBean);
            }
        }

        application.setAttribute("pageBeans", indexPageBeans);
    }

    public void contextInitialized(ServletContextEvent sce) {
        // TODO Auto-generated method stub
        ServletContext application=sce.getServletContext();
        refreshSystem(application);
    }

    public void contextDestroyed(ServletContextEvent sce) {
        // TODO Auto-generated method stub
    }

}


