/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.37
 * Generated at: 2019-03-26 16:19:06 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.aboutus;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.math.BigInteger;
import member.model.vo.Member;

public final class companyIntroduce_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/views/aboutus/..//common/footer.jsp", Long.valueOf(1553173318000L));
    _jspx_dependants.put("/views/aboutus/..//common/menu.jsp", Long.valueOf(1553616979658L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.security.SecureRandom");
    _jspx_imports_classes.add("java.net.URLEncoder");
    _jspx_imports_classes.add("member.model.vo.Member");
    _jspx_imports_classes.add("java.math.BigInteger");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>Insert title here</title>\n");
      out.write("<link href=\"/doggybeta/resources/css/footer.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	Member loginUser = (Member)session.getAttribute("loginUser");
	String access_token = (String)session.getAttribute("access_token");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/doggybeta/resources/css/psForm.css\">\r\n");
      out.write("<link href='/doggybeta/resources/css/member/login.css' rel='stylesheet' type='text/css'>\r\n");
      out.write("<link href=\"//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("\r\n");
      out.write("<link href=\"/doggybeta/resources/css/mainV2.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"/doggybeta/resources/js/jquery-3.3.1.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js\" charset=\"utf-8\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t $(function() {\r\n");
      out.write(" \t\t$('.login-form').hide();\r\n");
      out.write("\t\t \r\n");
      out.write("\t\t$('.btn').click(function() {\r\n");
      out.write("\t\t\t$('body').append('<div id=\"mask\"></div>');\r\n");
      out.write("\t\t    $('#mask').fadeIn(300);\r\n");
      out.write("\t\t    $('.login-form').fadeIn(300);\r\n");
      out.write("\t\t\t$('.login-form').show();\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t    $('#mask').click(function() {\r\n");
      out.write("\t\t    \t$('#mask, .login-form').fadeOut(300);\r\n");
      out.write("\t\t    });\r\n");
      out.write("\t\t    \r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("<style>\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\t");
 if(loginUser == null) { 
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<input type='checkbox' id='menu_state' checked />\r\n");
      out.write("\t<div id='mask'> </div>\r\n");
      out.write("\t<nav>\r\n");
      out.write("\t\t<ul class='doghouse'>\r\n");
      out.write("\t\t\t<li><a><span>doghouse</span></a></li>\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("\t\t<span class='btn btn-1 btn-sign'>회원가입/로그인</span>\r\n");
      out.write("\t\t<!-- ---------------------------------------------------------------------------- -->\r\n");
      out.write("\t\t<!-- MENU -->\r\n");
      out.write("\t\t<ul class='icon' id='icon'>\r\n");
      out.write("\t\t\t<li><a href='/doggybeta' id='icon1'> <span>&nbsp;&nbsp;&nbsp;홈</span>\r\n");
      out.write("\t\t\t\t</a></li>\r\n");
      out.write("\t\t\t<li class=\"m1\"><a href=\"#\" id='icon2'><span>&nbsp;&nbsp;&nbsp;About\r\n");
      out.write("\t\t\t\t\t\tus</span></a>\r\n");
      out.write("\t\t\t\t<ul class=\"m2\">\r\n");
      out.write("\t\t\t\t\t<li><a href=\"/doggybeta/views/aboutus/companyIntroduce.jsp\">회사소개</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a>연혁</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"/doggybeta/views/aboutus/teamIntroduce.jsp\">팀\r\n");
      out.write("\t\t\t\t\t\t\t도그집사</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"/doggybeta/views/aboutus/location.jsp\">오시는 길</a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li><a href='/doggybeta/views/findSitter/petSitterListView.jsp' id='icon3'> <span>&nbsp;&nbsp;&nbsp;펫시터\r\n");
      out.write("\t\t\t\t\t\t찾기</span></a> </li>\r\n");
      out.write("\t\t\t<li class=\"m1\"><a href='#' id='icon4'> <span>&nbsp;&nbsp;&nbsp;게시판</span>\r\n");
      out.write("\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t<ul class=\"m2\">\r\n");
      out.write("\t\t\t\t\t<li><a href='/doggybeta/nlist'>공지사항</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href='/doggybeta/flist'>자유게시판</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href='/doggybeta/tlist'>팁</a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li class=\"m1\"><a href=\"#\" id='icon5'> <span>&nbsp;&nbsp;&nbsp;고객센터</span></a>\r\n");
      out.write("\t\t\t\t<ul class=\"m2\">\r\n");
      out.write("\t\t\t\t\t<li><a href='/doggybeta/faqlist'>FAQ</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href='#'>이용방법</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href='#'>1:1문의</a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<li class=\"m1\"><a href=\"#\" id='icon6'><span>&nbsp;&nbsp;&nbsp;마이페이지</span></a>\r\n");
      out.write("\t\t\t\t<ul class=\"m2\">\r\n");
      out.write("\t\t\t\t\t<li><a href='#'>정보수정</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href='#'>이용내역/예약확인</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href='#' id=\"pet_reg__btn\">펫시터신청</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href='#'>사전문의확인</a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("\t</nav>\r\n");
      out.write("\t<!-- Login Form ---------------------------------------------------------------------------- -->\r\n");
      out.write("\t<div class='loginbody'>\r\n");
      out.write("\t<form class=\"login-form\" method='post' action='/doggybeta/jipsalogin'>\r\n");
      out.write("\t\t<!-- <img id='cancelBtn' src='/doggybeta/resources/images/cancel-button.jpg'> -->\r\n");
      out.write("\t\t<p class=\"login-text\">\r\n");
      out.write("\t\t\tDOGHOUSE\r\n");
      out.write("\t\t</p>\r\n");
      out.write("\t\t<input type=\"text\" name='userid' id='userid' class=\"login-username\" autofocus required placeholder=\"Email\" />\r\n");
      out.write("\t\t<input type=\"password\" name='userpwd' id='passwd' class=\"login-password\" required required\r\n");
      out.write("\t\t\tplaceholder=\"Password\" />\r\n");
      out.write("\t\t<a href='/doggybeta/jipsalogin'>\r\n");
      out.write("\t\t\t<input type=\"submit\" name=\"Login\" value=\"Login\" class=\"login-submit\" id='btnLogin' /></a><br>\r\n");
      out.write("\t\t<a href='/doggybeta/views/member/termsOfService.jsp'>\r\n");
      out.write("\t\t\t<input type=\"button\" name='enroll' value='회원가입' class='login-submit' id='btnEnroll' /></a>\r\n");
      out.write("\t\t<p align='center' id='orid'>------- 또는 -------</p>\r\n");
      out.write("\t\t<!-- http://127.0.0.1:8888/doggybeta/views/member/callback.jsp -->\r\n");
      out.write("\t\t");

   				 String clientId = "obXTFPuiHDCuNQb5kAmx";//애플리케이션 클라이언트 아이디값";
   				 String redirectURI = URLEncoder.encode("http://127.0.0.1:8888/doggybeta/naverlogin", "UTF-8");
   				 SecureRandom random = new SecureRandom();
   				 String state = new BigInteger(130, random).toString();
   				 String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
   				 apiURL += "&client_id=" + clientId;
   				 apiURL += "&redirect_uri=" + redirectURI;
   				 apiURL += "&state=" + state;
   				 session.setAttribute("state", state);
    		 
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t<a href=\"");
      out.print(apiURL);
      out.write("\"><img id='naver_id_login' style='position:relative;' height=\"47\" width='260'  src=\"/doggybeta/resources/images/naverButton/네이버 아이디로 로그인_완성형_White.PNG\"/></a> \r\n");
      out.write("\t\t\t<br>\r\n");
      out.write("\t\t\t<br>\r\n");
      out.write("  \t\t\t<a href=\"/doggybeta/views/member/findPassword.jsp\" class=\"login-forgot-pass\" id='tempPwd'>비밀번호를 잊으셨나요?</a>\r\n");
      out.write("\r\n");
      out.write("\t</form>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t$('.m1').click(function () {\r\n");
      out.write("\t\t\tif ($(this).children('.m2').is(':visible')) {\r\n");
      out.write("\t\t\t\t$(this).children('.m2').slideUp(200);\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\t$(this).children('.m2').slideDown(200);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t</script>\r\n");
      out.write("\t");
 } else { 
      out.write("\r\n");
      out.write("\t\t<a href='/doggybeta/jipsalogout'>로그아웃</a>\r\n");
      out.write("\t\t<input type='checkbox' id='menu_state' checked />\r\n");
      out.write("\r\n");
      out.write("\t<nav>\r\n");
      out.write("\t\t<ul class='doghouse'>\r\n");
      out.write("\t\t\t<li><a><span><img src=\"/doggybeta/resources/images/로고test2.png\" style=\"margin-left: 50px; padding: 10px 10px;\" width=\"80px\"></span></a></li>\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("\r\n");
      out.write("\t\t<a  href='/doggybeta/jipsalogout'><span class='btn btn-1 btn-sign'>로그아웃</span></a>\r\n");
      out.write("\t\t");
 if(access_token != null) { 
      out.write("\r\n");
      out.write("\t\t<!-- 네이버로그인이 제대로 되었음을 확인 -->\r\n");
      out.write("\t\t\t");
      out.print( loginUser.getUserName() );
      out.write(" 님 환영합니다\r\n");
      out.write("\t\t");
 } else { 
      out.write("\r\n");
      out.write("\t\t\t");
      out.print( loginUser.getUserName() );
      out.write(" 님 환영합니다\r\n");
      out.write("\t\t");
 } 
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- -------------------------------------------------------------------------  -->\r\n");
      out.write("\t\t<ul class='icon' id='icon'>\r\n");
      out.write("\t\t\t<li><a href='/doggybeta' id='icon1'> <span>&nbsp;&nbsp;&nbsp;홈</span>\r\n");
      out.write("\r\n");
      out.write("\t\t\t</a></li>\r\n");
      out.write("\t\t\t<li class=\"m1\"><a\r\n");
      out.write("\t\t\t\thref=\"#\" id='icon2'><span>&nbsp;&nbsp;&nbsp;About\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\tus</span></a>\r\n");
      out.write("\t\t\t\t<ul class=\"m2\">\r\n");
      out.write("\t\t\t\t\t<li><a href=\"/doggybeta/views/aboutus/companyIntroduce.jsp\">회사소개</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a>연혁</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"/doggybeta/views/aboutus/teamIntroduce.jsp\">팀\r\n");
      out.write("\t\t\t\t\t\t\t도그집사</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"/doggybeta/views/aboutus/location.jsp\">오시는 길</a></li>\r\n");
      out.write("\t\t\t\t</ul></li>\r\n");
      out.write("\t\t\t<li><a href='/doggybeta/finding' id='icon3'> <span>&nbsp;&nbsp;&nbsp;펫시터\t찾기</span></a> </li>\r\n");
      out.write("\t\t\t<li class=\"m1\"><a href='#'  id='icon4'> <span>&nbsp;&nbsp;&nbsp;게시판</span>\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t\t\t<ul class=\"m2\">\r\n");
      out.write("\t\t\t\t\t<li><a href='/doggybeta/nlist'>공지사항</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href='/doggybeta/flist'>자유게시판</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href='/doggybeta/tlist'>팁</a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li class=\"m1\"><a href=\"#\" id='icon5'> <span>&nbsp;&nbsp;&nbsp;고객센터</span></a>\r\n");
      out.write("\t\t\t\t<ul class=\"m2\">\r\n");
      out.write("\t\t\t\t\t<li><a href='/doggybeta/faqlist'>FAQ</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href='#'>이용방법</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href='#'>1:1문의</a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<li class=\"m1\"><a href=\"#\" id='icon6'><span>&nbsp;&nbsp;&nbsp;마이페이지</span></a>\r\n");
      out.write("\t\t\t\t<ul class=\"m2\">\r\n");
      out.write("\t\t\t\t\t<li><a href='#'>정보수정</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href='/doggybeta/views/customerservice/checkMyLog.jsp'>이용내역/예약확인</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href='#' id=\"pet_reg__btn\">펫시터신청</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href='#'>사전문의확인</a></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("\t</nav>\r\n");
      out.write("\r\n");
      out.write("\t<!-- 펫시터 신청 버튼 클릭시 생성 보여지는 HTML 부분. 로그인 부분 구현시 인풋에 세션으로 값 넣어놓고 readonly 처리할 것  -->\r\n");
      out.write("\r\n");
      out.write("\t<form class=\"ps_reg_form\" action=\"/doggybeta/hostup\" method=\"POST\" enctype=\"multipart/form-data\">\r\n");
      out.write("\t\t<span class=\"close\">x</span>\r\n");
      out.write("\t\t<div class=\"section1\">\r\n");
      out.write("\t\t\t<p>아이디</p>\r\n");
      out.write("\t\t\t<input name=\"userid\" value=\"");
      out.print(loginUser.getUserId() );
      out.write("\" class=\"ps_input input_id\" autocomplete=\"off\"\r\n");
      out.write("\t\t\t\treadonly>\r\n");
      out.write("\t\t\t<p>이름</p>\r\n");
      out.write("\t\t\t<input name=\"username\" value=\"");
      out.print(loginUser.getUserName() );
      out.write("\" class=\"ps_input input_name\" autocomplete=\"off\"\r\n");
      out.write("\t\t\t\treadonly>\r\n");
      out.write("\t\t\t<p>연락처</p>\r\n");
      out.write("\t\t\t<input type=\"tel\" name=\"phone\" value=\"");
      out.print(loginUser.getPhone() );
      out.write("\" class=\"ps_input input_phone\" autocomplete=\"off\"\r\n");
      out.write("\t\t\t\trequired>\r\n");
      out.write("\t\t\t<p>이메일</p>\r\n");
      out.write("\t\t\t<input type=\"email\" name=\"email\" value=\"");
      out.print(loginUser.getEmail() );
      out.write("\" class=\"ps_input input_email\" autocomplete=\"off\"\r\n");
      out.write("\t\t\t\trequired>\r\n");
      out.write("\t\t\t\t<p>희망 일급(원)</p>\r\n");
      out.write("\t\t\t\t<input type=\"number\" name=\"price\" placeholder=\"가격 입력\" class=\"ps_input input_price\" required>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"section2\">\r\n");
      out.write("\t\t\t<p>프로필 사진 추가</p>\r\n");
      out.write("\t\t\t<div class=\"image_box\">\r\n");
      out.write("\t\t\t\t<img class=\"image_box_pic\" />\r\n");
      out.write("\t\t\t\t<input type=\"file\" id=\"real-file\" name=\"pic\" hidden=\"hidden\" / required>\r\n");
      out.write("\t\t\t\t<span>\r\n");
      out.write("\t\t\t\t\t<button id=\"fake-file-btn\">Choose a File</button>&nbsp;\r\n");
      out.write("\t\t\t\t\t<span id=\"file-text\"></span>\r\n");
      out.write("\t\t\t\t</span>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<p>펫시팅 장소</p>\r\n");
      out.write("\t\t\t<input name=\"postcode\" id=\"sample6_postcode\" class=\"ps_input\" placeholder=\"우편번호\" required>\r\n");
      out.write("\t\t\t<input type=\"button\" onclick=\"sample6_execDaumPostcode()\" id=\"post-search\" value=\"우편번호 찾기\">\r\n");
      out.write("\t\t\t<input name=\"addr\" id=\"sample6_address\" class=\"ps_input input_addr\" placeholder=\"주소\" required>\r\n");
      out.write("\t\t\t<input name=\"daddr\" id=\"sample6_detailAddress\" class=\"ps_input\" placeholder=\"상세주소\" required>\r\n");
      out.write("\t\t\t<input name=\"extra\" id=\"sample6_extraAddress\" class=\"ps_input\" placeholder=\"참고항목\" readonly>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"section3\">\r\n");
      out.write("\t\t\t<p>시설/장소 사진 추가 (최대 3개 / 10MB)</p>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"ppics_list\">\r\n");
      out.write("\t\t\t\t<img class=\"pp1\" />\r\n");
      out.write("\t\t\t\t<img class=\"pp2\" />\r\n");
      out.write("\t\t\t\t<img class=\"pp3\" />\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\t<input type=\"file\" name=\"placepics\" id=\"place_pics\" multiple required>\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" name=\"fileList\" id=\"fileList\">\r\n");
      out.write("\t\t\t<button id=\"ppics_upload\">Upload Files</button>\r\n");
      out.write("\t\t\t<span id=\"ppics-text\"></span>\r\n");
      out.write("\t\t\t<div id=\"reg_map_box\"></div>\r\n");
      out.write("\t\t\t<span><button type=\"submit\" id=\"submit-btn\">펫시터 등록하기</button></span>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</form>\r\n");
      out.write("\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/doggybeta/resources/js/petSitting.js\"></script>\r\n");
      out.write("\t<script src=\"http://dmaps.daum.net/map_js_init/postcode.v2.js\"></script>\r\n");
      out.write("\t<script src=\"//dapi.kakao.com/v2/maps/sdk.js?appkey=b9810167e43ee638a44b19264113db0d&libraries=services\"></script>\r\n");
      out.write("\t<script src=\"/doggybeta/resources/js/addr.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("\t\t$('.m1').click(function () {\r\n");
      out.write("\t\t\tif ($(this).children('.m2').is(':visible')) {\r\n");
      out.write("\t\t\t\t$(this).children('.m2').slideUp(200);\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\t$(this).children('.m2').slideDown(200);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t</script>\r\n");
      out.write("\t");
 } 
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>");
      out.write("\n");
      out.write("\t<div id=\"wrap\">\n");
      out.write("\t\t  <div id=\"content\">\n");
      out.write("\t\t\t<!-- 내용작성  -->\n");
      out.write("\t\t\t<h1>안녕하세요 도그집사입니다.안녕하세요 도그집사입니다.안녕하세요 도그집사입니다.안녕하세요 도그집사입니다.안녕하세요 도그집사입니다.</h1>\n");
      out.write("\t\t\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div id=\"footer\">");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title></title>\n");
      out.write("\n");
      out.write("<style>\n");
      out.write("\n");
      out.write("/* footer {\n");
      out.write("\ttext-align:center;\n");
      out.write("    bottom:0;\n");
      out.write("    width:120%;\n");
      out.write("    background:#ccc;\n");
      out.write("    margin-bottom:0;\n");
      out.write("    border-top-width: 0;\n");
      out.write("} */\n");
      out.write("/* footer{\n");
      out.write("\twidth:100%;\n");
      out.write("\theight:60px; \n");
      out.write("\tposition:absolute;\n");
      out.write("\tbottom:0; \n");
      out.write("\tleft:0;\n");
      out.write("\tbackground:#ccc;\n");
      out.write("\ttext-align:center;\n");
      out.write("} */\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<footer>\n");
      out.write("copyright@kh.org 2019-03-04 master : 홍길동 <br>\n");
      out.write("tel : 02-1234-5678, 서울시 강남구 역삼동 777, fax : 02-1111-2356\n");
      out.write("</footer>\n");
      out.write("</body>\n");
      out.write("</html>");
      out.write("</div>\n");
      out.write("\t</div>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
