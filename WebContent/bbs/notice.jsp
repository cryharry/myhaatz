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
			//디비객체 생성 boardDAO
			BoardDAO boardDAO = new BoardDAO();
			//int count= getBoardCount()   //count(*)
			int count = boardDAO.getBoardCount();
			// 한 페이지 보여줄 글수
			int pageSize = 10;
			// 현 페이지 가져오기
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null) {
			    pageNum = "1";
			}
			// 시작하는 행 구하기
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage-1)*pageSize+1;
			// 끝나는 행 구하기
			int endRow = currentPage*pageSize;
			// 글이 있으면 디비 게시판 글 가져오기
			List<BoardBean> boardList = null;
			if(count != 0) {
			    boardList = boardDAO.getBoards(startRow, pageSize);
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			// 가상번호 계산
			int number = 0;
			number = count-(currentPage-1)*pageSize;
		%>
		<div class="contents_box">
		<h1>게시판 : 전체글수[<%=count %>]</h1>
			<div class="member01">
				<table summary="게시판 테이블 보여주기">
					<colgroup>
						<col style="width: 120px">
						<col style="width: 668px">
						<col style="width: 200px;">
						<col style="width: 100px;">
						<col style="width: 50px;">
					</colgroup>
					<tbody>
						<tr><th class="tno">No.</th>
					    <th>제목</th>
					    <th>작성자</th>
					    <th>날짜</th>
					    <th>조회수</th></tr>
					    <%
					    if(count == 0) {
					        %>
					        <tr>
					        	<td colspan="5">게시판 글 없음</td>
					    	</tr>
					        <%
					    } else {
					        for(int i=0; i<boardList.size(); i++) {
					        BoardBean boardBean =  boardList.get(i);
					        %>
					        <tr onclick="location.href='content.jsp?num=<%=boardBean.getNum()%>&pageNum=<%=pageNum%>'" style="cursor: pointer;">
						    	<td><%=number-- %></td>
						        <td>
							        <%
									int wid = 0;
									if(boardBean.getRe_lev()>0) { //답변글
										wid = 10*boardBean.getRe_lev();
									%>
										<img src="../img/bbs/level.gif" width="<%=wid%>">
										<img src="../img/bbs/re.gif">
									<%
									}
									%>
							        	<%=boardBean.getSubject() %>
						        </td>
						    	<td><%=boardBean.getName() %></td>
						    	<td><%=sdf.format(boardBean.getDate()) %></td>
						    	<td><%=boardBean.getReadcount() %></td>
					    	</tr>
					    <%
					        }
					    }
					    %>
					</tbody>
				</table>
				<br>
				<div style="width: 100%; text-align: center">
					<input type="image" src="" alt="글쓰기" onclick="location.href='write.jsp'">
				</div>
				<div id="page_control">
				<% 
				if(count > 0) {
					// 전체 페이지수 구하기 글55 한 페이지에 보여줄 글 수 10
					int pageCount = count/pageSize+(count%pageSize==0?0:1); // 55/10 = 5+1(나머지있을경우)
					// 한화면에 보여줄 페이지수 설정
					int pageBlock = 10;
					// 시작페이지 번호 구하기
					int startPage = ((int)(currentPage/pageBlock)-(currentPage%pageBlock==0?1:0))*pageBlock+1; 
					// 끝페이지 번호 구하기
					int endPage = startPage+pageBlock-1;
					if(endPage > pageCount) {
						endPage = pageCount;
					}
					// [이전]
					if(startPage > pageBlock) {
						%><a href="notice.jsp?pageNum=<%=startPage-pageBlock%>">[PREV]</a><%
					}
					// [1] ~ [10]
					for(int i=startPage; i<=endPage; i++) {
						%><a href="notice.jsp?pageNum=<%=i%>">[<%=i %>]</a><%
					}
					// [다음]
					if(endPage < pageCount) {
						%><a href="notice.jsp?pageNum=<%=startPage+pageBlock%>">[NEXT]</a><%
					}
				}
				%>
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