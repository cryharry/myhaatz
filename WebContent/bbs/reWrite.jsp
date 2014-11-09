<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#content').focus();
	});
</script>
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
		int num = Integer.parseInt(request.getParameter("num"));
		int re_ref = Integer.parseInt(request.getParameter("re_ref"));
		int re_lev = Integer.parseInt(request.getParameter("re_lev"));
		int re_seq = Integer.parseInt(request.getParameter("re_seq"));
	%>
		<form name="form" action="reWritePro.jsp" method="post">
			<input type="hidden" name="num" value="<%=num%>">
			<input type="hidden" name="re_ref" value="<%=re_ref%>">
			<input type="hidden" name="re_lev" value="<%=re_lev%>">
			<input type="hidden" name="re_seq" value="<%=re_seq%>">
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
										<input type="text" id="subject" name="subject" value="[답글]">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="u_content">내용</label></th>
									<td>
										<textarea rows="30" cols="100" id="content" name="content"></textarea>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="u_pw">패스워드</label></th>
									<td>
										<input type="password" id="passwd" name="passwd">
									</td>
								</tr>
							</tbody>
						</table>
						<br>
						<div style="width: 100%; text-align: center">
							<input type="submit" value="글적기">
							<input type="reset" value="재작성">
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