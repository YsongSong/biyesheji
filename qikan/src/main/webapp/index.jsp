<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>长江大学期刊投稿</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forground/home.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forground/index.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forground/loginDialog.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js" ></script>

</head>
<body>
<!-- 顶部登录注册 start  -->
<div class="top_nav">
    <div class="w1060 clearfix">
        <div class="fl">期刊在线投稿</div>
        <c:choose>
            <c:when test="${authorInfo!= null}">
                <div class="help">
                    <span class="red">${authorInfo.username}</span><span>|</span><a href="${pageContext.request.contextPath}/author/admin.do">个人中心</a><span>|</span><a href="${pageContext.request.contextPath}/author/logOut.do">退出登录</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="help">
                    <a href="${pageContext.request.contextPath}/login.do?systemId=333" class="red">{登录}</a><span>|</span><a href="${pageContext.request.contextPath}/pages/author/regist.jsp">{注册}</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<!-- 顶部登录注册  end  -->

<!-- 搜索栏 start -->
<div class="header">
    <div class="logo clearfix">
        <a href="periodical/index.html"><img src="${pageContext.request.contextPath}/img/logo1.jpg"></a>
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
        <img src="${pageContext.request.contextPath}/img/logo2.jpg">
    </div>
</div>
<!-- 搜索栏 end -->

<!-- 导航栏 start -->

<!-- 导航 start -->
<div class="w1060 clearfix pos_r">

    <div id="nav">
        <ul>
            <li><a href="${pageContext.request.contextPath}/index.do" target="_blank"><em></em>首页</a></li>
            <li><a href="${pageContext.request.contextPath}/qikan.jsp" target="_blank">关于我们</a></li>
            <li><a href="#" target="_blank">学术期刊</a></li>
            <li><a href="#" target="_blank">学术论文</a></li>

            <li><a href="#" target="_blank">联系我们</a></li>
            <li><a href="#" target="_blank">帮助中心</a></li>
            <li><a href="${pageContext.request.contextPath}/contributePage/tougao.do" target="_blank">在线投稿</a></li>
        </ul>
    </div>
</div>
<!-- 导航 end -->

<!-- 主要 -->
<div class="w1060 pos_r">

    <div class="product_sort fl">
        <div class="hd">在线办公</div>
        <div class="bd  hide">
            <div class="item">
                <div class="title one">
                    <!--<em class="book_icon"></em>-->
                    <a target="_blank" href="${pageContext.request.contextPath}/contributePage/tougao.do">在线投稿</a>
                </div>
            </div>
            <div class="item">
                <div class="title one">
                    <!--<em class="book_icon"></em>-->
                    <a target="_blank" href="${pageContext.request.contextPath}/login.do?systemId=222">在线审稿</a>
                </div>
            </div>
            <div class="item">
                <div class="title one">
                    <!--<em class="book_icon"></em>-->
                    <a target="_blank" href="${pageContext.request.contextPath}/login.do?systemId=111">编辑办公</a>
                </div>
            </div>
            <div class="item">
                <div class="title one">
                    <!--<em class="book_icon"></em>-->
                    <a target="_blank" href="${pageContext.request.contextPath}/login.do?systemId=444">主编办公</a>
                </div>
            </div>
        </div>
    </div>

    <!-- 中间大图 start -->
    <div>
        <img src="${pageContext.request.contextPath}/img/ad2.jpg"  style="margin-left: 35px;"/>
    </div>
    <!-- 中间大图 end -->

    <!-- 期刊列表start -->

    <div class="w1060">

        <div class="work-floor">
            <div class="zzsc" id="jiaoyu">

                <div class="tab_box">

                    <div class="tab">
                        <c:forEach var="pageBean" items="${pageBeans}" begin="0" end="3" varStatus="allStatus">
                        <a href="javascript:;" class="on">${pageBean.type.typename}</a>
                        </c:forEach>
                    </div>
                    <div class="more">
                        <a target="_blank" href="${pageContext.request.contextPath}/alltype.do">更多&gt;&gt;</a>
                    </div>
                </div>


                <!-- 主要内容 start -->
                <div class="content">
                    <ul>
                        <c:forEach var="pageBean" items="${pageBeans}" begin="0" end="3">
                        <li style="display:block;">
                            <!-- 左侧 -->
                            <div class="tab_box_list">
                                <dl>
                                    <c:forEach var="notice" items="${pageBean.noticeList}">
                                    <dd><a target="_blank" href="${pageContext.request.contextPath}/notice/${notice.noticeid}.htm">${notice.noticetitle}</a></dd>
                                    </c:forEach>
                                </dl>
                            </div>

                            <!-- 右侧 -->
                            <div class="qikan">
                                <div class="qikan_box">

                                    <c:forEach var="qikan" items="${pageBean.qikanList}">

                                    <dl>
                                        <a target="_blank" href="${pageContext.request.contextPath}/periodical/${qikan.qikanid}.htm">
                                            <dt>
                                                <img src="${qikan.image}"></dt>
                                            <dd>
                                                <h3>${qikan.qikanname}</h3>
                                                <p>${qikan.jibie}</p>
                                            </dd>
                                        </a>
                                    </dl>

                                    </c:forEach>


                                </div>
                            </div>

                        </li>

                        </c:forEach>
                    </ul>
                </div>

                <!-- 主要内容 end -->

            </div>
            <!--work-floor end-->
        </div>

    </div>

    <div class="w1060">

        <div class="work-floor">
            <div class="zzsc" id="jingji">

                <div class="tab_box">

                    <div class="tab">
                        <c:forEach var="pageBean" items="${pageBeans}" begin="3"  varStatus="allStatus">

                            <a href="javascript:;" class="on">${pageBean.type.typename}</a>

                        </c:forEach>
                    </div>
                    <div class="more">
                        <a target="_blank" href="${pageContext.request.contextPath}/alltype.do">更多&gt;&gt;</a>
                    </div>
                </div>


                <!-- 主要内容 start -->
                <div class="content">
                    <ul>
                        <c:forEach var="pageBean" items="${pageBeans}" begin="3">
                            <li style="display:block;">
                                <!-- 左侧 -->
                                <div class="tab_box_list">
                                    <dl>
                                        <c:forEach var="notice" items="${pageBean.noticeList}">
                                            <dd><a target="_blank" href="${pageContext.request.contextPath}/notice/${notice.noticeid}.htm">${notice.noticetitle}</a></dd>
                                        </c:forEach>
                                    </dl>
                                </div>

                                <!-- 右侧 -->
                                <div class="qikan">
                                    <div class="qikan_box">

                                        <c:forEach var="qikan" items="${pageBean.qikanList}">

                                            <dl>
                                                <a target="_blank" href="${pageContext.request.contextPath}/periodical/${qikan.qikanid}.htm">
                                                    <dt>
                                                        <img src="${qikan.image}"></dt>
                                                    <dd>
                                                        <h3>${qikan.qikanname}</h3>
                                                        <p>${qikan.jibie}</p>
                                                    </dd>
                                                </a>
                                            </dl>

                                        </c:forEach>


                                    </div>
                                </div>

                            </li>

                        </c:forEach>
                    </ul>
                </div>

                <!-- 主要内容 end -->

            </div>
            <!--work-floor end-->
        </div>

    </div>

    <!-- 期刊列表start -->

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
                <span id="btnLogin"><a href="${pageContext.request.contextPath}/login.do?systemId=444">管理登录</a></span>
            </p>
        </div>
    </div>
</div>
<!-- 底部 end -->

</body>
</html>
