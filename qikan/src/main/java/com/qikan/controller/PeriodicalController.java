package com.qikan.controller;

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
 * 期刊信息查询
 * Created by Yang.
 */
@Controller
@RequestMapping(value = "/periodical")
public class PeriodicalController {

    private static final Logger logger = LoggerFactory.getLogger(PeriodicalController.class);

    @Autowired
    private QikanService service;
    @Autowired
    private TypeService typeService;
    @Autowired
    private NoticeService noticeService;


    /**
     * 按分类查询
     * @param req
     * @return
     */
    @RequestMapping(value = "/index")
    public ModelAndView findQikanByCategory(@RequestParam(value = "typeId") Integer typeId , HttpServletRequest req) {
        Type type = typeService.selectTypeById(typeId);
        ModelAndView mv = new ModelAndView();
        /*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
        int pc = PageUtils.getPc(req);
		/*
		 * 2. 得到url：...
		 */
        String url = PageUtils.getUrl(req);

        //  得到期刊记录
        int tr = service.getQikanCount(typeId);
        int offset = (pc -1) * 10;
        List<Qikan> qikanList = service.getIndex10(typeId, offset);
        for (Qikan qikan : qikanList) {
            int leve = Integer.parseInt(qikan.getJibie());
            qikan.setJibie(QikanLevelEnum.getQikanLevelById(leve).getName());
        }
        PageBean<Qikan> pageBean = new PageBean<>();
        pageBean.setBeanList(qikanList);
        pageBean.setUrl(url);
        pageBean.setPc(pc);
        System.out.println(qikanList.size());
        pageBean.setTr(tr);
        System.out.println("页数" + pageBean.getTp());
        mv.addObject("pb", pageBean);
        mv.addObject("type", type);
        mv.setViewName("qikan");
        return mv;
    }

    @RequestMapping("/{qikanid}")
    public ModelAndView qikanDetails(@PathVariable("qikanid") Integer qikanid, HttpServletRequest request)throws Exception{
        System.out.println(qikanid);
        ModelAndView mv=new ModelAndView();
        Qikan qikan = service.selectByQikanId(qikanid);
        mv.setViewName("qikanDetail");
        mv.addObject("qikan", qikan);
        return mv;
    }


}
