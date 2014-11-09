<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.*, board.*" %>
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
			int num = 1;
			if(request.getParameter("num") != null) {
				num=Integer.parseInt(request.getParameter("num"));
			}
			String pageNum=request.getParameter("pageNum");
			//디비객체 생성
			BoardDAO boardDAO=new BoardDAO();
			//자바빈 = 메서드호출
			BoardBean boardBean=boardDAO.getBoard(num);
			
			String type = "";
			if(boardBean.getType() != null) {
				type = boardBean.getType();
				if(type.equals("image/jpeg") || type.equals("image/gif") || type.equals("image/png") || type.equals("image/jpg")) {
					type = "image";
				}
			}
		%>
			<form name="form" action="updatePro.jsp?pageNum=<%=pageNum%>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="num" value="<%=num%>">
				<!-- sub_top 시작 -->
				<%@include file="../inc/sub_top.jsp" %>
				<!-- sub_top 끝 -->
				<div class="contents_box">
					<div class="member01">
						<table summary="게시판 테이블">
							<colgroup>
								<col style="width: 120px">
								<col style="width: 868px">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="u_name">작성자</label></th>
									<td>
										<input type="text" id="name" name="name" value="<%=memberBean.getName()%>" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="u_subject">제목</label></th>
									<td>
										<input type="text" id="subject" name="subject" value="<%=boardBean.getSubject()%>">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="u_content">내용</label></th>
									<td>
										<textarea rows="30" cols="100" id="content" name="content"><%=boardBean.getContent() %></textarea>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="u_pw">패스워드</label></th>
									<td>
										<input type="password" id="passwd" name="passwd" value="">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="u_file">파일</label></th>
									<td>
										<input type="file" id="file" name="file" value="<%=boardBean.getFile()%>"><%=boardBean.getFile()%><% if(boardBean.getFile() != null && type.equals("image")) { %><img src="../upload/<%=boardBean.getFile()%>"><%} %>
										<input type="hidden" name="file2" value="<%=boardBean.getFile()%>">
									</td>
								</tr>
							</tbody>
						</table>
						<br>
						<div style="width: 100%; text-align: center">
							<input type="submit" value="글적기">
							<input type="reset" value="다시쓰기">
							<input type="button" value="목록보기" onclick="location.href='notice.jsp'">
						</div>
					</div>
				</div>
			</form>
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