<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fnCategory() {
		$('.category').animate({height:'toggle'});
	}
</script>
</head>
<body>
<div class="sub_top">
	<div class="depth cle">
		<div class="whole">
			<h3 class="hide">메뉴 바로가기</h3>
			<ul>
				<li>
					<a href="" class="m_name" style="background-position: 0px -13px;">전체보기</a>
					<ul class="category" style="display: none;">
						<li>
							<a href="">하츠소개</a>
						</li>
						<li>
							<a href="">제품소개</a	>
						</li>
						<li>
							<a href="">커뮤니티</a>
						</li>
						<li>
							<a href="">고객지원</a>
						</li>
					</ul>
				</li>
			</ul>
			<span class="w_btn">
				<a href="javascript:fnCategory();">
					<img src="../img/sub_top/depth_btn.gif" alt="메뉴 펼치기 버튼">
				</a>
			</span>
		</div>
		<!-- //.whole -->
		<div class="depth_menu">
			<ul class="cle">
				<li class="focus">
					<a href="">회사개요</a>
				</li>
				<li>
					<a href="">사회공헌활동</a>
				</li>
				<li>
					<a href="">투자정보</a>
				</li>
				<li>
					<a href="">채용정보</a>
				</li>
				<li>
					<a href="">오시는길</a>
				</li>
			</ul>
		</div>
		<!-- //.depth_menu -->
	</div>
	<!-- //.depth -->
</div>
</body>
</html>