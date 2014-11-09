<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<%
	String id = (String)session.getAttribute("id");
	if(id == null) response.sendRedirect("login.jsp");
	%>
	<jsp:useBean id="memberBean" class="member.MemberBean" />
	<jsp:setProperty property="*" name="memberBean" />
	<%
	MemberDAO memberDAO = new MemberDAO();
	int check = memberDAO.updateMember(memberBean);
	
	if(check == 1) {
		%>
		<script>
			alert("정보수정성공");
			location.href="../index.jsp";
		</script>
		<%
	} else {
		%>
		<script>
			alert("정보수정실패");
			history.back();
		</script>
		<%
	}
%>