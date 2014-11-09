<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/sub_style.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
	var result = "";
	function fnMenu() {
		$('#div_menu').animate({
			height:'toggle'
		});
	}
	function createXMLHttpRequest(){
		  // See http://en.wikipedia.org/wiki/XMLHttpRequest
		  // Provide the XMLHttpRequest class for IE 5.x-6.x:
		  if( typeof XMLHttpRequest == "undefined" ) XMLHttpRequest = function() {
		    try { return new ActiveXObject("Msxml2.XMLHTTP.6.0") } catch(e) {}
		    try { return new ActiveXObject("Msxml2.XMLHTTP.3.0") } catch(e) {}
		    try { return new ActiveXObject("Msxml2.XMLHTTP") } catch(e) {}
		    try { return new ActiveXObject("Microsoft.XMLHTTP") } catch(e) {}
		    throw new Error( "This browser does not support XMLHttpRequest." )
		  };
		  return new XMLHttpRequest();
	}
	//생성된 xhr 개체를 AJAX라는 변수에 저장
	var AJAX = createXMLHttpRequest();

	// AJAX 결과값 메인 함수
	function handler() {
		if(AJAX.readyState == 4 && AJAX.status == 200) {
		    // AJAX success시 결과값 result라는 변수에 저장
		    result = AJAX.responseText;
		    // result값을 호출한 곳으로 돌려줌
		    $('#search_ajax').show();
		    $('#search_ajax').html("<a href='#' onclick='search_add();return false;'>"+result+"</a>");
		}else if (AJAX.readyState == 4 && AJAX.status != 200) {
			// AJAX status fail
		  	alert('Something went wrong...');
		}
	}
	function ajax_search(search) {
		AJAX.onreadystatechange = handler;
		AJAX.open("POST", "../bbs/checkSearch.jsp?search="+search, true);
		AJAX.send();
	}
	function search_add() {
		var result_replace = result.replace(/<.*?>^\s*|\s*$|<.*?>\r\n.*/g, '');
		alert(result_replace);
		$('#search').text(result_replace);
	}
</script>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<%
	String id = (String)session.getAttribute("id");
%>
<body>
	<div id="header">
		<!-- 최상단 로그인, 회원가입 -->
		<div class="login2">
			<ul>
				<%if(id == null) { %>
					<!-- 로그인 -->
					<li>
						<a href="../member/login.jsp">
						 <img src="../img/head/login.png" alt="로그인">
						</a>
					</li>
					<!-- 회원가입 -->
					<li>
						<a href="../member/register.jsp">
						 <img src="../img/head/register.png" alt="회원가입">
						</a>
					</li>
				<%} else if(id.equals("admin")) {%>
					<li>
						<a href="../member/logout.jsp">
						 <img src="../img/head/logout.png" alt="로그아웃">
						</a>
					</li>
					<!-- 회원가입 -->
					<li>
						<a href="../member/modify.jsp">
						 <img src="../img/head/modify.png" alt="정보수정">
						</a>
					</li>
					<li>
						<a href="../member/admin.jsp" style="float: left;">
							<img src="../img/head/admin.png" alt="관리자">
						</a>
					</li>	
				<%} else { %>
					<!-- 로그인 -->
					<li>
						<a href="../member/logout.jsp">
						 <img src="../img/head/logout.png" alt="로그아웃">
						</a>
					</li>
					<!-- 회원가입 -->
					<li>
						<a href="../member/modify.jsp">
						 <img src="../img/head/modify.png" alt="정보수정">
						</a>
					</li>
					<li>
						<font color="white"><%=id %></font>
					</li>
				<%} %>
			</ul>
		</div>
		<!-- 로그인,회원가입 끝 -->
		<!-- 전체메뉴 시작 -->
		<div style="position: absolute; top: 70px; left: 0px;">
			<a href="javascript:fnMenu();">
			 <img src="../img/head/menu_00.jpg">
			</a>
			<div id="div_menu">
				<div style="padding-top: 25px">
					<!-- 메뉴1 -->
					<div class="menu_box">
						<div style="height: 160px;">
							<div class="menu_title">회사소개</div>
							<div class="menu_con">
								<ul>
									<li>
										CEO
									</li>
									<li>
										오시는길
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- 메뉴1 끝 -->
					<!-- 메뉴2 -->
					<div class="menu_box">
						<div style="height: 160px;">
							<div class="menu_title">커뮤니티</div>
							<div class="menu_con">
								<ul>
									<li>
										<a href="../bbs/notice.jsp">공지사항</a>
									</li>
									<li>
										<a href="../bbs/notice.jsp">게시판</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- 메뉴2 끝 -->
					<!-- 메뉴3 -->
					<div class="menu_box" style="border: none">
						<div style="height: 180px;">
							<div class="menu_title">고객지원</div>
							<div class="menu_con">
								<ul>
									<li>
										고객문의
									</li>
									<li>
										FAQ
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- 메뉴3 끝 -->
					<div class="img_ban" style="">
						<span style="margin-right: 11px;">
							 <img src="../img/head/banner_1.jpg">
						</span>
						<span style="margin-right: 11px;">
							 <img src="../img/head/banner_2.jpg">
						</span>
						<span>
							 <img src="../img/head/banner_3.jpg">
						</span>
					</div>
				</div>
			</div>
		</div>
		<!-- 전체메뉴 끝 -->
		<div style="position: absolute; top: 65px; left: 450px;">
			<a href="../index.jsp">
			 <img src="../img/head/logo.jpg">
			</a>
		</div>
		<div style="position: absolute; top: 70px; right: 240px;">
			<!-- 페이스북 -->
			<span>
				<a href="https://ko-kr.facebook.com/">
				 <img src="../img/head/pb01.gif">
				</a>
			</span>
			<!-- 트위터 -->
			<span>
				<a href="https://twitter.com/?lang=ko">
				 <img src="../img/head/tw01.gif">
				</a>
			</span>
		</div>
		<!-- 검색 -->
		<div style="position: absolute; top: 70px; right: 0px;">
			<div style="border: 1px solid #ddd;">
				<form name="sform" action="" method="post">
					<div style="border: 1px solid #ddd;">
						<input type="hidden" name="sfl" value="wr_subject">
						<input type="text" name="stx" id="search" class="select" onkeyup="ajax_search(this.value)">
						<input type="image" src="../img/head/sea_icon01.jpg">
					</div>
					<div id="search_ajax"></div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>