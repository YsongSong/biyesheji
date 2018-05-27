package com.qikan.controller.editor;

import com.qikan.entitys.ArticleInfo;
import com.qikan.entitys.ArticleInfoDto;
import com.qikan.entitys.ReturnResponse;
import com.qikan.entitys.UserInfo;
import com.qikan.enums.DegreeEnums;
import com.qikan.enums.RoleIdEnums;
import com.qikan.pager.PageBean;
import com.qikan.service.ArticleService;
import com.qikan.service.UserService;
import com.qikan.util.MD5Util;
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
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Yang.
 */
@Controller
@RequestMapping(value = "editor")
public class EditorManageController {

    private static final Logger logger = LoggerFactory.getLogger(EditorManageController.class);

    @Autowired
    private UserService userService;


    /**
     * 编辑注销登录
     * @param request
     * @return
     */
    @RequestMapping(value = "toEditorLogOut")
    public ModelAndView toExpertLogOut(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        request.getSession().removeAttribute("editorInfo");
        mv.setViewName("redirect:/index.do");
        return mv;
    }

    /**
     * 去编辑个人信息页面
     * @return
     */
    @RequestMapping("editorInfo")
    public ModelAndView toEditorInfo(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        UserInfo editorInfo = (UserInfo) request.getSession().getAttribute("editorInfo");
        UserInfo editor = userService.getUserById(editorInfo.getUserid());
        editor.setDegreeid(DegreeEnums.getDegreeByCode(editor.getDegreeid()));
        mv.addObject("editor", editor);
        mv.setViewName("pages/editor/editorInfo");
        return mv;
    }

    /**
     * 去修改个人信息页面
     * @return
     */
    @RequestMapping(value = "toEditEditorInfo", method = RequestMethod.GET)
    public ModelAndView toEditEditorInfo(UserInfo userInfo) {
        ModelAndView mv = new ModelAndView();
        UserInfo editor = userService.getUserById(userInfo.getUserid());
        mv.addObject("editor", editor);
        mv.setViewName("pages/editor/modifyeditorinfo");
        return mv;
    }

    /**
     * 去修改密码
     * @return
     */
    @RequestMapping(value = "updatepassword", method = RequestMethod.GET)
    public ModelAndView updatepassword() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pages/editor/updatepassword");
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
        UserInfo editorInfo = (UserInfo) session.getAttribute("editorInfo");
        editorInfo.setPassword(MD5Util.string2MD5(oldpassword));
        // 判断旧密码是否错误，错误返回错误信息
        UserInfo author = userService.getUser(editorInfo);
        if(author == null) {
            returnResponse.setCode(1);
            returnResponse.setMsg("旧密码错误！");
            return returnResponse;
        } else {
            editorInfo.setPassword(MD5Util.string2MD5(newpassword));
            try{
                userService.updateUserPassword(editorInfo);
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
    @RequestMapping(value = "modifyEditorInfo")
    @ResponseBody
    public ReturnResponse modifyEditorInfo(UserInfo userInfo) {
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
