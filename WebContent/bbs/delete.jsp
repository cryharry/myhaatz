<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.*, board.*, java.util.List, java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<!-- wrap_bg : open -->
<div id="wrap_bg">	
	<!-- wrap : open -->
	<div id="wrap">
	<!-- header 시작 -->
	<%@include file="../inc/header.jsp" %>
	<!-- header 끝 -->
	<!-- container : open -->
	<%
		if(id == null) {
			response.sendRedirect("../member/login.jsp");
		}
	%>
		<!-- sub_top 시작 -->
		<%@include file="../inc/sub_top.jsp" %>
		<!-- sub_top 끝 -->
		<%
			// 파라미터 num pageNum 가져오기
			int num = 1;
			if(request.getParameter("num") != null) {
				num = Integer.parseInt(request.getParameter("num"));
			}
			String pageNum = "1";
			if(request.getParameter("pageNum") != null) {
				pageNum = request.getParameter("pageNum");
			}
		%>
		<div class="contents_box">
			<div class="member01">
			<form action="deletePro.jsp?pageNum=<%=pageNum %>" method="post">
			<input type="hidden" name="num" value="<%=num%>">
				<table summary="게시판 테이블 삭제">
					<colgroup>
						<col style="width: 120px">
						<col style="width: 868px">
					</colgroup>
					<tbody>
						<tr>
							<td>패스워드</td>
							<td><input type="password" name="passwd"></td>
						</tr>
					</tbody>
				</table>
				<br>
				<div style="width: 100%; text-align: center">
					<input type="submit" value="글삭제">
					<input type="reset" value="다시쓰기">
					<input type="button" value="목록보기" onclick="location.href='notice.jsp'">
				</div>
			</form>
			</div>
		</div>
		<!-- //.contents_box -->
		<!-- container : close -->
		<div style="clear:both;"></div>
		<!-- under bar -->
		<%@include file="../inc/under_bar.jsp" %>
		<!-- footer : open -->
		<%@include file="../inc/footer.jsp" %>
		<!-- footer : close -->
	</div>
	<!-- wrap : close -->
</div>
<!-- wrap_bg : close -->
</body>
</html>