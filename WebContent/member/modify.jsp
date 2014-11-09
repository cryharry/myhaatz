<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script type="text/javascript">
function onlyNum(event, type) {
	if(event.keyCode == 45) return true;
	if(type == "numbers") {
		if(event.keyCode < 46 || event.keyCode > 57) return false;
	}
}

function onlyNum_han(obj) {
	if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 38  || event.keyCode == 39 || event.keyCode == 40) return;
	obj.value = obj.value.replace(/[ㄱ-ㅎㅏ-ㅣ가-힣]/g,'');
}

function idcheck() {
	if(AJAX.readyState == 4 && AJAX.status == 200) {
	    // AJAX success시 결과값 result라는 변수에 저장
	    result = AJAX.responseText;
	    idCheckValue = true;
	    $('#id_span').html(result);
	    // result값을 호출한 곳으로 돌려줌
	}else if (AJAX.readyState == 4 && AJAX.status != 200) {
		// AJAX status fail
	  	alert('Something went wrong...');
	}
}

function oncheckid(id) {
	AJAX.onreadystatechange = idcheck;
	AJAX.open("POST", "checkId.jsp?id="+id, true);
	AJAX.send();
}

function openDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr').value = data.postcode1 + "-" +data.postcode2;
                document.getElementById('addr1').value = data.address;

                //전체 주소에서 연결 번지 및 ()로 묶여 있는 부가정보를 제거하고자 할 경우,
                //아래와 같은 정규식을 사용해도 된다. 정규식은 개발자의 목적에 맞게 수정해서 사용 가능하다.
                //var addr = data.address.replace(/(\s|^)\(.+\)$|\S+~\S+/g, '');
                //document.getElementById('addr').value = addr;

                document.getElementById('addr2').focus();
            }
        }).open();
}
function email_check(email) {
	 var re=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	 if(re.test(email)) {
		 return true;
	 } else {
		 $("#ajax_email").html("<font color='red'>이메일형식이 틀립니다.</font>");
		 $("#email").focus();
		 return false;
	 }
}
function email_check2(email) {
	var re=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	 if(re.test(email)) {
		 $("#ajax_email").html("<font color='green'>올바른 이메일입니다.</font>");
		 return true;
	 }
}

function form_submit(form) {
	if(form.passwd.value == "") {
		alert("비밀번호를 입력해주세요");
		form.passwd.focus();
		return false;
	}
	if(form.passwd_re.value == "") {
		alert("비밀번호 확인이 필요합니다.");
		form.passwd_re.focus();
		return false;
	}
	if(form.passwd.value != form.passwd_re.value) {
		alert("입력한 비밀번호가 다릅니다");
		$('#passwd').val("");
		$('#passwd_re').val("");
		form.passwd.focus();
		return false;
	}
	if(form.name.value == "") {
		alert("이름을 입력해주세요");
		form.name.focus();
		return false;
	}
	if(form.age.value == "") {
		alert("나이를 입력해주세요");
		form.age.focus();
		return false;
	}
	if(form.gender[0].checked==false && form.gender[1].checked==false) {
		alert("성별을 체크하세요");
		return false;
	}
	if(form.email.value == "") {
		alert("이메일을 입력해주세요");
		form.email.focus();
		return false;
	}
	if(form.addr.value == "") {
		alert("주소를 입력해주세요");
		form.addr.focus();
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
		<%
			if(id == null) {
				response.sendRedirect("login.jsp");
			}
			MemberDAO memberDAO = new MemberDAO();
			MemberBean memberBean =  memberDAO.getMember(id);
			String gender = memberBean.getGender();
			if(gender == null) {
				gender = "남";
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		%>	
		<!-- container : open -->
			<form name="form" action="modifyPro.jsp" method="post" onsubmit="return form_submit(document.form);">
				<!-- sub_top 시작 -->
				<%@include file="../inc/sub_top.jsp" %>
				<!-- sub_top 끝 -->
				<div class="contents_box">
					<div class="member01">
						<table summary="아이디/패스워드/이름/닉네임등을 기입하는 회원가입표">
							<colgroup>
								<col style="width: 120px">
								<col style="width: 868px">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="reg_date">가입일자</label></th>
									<td>
										<input type="text" id="" name="" value="<%=sdf.format(memberBean.getReg_date())%>" class="id_input" style="ime-mode: disabled" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="u_id">아이디</label></th>
									<td>
										<input type="text" id="id" name="id" value="<%=memberBean.getId() %>" class="id_input" style="ime-mode: disabled" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="u_pw">패스워드</label></th>
									<td>
										<input type="password" id="passwd"	name="passwd">&nbsp;&nbsp;&nbsp;비밀번호는 6~16자 영문 대소문자, 숫자를 사용하세요.
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="u_pw2">패스워드확인</label></th>
									<td>
										<input type="password" id="passwd_re" name="passwd_re">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="u_name">이름</label></th>
									<td>
										<input type="text" id="name" name="name" value="<%=memberBean.getName()%>">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="u_nick">나이</label></th>
									<td>
										<input type="text" id="age" name="age" value="<%=memberBean.getAge() %>" onkeypress="return onlyNum(event, 'numbers');" onkeydown="return onlyNum_han(this);">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="gender">성별</label></th>
									<td>
										<input type="radio" name="gender" id="txtGender" value="남" <%if(gender.equals("남")){%>checked<%} %>>남
										<input type="radio" name="gender" id="txtGender" value="여" <%if(gender.equals("여")){%>checked<%} %>>여
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="u_mail">E-mail</label></th>
									<td>
										<input type="text" id="email" name="email" value="<%=memberBean.getEmail() %>" onblur="return email_check(this.value);" onkeyup="return email_check2(this.value);">
										<span id="ajax_email"></span>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="u_phone">전화번호</label></th>
									<td>
										<input type="text" id="tel" name="tel" <% if(memberBean.getTel() != null) {%> value="<%=memberBean.getTel()%>" <%}%> onkeypress="return onlyNum(event, 'numbers');" onkeydown="return onlyNum_han(this);">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="u_phone02">핸드폰번호</label></th>
									<td>
										<input type="text" id="mtel" name="mtel" <% if(memberBean.getMtel() != null) {%> value="<%=memberBean.getMtel()%>"<%}%> onkeypress="return onlyNum(event, 'numbers');" onkeydown="return onlyNum_han(this);">
									</td>
								</tr>
								<tr>
									<th scope="row" style="border-bottom: 1px solid #d5d5d5" rowspan="2">
										<label for="u_addr">주소</label>
									</th>
									<td style="border-bottom: 1px solid #d5d5d5">
										<span class="id_input">
											<input type="text" id="address1" name="address1" class="call_input" value="<%=memberBean.getAddress1() %>" style="width: 100px;">
										</span>
										<a href="" onclick="openDaumPostcode(); return false;">
											<img src="../img/member/post_btn.gif" alt="우편번호 검색" style="padding-left: 10px; padding-top: 5px;">
										</a>
									</td>
								</tr>
								<tr>
									<td style="border-bottom: 1px solid #d5d5d5">
										<input type="text" id="address2" name="address2" title="주소 첫자리" value="<%=memberBean.getAddress2() %>" style="width: 400px;">
										<input type="text" id="address3" name="address3" title="상세주소" style="width: 400px; margin-left: 10px;" <%if(memberBean.getAddress3()!=null) {%> value="<%=memberBean.getAddress3() %>" <%} %>>
									</td>
								</tr>
							</tbody>
						</table>
						<br>
						<div style="width: 100%; text-align: center">
							<input type="submit" value="정보수정">
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