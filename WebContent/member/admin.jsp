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
		int count = memberDAO.getMemberCount();
	%>
		<!-- sub_top 시작 -->
		<%@include file="../inc/sub_top.jsp" %>
		<!-- sub_top 끝 -->
		<div class="contents_box">
		<h1>회원정보 : 전체회원수[<%=count %>]</h1>
			<div class="member01">
				<table summary="게시판 테이블 보여주기">
					<colgroup>
						<col style="width: 50px">
						<col style="width: 100px">
						<col style="width: 100px;">
						<col style="width: 20px;">
						<col style="width: 20px;">
						<col style="width: 100px;">
						<col style="width: 500px;">
						<col style="width: 100px;">
						<col style="width: 100px;">
					</colgroup>
					<tbody>
						<tr>
							<th>ID</th>
						    <th>이름</th>
						    <th>가입일자</th>
						    <th>나이</th>
						    <th>성별</th>
						    <th>이메일</th>
						    <th>주소</th>
						    <th>전화번호</th>
						    <th>핸드폰</th>
					   	</tr>
					   	<%
							List<MemberBean> memList = null;
							memList = memberDAO.getMembers();
							for(int i=0; i<memList.size(); i++) {
								MemberBean memberBean = memList.get(i);
								String address = "";
								if(memberBean.getAddress3() != null) {
									address = memberBean.getAddress1()
											+" "+memberBean.getAddress2()+" "+memberBean.getAddress3();
								} else {
									address = memberBean.getAddress1()
											+" "+memberBean.getAddress2();
								}
								String tel = "";
								if(memberBean.getTel() != null) {
									tel = memberBean.getTel();
								}
								String mtel = "";
								if(memberBean.getMtel() != null) {
									mtel = memberBean.getMtel();
								}
						%>
					   	<tr>
					   		<td><%=memberBean.getId() %></td>
					   		<td><%=memberBean.getName() %></td>
					   		<td><%=memberBean.getReg_date() %></td>
					   		<td><%=memberBean.getAge() %></td>
					   		<td><%=memberBean.getGender() %></td>
					   		<td><%=memberBean.getEmail() %></td>
					   		<td><%=address%></td>
					   		<td><%=tel %></td>
					   		<td><%=mtel %></td>
					   	</tr>
					   	<% } %>
					</tbody>
				</table>
				<br>
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