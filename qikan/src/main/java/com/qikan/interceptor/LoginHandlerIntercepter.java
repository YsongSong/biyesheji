package com.qikan.interceptor;

import com.qikan.entitys.UserInfo;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Yang.
 * 登陆拦截器
 * 场景：用户点击查看的时候，我们进行登陆拦截器操作，判断用户是否登陆？
 * 登陆，则不拦截，没登陆，则转到登陆界面；
 */
public class LoginHandlerIntercepter implements HandlerInterceptor {

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object arg2, Exception arg3)
            throws Exception {
    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
                           Object arg2, ModelAndView arg3) throws Exception {

    }
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object arg2) throws Exception {
        String requestURI = request.getRequestURI();
        System.out.println(requestURI);

        HttpSession session = request.getSession();
        UserInfo authorinfo = (UserInfo) session.getAttribute("authorInfo");
        UserInfo editorInfo = (UserInfo) session.getAttribute("editorInfo");
        UserInfo expertInfo = (UserInfo) session.getAttribute("expertInfo");


        System.out.println("authorInfo--Session:" + authorinfo);
        System.out.println("editorInfo--Session:" + editorInfo);
        System.out.println("expertInfo--Session:" + expertInfo);


        if(requestURI.indexOf("editor") > 0 ){
            //说明前往编辑管理页面,后台页面
            if(editorInfo != null){
                //登陆成功的用户
                return true;
            }else{
                //没有登陆，转向登陆界面
                String basePath = request.getContextPath();
                response.sendRedirect(basePath + "/pages/editor/login_editor.jsp");
                return false;
            }
        }

        if(requestURI.indexOf("contributePage") > 0 || requestURI.indexOf("author") > 0){
            //说明前往投稿页面,后台页面
            if(authorinfo != null){
                //登陆成功的用户
                return true;
            }else{
                //没有登陆，转向登陆界面
                String basePath = request.getContextPath();
                response.sendRedirect(basePath + "/pages/author/login_author.jsp");
                return false;
            }
        } else if(requestURI.indexOf("expert") > 0){
            //说明前往专家页面,后台页面
            if(expertInfo != null){
                //登陆成功的用户
                return true;
            }else{
                //没有登陆，转向登陆界面
                String basePath = request.getContextPath();
                response.sendRedirect(basePath + "/pages/expert/login_expert.jsp");
                return false;
            }
        } else {
            return true;
        }

    }

}

