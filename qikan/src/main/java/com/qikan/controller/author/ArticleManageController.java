package com.qikan.controller.author;

import com.qikan.entitys.ArticleInfo;
import com.qikan.entitys.ReturnResponse;
import com.qikan.entitys.UserInfo;
import com.qikan.entitys.UserInfoDto;
import com.qikan.pager.PageBean;
import com.qikan.service.ArticleService;
import com.qikan.util.PageUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 作者工作区-稿件查询,修改
 * Created by Yang.
 */
@Controller
@RequestMapping("author")
public class ArticleManageController {

    private final Logger logger = LoggerFactory.getLogger(ArticleManageController.class);

    @Autowired
    private ArticleService articleService;

    /**
     * 去已投稿件页面  即未审核完成
     * @return
     */
    @RequestMapping(value = "auditingArticles", method = RequestMethod.GET)
    public ModelAndView auditingArticles(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        /*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
        int pc = PageUtils.getPc(request);
		/*
		 * 2. 得到url：...
		 */
        String url = PageUtils.getUrl(request);

        UserInfo author = (UserInfo) request.getSession().getAttribute("authorInfo");
        UserInfoDto userInfoDto = new UserInfoDto();
        userInfoDto.setUserid(author.getUserid());

        userInfoDto.setPs(null);    // 首先设置查询数据为0  统计总记录数
        List<ArticleInfo> articleInfoCount = articleService.getUnCheckArticle(userInfoDto); // 获取总记录数
        int tr = articleInfoCount.size();

        System.out.println("count = " + tr);
        int offset = (pc - 1)*5;    // 从第几条数据开始
        userInfoDto.setPc(offset);
        userInfoDto.setPs(5);   // 设置每次查询记录为5条

        List<ArticleInfo> articleInfoList = articleService.getUnCheckArticle(userInfoDto);
        PageBean<ArticleInfo> pb = new PageBean<>();
        pb.setBeanList(articleInfoList);
        pb.setUrl(url);
        pb.setPc(pc);
        pb.setTr(tr);
        pb.setPs(5);
        mv.addObject("pb", pb);
        mv.setViewName("pages/author/auditingArticles");
        return mv;
    }

    /**
     * 去已审核页面
     * @return
     */
    @RequestMapping(value = "checkupArticles", method = RequestMethod.GET)
    public ModelAndView checkupArticles(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        /*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
        int pc = PageUtils.getPc(request);
		/*
		 * 2. 得到url：...
		 */
        String url = PageUtils.getUrl(request);

        UserInfo author = (UserInfo) request.getSession().getAttribute("authorInfo");
        UserInfoDto userInfoDto = new UserInfoDto();
        userInfoDto.setUserid(author.getUserid());

        userInfoDto.setPs(null);    // 首先设置查询数据为0  统计总记录数
        List<ArticleInfo> articleInfoCount = articleService.getCheckArticle(userInfoDto); // 获取总记录数
        int tr = articleInfoCount.size();

        System.out.println("count = " + tr);
        int offset = (pc - 1)*5;    // 从第几条数据开始
        userInfoDto.setPc(offset);
        userInfoDto.setPs(5);   // 设置每次查询记录为5条
        List<ArticleInfo> articleInfoList = articleService.getCheckArticle(userInfoDto);    // 已审核稿件查询
        PageBean<ArticleInfo> pb = new PageBean<>();
        pb.setBeanList(articleInfoList);
        pb.setUrl(url);
        pb.setPc(pc);
        pb.setTr(tr);
        pb.setPs(5);
        mv.addObject("pb", pb);
        mv.setViewName("pages/author/checkupArticles");
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

        UserInfo author = (UserInfo) request.getSession().getAttribute("authorInfo");
        UserInfoDto userInfoDto = new UserInfoDto();
        userInfoDto.setUserid(author.getUserid());

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
        mv.setViewName("pages/author/publishedArticles");
        return mv;
    }

    /**
     * 去修改稿件信息页面
     * @return
     */
    @RequestMapping(value = "modifyArticle", method = RequestMethod.GET)
    public ModelAndView modifyArticle(Integer articleId) {
        logger.info("稿件编号---" + articleId);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pages/author/editarticle");
        return mv;
    }

    /**
     * 删除稿件
     * @param articleId
     * @return
     */
    @RequestMapping(value = "deleteArticleById")
    @ResponseBody
    public ReturnResponse deleteArticleByArticleId(Integer articleId, HttpServletRequest request) {
        ReturnResponse returnResponse = new ReturnResponse(0, "删除成功","");
        ArticleInfo articleInfo = articleService.selectByArticleId(articleId);
        if (articleInfo.getEditorstatus() == 1) {
            returnResponse.setCode(1);
            returnResponse.setMsg("审核中的稿件不允许删除！");
            return returnResponse;
        }
        try {
            articleService.deleteByArticleId(articleId);
            return returnResponse;
        } catch (Exception e) {
            returnResponse.setCode(1);
            returnResponse.setMsg("删除失败");
            return returnResponse;
        }

    }

}
