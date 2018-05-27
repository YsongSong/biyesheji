package com.qikan.controller.author;

import com.qikan.entitys.*;
import com.qikan.service.AuthorContributeService;
import com.qikan.service.QikanService;
import com.qikan.service.TypeService;
import com.qikan.util.DateUtils;
import com.qikan.util.FileUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;

/**
 * Created by Yang.
 */
@Controller
@RequestMapping("contributePage")
public class ContributePageController {

    private static final Logger logger = LoggerFactory.getLogger(ContributePageController.class);
    @Autowired
    private TypeService typeService;
    @Autowired
    private QikanService qikanService;
    @Autowired
    private AuthorContributeService authorContributeService;

    @Value("${file.dir}")
    String fileDir;

    @RequestMapping(value = "/toContribute", method = RequestMethod.POST)
    //上传文件会自动绑定到MultipartFile中
    public ModelAndView upload(@RequestParam("file") MultipartFile file,
                                 ArticleInfo article,Integer qikanid, HttpServletRequest request
                                 ) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("message");
        System.out.println(article.toString());
        /* 获取session中作者信息 */
        HttpSession session = request.getSession();
        UserInfo authorinfo = (UserInfo) session.getAttribute("authorInfo");
        //如果文件不为空，写入上传路径(文章保存位置=基础路径/+作者Id/xxx.doc)
        String fileName = file.getOriginalFilename();
        // 判断该文件类型是否有上传过，如果上传过则提示不允许再次上传
        String filePath = fileDir + authorinfo.getUserid() + "\\" + fileName;
        String outPath = fileDir + authorinfo.getUserid();
        File outFile = new File(fileDir + authorinfo.getUserid());
        if(FileUtil.fileExists(filePath)) {
            mv.addObject("msg","稿件已存在，请返回重新上传稿件！");
            return mv;
        }
        if(FileUtil.fileUpload(file, filePath, outPath)) {
            Qikan articleQikan = new Qikan();
            articleQikan.setQikanid(qikanid);
            // 保存稿件信息
            article.setAuthor(authorinfo);
            article.setArticlepath(fileName);
            article.setReceivearticletime(DateUtils.getDate());
            article.setQikan(articleQikan);
            article.setEditorstatus(0);     // 审核状态 0待审核,1审核中, 2已审核
            authorContributeService.saveArticle(article);
            mv.addObject("msg","投稿成功!");
        } else {
            mv.addObject("msg","投稿失败，请重新尝试!");
        }
        return mv;
    }

    @RequestMapping(value = "/tougao")
    public ModelAndView touGao() {
        ModelAndView mv = new ModelAndView();
        /* 获取类别列表 */
        List<Type> typeList = typeService.getAllType();
        mv.setViewName("tougao");
        mv.addObject("typeList", typeList);
        return mv;
    }
}
