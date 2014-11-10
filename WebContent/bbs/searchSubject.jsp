<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, org.json.simple.*" %>
<%
	request.setCharacterEncoding("utf8");
	String subject = request.getParameter("subject");
	
	BoardDAO boardDAO = new BoardDAO();
	BoardBean boardBean =  boardDAO.getBoard(subject);

	out.println(boardBean.getNum());
	out.flush();
%>