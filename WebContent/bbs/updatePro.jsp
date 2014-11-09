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
	boardBean.setNum(Integer.parseInt(multi.getParameter("num")));
	boardBean.setContent(multi.getParameter("content"));
	boardBean.setName(multi.getParameter("name"));
	boardBean.setPasswd(multi.getParameter("passwd"));
	boardBean.setSubject(multi.getParameter("subject"));
	// 업로드폴더 업로드된 파일이름
	if(multi.getFilesystemName("file") != null) {
	    boardBean.setFile(multi.getFilesystemName("file"));
	    String type = multi.getContentType("file");
	    boardBean.setType(type);
	} else {
	    boardBean.setFile(multi.getParameter("file2"));
	    String type = multi.getContentType("file2");
	    boardBean.setType(type);
	}
	multi.getOriginalFileName("file");
	
	boardBean.setDate(new Timestamp(System.currentTimeMillis()));
	boardBean.setIp(request.getRemoteAddr());
	
	// pageNum 가져오기
	String pageNum = request.getParameter("pageNum");
	// 디비객체 생성 boardDAO
	BoardDAO boardDAO = new BoardDAO();
	// int check = 메서드 호출 updateBoard(boardBean)
	int check = boardDAO.updateBoard(boardBean);
	// check==1 업데이트 성공 fnotice.jsp?pageNum=
	if(check == 1) {
	    response.sendRedirect("notice.jsp?pageNum="+pageNum);
	}
	// check==0 비밀번호 틀림 뒤로이동
	else {
	    %>
	    	<script>
	    		alert("비밀번호 틀림");
	    		history.back();
	    	</script>
	    <%
	}
%>
<script>
	alert("글쓰기성공");
	location.href="notice.jsp";
</script>