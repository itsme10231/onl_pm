<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<html>
<head>
<title>Home</title>
<style type="text/css">

	#aa li {
/* 	border: solid 1px; */
 	list-style-type: none;
  	float: left; 
 	margin-left: 38px; 
	text-align: center;
	
	}
	
	#aa ul{
/* 	border: solid 1px; */
	width: 1150px;
	margin: 0 auto;
	
	}
	
	.category1{
/* 	border: solid 1px; */
	font-size: 9pt;
	margin-top: 0px;
	}
	
	.category2{
	display: none;
	}

	.sosC{
/* 	border: solid 1px; */
	width: 250px;
 	position: absolute;
	text-align: center ;
	float: left;
	
	}
	
	.w{
/* 	border: solid 1px; */
	width: 1150px;
	margin: 0 auto;
	float: none;
	}
	
	p{
	text-align: center;
	}

	#body{
	border: solid red 2px; 
	width: 1200px;
	margin: 0 auto;
	
	}
	

	#view{
	border: solid 1px;
	width: 500px;
	height: 300px;
	margin: 0 auto;
	
	}
	#slider-wrap{
	
	}
	
	#slider{
	list-style: none;
	position: absolute;
	}
	
	#slider li{
	display: inline-block;
	overflow: hidden;
	}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<div id="body">
	<h1>
		오늘, 내:일  
	</h1>
	<div id="aa">
		<ul>
			<li>
				<img alt="asd" src="${pageContext.request.contextPath}/resources/img/service_1.jpg" width="80px" >
				<p class="category1">반려동물</p>
				<p class="category2">dasdad</p>
			</li>
			<li>
				<img alt="asd" src="${pageContext.request.contextPath}/resources/img/service_1.jpg" width="80px" >
				<p class="category1">차량/배달</p>
				<p class="category2">dasdad</p>
			</li>
			<li>
				<img alt="asd" src="${pageContext.request.contextPath}/resources/img/service_1.jpg" width="80px" >
				<p class="category1">대행서비스</p>
				<p class="category2">dasdad</p>
			</li>
			<li>
				<img alt="asd" src="${pageContext.request.contextPath}/resources/img/service_1.jpg" width="80px" >
				<p class="category1">상담/코칭</p>
				<p class="category2">dasdad</p>
			</li>
			<li>
				<img alt="asd" src="${pageContext.request.contextPath}/resources/img/service_1.jpg" width="80px" >
				<p class="category1">홈케어</p>
				<p class="category2">dasdad</p>
			</li>
			<li>
				<img alt="asd" src="${pageContext.request.contextPath}/resources/img/service_1.jpg" width="80px" >
				<p class="category1">제작/수리</p>
				<p class="category2">dasdad</p>
			</li>
			<li>
				<img alt="asd" src="${pageContext.request.contextPath}/resources/img/service_1.jpg" width="80px" >
				<p class="category1">일용식</p>
				<p class="category2">dasdad</p>
			</li>
			<li>
				<img alt="asd" src="${pageContext.request.contextPath}/resources/img/service_1.jpg" width="80px" >
				<p class="category1">요양/케어</p>
				<p class="category2">dasdad</p>
			</li>
			<li>
				<img alt="asd" src="${pageContext.request.contextPath}/resources/img/service_1.jpg" width="80px" >
				<p class="category1">기타</p>
				<p class="category2">dasdad</p>
			</li>
		</ul>
	</div>	
	<br><br><br><br><br><br>
	<div class="w">
		<h2>긴급</h2>
		<div class="sosC" ><img width="250px" alt="sas" src="${pageContext.request.contextPath}/resources/img/service_1.jpg"><p>sos</p></div>
		<div class="sosC" style="margin-left: 300px"><img width="250px" alt="sas" src="${pageContext.request.contextPath}/resources/img/service_1.jpg"><div><p>sos</p></div></div>
		<div class="sosC" style="margin-left: 600px"><img width="250px" alt="sas" src="${pageContext.request.contextPath}/resources/img/service_1.jpg"><div><p>sos</p></div></div>
		<div class="sosC" style="margin-left: 900px"><img width="250px" alt="sas" src="${pageContext.request.contextPath}/resources/img/service_1.jpg"><p>sos</p></div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<div class="w">
		<h2>추천</h2>
		<div class="sosC"><img width="250px" alt="sas" src="${pageContext.request.contextPath}/resources/img/service_1.jpg"><p>sos</p></div>
		<div class="sosC" style="margin-left: 300px"><img width="250px" alt="sas" src="${pageContext.request.contextPath}/resources/img/service_1.jpg"><p>sos</p></div>
		<div class="sosC" style="margin-left: 600px"><img width="250px" alt="sas" src="${pageContext.request.contextPath}/resources/img/service_1.jpg"><p>sos</p></div>
		<div class="sosC" style="margin-left: 900px"><img width="250px" alt="sas" src="${pageContext.request.contextPath}/resources/img/service_1.jpg"><p>sos</p></div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<div id="view">
		<div id="slider-wrap">
			<ul id="slider">
				<li>
					<div>
						<h3>1/3</h3>
					</div>
					<img alt="광고" src="${pageContext.request.contextPath}/resources/img/service_1.jpg" width="500px" height="200px">
				</li>
				<li>
					<div>
						<h3>2/3</h3>
					</div>
					<img alt="광고" src="${pageContext.request.contextPath}/resources/img/service_1.jpg" width="500px" height="200px">
				</li>
				<li>
					<div>
						<h3>3/3</h3>
					</div>
					<img alt="광고" src="${pageContext.request.contextPath}/resources/img/service_1.jpg" width="500px" height="200px">	
				</li>
			</ul>
		</div>
	</div>	
</div>	
	<br>
</html>
