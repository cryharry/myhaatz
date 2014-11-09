<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.sql.Timestamp" %>
<%
	// 한글 처리
	request.setCharacterEncoding("utf8");
	// 액션태그
%>
	<jsp:useBean id="boardBean" class="board.BoardBean" />
	<jsp:setProperty property="*" name="boardBean" />
<%
	// set메서드 호출 date  ip
	boardBean.setDate(new Timestamp(System.currentTimeMillis()));
	boardBean.setIp(request.getRemoteAddr());
		
	// 디비파일만들기 패키지 board 파일이름 BoardDAO
	// 디비객체 생성 boarddao
	BoardDAO boardDAO=new BoardDAO();
	// 메서드호출 insertBoard(boardbean)
	boardDAO.reInsertBoard(boardBean);
	// 이동 notice.jsp이동
%>
<script>
	alert("글쓰기성공");
	location.href="notice.jsp";
</script>