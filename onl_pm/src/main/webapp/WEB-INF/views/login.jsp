<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/onl/resources/js/jquery-3.5.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>


<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<style type="text/css">
	h1{
		margin-top: 40px;
		margin-bottom: 50px;
	}
	
	body{
		font-family: 'Noto Sans KR', sans-serif;
		background-color: whitesmoke;
	}
	
	.logindiv{
		border: solid lightgray 1px;
		width: 300px;
		height: 400px;
		margin: 0 auto;
		padding: 20px;
		border-radius: 5px;
		background-color: white;
		text-align: center;
	}
	
	.loginbtn {
		font-size: 13pt;
	}

</style>
</head>
<body>
	<div class="logindiv" style="position:relative; top: 25%;">
	<h1>ONL</h1>
		<form action="auth" method="post" id="login">
			<input type="email" name="email" class="form-control" placeholder="이메일 예)example@example.co.kr">
			<input type="password" name="password" class="form-control" placeholder="비밀번호/password">
			<input type="submit" class="btn btn-primary btn-lg loginbtn" value="오늘계정으로 로그인" style="width:220px; margin-top:20px;">
		</form>
	
		<a id="kakao-login-btn"></a>
	  	<a href="http://developers.kakao.com/logout"></a>
		  <script type='text/javascript'>
		    //<![CDATA[
		   // 사용할 앱의 JavaScript 키를 설정해 주세요.
		   Kakao.init("4256f43891c9d18b2a718ee8751b2b5a");
		   
		   // 카카오 로그인 버튼을 생성합니다.
		   Kakao.Auth.createLoginButton({
		     container: '#kakao-login-btn',
		     success: function(authObj) {


		   		 Kakao.API.request({
			         url: '/v2/user/me',
			         success: function(res) {

			           
			           $.ajax({
			        	   url:"emailchk.do",
			        	   method:"post",
			        	   data: {"email": "K"+res.id},
			        	   dataType:"text",
			        	   success: function(text){
			        		   if(text == "DISABLE"){
			        			   //이미 가입된 계정이라면 로그인
			        			   $("input[name='email']").val("K" +res.id);
			        			   $("input[name='password']").val(res.id);
			        			   $("form").submit();
			        		   }else {
			        			   //아닐시 토큰을 가지고 가입페이지로 이동
			        			   location.href= "registform.do?regflag=K";
			        		   }
			        	   },
			        	   fail: function(text){
			        		   console.log("서버통신실패");
			        	   }
			           });
			           
			         },
			         fail: function(error) {
			           alert(
			             'login success, but failed to request user information: ' +
			               JSON.stringify(error)
			           )
			         },
		       })
		     },
		     fail: function(err) {
		     alert(JSON.stringify(err));
		     }
		   });
		    //
		  </script>
	</div>
	
</body>
</html>