package com.qikan.controller;

import com.qikan.entitys.Notice;
import com.qikan.entitys.Qikan;
import com.qikan.entitys.ReturnResponse;
import com.qikan.entitys.UserInfo;
import com.qikan.service.NoticeService;
import com.qikan.service.QikanService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * Created by Yang on 2018/2/24 0024.
 */
@Controller
public class Test {
    private static final Logger logger = LoggerFactory.getLogger(Test.class);
    @Resource
    private NoticeService service;

    @Resource
    private QikanService qikanService;

    @RequestMapping(value = "/hello", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView hello() {
        logger.info("这是测试");
        ModelAndView mv = new ModelAndView();
        List<Notice> notices = service.getNoticeListByTypeId(1);
        List<Qikan> qikans = qikanService.getIndex10(1, 1);
        System.out.println(qikans);
        mv.addObject("tes","hello MVC");
        mv.addObject("notices",notices);
        mv.setViewName("jsp/author/login_author");
        return mv;
    }

    @RequestMapping(value = "/totest", method = RequestMethod.POST)
    @ResponseBody
    public ReturnResponse totest(UserInfo authorinfo) {
//        String ss = request.getParameter("username");
        System.out.println(authorinfo);
        return new ReturnResponse(1,"success","123");
    }

}
