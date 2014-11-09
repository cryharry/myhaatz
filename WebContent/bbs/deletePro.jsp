<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%
	// 한글 처리
	request.setCharacterEncoding("utf8");
	// 파라미터 가져오기 num, pageNum, passwd
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");
	// 디비 객체 생성 boardDAO
	BoardDAO boardDAO = new BoardDAO();
	// int check = boardDAO.deleteBoard(num, passwd) 메서드 호출
	int check = boardDAO.deleteBoard(num, passwd);
	// 삭제 성공시
	if(check == 1) {
	    response.sendRedirect("notice.jsp?pageNum=" +pageNum);
	// 비밀번호 틀림 뒤로 이동
	} else {
	    %>
	    	<script>
	    		alert("비밀번호 틀림");
	    		history.back();
	    	</script>
	    <%
	}
%>