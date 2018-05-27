package com.qikan.controller.expert;

import com.qikan.entitys.CheckDto;
import com.qikan.entitys.CheckUpWithBLOBs;
import com.qikan.entitys.ReturnResponse;
import com.qikan.entitys.UserInfo;
import com.qikan.enums.ExpertStatus;
import com.qikan.pager.PageBean;
import com.qikan.service.ArticleService;
import com.qikan.service.CheckUpService;
import com.qikan.service.NoticeService;
import com.qikan.service.UserService;
import com.qikan.util.DateUtils;
import com.qikan.util.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 专家审稿工作 查询、修改
 * Created by Yang.
 */
@Controller
@RequestMapping("expert")
public class ArticleCheckController {

    @Autowired
    private ArticleService articleService;
    @Autowired
    private UserService userService;
    @Autowired
    private CheckUpService checkUpService;

    /**
     * 查询专家未审核稿件
     * @return
     */
    @RequestMapping(value = "expertUnCkeck")
    public ModelAndView expertUnCkeck(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        UserInfo expertInfo = (UserInfo) request.getSession().getAttribute("expertInfo");
        /*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
        int pc = PageUtils.getPc(request);
		/*
		 * 2. 得到url：...
		 */
        String url = PageUtils.getUrl(request);
        CheckDto checkDto = new CheckDto();
        checkDto.setExpertInfo(expertInfo);
        checkDto.setPs(null);
        List<CheckUpWithBLOBs> checkUpWithBLOBs =  checkUpService.getExpertUnCheck(checkDto);   // 获取总记录
        int tr = checkUpWithBLOBs.size();

        System.out.println("count = " + tr);
        int offset = (pc - 1)*5;    // 从第几条数据开始

        checkDto.setPc(offset);
        checkDto.setPs(5);
        List<CheckUpWithBLOBs> checkUpWithBLOBsList =  checkUpService.getExpertUnCheck(checkDto);    // 分页查询

        PageBean<CheckUpWithBLOBs> pb = new PageBean<>();
        pb.setBeanList(checkUpWithBLOBsList);
        pb.setUrl(url);
        pb.setPc(pc);
        pb.setTr(tr);
        pb.setPs(5);
        mv.addObject("pb", pb);
        mv.setViewName("pages/expert/unAudited");
        return mv;
    }

    /**
     * 查询专家已审核审核稿件
     * @return
     */
    @RequestMapping(value = "expertCkeck")
    public ModelAndView expertCkeck(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        UserInfo expertInfo = (UserInfo) request.getSession().getAttribute("expertInfo");
        /*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
        int pc = PageUtils.getPc(request);
		/*
		 * 2. 得到url：...
		 */
        String url = PageUtils.getUrl(request);
        CheckDto checkDto = new CheckDto();
        checkDto.setExpertInfo(expertInfo);
        checkDto.setPs(null);
        List<CheckUpWithBLOBs> checkUpWithBLOBs =  checkUpService.getExpertCheck(checkDto);   // 获取总记录
        int tr = checkUpWithBLOBs.size();

        System.out.println("count = " + tr);
        int offset = (pc - 1)*5;    // 从第几条数据开始


        checkDto.setPc(offset);
        checkDto.setPs(5);
        List<CheckUpWithBLOBs> checkUpWithBLOBsList =  checkUpService.getExpertCheck(checkDto);    // 分页查询

        PageBean<CheckUpWithBLOBs> pb = new PageBean<>();
        pb.setBeanList(checkUpWithBLOBsList);
        pb.setUrl(url);
        pb.setPc(pc);
        pb.setTr(tr);
        pb.setPs(5);
        mv.addObject("pb", pb);
        mv.setViewName("pages/expert/audited");
        return mv;
    }

    /**
     * 去专家审稿页面
     * @param checkId
     * @return
     */
    @RequestMapping(value = "toExpertEditorArticle", method = RequestMethod.GET)
    public ModelAndView toEditArticle(Integer checkId) {
        ModelAndView mv = new ModelAndView();
        CheckUpWithBLOBs check = checkUpService.selectByPrimaryKey(checkId);
        mv.addObject("check", check);
        mv.setViewName("pages/expert/editarticle");
        return mv;
    }

    /**
     * 专家审稿
     * @param checkId
     * @return
     */
    @RequestMapping(value = "expertEditorArticle", method = RequestMethod.POST)
    @ResponseBody
    public ReturnResponse expertEditorArticle(Integer checkId, String expertMessage) throws Exception {
        ReturnResponse returnResponse = new ReturnResponse(0, "审核成功!",null);

        CheckUpWithBLOBs checkUpWithBLOBs = new CheckUpWithBLOBs();
        checkUpWithBLOBs.setIscheck(ExpertStatus.YISHENHE.getCode());   // 设置审核表专家状态为已审核
        String expertenddate = DateUtils.getDateNow();
        checkUpWithBLOBs.setExpertenddate(expertenddate);   // 设置专家审核日期
        checkUpWithBLOBs.setExpertmessage(expertMessage);   // 设置专家评审意见
        checkUpWithBLOBs.setCheekid(checkId);   // 要操作的审核稿件编号
        try {
            checkUpService.updateByPrimaryKeySelective(checkUpWithBLOBs);
            return returnResponse;
        } catch (Exception e) {
            e.printStackTrace();
            returnResponse.setMsg("审核失败请重试");
            returnResponse.setCode(1);
            return returnResponse;
        }

    }
}
