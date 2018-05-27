package com.qikan.controller;

import com.qikan.entitys.IndexPageBean;
import com.qikan.entitys.Qikan;
import com.qikan.entitys.Type;
import com.qikan.enums.QikanLevelEnum;
import com.qikan.service.NoticeService;
import com.qikan.service.QikanService;
import com.qikan.service.TypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Yang.
 */
@Controller
public class IndexController {

    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

    @Resource
    private TypeService typeService;
    @Resource
    private NoticeService noticeService;
    @Resource
    private QikanService qikanService;

    @RequestMapping(value = "/index")
    public ModelAndView index(HttpSession session) {
        logger.info("这是首页数据集合");
        ModelAndView mv = new ModelAndView();

        /* 获取类别列表 */
        List<Type> typeList = typeService.getAllType();
        /* 按类别获取通告、期刊分类 */
        List<IndexPageBean> indexPageBeans = new ArrayList<>();
        if(typeList != null && typeList.size() != 0) {
            int size = 8;
            if(typeList.size() <= 8) {
                size = typeList.size();
            }
            for (int i = 0; i < size; i++) {
                IndexPageBean pageBean = new IndexPageBean();
                pageBean.setType(typeList.get(i));  //设置类别
                pageBean.setNoticeList(noticeService.getNoticeListByTypeId(typeList.get(i).getTypeid()));   //  设置10条通告信息
                List<Qikan> qikans = qikanService.getIndex8(typeList.get(i).getTypeid());
                List<Qikan> qikanList = new ArrayList<>();
                for (Qikan qikan : qikans) {
                    qikan.setJibie(QikanLevelEnum.getQikanLevelById(Integer.parseInt(qikan.getJibie())).getName());
                    qikanList.add(qikan);
                }
//                pageBean.setQikanList(qikanService.getIndex8(typeList.get(i).getTypeid()));
                pageBean.setQikanList(qikanList);
                indexPageBeans.add(pageBean);
            }
        }

        mv.setViewName("index");
        mv.addObject("pageBeans", indexPageBeans);
        return mv;
    }

    @RequestMapping(value = "/alltype")
    public ModelAndView allType() {
        logger.info("这是所有数据集合");
        ModelAndView mv = new ModelAndView();

        /* 获取类别列表 */
        List<Type> typeList = typeService.getAllType();
        /* 按类别获取通告、期刊分类 */
        List<IndexPageBean> allTypePageBeans = new ArrayList<>();
        if(typeList != null && typeList.size() != 0) {

            for (int i = 0; i < typeList.size(); i++) {
                IndexPageBean pageBean = new IndexPageBean();
                pageBean.setType(typeList.get(i));  //设置类别
                List<Qikan> qikans = qikanService.getIndex6(typeList.get(i).getTypeid());
                List<Qikan> qikanList = new ArrayList<>();
                for (Qikan qikan : qikans) {
                    qikan.setJibie(QikanLevelEnum.getQikanLevelById(Integer.parseInt(qikan.getJibie())).getName());
                    qikanList.add(qikan);
                }
                pageBean.setQikanList(qikanList);
                allTypePageBeans.add(pageBean);
            }
        }
        mv.setViewName("allqikantype");
        mv.addObject("pb", allTypePageBeans);
        return mv;
    }

}
