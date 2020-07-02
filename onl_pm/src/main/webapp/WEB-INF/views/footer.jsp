<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	.footerWrapper{
		position: relative;
		min-width: 1200px;
		max-width: 80%;
		
		margin: 0 auto;
		margin-top: 100px;

	}
	
	.copyright{
		font-size: 12px;
		text-align: center;
		color: darkgray;
	}
	
	.footerlinkfield{
		text-align: center;
	}
	
	footer{
		clear: both;
		min-height: 200px;
	}
	
</style>
</head>
<body>

<footer>
	<div class="footerwrapper">
		<hr style="boder:2px;"/>
		<div class="footerlinkfield">
		<a href="companydetail.do">회사소개</a> | 공지사항 | <a href="qnalist.do?pnum=1">QnA</a> | 사이트맵 | <a href="companylocation.do">찾아오시는 길</a>
		</div>
		<p class="copyright">
		Copyright © 2020 ONL Inc. All rights reserved.
		</p>
	</div>
</footer>
</body>
</html>