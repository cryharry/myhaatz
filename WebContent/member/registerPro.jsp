<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.*, java.sql.Timestamp" %>
<%
	request.setCharacterEncoding("utf8");
	
	// 액션태그 사용
	%>
	<jsp:useBean id="memberBean" class="member.MemberBean"></jsp:useBean>
	<jsp:setProperty property="*" name="memberBean"/>
	<%
	
	memberBean.setReg_date(new Timestamp(System.currentTimeMillis()));
	MemberDAO memberDAO = new MemberDAO();
	memberDAO.insertMember(memberBean);
	
	response.sendRedirect("login.jsp");
%>