/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.37
 * Generated at: 2019-03-26 18:28:43 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class checkAdmitNumber_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
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
      			"memberError.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

	String keycode = (String)session.getAttribute("keycode");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html id='admitbody'>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/doggybeta/resources/css/member/enroll.css\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"/doggybeta/resources/js/jquery-3.3.1.min.js\"></script>\r\n");
      out.write("<script type='text/javascript' src='/doggybeta/resources/js/jzCheckAdmitJS.js'></script>\r\n");
      out.write("</head>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<section id='bodystyle'>\r\n");
      out.write("<!-- <h2>회원가입페이지</h2><br> -->\r\n");
      out.write("\t<div id='tb'>\r\n");
      out.write("\t<h1 id='maintitle'>Create a new Account!</h1>\r\n");
      out.write("\t<img id='doglogo' src='/doggybeta/resources/images/로고test2.png'>\r\n");
      out.write("\t<form action=\"/doggybeta/resistenroll\" method=\"post\">\r\n");
      out.write("\t\t<span class='first_span'>\r\n");
      out.write("\t\t\t<input type=\"text\" name=\"userid\" class='mainInputForm inputForm' id=\"userid\" required onclick='getValue();'/>\r\n");
      out.write("\t\t\t\t<label class='inputLabel labelJeong' for='userid' data-content='*아 이 디'>\r\n");
      out.write("\t\t\t\t\t<span class='input_span span_second_jeong'>*아 이 디</span>\r\n");
      out.write("\t\t\t\t</label>\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t\t<input type='button' id='chkId' onclick=\"return checkid();\" value='중복&#x00A;확인'>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<span class='first_span'>\r\n");
      out.write("\t\t\t<input type=\"text\" name=\"username\" class='mainInputForm inputForm' required id='username'/>\r\n");
      out.write("\t\t\t\t<label class='inputLabel labelJeong' for='username' data-content='*이 름'>\r\n");
      out.write("\t\t\t\t\t<span class='input_span span_second_jeong'>*이 름</span>\r\n");
      out.write("\t\t\t\t</label>\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t\t<span class='first_span'>\r\n");
      out.write("\t\t\t<input type='email' name='email' id='email' class='mainInputForm inputForm' required placeholder='이메일 입력후 전송버튼을 눌러주세요'/>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<label class='inputLabel labelJeong' for='email' data-content='*이 메 일'>\r\n");
      out.write("\t\t\t\t\t<span class='input_span span_second_jeong'>*이 메 일</span>\r\n");
      out.write("\t\t\t\t</label>\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t\t<input type='submit' id='sendbtn' onclick='return admit();' value='전송'/>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<span class='first_span'>\r\n");
      out.write("\t\t\t<input type='text' name='number' id='number' class='mainInputForm inputForm' placeholder='인증번호를 입력해주세요' required/>\r\n");
      out.write("\t\t\t\t<label class='inputLabel labelJeong' for='number' data-content='*인 증 번 호 입 력'>\r\n");
      out.write("\t\t\t\t\t<span class='input_span span_second_jeong'>* 인 증 번 호 입 력</span>\r\n");
      out.write("\t\t\t\t</label>\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t\t<input type='button' id='btnok' onclick='return confirmNum();' value='확인'/>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<span class='first_span'>\r\n");
      out.write("\t\t\t<input type=\"password\" name=\"userpwd\" id=\"userpwd1\" class='mainInputForm inputForm' required placeholder='비밀번호를 입력해주세요'/>\r\n");
      out.write("\t\t\t\t<label class='inputLabel labelJeong' for='userpwd1' data-content='*비 밀 번 호'>\r\n");
      out.write("\t\t\t\t\t<span class='input_span span_second_jeong'>*비 밀 번 호</span>\r\n");
      out.write("\t\t\t\t</label>\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t\t<span class='first_span'>\r\n");
      out.write("\t\t\t<input type=\"password\" name=\"userpwd\" id=\"userpwd2\" class='mainInputForm inputForm' required/>\r\n");
      out.write("\t\t\t\t<label class='inputLabel labelJeong' for='userpwd2' data-content='*비 밀 번 호 확 인'>\r\n");
      out.write("\t\t\t\t\t<span class='input_span span_second_jeong'>*비 밀 번 호 확 인</span>\r\n");
      out.write("\t\t\t\t</label>\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t\t<span class='first_span'>\r\n");
      out.write("\t\t\t<input type='tel' name='phone' id='phone' class='mainInputForm inputForm'/>\r\n");
      out.write("\t\t\t\t<label class='inputLabel labelJeong' for='phone' data-content='전 화 번 호'>\r\n");
      out.write("\t\t\t\t\t<span class='input_span span_second_jeong'>전 화 번 호</span>\r\n");
      out.write("\t\t\t\t</label>\r\n");
      out.write("\t\t</span>\r\n");
      out.write("\t\t<input type=\"submit\" value=\"가입하기\" id='signupbtn'/>\r\n");
      out.write("\t\t<input type=\"reset\" value=\"작성취소\"/><br>\r\n");
      out.write("\t\t<p id='nes'>* 표시 항목은 필수입력 항목입니다.</p>\r\n");
      out.write("\t\t<a href=\"/doggybeta/index.jsp\">시작 페이지로</a>\r\n");
      out.write("\t</form>\r\n");
      out.write("\t</div>\r\n");
      out.write("</section>\r\n");
      out.write("<input type='hidden' id='number2' class='mainInputForm inputForm'/>\r\n");
      out.write("</body>\r\n");
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