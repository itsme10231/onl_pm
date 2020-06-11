
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
<style type="text/css">
	.wantedDetail{
		border: solid gray 1px;
/* 		width: 800px; */
		margin: 0 auto;
		padding: 20px;
		border-radius: 5px;
	}
	
	.asd div{
		width: 50px;
		height:30px;
		position: relative;
 		text-align: center; 
		position: relative;
		border: solid 1px;
	}
	
	h1{
		width: 700px;
		margin-left: 100px;
	}
	
	.wish{
		position: absolute;
	}
	
	.profile{
		width: 150px;
		height: 200px;
		border: solid 1px;
		margin-top: -150px;
		border-radius: 50%;
	}
	
	.profileName{
		width: 150px; 
		text-align: center;
		
	}
	
	table{
		width: 500px;
		height: 300px;
	}
</style>
</head>

<body>
<div class="headerWrapper">
	<div class="wantedDetail">
		<h1>제목</h1>
		<div class="wish" style="right: 200px; top: 50px;"><img alt="" src="">a</div>
		<div class="wish" style="right: 100px; top: 50px;"><img alt="" src="">b</div>
		<div class="asd">
			<div>지원</div><div style="left: 50px; top: -30px;">></div>
			<div style="left: 100px; top: -60px;">진행</div><div style="left: 150px; top: -90px;">></div>
			<div style="left: 200px; top: -120px;">완료</div><br><br>
		</div>
		<div class="profile">
			<img alt="" src="">
		</div>
		<div class="profileName">이름</div>
		<table border="1">
			<tr>
				<td>
				
				</td>
			</tr>
			<tr>
				<td>
				
				</td>
			</tr>
			<tr>
				<td>
				
				</td>
			</tr>
			<tr>
				<td>
				
				</td>
			</tr>
			<tr>
				<td>
				
				</td>
			</tr>
			<tr>
				<td>
				
				</td>
			</tr>
			<tr>
				<td>
				
				</td>
			</tr>
			<tr>
				<td>
				
				</td>
			</tr>
			<tr>
				<td>
				
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>
<%@include file="footer.jsp" %>