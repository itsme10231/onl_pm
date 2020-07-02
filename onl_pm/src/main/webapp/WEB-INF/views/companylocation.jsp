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
#h2 {margin-left: 630px; font-size: 30px;}

/* 	p {width:40%; margin: auto; font-weight: bold;} */
	
	
	table {width:50%; margin-left: 630px; text-align: left; font-weight: bold;}
	
	#map1{float:left;margin-left:590px; width: 40px; margin-top: 25px;}
</style>
</head>
<body>
<div style="white-space:nowrap; overflow:auto;  width:1910px; height:900px;">
<br>
<h2 id="h2">오시는길</h2>

<hr>

<table>
	<th>서울특별시 영등포구 양산로 53 월드메르디앙비즈센터 4층 401호 한경닷컴 2강의실</th>
	<tr>
		<td></td>
	</tr>
	<tr>
		<td>대표번호:010)xxxx-xxxx          ｜                             FAX:02)xxx-xxxx          ｜                             E-MAIL:hankyung11@hankyung.com</td>
	</tr>
</table>
<br>
<!-- <img src="map2.png" id=map2> -->
<!-- 1. 지도 노드 -->
<div id="daumRoughmapContainer1591342442518" class="root_daum_roughmap root_daum_roughmap_landing" style="width:600px; margin: auto;"></div>
<!-- 	2. 설치 스크립트 -->
<!-- 	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다. -->

<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1591342442518",
		"key" : "yokq",
		"mapWidth" : "640",
		"mapHeight" : "360"
	}).render();
</script>
</div>
</body>
</html>
<%@include file="footer.jsp" %>