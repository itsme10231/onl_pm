<%@page import="com.nl.onl.util.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@include file="header.jsp" %>
<!DOCTYPE>
<html>
<head>
<%
	String resultPass=(String)request.getAttribute("resultPass");
	Util uran=new Util();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
var code;

function pass(){
	//입력된 아이디값 구하기
	var confirm=document.getElementsByName("confirm").text();
	
	
}
function requestCode(){
	var email=$("input[name='email']").val();
	console.log(email);
	$.ajax({
		url:"regist.do",
		data:{"email":email},
		method:"post",
		dataType:"text",
		success:function(result){
			code=result;
			console.log(result);
			console.log(uran);
		}
	})
}

function confirmCode(){
	var isS = false;
	var confirm = $("input[name='confirm']").val();
	
	if(code==confirm){
		isS = true;
	}else{
		alert("인증코드를 확인하세요.");
	}
	
	return isS;
}
</script>
<style type="text/css">
	
</style>
</head>
<body>
<h1>회원가입</h1>
<form action="login.do" method="post">
	<table style="margin: 0 auto; width: 700px; height: 1000px;">
		<tr>
			<td>이메일</td>
			<td><input type="email" name="email" required="required"></td>
			<td><input type="button" value="인증번호 요청" onclick="requestCode()"></td>
		</tr>
		<tr>
			<td>인증번호 확인</td>
			<td><input type="text"></td>
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
			<td><input type="tel" name="phone" required="required"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="button" value="주소찾기">
				<input type="text" value="우편번호" readonly="readonly" style="width: 90px;">
			</td>
		</tr>
		<tr>
			<td></td>	
			<td><input type="text" name="address" required="required"></td>
		</tr>
		<tr>
			<td>상세주소</td>	
			<td><input type="text" name="detailAddress" required="required"></td>
		</tr>
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