<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>期刊详细页</title>
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

    <div class="w1060 clearfix">
        <div class="qk_main">
            <div class='qk_nr_img'>
                <img src="${pageContext.request.contextPath}/${qikan.image}" />
            </div>
            <div class='qk_nr_con'>
                <h3>${qikan.qikanname}</h3>
                <table width='0' border='0' cellspacing='0' cellpadding='0'>
                    <tr>
                        <td width='60%'>主管单位：${qikan.competentunit}</td>
                        <td width='40%'>主办单位：${qikan.hostunit}</td>
                    </tr>
                    <tr>
                        <td width='60%'>国际刊号：${qikan.issn}</td>
                        <td width='40%'>国内刊号：${qikan.cn}</td>
                    </tr>
                    <tr>
                        <td width='60%'>期刊级别：${qikan.jibie}</td>
                        <td width='40%'>发行周期：月刊</td>
                    </tr>
                    <tr>
                        <td width='60%'>投稿邮箱：24zazhi@sina.com</td>
                        <td width='40%'>审稿时间：3-7天</td>
                    </tr>
                    <%--<tr>--%>
                        <%--<td colspan='2'>收录情况：知网；万方</td>--%>
                    <%--</tr>--%>
                </table>
            </div>
            <div class='qk_link'>
                <h3>联系方式</h3>
                <p>电话：000-0000000</p>
                <p>24小时电话：18888888888</p>
                <p>地址：中国湖北荆州</p>
                <p>邮编：666666</p>
                <p>邮箱：tougao@tougao.com</p>
            </div>

        </div>
        <!--qk_main end-->
    </div>


    <c:choose>

        <c:when test="${authorInfo == null}">
            <center>
                <a href="${pageContext.request.contextPath}/login.do?systemId=333">请先登录再投稿</a>
            </center>
        </c:when>

        <c:otherwise>

            <!-- 投稿 start  -->
            <div class="w1060" id="tougao">

                <div class="qk_fl clearfix">

                    <div style="margin-top: 20px" align="center">

                        <form name="aspnetForm" method="post" action="${pageContext.request.contextPath}/contributePage/toContribute.do" id="aspnetForm" class="publicForm" enctype="multipart/form-data">

                            <input hidden="hidden" name="qikanid" value="${qikan.qikanid}" />

                            <table width="714" border="0" cellspacing="0" cellpadding="0" bordercolor="#bfc2c8">

                                <tr>
                                    <td class="need" style="width: 10px;"></td>
                                    <td style="width: 100px;">中文题目：</td>
                                    <td style="width: 205px;">

                                        <input type="text" id="articleCNTitle" name="articlecntitle" class="input_txt w340" />
                                    </td>
                                    <td>
                                        <div class="articleCNTitleValidform_checktip"></div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="need" style="width: 10px;"></td>
                                    <td style="width: 80px;">英文题目：</td>
                                    <td style="width: 205px;">

                                        <input type="text" id="articleENTitle" name="articleentitle" class="input_txt w340" />
                                    </td>
                                    <td>
                                        <div class="articleENTitleValidform_checktip"></div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="need" style="width: 10px;"></td>
                                    <td style="width: 80px;">中文摘要：</td>
                                    <td style="width: 205px;">

                                        <input type="text" id="articleCNSummary" name="articlecnsummary" class="input_txt w340" />
                                    </td>
                                    <td>
                                        <div class="articleCNSummaryValidform_checktip"></div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="need" style="width: 10px;"></td>
                                    <td style="width: 80px;">英文摘要：</td>
                                    <td style="width: 205px;">

                                        <input type="text" id="articleENSummary" name="articleensummary" class="input_txt w340" />
                                    </td>
                                    <td>
                                        <div class="articleENSummaryValidform_checktip"></div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="need" style="width: 10px;"></td>
                                    <td style="width: 80px;">中文关键字：</td>
                                    <td style="width: 205px;">

                                        <input type="text" id="articleCNKeywords" name="articlecnkeywords" class="input_txt w340" />
                                    </td>
                                    <td>
                                        <div class="articleCNKeywordsValidform_checktip"></div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="need" style="width: 10px;"></td>
                                    <td style="width: 80px;">英文关键字：</td>
                                    <td style="width: 205px;">

                                        <input type="text" id="articleENKeywords" name="articleenkeywords" class="input_txt w340" />
                                    </td>
                                    <td>
                                        <div class="articleENKeywordsValidform_checktip"></div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="need"></td>
                                    <td>上传稿件：</td>
                                    <td>
                                        <input type="file" name="file" id="fileUpload" onchange="checkFileType(this.value);" />

                                    </td>
                                    <td>
                                        <div class="fileUploadValidform_checktip"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="need"></td>
                                    <td></td>
                                    <td colspan="2" style="padding: 10px 0 18px 0;">
                                        <input type="submit" name="submit" value="提 交" id="submitBtn" class="tjtg" style="color:White;background-color:#6CBBE5;height:30px;width:80px;" />

                                    </td>
                                </tr>
                            </table>

                        </form>

                    </div>

                </div>
            </div>

        </c:otherwise>

    </c:choose>




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

<script type="text/javascript">

    $(function() {

        $("#second").hide(); //初始化的时候第二个下拉列表隐藏

        /*
         * 表单提交时进行校验
         */
        $("#submitBtn").click("submit",function() {
            var bool = true;//表示校验通过
            if(!articleCNTitle()) {
                bool = false;
            }
            if(!articleENTitle()) {
                bool = false;
            }
            if(!articleCNSummary()) {
                bool = false;
            }
            if(!articleENSummary()) {
                bool = false;
            }
            if(!articleCNKeywords()) {
                bool = false;
            }
            if(!articleENKeywords()) {
                bool = false;
            }
            if(!fileupload()) {
                bool = false;
            }

            return bool;
        });

        /*
         * 输入框得到焦点时隐藏错误信息
         */
        $(".input_txt").focus(function() {
            var inputName = $(this).attr("id");
            $("." + inputName + "Validform_checktip").css("display","none");
        });

        /*
         * 失去焦点验证输入内容
         */
        $(".input_txt").blur(function() {
            var inputName = $(this).attr("id");
            eval(inputName + "()");// 调用相应的验证方法
        });

    });


    /*
     * 中文标题校验
     */
    function articleCNTitle() {
        var bool = true;
        var value = $("#articleCNTitle").val();
        if(!value) {// 非空校验
            $(".articleCNTitleValidform_checktip").css("display","block");
            $(".articleCNTitleValidform_checktip").text("请输入中文标题！");
            bool = false
        }
        return bool;
    }

    /*
     * 英文标题校验
     */
    function articleENTitle() {
        var bool = true;
        var value = $("#articleENTitle").val();
        if(!value) {// 非空校验
            $(".articleENTitleValidform_checktip").css("display","block");
            $(".articleENTitleValidform_checktip").text("请输入英文标题！");
            bool = false;
        }
        return bool;
    }

    /*
     * 中文摘要
     */
    function articleCNSummary() {
        var bool = true;
        var value = $("#articleCNSummary").val();
        if(!value) {// 非空校验
            $(".articleCNSummaryValidform_checktip").css("display","block");
            $(".articleCNSummaryValidform_checktip").text("请输入中文摘要！");
            bool = false;
        }
        return bool;
    }

    /*
     * 英文摘要
     */
    function articleENSummary() {
        var bool = true;
        var value = $("#articleENSummary").val();
        if(!value) {// 非空校验
            $(".articleENSummaryValidform_checktip").css("display","block");
            $(".articleENSummaryValidform_checktip").text("请输入英文摘要！");
            bool = false;
        }
        return bool;
    }

    /*
     * 中文关键字
     */
    function articleCNKeywords() {
        var bool = true;
        var value = $("#articleCNKeywords").val();
        if(!value) {// 非空校验
            $(".articleCNKeywordsValidform_checktip").css("display","block");
            $(".articleCNKeywordsValidform_checktip").text("请输入中文关键字！");
            bool = false;
        }
        return bool;
    }

    /*
     * 英文关键字
     */
    function articleENKeywords() {
        var bool = true;
        var value = $("#articleENKeywords").val();
        if(!value) {// 非空校验
            $(".articleENKeywordsValidform_checktip").css("display","block");
            $(".articleENKeywordsValidform_checktip").text("请输入英文关键字！");
            bool = false;
        }
        return bool;
    }


    /*文件上传拦截*/
    function checkFileType(str){
        var pos = str.lastIndexOf(".");
        var lastname = str.substring(pos,str.length);
        var resultName=lastname.toLowerCase();
        if (".doc"!=resultName.toString() & ".docx"!=resultName.toString()){
            $(".fileUploadValidform_checktip").css("display", "block");
            $(".fileUploadValidform_checktip").text("只能上传doc、docx文件，您上传的文件类型为"+lastname+"，请重新上传");
            $("#fileUpload").val("");
        }
    }

    function fileupload() {
        var bool = true;
        var file = $("#fileUpload").val();
        if (file == "") {
            $(".fileUploadValidform_checktip").css("display", "block");
            $(".fileUploadValidform_checktip").text("您还没有选择文件!");
            bool = false;
        }
        return bool;
    }


</script>


</body>
</html>
