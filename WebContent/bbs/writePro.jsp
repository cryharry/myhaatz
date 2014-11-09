<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.*, java.sql.Timestamp" %>
<%@page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"%>
<%
	String realPath = request.getRealPath("upload");
	
	int maxSize = 100*1024*1024; //100M
	MultipartRequest multi =
		new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy()); 
	
	BoardBean boardBean = new BoardBean();
	
	boardBean.setContent(multi.getParameter("content"));
	boardBean.setName(multi.getParameter("name"));
	boardBean.setPasswd(multi.getParameter("passwd"));
	boardBean.setSubject(multi.getParameter("subject"));
	
	String type = multi.getContentType("file");
	boardBean.setType(type);
	
	boardBean.setFile(multi.getFilesystemName("file"));
	
	multi.getOriginalFileName("file");
	
	boardBean.setDate(new Timestamp(System.currentTimeMillis()));
	boardBean.setIp(request.getRemoteAddr());
	
	BoardDAO boardDAO=new BoardDAO();
	
	boardDAO.insertBoard(boardBean);
%>
<script>
	alert("글쓰기성공");
	location.href="notice.jsp";
</script>

