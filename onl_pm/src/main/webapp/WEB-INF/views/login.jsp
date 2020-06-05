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
</head>
<body>
	<h1>로그인 페이지(login.jsp)</h1>
	<form action="auth" method="post">
		이메일 <input type="email" name="email">
		비밀번호 <input type="password" name="password">
		<input type="submit" value="로그인">
	</form>
	${msg}
</body>
</html>