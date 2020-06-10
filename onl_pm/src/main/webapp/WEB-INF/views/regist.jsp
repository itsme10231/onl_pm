<%@page import="com.nl.onl.util.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@include file="header.jsp" %>
<!DOCTYPE>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery와 Postcodify를 로딩한다 -->
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> -->
<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript">
var code;


$(function() {

	$("#postcodify_search_button").postcodifyPopUp(); 



});



function pass(){
	//입력된 아이디값 구하기
	var confirm=document.getElementsByName("confirm").text();
	
	
}
function requestCode(){
	var email=$("td[id='email']").val();
	console.log(email);
	$.ajax({
		url:"mailConfirm.do",
		data:{"email":email},
		method:"post",
		dataType:"text",
		success:function(result){
			code=result;
			console.log(result);
// 			console.log(uran);
		}
	})
}

function confirmCode(){
	var isS = false;
	var confirm = $("input[name='confirm']").val();
	
	if(code==confirm){
		isS = true;
		alert("인증코드가 일치합니다.");
	}else{
		alert("인증코드를 확인하세요.");
	}
	
	return isS;
}

function SetEmailTail(emailValue) {
	  var email = document.all("email")    // 사용자 입력
	  var emailTail = document.all("email02") // Select box
	  
	  if ( emailValue == "1" )
	   return;
	  else if ( emailValue == "2" ) {
	   emailTail.readOnly = false;
	   emailTail.value = "";
	   emailTail.focus();
	  } else {
	   emailTail.readOnly = true;
	   emailTail.value = emailValue;
	  }
	 }


</script>
<style type="text/css">
	
</style>
</head>
<body>
<h1>회원가입</h1>
<form action="" method="post">
	<table style="margin: 0 auto; width: 700px; height: 1000px;" border="1">
		<tr>
			<td>이메일</td>
			<td id="email">
				<input type="text" name="email01" required="required">@
				<input type="text" name="email02" readonly="readonly">
			</td>
			<td>
				<input type="button" value="인증번호 요청" onclick="requestCode()">
			</td>
		</tr>	
		<tr>	
			<td></td>
			<td>	
				<select name="emailCheck" onchange="SetEmailTail(emailCheck.options[this.selectedIndex].value)">
					<option value="1" selected="selected">---선택하세요---</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.com">daum.com</option>
					<option value="nate.com">nate.com</option>
					<option value="2">---직접입력---</option>
				</select>
			</td>
		</tr>	
		<tr>
			<td>인증번호 확인</td>
			<td><input type="text" name="confirm"></td>
			<td><input type="button" value="인증번호 확인" required="required" onclick="confirmCode()"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password1" required="required"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" name="passowrd2" required="required"></td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td><input type="text" name="nickName" required="required"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" required="required"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="date" name="birth" required="required"></td>
		</tr>
		<tr>
			<td>휴대폰번호</td>
			<td>
				<input type="text" name="phone" required="required" size="4"> - 
				<input type="text" name="phone" required="required" size="4"> - 
				<input type="text" name="phone" required="required" size="4">
			</td>
			
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<!-- 주소와 우편번호를 입력할 <input>들을 생성하고 적당한 name과 class를 부여한다 -->
				&nbsp;우편번호
				<input type="text" name="postcode" class="postcodify_postcode5" readonly="readonly" value="" />
				<button id="postcodify_search_button">검색</button><br />
				&nbsp;도로명 &nbsp;&nbsp;
				<input type="text" name="address" class="postcodify_address" readonly="readonly" value="" /><br />
				&nbsp;상세주소
				<input type="text" name="details" class="postcodify_details" value="" /><br />
				&nbsp;참고항목
				<input type="text" name="extra_info" class="postcodify_extra_info" readonly="readonly" value="" /><br />
<!-- 				<input type="button" name="addressSearch" value="주소찾기" > -->
<!-- 				<input type="text" value="우편번호" readonly="readonly" style="width: 90px;"> -->
			</td>
		</tr>
<!-- 		<tr> -->
<!-- 			<td></td>	 -->
<!-- 			<td><input type="text" name="address" required="required"></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>상세주소</td>	 -->
<!-- 			<td><input type="text" name="detailAddress" required="required"></td> -->
<!-- 		</tr> -->
		<tr><td></td></tr><tr><td></td></tr>
		<tr>
			<td></td>
			<td>
				<input type="submit" value="가입완료" style="width: 175px;">
			</td>
		</tr>
	</table>
</form>

</body>
</html>
<%@include file="footer.jsp" %>