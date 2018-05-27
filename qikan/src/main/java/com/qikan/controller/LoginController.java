package com.qikan.controller;

/**
 * Created by Yang.
 */

import com.qikan.controller.author.AuthorManageController;
import com.qikan.entitys.Admin;
import com.qikan.entitys.ReturnResponse;
import com.qikan.entitys.UserInfo;
import com.qikan.enums.RoleIdEnums;
import com.qikan.enums.SystemIdEnums;
import com.qikan.service.AdminService;
import com.qikan.service.UserService;
import com.qikan.util.MD5Util;
import com.qikan.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录Controller
 */
@Controller
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    private UserService userService;
    @Autowired
    private AdminService adminService;

    /**
     * 跳转到登录页面
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam("systemId") String systemId, HttpServletRequest request) {
        logger.info("登录系统systemId:[" + systemId + "]");
        HttpSession session = request.getSession();
        ModelAndView mav = null;

        if(SystemIdEnums.AUTHOR_SYS.getCode().equals(systemId)){    // 去作者登录页面
            mav = new ModelAndView("pages/author/login_author");
        }else if(SystemIdEnums.EDIT_SYS.getCode().equals(systemId)){
            UserInfo editorInfo = (UserInfo) session.getAttribute("editorInfo");
            if(editorInfo!=null) { // 去编辑系统
                mav = new ModelAndView("pages/editor/weadmin");
            } else {
                mav = new ModelAndView("pages/editor/login_editor");
            }
        }else if(SystemIdEnums.EXPERT_SYS.getCode().equals(systemId)){
            UserInfo expert = (UserInfo) session.getAttribute("expertInfo");
            if (expert != null){    // 去专家系统
                mav = new ModelAndView("pages/expert/weadmin");
            } else {
                mav = new ModelAndView("pages/expert/login_expert");
            }
        }else if(SystemIdEnums.ADMIN_SYS.getCode().equals(systemId)){
            Admin adminInfo = (Admin) session.getAttribute("adminInfo");
            if (adminInfo != null){    // 去主编系统
                mav = new ModelAndView("pages/admin/weadmin");
            } else {
                mav = new ModelAndView("pages/admin/login_admin");
            }
        }else{
            mav=new ModelAndView("error");
        }
        mav.addObject("systemId", systemId);
        return mav;
    }

    /**
     * 作者登录
     * @param authorInfo
     * @return
     */
    @RequestMapping("/toAuthorLogin")
    public ModelAndView login(UserInfo authorInfo, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        if (StringUtil.isNotEmpty(authorInfo.getPassword())) {
            authorInfo.setPassword(MD5Util.string2MD5(authorInfo.getPassword()));
        }
        UserInfo author = new UserInfo();
        try {
            author = userService.getUser(authorInfo);
            if (author != null && author.getRoleid() == RoleIdEnums.AUTHOR.getCode()) {
                session.setAttribute("authorInfo", author);
                mv.setViewName("redirect:/main.jsp");
                return mv;
            } else {
                logger.info("账号查询失败：" + authorInfo.getUsername() + "&"
                        + authorInfo.getPassword());
                mv.setViewName("pages/author/login_author");
                mv.addObject("authorInfo", authorInfo);
                mv.addObject("msg", "用户名或密码错误!");
                return mv;
            }
        } catch (Exception e) {
            logger.info("登录失败：" + authorInfo.getUsername() + "&" + authorInfo.getPassword());
            mv.setViewName("pages/author/login_author");
            mv.addObject("authorInfo", authorInfo);
            mv.addObject("msg", "登录失败请重试!");
            return mv;
        }
    }

    /**
     * 专家登录
     * @param expertInfo
     * @param request
     * @return
     */
    @RequestMapping(value = "toExpertLogin")
    public ModelAndView toExpertLogin(UserInfo expertInfo, HttpServletRequest request) {
        logger.info(expertInfo.getUsername() + "----" + expertInfo.getPassword());
        ModelAndView mv = new ModelAndView();
        expertInfo.setPassword(MD5Util.string2MD5(expertInfo.getPassword()));
        UserInfo expert = userService.getUser(expertInfo);
        if(expert != null && expert.getRoleid() == RoleIdEnums.EXPERT.getCode()) {
            logger.info("专家登录成功：" + expertInfo.getUsername() + "&" + MD5Util.convertMD5(expertInfo.getPassword()));
            request.getSession().setAttribute("expertInfo", expert);
            mv.setViewName("pages/expert/weadmin");
        } else{
            logger.info("账号查询失败：" + expertInfo.getUsername() + "&"
                    + expertInfo.getPassword());
            mv.setViewName("pages/expert/login_expert");
            mv.addObject("expertInfo", expertInfo);
            mv.addObject("msg", "用户名或密码错误!");
            return mv;
        }
        mv.addObject("expertInfo", expert);
        return mv;
    }


    /**
     * 编辑登录
     * @param editorInfo
     * @param request
     * @return
     */
    @RequestMapping(value = "toEditorLogin")
    public ModelAndView toEditorLogin(UserInfo editorInfo, HttpServletRequest request) {
        logger.info(editorInfo.getUsername() + "----" + editorInfo.getPassword());
        ModelAndView mv = new ModelAndView();
        editorInfo.setPassword(MD5Util.string2MD5(editorInfo.getPassword()));
        UserInfo editor = userService.getUser(editorInfo);
        if(editor != null && editor.getRoleid() == RoleIdEnums.EDITOR.getCode()) {
            logger.info("编辑登录成功：" + editorInfo.getUsername() + "&" + MD5Util.convertMD5(editorInfo.getPassword()));
            request.getSession().setAttribute("editorInfo", editor);
            mv.setViewName("pages/editor/weadmin");
        } else{
            logger.info("账号查询失败：" + editorInfo.getUsername() + "&"
                    + editorInfo.getPassword());
            mv.setViewName("pages/editor/login_editor");
            mv.addObject("editorInfo", editorInfo);
            mv.addObject("msg", "用户名或密码错误!");
            return mv;
        }
        mv.addObject("editorInfo", editor);
        return mv;
    }


    /**
     * 主编登录
     * @param admin
     * @param request
     * @return
     */
    @RequestMapping(value = "toAdminLogin")
    public ModelAndView toAdminLogin(Admin admin, HttpServletRequest request) {
        logger.info(admin.getUsername() + "----" + admin.getPassword());
        ModelAndView mv = new ModelAndView();
        admin.setPassword(MD5Util.string2MD5(admin.getPassword()));
        Admin adminResult = adminService.login(admin);
        if(adminResult != null) {
            logger.info("主编登录成功：" + admin.getUsername() + "&" + MD5Util.convertMD5(admin.getPassword()));
            request.getSession().setAttribute("adminInfo", admin);
            mv.setViewName("pages/admin/weadmin");
        } else{
            logger.info("账号查询失败：" + admin.getUsername() + "&"
                    + admin.getPassword());
            mv.setViewName("pages/admin/login_admin");
            mv.addObject("adminInfo", admin);
            mv.addObject("msg", "用户名或密码错误!");
            return mv;
        }
        mv.addObject("adminInfo", admin);
        return mv;
    }


    /**
     * 注册
     * @param authorInfo
     * @return
     */
    @RequestMapping(value = "/toRegister", method = RequestMethod.POST)
    public ModelAndView register(UserInfo authorInfo) {
        ModelAndView mv = new ModelAndView();
        System.out.println(authorInfo);
        try {
            //执行添加用户功能
            authorInfo.setPassword(MD5Util.string2MD5(authorInfo.getPassword()));
            authorInfo.setRoleid(RoleIdEnums.AUTHOR.getCode());
            userService.insertUser(authorInfo);
            logger.info("注册成功！请登录！");
            mv.addObject("msg","注册成功请登录！");
            mv.setViewName("pages/author/login_author");
            return mv;
        } catch (Exception e) {
            logger.info("注册失败！" + authorInfo.getUsername() + "----" + authorInfo.getPassword());
            mv.addObject("msg","注册失败请重试！");
            mv.setViewName("pages/author/regist");
            return mv;
        }
    }
}

