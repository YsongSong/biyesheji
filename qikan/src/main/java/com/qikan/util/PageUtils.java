package com.qikan.util;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Yang.
 */
public class PageUtils {

    /**
     * 获取当前页码
     * @param req
     * @return
     */
    public static int getPc(HttpServletRequest req) {
        int pc = 1;
        String param = req.getParameter("pc");
        if(param != null && !param.trim().isEmpty()) {
            try {
                pc = Integer.parseInt(param);
            } catch(RuntimeException e) {}
        }
        return pc;
    }

    /**
     * 截取url，页面中的分页导航中需要使用它做为超链接的目标！
     * @param req
     * @return
     */
	/*
	 * http://localhost:8080/periodical/index?typeId=xxx&pc=3
	 * /goods/BookServlet + methed=findByCategory&cid=xxx&pc=3
	 */
    public static String getUrl(HttpServletRequest req) {
        String url = req.getRequestURI() + "?" + req.getQueryString();
		/*
		 * 如果url中存在pc参数，截取掉，如果不存在那就不用截取。
		 */
        int index = url.lastIndexOf("&pc=");
        if(index != -1) {
            url = url.substring(0, index);
        }
        return url;
    }

}
