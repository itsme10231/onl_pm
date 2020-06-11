
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
	
	h1{
		width: 800px;
 		margin: 0 auto;
		border: solid 1px;
		margin-bottom: 10px;
	}
	
	.wish{
		width: 25px;
		height: 25px;
		float: right;
		margin-right: 50px;
		margin-top: -10px;
	}
	
	.profile{
 		width: 150px;
 		height: 200px; 
		border: solid 1px;
		border-radius: 50%;
	
	}
	
	.profileName{
 		width: 150px;  
		text-align: center;
		
	}
	
	.profileImg{
		width: 150px;
		height: 200px;
		border-radius: 50%;
		float: left;
		margin-right: 20px;
	}
	
	table{
		width: 800px;
		height: 300px;
		margin: 0 auto;
		text-align: center;
	}
	
	.detail{
		border: solid 1px;
		width: 800px;
		height: 300px;
		margin: 0 auto;
		
	}
	
	.process1 div{
/* 		border: solid 1px; */
		
		margin-left: 10px;
		float: left; 
		text-align: center;	
	}
	
	.process1{
		margin-bottom: 10px;
		
		overflow: auto;
	}
	
	.regdate{
		border: solid 1px;
		
	}
	
	.deadline{
		border: solid 1px;
	}
	
	.date{
 		border: solid 1px; 
		margin-left: 20px;
		width: 500xp;
	}
	
	.date div{
		float: left;
		padding: 5px;
	}
	
	.dateIcon{
		width: 25px;
		height: 25px;
		float: left;
	}
	
	.depth div{
		float: left;
		margin-left: 5px;
	}
	
	.depth{
		overflow: auto;
		margin-left: 150px;
		margin-bottom: 10px;
		
	}
</style>
</head>

<body>
<div class="headerWrapper">
	<div class="wantedDetail">
		<div class="depth">
			<div class="depth1">홈</div><div>></div><div>대분류</div><div>></div><div class="depth5">소분류</div>
		</div>	
		<h1>제목</h1>
		<div class="detail">
			<div>
				<div class="process1">
					<div class="wanted">지원  ></div><div class="process">진행  ></div><div class="complete">완료</div>
				</div>
				<div class=wish>
					<img alt="찜하기아이콘" src="resources/img/service_1.jpg" class="wish">
				</div>
				<div class="profileImg">
					<img alt="프로필사진" src="resources/img/service_1.jpg" class="profileImg">
				</div>
				<div class="date">
					<div class="regdate">
						<div>
							<img alt="등록일" src="resources/img/service_1.jpg" class="dateIcon">
						</div>
						<div>등록일</div>
						<div>2020-20-20 20:20</div>
					</div>
					<div class="deadline">
						<div>
							<img alt="마감일" src="resources/img/service_1.jpg" class="dateIcon">
						</div>
						<div>마감일</div>
						<div>2020-20-20 20:20</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
<!-- 		<table border="1"> -->
<!-- 			<colgroup> -->
<!-- 				<col width="50px;"> -->
<!-- 				<col width="50px;"> -->
<!-- 				<col width="50px;"> -->
<!-- 				<col width="50px;"> -->
<!-- 				<col width="50px;"> -->
<!-- 				<col width="50px;"> -->
<!-- 				<col width="50px;"> -->
<!-- 				<col width="50px;"> -->
<!-- 			</colgroup> -->
<!-- 			<tr> -->
<!-- 				<td class="wanted">지원</td> -->
<!-- 				<td class="wanted">></td> -->
<!-- 				<td class="process">진행</td> -->
<!-- 				<td class="process">></td> -->
<!-- 				<td class="complete">완료</td> -->
<!-- 				<td colspan="9"></td> -->
<!-- 				<td></td> -->
<!-- 				<td><img alt="찜하기아이콘" src="resources/img/service_1.jpg" class="wish"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td colspan="3" rowspan="6"><img alt="프로필사진" src="resources/img/service_1.jpg" class="profileImg"></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td>등록일</td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td colspan="3"><div class="profileName">이름</div></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
	</div>
</div>
</body>
</html>
<%@include file="footer.jsp" %>