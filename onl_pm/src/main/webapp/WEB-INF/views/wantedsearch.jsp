<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="headerWrapper">
	<%@include file="sidemenu_search.jsp" %>
	
	<div class="pageContent">
		<div class="depth">홈 > 검색결과</div>
		<div class="contentDetail">
			<div class="centerDiv">
				<h2 class="pageTitle">총 n건의 검색결과가 있습니다.</h2>
				이 아래로 컨텐츠 영역입니다.
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%@include file="footer.jsp" %>