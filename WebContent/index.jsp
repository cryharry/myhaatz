<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.text.SimpleDateFormat, java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
	function fnMenu() {
		$('#div_menu').animate({
			height:'toggle'
		});
	}
	function fnSlide(way) {
		if(way == 'right') {
			$('.img_area').fadeOut(1000);
			$('.img_area02').animate({left:'0px',right:'770px'},1000);
			$('#div_right_arrow').hide();
			$('#div_left_arrow').animate({display:'block',opacity:'100'});
			$('.img_area03').fadeIn(1000);
		} else {
			$('.img_area03').fadeOut(1000);
			$('.img_area02').animate({right:'0px',left:'770px'},1000);
			$('.img_area03').show();
			$('#div_left_arrow').hide();
			$('#div_right_arrow').show();
			$('.img_area').fadeIn(1000);
		}
	}
	function change_back(liId) {
		$('.img_area03').css({"background-image":"url(img/main/imgarea03_back_"+liId+".png)"});
	}
	function ajax_search(search) {
		$.post("bbs/checkSearch.jsp?",{"search":search},function(data){
			$('#search_ajax').show();
			$('#search_ajax').html(data);
		});
	}
</script>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
%>
<!-- wrap_bg : open -->
<div id="wrap_bg">	
	<!-- wrap : open -->
	<div id="wrap">
	<!-- header 시작 -->
	<div id="header">
		<!-- 최상단 로그인, 회원가입 -->
		<div class="login2">
			<ul>
				<%if(id == null) { %>
					<!-- 로그인 -->
					<li>
						<a href="member/login.jsp">
						 <img src="img/head/login.png" alt="로그인">
						</a>
					</li>
					<!-- 회원가입 -->
					<li>
						<a href="member/register.jsp">
						 <img src="img/head/register.png" alt="회원가입">
						</a>
					</li>
				<%} else if(id.equals("admin")) {%>
					<li>
						<a href="member/logout.jsp">
						 <img src="img/head/logout.png" alt="로그아웃">
						</a>
					</li>
					<!-- 회원가입 -->
					<li>
						<a href="member/modify.jsp">
						 <img src="img/head/modify.png" alt="정보수정">
						</a>
					</li>
					<li>
						<a href="member/admin.jsp">
							<img src="img/head/admin.png" alt="관리자">
						</a>
					</li>
				<%} else { %>
					<!-- 로그아웃 -->
					<li>
						<a href="member/logout.jsp">
						 <img src="img/head/logout.png" alt="로그아웃">
						</a>
					</li>
					<!-- 회원가입 -->
					<li>
						<a href="member/modify.jsp">
						 <img src="img/head/modify.png" alt="정보수정">
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
			 <img src="img/head/menu_00.jpg">
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
									<li><a
										href="bbs/notice.jsp">공지사항</a>
									</li>
									<li><a
										href="bbs/notice.jsp">게시판</a>
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
							 <img src="img/head/banner_1.jpg">
						</span>
						<span style="margin-right: 11px;">
							 <img src="img/head/banner_2.jpg">
						</span>
						<span>
							 <img src="img/head/banner_3.jpg">
						</span>
					</div>
				</div>
			</div>
		</div>
		<!-- 전체메뉴 끝 -->
		<div style="position: absolute; top: 65px; left: 450px;">
			<a href="index.jsp">
			 <img src="img/head/logo.jpg">
			</a>
		</div>
		<div style="position: absolute; top: 70px; right: 240px;">
			<!-- 페이스북 -->
			<span>
				<a href="https://ko-kr.facebook.com/">
				 <img src="img/head/pb01.gif">
				</a>
			</span>
			<!-- 트위터 -->
			<span>
				<a href="https://twitter.com/?lang=ko">
				 <img src="img/head/tw01.gif">
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
						<input type="image" src="img/head/sea_icon01.jpg" onclick="">
					</div>
					<div id="search_ajax"></div>
				</form>
			</div>
		</div>
	</div>
	<!-- header 끝 -->	
	<!-- container : open -->
	<div id="container">
		<!-- 좌측비주얼 -->	
		<div class="img_area">
			<img src="img/main/imgarea1_1.jpg" id="haatz1_t_img1">
			<img src="img/main/imgarea1_2.jpg" id="haatz1_t_img2">
			<img src="img/main/imgarea1_3.jpg" id="haatz1_t_img3">
		</div>
		<!-- 좌측비주얼 -->
		<div class="img_area02">
			<div>
				<img src="img/main/m_bt01.jpg"><img src="img/main/m_bt02.jpg">
			</div>
			<div style="margin-top:5px;">
					<img src="img/main/m_bt03.jpg">
			</div>
			<div style="margin-top:5px;">
					<img src="img/main/m_bt04.jpg">
			</div>
			<div style="margin-top:5px;" id="image_list_3">
				<div class="clsBannerScreen">
					<div class="images">
							<img src="img/main/imgarea_bottom_1.jpg">
					</div>
					<div class="images">
							<img src="img/main/imgarea_bottom_1.jpg">
					</div>
					<div class="images">
							<img src="img/main/imgarea_bottom_1.jpg">
					</div>
				</div>
				<ul class="clsBannerButton" id="label_3">		
					<li>
						<img src="">
					</li>	
					<li>
						<img src="">
					</li>	
					<li>
						<img src="">
					</li>
				</ul>
			</div>				
		</div> 
		<!-- 무브 -->		
		<div id="banner">
			<!-- 우측비주얼 -->
			<div class="img_area03">
				<div class="right_bt">
					<ul>
						<li id="p01">
							<img src="img/main/t1_off.png" onclick="change_back('1');" style="cursor: pointer;">
						</li>
						<li id="p02">
							<img src="img/main/t2_off.png" onclick="change_back('2');" style="cursor: pointer;">
						</li>
						<li id="p03">
							<img src="img/main/t3_off.png" onclick="change_back('3');" style="cursor: pointer;">
						</li>
						<li id="p04">
					 		<img src="img/main/t4_off.png" onclick="change_back('4');" style="cursor: pointer;">
						</li>
						<li id="p05">
							<img src="img/main/t5_off.png" onclick="change_back('5');" style="cursor: pointer;">
						</li>
						<li id="p06">
							<img src="img/main/t6_off.png" onclick="change_back('6');" style="cursor: pointer;">
						</li>
					</ul>
				</div>
			</div>	
			<!-- 우측비주얼 -->
		</div>
		<!-- 화살표 -->
		<div id="div_left_arrow" style="position:absolute; z-index:41; top:240px; left:-110px; display:none; opacity:0;">
			<a href="javascript:fnSlide('left')">
				<img src="img/main/arrow_01.png">
			</a>
		</div>
		<div id="div_right_arrow" style="position:absolute; z-index:41; top:240px; right:-110px;">
			<a href="javascript:fnSlide('right')">
				<img src="img/main/arrow_02.png">
			</a>
		</div>
		<!-- 화살표 -->
	</div>
	<!-- container : close -->
	<div class="contents01">
		<!-- 게시판노출 -->
		<div style="margin-top:30px;">
			<!-- 게시판 시작 -->
			<div style="float:left; border:0px solid red;">
				<div style="float:left; widtht:163px; height:240px; background-color:#676767;">
					<img src="img/m_title01.jpg">
					<div style="position:relative;">
						<div style="position:absolute; bottom:-145px; right:0px;">
							<a href="bbs/notice.jsp">
								<img src="img/m_more.png">
							</a>
						</div>
					</div>
				</div>
				<div style="float:left; margin-left:10px; width:800px; padding-top:10px;">
						<%
							SimpleDateFormat mon = new SimpleDateFormat("dd");
							SimpleDateFormat date = new SimpleDateFormat("yyyy-MM");
							BoardDAO boardDAO = new BoardDAO();
							int count = boardDAO.getBoardCount();
							List<BoardBean> boardList = null;
							if(count != 0) {
							    boardList = boardDAO.getBoards(1, 3);
							    for(int i=0; i<boardList.size(); i++) {
							        BoardBean boardBean = boardList.get(i);
						%>			
							<div class="latest_01">
								<div style="float:left;">
									<div class="txt_mon"><%=mon.format(boardBean.getDate())%></div>
									<div class="txt_date"><%=date.format(boardBean.getDate()) %></div>
								</div>
								<div class="txt_latest">
									<div class="txt_subject">
										<%
										int wid = 0;
										if(boardBean.getRe_lev()>0) { //답변글
											wid = 10*boardBean.getRe_lev();
										%>
											<img src="img/bbs/level.gif" width="<%=wid%>">
											<img src="img/bbs/re.gif">
										<%
										}
										%>
										<a href="bbs/content.jsp?num=<%=boardBean.getNum()%>"><%=boardBean.getSubject() %></a>
									</div>
									<div id="content" class="txt_con">
										<p>
											<%=boardBean.getContent() %>
										</p>
									</div>
								</div>
								<div style="clear:both;">
								</div>
							</div>
							<div style="clear:both;"></div>
						<% }
						}
						%>					
				</div>
				<!-- 게시판 끝 -->
			</div>
		<div style="clear:both;"></div>
		<!-- 게시판노출 -->
		</div>
	<div style="clear:both;"></div>
	</div>
	<!-- under bar -->
	<div class="under_bar" style="width:1000px; clear:both; margin:0 auto;">
		<%for(int i=1; i<=9; i++) { %>
			<img src="img/under_bar/bot_img0<%=i%>.gif">
		<%} %>
	</div>
	<!-- footer : open -->
	<div id="footer">
		<div class="copylogo">
			<img src="img/foot/copylogo.png">
		</div>
		<div class="row_util">
			<img src="img/foot/row_util01.jpg">
			<img src="img/foot/row_util02.jpg">
			<img src="img/foot/row_util03.jpg">
			<img src="img/foot/row_util04.jpg">
			<span class="layer_on">
					<img src="img/foot/row_util05.jpg">
			</span>
			<img src="img/foot/row_util06.jpg">
		</div>
		<div class="copy">
			<img src="img/foot/copy.jpg">
		</div>	
	</div>
	<!-- footer : close -->
	</div>
	<!-- wrap : close -->
</div>
<!-- wrap_bg : close -->
</body>
</html>