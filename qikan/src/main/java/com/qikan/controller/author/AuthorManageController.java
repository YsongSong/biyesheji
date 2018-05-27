package com.qikan.controller.author;

import com.qikan.entitys.ReturnResponse;
import com.qikan.entitys.UserInfo;
import com.qikan.enums.DegreeEnums;
import com.qikan.enums.RoleIdEnums;
import com.qikan.service.UserService;
import com.qikan.util.MD5Util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Created by Yang.
 */
@Controller
@RequestMapping("/author")
public class AuthorManageController {

    private final Logger logger = LoggerFactory.getLogger(AuthorManageController.class);
    @Autowired
    private UserService userService;

    /**
     * 注销
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/logOut")
    public String logOut(HttpServletRequest request,
                         HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.removeAttribute("authorInfo");
        return "redirect:/index.do";
    }


    /**
     * 去管理页面
     * @return
     */
    @RequestMapping(value = "admin", method = RequestMethod.GET)
    public String toadmin() {
        return "pages/author/weadmin";
    }

    /**
     * 去个人信息页面
     * @return
     */
    @RequestMapping(value = "authorInfo", method = RequestMethod.GET)
    public ModelAndView authorInfo(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        UserInfo authorInfo = (UserInfo) request.getSession().getAttribute("authorInfo");
        UserInfo author = userService.getUserById(authorInfo.getUserid());
        author.setDegreeid(DegreeEnums.getDegreeByCode(author.getDegreeid()));
        mv.addObject("user", author);
        mv.setViewName("pages/author/authorInfo");
        return mv;
    }

    /**
     * 去修改个人信息页面
     * @return
     */
    @RequestMapping(value = "editauthorinfo", method = RequestMethod.GET)
    public ModelAndView editauthorinfo(UserInfo userInfo) {
        ModelAndView mv = new ModelAndView();
        UserInfo user = userService.getUserById(userInfo.getUserid());
        mv.addObject("user", user);
        mv.setViewName("pages/author/editauthorinfo");
        return mv;
    }

    /**
     * 去修改密码
     * @return
     */
    @RequestMapping(value = "updatepassword", method = RequestMethod.GET)
    public ModelAndView updatepassword() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pages/author/updatepassword");
        return mv;
    }

    /**
     * 修改个人密码
     * @param oldpassword
     * @param newpassword
     * @param request
     * @return
     */
    @RequestMapping(value = "toUpdatePassword")
    @ResponseBody
    public ReturnResponse toUpdatePassword(String oldpassword, String newpassword, HttpServletRequest request) {
        ReturnResponse returnResponse = new ReturnResponse(0,"修改成功", "----");
        HttpSession session = request.getSession();
        UserInfo authorInfo = (UserInfo) session.getAttribute("authorInfo");
        authorInfo.setPassword(MD5Util.string2MD5(oldpassword));
        // 判断旧密码是否错误，错误返回错误信息
        UserInfo author = userService.getUser(authorInfo);
        if(author == null) {
            returnResponse.setCode(1);
            returnResponse.setMsg("旧密码错误！");
            return returnResponse;
        } else {
            authorInfo.setPassword(MD5Util.string2MD5(newpassword));
            try{
                userService.updateUserPassword(authorInfo);
                return returnResponse;
            }catch (Exception e) {
                returnResponse.setMsg("修改失败请重试！");
                returnResponse.setCode(1);
                return returnResponse;
            }
        }
    }

    /**
     * 修改个人信息
     * @param userInfo
     * @return
     */
    @RequestMapping(value = "toEditauthorInfo")
    @ResponseBody
    public ReturnResponse toEditauthorInfo(UserInfo userInfo) {
        ReturnResponse returnResponse = new ReturnResponse(0,"修改成功",null);
        try{
            System.out.println(userInfo);
            userService.updateByUserId(userInfo);
            return returnResponse;
        }catch (Exception e) {
            returnResponse.setCode(1);
            returnResponse.setMsg("修改失败请重试");
            return returnResponse;
        }
    }



}
