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
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">

//Adobe font
(function(d) {
    var config = {
      kitId: 'fpr3sxh',
      scriptTimeout: 3000,
      async: true
    },
    h=d.documentElement,t=setTimeout(function(){h.className=h.className.replace(/\bwf-loading\b/g,"")+" wf-inactive";},config.scriptTimeout),tk=d.createElement("script"),f=false,s=d.getElementsByTagName("script")[0],a;h.className+=" wf-loading";tk.src='https://use.typekit.net/'+config.kitId+'.js';tk.async=true;tk.onload=tk.onreadystatechange=function(){a=this.readyState;if(f||a&&a!="complete"&&a!="loaded")return;f=true;clearTimeout(t);try{Typekit.load(config)}catch(e){}};s.parentNode.insertBefore(tk,s)
  })(document);

</script>
<style type="text/css">
	body{
		font-family: source-han-sans-korean, sans-serif;
	}
	
	.logindiv{
	
	}
</style>
</head>
<body>
	<div class="logindiv">
	<h1>ONL</h1>
		<form action="auth" method="post">
			<input type="email" name="email" placeholder="이메일 예)example@example.co.kr"><br>
			<input type="password" name="password" placeholder="비밀번호/password"><br>
			<input type="submit" value="로그인">
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
		    alert(JSON.stringify(authObj));
		     },
		     fail: function(err) {
		     alert(JSON.stringify(err));
		     }
		   });
		    //
		  </script>
	</div>
	${msg}
</body>
</html>