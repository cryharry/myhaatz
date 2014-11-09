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
		MemberDAO memberDAO = new MemberDAO();
		MemberBean memberBean = memberDAO.getMember(id);
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
			String pageNum = request.getParameter("pageNum");
			//디비객체 생성 boardDAO
			BoardDAO boardDAO = new BoardDAO();
			// 조회수 1증가
			boardDAO.updateReadCount(num);
			// num에 해당하는 글 가져오기
			BoardBean boardBean = boardDAO.getBoard(num);
			// 엔터키(\r\n) <br>바꾸기
			String content = boardBean.getContent().replace("\r\n","<br>");
			String type = "";
			if(boardBean.getType() != null) {
				type = boardBean.getType();
				if(type.equals("image/jpeg") || type.equals("image/gif") || type.equals("image/png") || type.equals("image/jpg")) {
					type = "image";
				}
			}
		%>
		<div class="contents_box">
			<div class="member01">
				<table summary="게시판 테이블 보여주기">
					<colgroup>
						<col style="width: 120px">
						<col style="width: 868px">
					</colgroup>
					<tbody>
						<tr>
							<td>글번호</td>
							<td><%=num %></td>
						</tr>
						<tr>
							<td>조회수</td>
							<td><%=boardBean.getReadcount() %></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><%=boardBean.getName() %></td>
						</tr>
						<tr>
							<td>작성일</td>
							<td><%=boardBean.getDate() %></td>
						</tr>
						<tr>
							<td>글제목</td>
							<td colspan="3"><%=boardBean.getSubject() %></td>
						</tr>
						<tr>
							<% if(boardBean.getFile() != null){ %>
								<td>첨부파일</td>
								<td colspan="3">
									<a href="../upload/<%=boardBean.getFile()%>"><%=boardBean.getFile() %></a>
									<a href="file_down.jsp?file_name=<%=boardBean.getFile() %>">[Download]</a><br>
								</td>
							<% } %>
						</tr>
						<tr>
							<td>글내용</td>
							<td colspan="3">
								<%=content%><br>
								<% if(boardBean.getFile() != null && type.equals("image")) { %><img src="../upload/<%=boardBean.getFile()%>"><%} %>
							</td>
						</tr>
					</tbody>
				</table>
				<br>
				<div style="width: 100%; text-align: center">
					<% if(id != null) {%>
							<input type="button" value="글수정" class="btn" onclick="location.href='update.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">
							<input type="button" value="글삭제" class="btn" onclick="location.href='delete.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">
							<input type="button" value="답글쓰기" class="btn" onclick="location.href='reWrite.jsp?num=<%=num%>&re_ref=<%=boardBean.getRe_ref()%>&re_lev=<%=boardBean.getRe_lev()%>&re_seq=<%=boardBean.getRe_seq()%>'">
					<% } %>
					<input type="button" value="목록보기" onclick="location.href='notice.jsp'">
				</div>
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