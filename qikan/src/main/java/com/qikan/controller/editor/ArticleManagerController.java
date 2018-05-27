package com.qikan.controller.editor;

import com.qikan.entitys.*;
import com.qikan.enums.AdminStatus;
import com.qikan.enums.ArticleStatus;
import com.qikan.enums.EditorStatus;
import com.qikan.pager.PageBean;
import com.qikan.service.ArticleService;
import com.qikan.service.CheckUpService;
import com.qikan.service.NoticeService;
import com.qikan.service.UserService;
import com.qikan.util.DateUtils;
import com.qikan.util.PageUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Yang.
 */
@Controller
@RequestMapping(value = "editor")
public class ArticleManagerController {

    private static final Logger log = LoggerFactory.getLogger(ArticleManagerController.class);

    @Autowired
    private ArticleService articleService;
    @Autowired
    private UserService userService;
    @Autowired
    private CheckUpService checkUpService;
    @Autowired
    private NoticeService noticeService;

    /**
     * 查询待分派稿件(待审核)
     * @return
     */
    @RequestMapping(value = "unsend")
    public ModelAndView toUnsend(HttpServletRequest request){

        ModelAndView mv = new ModelAndView();
        /*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
        int pc = PageUtils.getPc(request);
		/*
		 * 2. 得到url：...
		 */
        String url = PageUtils.getUrl(request);

        List<ArticleInfo> articleInfoCount =  articleService.getUnSendArticle(null, null);   // 获取总记录
        int tr = articleInfoCount.size();

        System.out.println("count = " + tr);
        int offset = (pc - 1)*5;    // 从第几条数据开始

        List<ArticleInfo> articleInfoList =  articleService.getUnSendArticle(offset,5 );    // 分页查询

        PageBean<ArticleInfo> pb = new PageBean<>();
        pb.setBeanList(articleInfoList);
        pb.setUrl(url);
        pb.setPc(pc);
        pb.setTr(tr);
        pb.setPs(5);
        mv.addObject("pb", pb);
        mv.setViewName("pages/editor/unsend");
        mv.addObject("articles", articleInfoList);
        return mv;
    }

    /**
     * 查询已分派稿件
     * @return
     */
    @RequestMapping(value = "send")
    public ModelAndView send(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        /*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
        int pc = PageUtils.getPc(request);
		/*
		 * 2. 得到url：...
		 */
        String url = PageUtils.getUrl(request);

        List<CheckUpWithBLOBs> checkUpWithBLOBs =  checkUpService.getSend(null);   // 获取总记录
        int tr = checkUpWithBLOBs.size();

        System.out.println("count = " + tr);
        int offset = (pc - 1)*5;    // 从第几条数据开始

        CheckDto checkDto = new CheckDto();
        checkDto.setPc(offset);
        List<CheckUpWithBLOBs> checkUpWithBLOBsList =  checkUpService.getSend(checkDto);    // 分页查询

        PageBean<CheckUpWithBLOBs> pb = new PageBean<>();
        pb.setBeanList(checkUpWithBLOBsList);
        pb.setUrl(url);
        pb.setPc(pc);
        pb.setTr(tr);
        pb.setPs(5);
        mv.addObject("pb", pb);
        mv.setViewName("pages/editor/send");
        mv.addObject("articles", checkUpWithBLOBsList);
        return mv;
    }


    /**
     * 去专家分派页面
     * @param articleId 稿件编号
     * @param typeId 期刊类别
     * @return
     */
    @RequestMapping(value = "tosend")
    public ModelAndView toSend(Integer articleId, Integer typeId){
        ModelAndView mv = new ModelAndView();
        ArticleInfo articleInfo = articleService.selectByArticleId(articleId);  // 稿件数据
        List<UserInfo> experts =  userService.getUserByTypeId(typeId);  // 查询负责某类期刊的专家

        mv.addObject("article", articleInfo);
        mv.addObject("experts", experts);

        mv.setViewName("pages/editor/sendexpert");
        return mv;
    }

    /**
     * 分派专家
     * @param articleId     稿件编号
     * @param expertId      专家编号
     * @return
     */
    @RequestMapping(value = "sendExpert")
    @ResponseBody
    public ReturnResponse sendExpert(Integer articleId, Integer expertId){
        ReturnResponse returnResponse = new ReturnResponse(0,"分派成功!",null);
        CheckUpWithBLOBs checkUpWithBLOBs = new CheckUpWithBLOBs();

        // 添加文章编号
        ArticleInfo articleInfo = new ArticleInfo();
        articleInfo.setArticleid(articleId);
        checkUpWithBLOBs.setArticleInfo(articleInfo);

        UserInfo expertInfo = new UserInfo();
        expertInfo.setUserid(expertId);
        checkUpWithBLOBs.setExpertInfo(expertInfo);
        articleInfo.setExpert(expertInfo);
        articleInfo.setEditorstatus(EditorStatus.SHENHEZHONG.getCode());    // 设置稿件状态为审核中

        Boolean bool = checkUpService.sendExpert(checkUpWithBLOBs, articleInfo);    // 执行操作

        if (!bool) {
            returnResponse.setCode(1);
            returnResponse.setMsg("分派失败!");
            return returnResponse;
        }
        return returnResponse;
    }

    /**
     * 去复审页面
     * @param articleId  稿件编号
     * @return
     */
    @RequestMapping(value = "torecheck")
    public ModelAndView torecheck(Integer articleId){
        ModelAndView mv = new ModelAndView();
        CheckUpWithBLOBs checkUpWithBLOBs = checkUpService.selectByArticleId(articleId);
        mv.addObject("checkUp", checkUpWithBLOBs);
        mv.setViewName("pages/editor/sendadmin");
        return mv;
    }

    /**
     * 复审
     * @param checkId     // 登记编号
     * @param sendAdminId   // 主编审核意见(0-同意发表, 1-不同意发表)
     * @return
     */
    @RequestMapping(value = "recheck", method = RequestMethod.POST)
    @ResponseBody
    public ReturnResponse recheck(Integer checkId, Integer sendAdminId){

        log.info("checkId=" + checkId + "sendAdminId="+sendAdminId);

        if (sendAdminId == 1)  {    // 送至主编处审核
            /**
             * 改变审核记录表主编审核状态为0
             */
            ReturnResponse returnResponse = new ReturnResponse(0, "已送至主编处！", null);

            CheckUpWithBLOBs checkUpWithBLOBs = new CheckUpWithBLOBs();
            checkUpWithBLOBs.setAdminstatus(AdminStatus.YISONGSHEN.getCode());
            checkUpWithBLOBs.setCheekid(checkId);
            try {
                checkUpService.updateByPrimaryKeySelective(checkUpWithBLOBs);
                return returnResponse;
            } catch (Exception e) {
                e.printStackTrace();
                returnResponse.setCode(1);
                returnResponse.setMsg("提交失败");
                return returnResponse;
            }
        } else {    // 退稿处理

            return null;
        }

    }

    /**
     * 去发主编未审核页面(待审核)
     * @return
     */
    @RequestMapping(value = "adminunread")
    public ModelAndView toAdminUnReader(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        /*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
        int pc = PageUtils.getPc(request);
		/*
		 * 2. 得到url：...
		 */
        String url = PageUtils.getUrl(request);

        List<CheckUpWithBLOBs> checkUpWithBLOBs =  checkUpService.getAdminUnRead(null);   // 获取总记录
        int tr = checkUpWithBLOBs.size();

        System.out.println("count = " + tr);
        int offset = (pc - 1)*5;    // 从第几条数据开始

        CheckDto checkDto = new CheckDto();
        checkDto.setPc(offset);
        List<CheckUpWithBLOBs> checkUpWithBLOBsList =  checkUpService.getAdminUnRead(checkDto);    // 分页查询

        PageBean<CheckUpWithBLOBs> pb = new PageBean<>();
        pb.setBeanList(checkUpWithBLOBsList);
        pb.setUrl(url);
        pb.setPc(pc);
        pb.setTr(tr);
        pb.setPs(5);
        mv.addObject("pb", pb);
        mv.setViewName("pages/editor/adminunread");
        return mv;
    }

    /**
     * 去主编已审核页面
     * @return
     */
    @RequestMapping(value = "adminread")
    public ModelAndView toAdminReader(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        /*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
        int pc = PageUtils.getPc(request);
		/*
		 * 2. 得到url：...
		 */
        String url = PageUtils.getUrl(request);

        List<CheckUpWithBLOBs> checkUpWithBLOBs =  checkUpService.getAdminRead(null);   // 获取总记录
        int tr = checkUpWithBLOBs.size();

        System.out.println("count = " + tr);
        int offset = (pc - 1)*5;    // 从第几条数据开始

        CheckDto checkDto = new CheckDto();
        checkDto.setPc(offset);
        List<CheckUpWithBLOBs> checkUpWithBLOBsList =  checkUpService.getAdminRead(checkDto);    // 分页查询

        PageBean<CheckUpWithBLOBs> pb = new PageBean<>();
        pb.setBeanList(checkUpWithBLOBsList);
        pb.setUrl(url);
        pb.setPc(pc);
        pb.setTr(tr);
        pb.setPs(5);
        mv.addObject("pb", pb);
        mv.setViewName("pages/editor/adminread");
        return mv;
    }


    /**
     * 去发表页面稿件(待审核)
     * @param checkId       // 审稿编号
     * @return
     */
    @RequestMapping(value = "tofabiao")
    public ModelAndView toFabiao(Integer checkId){
        ModelAndView mv = new ModelAndView();
        CheckUpWithBLOBs article = checkUpService.selectByPrimaryKey(checkId);
        mv.addObject("article", article);
        mv.setViewName("pages/editor/tofabiao");
        return mv;
    }

    /**
     * 发表稿件
     * @return
     */
    @RequestMapping(value = "fabiao", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public ReturnResponse fabiao(NoticeWithBLOBs notice, Integer typeId, Integer articleId, Integer checkId){
        log.info(notice + " typeId = " + typeId + " articleId = " + articleId);
        ReturnResponse returnResponse = new ReturnResponse(0, "稿件已成功发表", null);

        try {
            /**
             * 1.添加通告信息 参数(noticeTitle标题、noticeContent带格式内容、typeId期刊类别Id、noticeText不带格式内容)
             */
            Type type = new Type();
            type.setTypeid(typeId);
            notice.setType(type);

            String date = DateUtils.getDate();
            notice.setNoticetime(date);
            noticeService.insert(notice);   // 添加通告

            /**
             * 2.修改稿件状态为出版，并修改稿件登记信息主编审稿状态为发表
             */
            // 修改稿件信息
            ArticleInfo articleInfo = new ArticleInfo();
            articleInfo.setArticleid(articleId);
            articleInfo.setArticlestatus(ArticleStatus.YIFABIAO.getCode());
            articleService.updateByArticleIdSelective(articleInfo);

            // 修改登记信息记录
            CheckUpWithBLOBs checkUpWithBLOBs = new CheckUpWithBLOBs();
            checkUpWithBLOBs.setCheekid(checkId);
            checkUpWithBLOBs.setAdminstatus(AdminStatus.YIFABIAO.getCode());
            checkUpService.updateByPrimaryKeySelective(checkUpWithBLOBs);

            return returnResponse;

        } catch (Exception e) {
            e.printStackTrace();
            returnResponse.setCode(1);
            returnResponse.setMsg("发表失败请重试");

            return returnResponse;
        }

    }

    /**
     * 去添加公告页面稿件(待审核)
     * @return
     */
    @RequestMapping(value = "toAddNotice", method = RequestMethod.POST)
    public ModelAndView toAddNotice(ArticleInfo articleInfo, String authorname, Integer typeId, String typename, String qikanname, String publishTime, Integer checkId) throws Exception {
        ModelAndView mv = new ModelAndView();
        String nowDate = DateUtils.getDateNow();
        log.info(articleInfo.toString() + " authorname = " + authorname + " typeId = " + typeId + " typename = " + typename + " qikanname = " + qikanname + " publishTime = " + publishTime + " checkId=" + checkId);        // 页面数据：稿件标题、稿件作者、拟发表时间、期刊信息、期刊类别
        mv.addObject("articleInfo", articleInfo);
        mv.addObject("authorname", authorname);
        mv.addObject("typeId", typeId);
        mv.addObject("typename", typename);
        mv.addObject("qikanname", qikanname);
        mv.addObject("publishTime",publishTime);
        mv.addObject("nowDate", nowDate);
        mv.addObject("checkId", checkId);
        mv.setViewName("pages/editor/addnotice");
        return mv;
    }


    /**
     * 去已发表稿件页面
     * @return
     */
    @RequestMapping(value = "publishedArticles", method = RequestMethod.GET)
    public ModelAndView publishedArticles(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
         /*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
        int pc = PageUtils.getPc(request);
		/*
		 * 2. 得到url：...
		 */
        String url = PageUtils.getUrl(request);
        UserInfoDto userInfoDto = new UserInfoDto();

        userInfoDto.setPs(null);    // 首先设置查询数据为0  统计总记录数
        List<ArticleInfo> articleInfoCount = articleService.getPublishArticle(userInfoDto); // 获取总记录数
        int tr = articleInfoCount.size();

        System.out.println("count = " + tr);
        int offset = (pc - 1)*5;    // 从第几条数据开始
        userInfoDto.setPc(offset);
        userInfoDto.setPs(5);   // 设置每次查询记录为5条
        List<ArticleInfo> articleInfoList = articleService.getPublishArticle(userInfoDto);
        PageBean<ArticleInfo> pb = new PageBean<>();
        pb.setBeanList(articleInfoList);
        pb.setUrl(url);
        pb.setPc(pc);
        pb.setTr(tr);
        pb.setPs(5);
        mv.addObject("pb", pb);
        mv.setViewName("pages/editor/publishedArticles");
        return mv;
    }


    /**
     * 去已退稿稿件页面
     * @return
     */
    @RequestMapping(value = "toTuiGao", method = RequestMethod.GET)
    public ModelAndView toArticles(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
         /*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
        int pc = PageUtils.getPc(request);
		/*
		 * 2. 得到url：...
		 */
        String url = PageUtils.getUrl(request);
        UserInfoDto userInfoDto = new UserInfoDto();

        userInfoDto.setPs(null);    // 首先设置查询数据为0  统计总记录数
        List<ArticleInfo> articleInfoCount = articleService.getTuiGao(userInfoDto); // 获取总记录数
        int tr = articleInfoCount.size();

        System.out.println("count = " + tr);
        int offset = (pc - 1)*5;    // 从第几条数据开始
        userInfoDto.setPc(offset);
        userInfoDto.setPs(5);   // 设置每次查询记录为5条
        List<ArticleInfo> articleInfoList = articleService.getTuiGao(userInfoDto);
        PageBean<ArticleInfo> pb = new PageBean<>();
        pb.setBeanList(articleInfoList);
        pb.setUrl(url);
        pb.setPc(pc);
        pb.setTr(tr);
        pb.setPs(5);
        mv.addObject("pb", pb);
        mv.setViewName("pages/editor/tuigao");
        return mv;
    }

    /**
     * 去退稿详情页面
     * @return
     */
    @RequestMapping(value = "toTuiGaoDetail", method = RequestMethod.GET)
    public ModelAndView toTuiGaoDetail(Integer articleId) throws Exception {
        ModelAndView mv = new ModelAndView();
        log.info("articleId = " + articleId);
        CheckUpWithBLOBs checkArticle = checkUpService.selectByArticleId(articleId);
        mv.addObject("checkArticle", checkArticle);
        mv.setViewName("pages/editor/tuigaodetail");
        return mv;
    }

}
