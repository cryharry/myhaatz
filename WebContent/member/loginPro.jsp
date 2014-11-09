<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<%
	// 한글 처리
	request.setCharacterEncoding("utf8");
	// 파라미터값 가져오기 id, passwd
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	// 디비객체 생성 memberDAO
	MemberDAO memberDAO = new MemberDAO();
	// int check  = 메서드호출 userCheck(id, passwd)
	int check = memberDAO.userCheck(id, passwd);
	// check==1 로그인인증 세션값생성"id" index.jsp이동
	if(check == 1) {
	    session.setAttribute("id", id);
	    response.sendRedirect("../index.jsp");
	}
	// check==0 "비밀번호틀림" 뒤로이동
	else if(check == 0) {
	    %>
	    <script>
	    	alert("비밀번호틀림");
	    	history.back();
	    </script>
	    <%
	}
	// check==-1 "아이디없음" 뒤로이동
	else {
	    %>
	    <script>
	    	alert("아이디없음");
	    	history.back();
	    </script>
	    <%
	}
	
%>