package com.qikan.controller.expert;

import com.qikan.entitys.ReturnResponse;
import com.qikan.entitys.UserInfo;
import com.qikan.enums.DegreeEnums;
import com.qikan.service.UserService;
import com.qikan.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Yang.
 */
@Controller
@RequestMapping("expert")
public class ExpertController {
    @Autowired
    private UserService userService;

    /**
     * 去专家个人信息页面
     * @return
     */
    @RequestMapping("expertInfo")
    public ModelAndView toEditorInfo(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        UserInfo expertInfo = (UserInfo) request.getSession().getAttribute("expertInfo");
        UserInfo expert = userService.getUserById(expertInfo.getUserid());
        expert.setDegreeid(DegreeEnums.getDegreeByCode(expert.getDegreeid()));
        mv.addObject("expert", expert);
        mv.setViewName("pages/expert/expertInfo");
        return mv;
    }

    /**
     * 去修改专家个人信息页面
     * @return
     */
    @RequestMapping(value = "toEditExpertInfo", method = RequestMethod.GET)
    public ModelAndView toEditEditorInfo(UserInfo userInfo) {
        ModelAndView mv = new ModelAndView();
        UserInfo expert = userService.getUserById(userInfo.getUserid());
        mv.addObject("expert", expert);
        mv.setViewName("pages/expert/editexpertinfo");
        return mv;
    }

    /**
     * 修改专家个人信息
     * @param userInfo
     * @return
     */
    @RequestMapping(value = "editExpertInfo")
    @ResponseBody
    public ReturnResponse editExpertInfo(UserInfo userInfo) {
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

    /**
     * 去修改密码页面
     * @return
     */
    @RequestMapping(value = "updatepassword", method = RequestMethod.GET)
    public ModelAndView updatepassword() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pages/expert/updatepassword");
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
        UserInfo expertInfo = (UserInfo) session.getAttribute("expertInfo");
        expertInfo.setPassword(MD5Util.string2MD5(oldpassword));
        // 判断旧密码是否错误，错误返回错误信息
        UserInfo expert = userService.getUser(expertInfo);
        if(expert == null) {
            returnResponse.setCode(1);
            returnResponse.setMsg("旧密码错误！");
            return returnResponse;
        } else {
            expertInfo.setPassword(MD5Util.string2MD5(newpassword));
            try{
                userService.updateUserPassword(expertInfo);
                return returnResponse;
            }catch (Exception e) {
                returnResponse.setMsg("修改失败请重试！");
                returnResponse.setCode(1);
                return returnResponse;
            }
        }
    }

    /**
     * 专家注销
     * @param request
     * @return
     */
    @RequestMapping(value = "toExpertLogOut")
    public ModelAndView toExpertLogOut(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        request.getSession().removeAttribute("expertInfo");
        mv.setViewName("redirect:/index.do");
        return mv;
    }
}
