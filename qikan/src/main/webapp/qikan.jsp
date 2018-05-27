<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>More</title>
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
        </div>
    </div>

</div>

<!-- 期刊列表 start -->

<div class="w1060">

    <div class="qikan_r">
        <h3><font>${type.typename}</font></h3>
        <div class="qk_list">

            <c:choose>

                <c:when test="${pb.beanList.size() == 0}" >
                    没有数据
                </c:when>
                <c:otherwise>

                    <c:forEach var="qikan" items="${pb.beanList}">

                        <div class="qk_box">
                            <div class="qk_book">
                                <a href="${pageContext.request.contextPath}/periodical/${qikan.qikanid}.htm">
                                    <img src="${pageContext.request.contextPath}/${qikan.image}" />
                                </a>
                            </div>
                            <div class="list-c">
                                <div class="book_title">
                                    <a href="${pageContext.request.contextPath}/periodical/${qikan.qikanid}.htm">${qikan.qikanname}</a>
                                </div>
                                <ul class="list-param">
                                    <li><span>主管单位：</span>${qikan.competentunit}</li>
                                    <li><span>主办单位：</span>${qikan.hostunit}</li>
                                    <li><span>国际刊号：</span>${qikan.issn}</li>
                                    <li><span>国内刊号：</span>${qikan.cn}</li>
                                    <li><span>期刊级别：</span>${qikan.jibie}</li>
                                    <li><span>审稿时间：</span>${qikan.readtime}</li>
                                </ul>
                            </div>
                            <!--list-c end-->
                            <div class="record-action-link">
                                <a class="export" href="${pageContext.request.contextPath}/tougao.do?qikanId=${qikan.qikanid}">
                                    <i class="icon-export"></i>
                                    <span class="text">在线投稿</span>
                                </a>
                            </div>
                        </div>

                    </c:forEach>

                    <!-- 此处循环打印  -->

                </c:otherwise>

            </c:choose>



        </div>


        <!-- 页码start -->
        <div class="pager clearfix">


            <div id="ctl00_ContentPlaceHolder1_AspNetPager1" class="paginator" ShowInputBox="Never" style="text-align:center;">

                <c:choose>
                    <c:when test="${pb.pc eq 1 }"><a disabled="disabled" style="margin-right:5px;">首页</a></c:when>
                    <c:otherwise><a href="${pb.url }&pc=1" style="margin-right:5px;">首页</a></c:otherwise>
                </c:choose>

                <c:choose>

                    <c:when test="${pb.pc eq 1 }"><a disabled="disabled" style="margin-right:5px;">上一页</a></c:when>
                    <c:otherwise><a href="${pb.url }&pc=${pb.pc-1}" style="margin-right:5px;">上一页</a></c:otherwise>
                </c:choose>


                <%--我们需要计算页码列表的开始和结束位置，即两个变量begin和end
                计算它们需要通过当前页码！
                1. 总页数不足6页--> begin=1, end=最大页
                2. 通过公式设置begin和end，begin=当前页-1，end=当前页+3
                3. 如果begin<1，那么让begin=1，end=6
                4. 如果end>tp, 让begin=tp-5, end=tp
                --%>
                <c:choose>
                <c:when test="${pb.tp <= 6 }">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="${pb.tp }"/>
                </c:when>
                <c:otherwise>
                    <c:set var="begin" value="${pb.pc-2 }"/>
                    <c:set var="end" value="${pb.pc + 3}"/>
                <c:if test="${begin < 1 }">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="6"/>
                </c:if>
                <c:if test="${end > pb.tp }">
                    <c:set var="begin" value="${pb.tp-5 }"/>
                    <c:set var="end" value="${pb.tp }"/>
                </c:if>
                </c:otherwise>
                </c:choose>

                <c:forEach begin="${begin }" end="${end }" var="i">
                    <c:choose>
                        <c:when test="${i eq pb.pc }">
                            <span class="page-selected" style="margin-right:5px;">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${pb.url }&pc=${i}"  style="margin-right:5px;">${i }</a>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>
                <%-- 计算begin和end --%>
                <%-- 如果总页数<=6，那么显示所有页码，即begin=1 end=${pb.tp} --%>
                <%-- 设置begin=当前页码-2，end=当前页码+3 --%>
                <%-- 如果begin<1，那么让begin=1 end=6 --%>
                <%-- 如果end>最大页，那么begin=最大页-5 end=最大页 --%>


                <%-- 显示点点点 --%>
                <c:if test="${end < pb.tp }">
                    <a style="margin-right:5px;">...</a>
                </c:if>

                <%--下一页 --%>
                <c:choose>
                    <c:when test="${pb.pc eq pb.tp }"><a disabled="disabled" style="margin-right:5px;">下一页</a></c:when>
                    <c:otherwise><a href="${pb.url }&pc=${pb.pc+1}">下一页</a></c:otherwise>
                </c:choose>

                <%-- 尾页 --%>

                <c:choose>
                    <c:when test="${pb.pc eq pb.tp }"><a disabled="disabled" style="margin-right:5px;"> 尾页</a></c:when>
                    <c:otherwise><a href="${pb.url }&pc=${pb.tp}" style="margin-right:5px;">尾页</a></c:otherwise>
                </c:choose>

            </div>


        </div>
        <!-- 页码end -->
    </div>


</div>

<!-- 期刊列表 end -->

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

