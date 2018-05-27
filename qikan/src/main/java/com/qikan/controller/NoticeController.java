package com.qikan.controller;

import org.apache.commons.lang.StringUtils;

import com.qikan.entitys.NoticeWithBLOBs;
import com.qikan.entitys.Qikan;
import com.qikan.entitys.Type;
import com.qikan.enums.QikanLevelEnum;
import com.qikan.pager.PageBean;
import com.qikan.service.NoticeService;
import com.qikan.service.QikanService;
import com.qikan.service.TypeService;
import com.qikan.util.PageUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * Created by Yang.
 */
@Controller
@RequestMapping(value = "/notice")
public class NoticeController {

    private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

    @Autowired
    private NoticeService noticeService;


    /**
     * 按通知编号查询
     * @param noticeid  通知编号
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/{noticeid}")
    public ModelAndView noticeDetails(@PathVariable("noticeid") Integer noticeid, HttpServletRequest request)throws Exception{
        System.out.println(noticeid);
        ModelAndView mv=new ModelAndView();
        NoticeWithBLOBs notice = noticeService.selectByNoticeId(noticeid);
        String noticeText = StringUtils.abbreviate(notice.getNoticetext(), 70);
        System.out.println(noticeText);
        notice.setNoticetext(noticeText);
        mv.setViewName("noticeDetail");
        mv.addObject("notice", notice);
        return mv;
    }

}
