<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <div class="w1060">
        <div class="submission">
            <div class="publicForm clearfix fl-l">

                <form name="aspnetForm" method="post" action="${pageContext.request.contextPath}/contributePage/toContribute.do" id="aspnetForm" class="publicForm" enctype="multipart/form-data">

                    <table width="714" border="0" cellspacing="0" cellpadding="0" bordercolor="#bfc2c8">
                        <tr>
                            <td class="need" style="width: 10px;"></td>
                            <td style="width: 70px;">投稿刊物：</td>
                            <td style="width: 205px;">
                                <!--<input type="text" id="ctl00_ContentPlaceHolder1_pname" name="title" class="input_txt w340" />-->
                                <select id="first" name="typeOne" style="width:150px;" onchange="firstSel()">
                                    <option value="-1">请选择类别</option>
                                    <c:forEach var="type" items="${typeList}">
                                    <option value="${type.typeid}" >${type.typename}</option>
                                    </c:forEach>
                                </select>
                                <select id="second" name="qikanid" style="width:150px; float: right;">

                                </select>
                            </td>
                            <td>
                                <div class="qikanValidform_checktip"></div>

                            </td>
                        </tr>
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
            <div class="submission_nr">
                <h3>投稿须知：</h3>
                <p>1、来稿请写明论文的作者、工作单位、邮编、E-mail以及联系电话：论文最好以word文件格式发送给本刊。</p>
                <p>2、来稿应能反应该学术领域的最新进展水平。论点明确，论据充分，数据可靠，条理清晰，题文相符，文字简明。论文已2500字符左右为宜。</p>
                <p>3、本刊收到稿件后，在1-3个工作日内把本刊对稿件的意见通知给作者。如稿件被录用，目前一般在1－3个月左右可刊发出版，具体刊期可咨询相关编辑。</p>
                <p>4、晋升职称需要的论文，建议您在使用此论文的前6个月投来稿件，这样此论文在您晋升职称前刊登的几率很大。</p>
                <h3>投稿注意事项：</h3>
                <p>投稿邮件标题格式：姓名 - 投稿刊物名 - 论文标题 - 日期。</p>
                <p>如：张三--《管理学家》--试论唯物主义的主观精神形态--- 20140701</p>
                <p>(请务必按投稿邮件标题格式来投稿,否则不给予处理)</p>
                <h3>作者资料常规格式：</h3>
                <p>作者资料：姓名、单位、单位所在城市、单位邮编、详细通讯地址、收件人、邮编、联系电话、简介。</p>
                <p>简介格式：姓名，(19**-)，性别，**省**市(籍贯)，(职称)，博士(学历)，研究方向：******。</p>
                <p>例：作者简介：张三(1969-)，女(汉族)，天津市，＊＊＊科技学院教授，马克思主义哲学。</p>
                <h3>【稿件要求】</h3>
                <p>1.选题新颖，观点明确，论据充实，论证严密，语言精炼，资料可靠，能及时反映教育学术研究和教育教学改革实践的最新成果。尤为欢迎有新观点、新方法、新视角的特色稿件和专家稿件。对于有重大学术理论创新的文稿，本刊将优先发表，稿酬从优。</p>
                <p>2．文稿书写格式及要求。来稿请按如下顺序撰写：文题、作者姓名、摘要（不超过200字）、关键词、作者简介（真实姓名、出生年份、性别、籍贯、工作 单位、职务、职称、专业学位和研究方向以及工作单位所在省、市、邮编）、中图分类号、文献标识码、正文、注释、参考文献及英文题目和作者拼音名。若有基金资助或课题经费资助的论文，请在［作者简介］后用［基金项目］注明基金项目名称或课题项目名称及编号。</p>
                <p><span><font>•</font>文题：应简明确切地反映文章的特定内容，以不超过20字为宜，一般不用副标题。</span></p>
                <p><span><font>•</font>关键词：2～5个，采用教育教学标准主题词，若规定标准词表中无该关键词的可使用自由词。</span></p>
                <p><span><font>•</font>中图分类号、文献标识码：此两项共占一行。例如：[中图分类号]G42[文献标识码]A</span></p>
                <p><span><font>•</font>图表：凡文字能说明的内容尽量不用表和图。文中的表或图应各有表题、图题，同时必须有相应的表序号和图序号。表中需说明的问题采用*、**、***表示，并置于表的下方加"注：……"。做图要规范，图坐标要设计准确，刻度均匀。</span></p>
                <p><span><font>•</font>名词使用：文中所用专用名词不要随意缩写，如所用名词过长，而文中又需多次使用，则应在第一次使用时在全名后加圆括号注明缩写。</span></p>
                <p><span><font>•</font>计量单位：使用我国法定计量单位。标点符号、数字用法等均按国家标准执行。</span></p>
                <p><span><font>•</font>标题序号：可按四级小标题的格式写："一、""（一）""1.""（1）"；一级、二级标题另起段，正文另起段；三级、四级小标题不另起段，与正文接排。</span></p>
                <p><span><font>•</font>注释：注释是对正文中某一特定内容的诠释和说明，用数字加圆圈标注如①②……，置于文后，标注文献类型。中文注释须依次标明序号（外加圆圈）、作 者、书名、出版地、出版社、出版年份、页码；外文注释须依次标明序号（外加圆圈）、作者姓、作者名、书名、出版地、出版社、出版年份、页码。</span></p>
                <p><span><font>•</font>参考文献：所列参考文献只限作者亲自阅读过的近期公开出版的主要文献，按文中首次出现的次序编号，内部刊物或未公开发表的资料均不列入。参考文献置于注释之后，标注文献类型。中文参考文献须依次标明序号（外加方括号）、作者、书名、出版地、出版社、出版年份；外文参考文献须依次标明序号（外加方括 号）、作者姓、作者名、书名、出版地、出版社、出版年份。既有中文文献又有外文文献的，请按中文在前、外文在后的顺序分别排列，并以第一作者姓氏的汉语拼音及外文字母为序；外文书名及刊名请用斜体字。若引用文章为电子文献，请注明网络地址及时间。</span></p>
            </div>
            <!--submission_nr end-->
        </div>
        <!--Submission end-->
    </div>
    <!--w1060 end-->

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

<script type="text/javascript">

    window.selectFocus = function(that) {
        $(that).attr("size", 5);
    };
    window.selectClick = function(that) {
        $(that).parent().removeAttr("size");
        $(that).parent().blur();
        $(that).parent().children("[selected='selected']").removeAttr("selected");
        $(that).attr("selected", "");
    };

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
            if(!qikantype()){
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

    /*获取下拉列表数据*/
    function firstSel() {//如果第一个下拉列表的值改变则调用此方法
        var typeId = $("#first").val();//得到第一个下拉列表的值
        if(typeId!=null && "" != typeId&& -1 != typeId){
            //通过ajax传入后台，把typeId数据传到后端
            $.post("${pageContext.request.contextPath}/getqikan/getTypeByTypeId.do",{typeId:typeId},function(data){
                if(data.content.length ==0) {
                    $("#second").hide();
                } else {
                    var option;
                    $.each(data.content,function(i,n){//循环，i为下标从0开始，n为集合中对应的第i个对象
                        option += "<option value='"+n.qikanid+"'>"+n.qikanname+"</option>"
                    });
                    $("#second").html(option);//将循环拼接的字符串插入第二个下拉列表
                    $("#second").show();//把第二个下拉列表展示
                }
            });
        }else {
            $("#second").hide();
        }
    };


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

    /* 期刊不能为空 */
    function  qikantype() {
        var bool = true;
        var value = $("#second").val();
        if(value == null) {
            $(".qikanValidform_checktip").css("display","block");
            $(".qikanValidform_checktip").text("请选择您期望投稿的期刊！");
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
