<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
	function form_submit(form) {
		if(form.id.value == "") {
			alert("아이디를 입력해주세요!");
			form.id.focus();
			return false;
		}
		if(form.passwd.value == "") {
			alert("비밀번호를 입력해주세요!");
			form.passwd.focus();
			return false;
		}
	}
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
		<!-- sub_top 시작 -->
		<%@include file="../inc/sub_top.jsp" %>
		<!-- sub_top 끝-->
		<div class="contents_box">
			<div class="login_box">
				<div class="cle">
					<div class="haatz_intr">
						<h3>
							<span>Haatz</span>홈페이지에<br>방문하신 것을 환영합니다.
						</h3>
						<ul>
							<li>편리한 이용을 위해 로그인을 해주시기 바랍니다.</li>
							<li>회원이 아니시라면 회원가입을 먼저 하십시요.</li>
						</ul>
					</div>
					<div class="login">
						<form name="form" method="post" action="loginPro.jsp" onsubmit="return form_submit(document.form);">
							<div style="float: left; width: 307px;">
								<div style="float: left; width: 220px;">
									아이디 <input name="id" type="text" id="id">
									비밀번호 <input type="password" id="passwd" name="passwd" title="비밀번호 입력">
								</div>
								<span style="float: left; width: 87px; margin-top: 15px;">
									<input type="image" src="../img/member/login_btn.gif" name="btn_submit" alt="로그인" style="width: 87px; height: 65px;">
								</span>
							</div>
						</form>
					</div>
					<div class="member03">
						<h4>회원 가입</h4>
						<p>
							아직 회원이 아니십니까? 저희 쇼핑몰은 <br>회원들을 위한 다양한 혜택이 준비되어 있습니다.
						</p>
						<span>
							<a href="register.jsp">
								<img src="../img/member/register_btn.gif" alt="가입하기">
							</a>
						</span>
					</div>
				</div>
				<div class="banner_zone cle">
					<ul>
						<li>
							<img src="../img/head/banner_1.jpg" alt="맑고 건강한 주방공기 하츠와 함께 하세요!">
						</li>
						<li>
							<img src="../img/head/banner_2.jpg" alt="그린의 편안한 휴식 - 버티컬 에어가든">
						</li>
						<li>
							<img src="../img/head/banner_3.jpg"	alt="신선하고 오염없는 건강한 생활 - 나드림이 만들어드립니다.">
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- //.contents_box -->
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