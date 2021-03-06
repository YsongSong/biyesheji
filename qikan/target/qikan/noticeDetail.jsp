<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>通知细页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forground/home.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forground/index.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forground/loginDialog.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forground/qikan.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js" ></script>



</head>
<body>
<!-- 顶部登录注册 start  -->
<div class="top_nav">
    <div class="w1060 clearfix">
        <div class="fl">专业论文发表服务平台</div>
        <div class="help">
            <a href="http://www.24zazhi.com/login/login.aspx" class="red">{登录}</a><a href="http://www.24zazhi.com/register/register.aspx">{注册}</a><span>|</span>

        </div>
    </div>
</div>
<!-- 顶部登录注册  end  -->

<!-- 搜索栏 start -->
<div class="header">
    <div class="logo clearfix">
        <a href="http://www.24zazhi.com/"><img src="${pageContext.request.contextPath}/img/logo1.jpg"></a>
    </div>
    <div class="header_txt"></div>
    <div class="search">
        <form>
            <input type="text" class="search_text" id="search_t" value="请输入搜索内容" onfocus="this.value=&#39;&#39;">
            <input type="button" class="search_btn s" value="搜索" onclick="opsearch()" id="search_btn"><br>
            <font style="color:#aeaeae; font-size:12px;">商业文化 &nbsp;&nbsp;|&nbsp; 工程建设与设计 &nbsp;| &nbsp;中小企业管理与科技</font>
        </form>
    </div>
    <div class="tel">
        <img src="img/logo2.jpg">
    </div>
</div>
<!-- 搜索栏 end -->

<!-- 导航栏 start -->

<!-- 导航 start -->
<div class="w1060 clearfix pos_r">

    <div id="nav">
        <ul>
            <li><a href="index.html" target="_blank"><em></em>首页</a></li>
            <li><a href="#" target="_blank">关于我们</a></li>
            <li><a href="#" target="_blank">学术期刊</a></li>
            <li><a href="#" target="_blank">学术论文</a></li>

            <li><a href="#" target="_blank">联系我们</a></li>
            <li><a href="#" target="_blank">帮助中心</a></li>
            <li><a href="tougao.html" target="_blank">在线投稿</a></li>
        </ul>
    </div>
</div>
<!-- 导航 end -->

<!-- 主要 -->

<div class="w1060 pos_r">
    <div class="product_sort fl">
        <div class="hd">所有分类</div>
        <div class="bd  hide">
            <div class="item">
                <div class="title one">
                    <!--<em class="book_icon"></em>-->
                    <a target="_blank" href="http://www.24zazhi.com/Periodical/HeXin/index.html">核心</a>
                    /<a target="_blank" href="http://www.24zazhi.com/Periodical/JiaoYu/index.html">教育</a>
                    /<a target="_blank" href="http://www.24zazhi.com/Periodical/YiXue/index.html">医学</a>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="w1060">
    <div class="qk_fl clearfix">


        <div class='qkartcont' style="height: 600px;">
            <h2>《教育科学》录用通知：</h2>
            <div class='tc grey'>
                <span>${notice.noticetime}</span>

            </div>
            <div class='artbox'>【摘要】

                ${notice.noticetext}...

            </div>

            <!--<div class='art_nr'>


            </div>-->


            ${notice.noticecontent}


        </div>

        <div class="msg">
            <p>上一篇：<a href='/literature/detail.aspx?id=60761&tid=95'>《工程建设标准化》杂志用稿通知书</a> </p> <p style='text-align:right'>下一篇：<a href='/literature/detail.aspx?id=267643&tid=95'>浅议信息时代国际货代行业的发展出路</a></p>
        </div>

    </div>
</div>


<!-- 底部 start -->
<div id="footer">
    <div class="w1060">
        <div class="footer_link">
            <p>版权所有：长江大学计算机科学学院软工2班LWAITING</p>
            <a href="https://ysongsong.github.io/qikan/" target="_blank">项目地址：https://ysongsong.github.io/qikan/</a>
            <p>联系地址：湖北荆州市南环路1号 长江大学计算机科学学院 434023</p>
        </div>

        <div class="left">
            <p class="admin_login">
                <span id="btnLogin"><a href="#">管理登录</a></span>
            </p>
        </div>

    </div>
</div>
<!-- 底部 end -->

</body>
</html>
