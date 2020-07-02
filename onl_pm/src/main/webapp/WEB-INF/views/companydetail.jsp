<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#h2 {margin-left: 400px; font-size: 30px;}

	table {text-align: center; border-bottom: 2px solid gray; border-top: 2px solid gray;
			width:50%; margin: auto;  height: 250px;
	}
	
 	.line {border-bottom: 1px solid gray;}
 	
 	#id1 {background-color: silver;}
</style>
</head>
<body>
<div style="white-space:nowrap; overflow:auto;  width:1910px; height:900px;">                                                                                                                                                                                  
<br>
<h2 id="h2">회사소개</h2>
<br>
<hr>
<br>
<br>

<table border="0">
	<tr>
		<td class="line" id="id1"><b>법인명</b></td>
		<td class="line">오늘, 내:일</td>
	</tr>
	<tr>
		<td class="line" id="id1"><b>대표이사</b></td>
		<td class="line">장 미</td>
	</tr>
	<tr>
		<td class="line" id="id1"><b>회사주소</b></td>
		<td class="line">서울특별시 영등포구 양산로 53 월드메르디앙비즈센터 4층 401호 한경닷컴 2강의실</td>
	</tr>
	<tr>
		<td class="line" id="id1"><b>대표전화/팩스</b></td>
		<td class="line">T.010)xxxx-xxxx / F.02)xxx-xxxx</td>
	</tr>
	<tr>
		<td class="line" id="id1"><b>이메일</b></td>
		<td class="line">hankyung11@hankyung.com</td>
	</tr>
	<tr>
		<td id="id1"><b>사업자등록번호</b></td>
		<td>110-xx-xxxxx</td>
	</tr>
</table>
</div>
</body>
</html>
<%@include file="footer.jsp" %>