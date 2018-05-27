package com.qikan.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Yang.
 */
@Controller
@RequestMapping("admin")
public class AdminController {

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
        session.removeAttribute("admin");
        return "redirect:/index.do";
    }

    /**
     * 去管理页面
     * @return
     */
    @RequestMapping(value = "admin", method = RequestMethod.GET)
    public String toadmin() {
        return "pages/admin/weadmin";
    }

}
