
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
/* 		float: left; */
		border: solid 1px;
		position: absolute;
		right: 172px;
		top: 115px;
	}
	
	.sos{
		width: 25px;
		height: 25px;
		position: absolute;
		right: 400px;
		top: 115px;
	}
	
	.views{
		width: 50px;
		height: 25px;
		position: absolute;
		top: 115px;
		border: solid 1px;
		right: 300px;
	}
	
	.views div{
		position: absolute;
 		top: -1px;
		border: solid 1px;
		left: 50px;
		height: 25px;
		width: 50px;
	}
	.profile{
 		width: 150px;
 		height: 200px; 
 		border: solid 1px; 
		border-radius: 50%;
	
	}
	
	.profileName{
 		width: 150px;  
 		height: 20px;
		text-align: center;
 		border: solid 1px; 
 		position: relative; 
		top: -20px;
	}
	
	.profileImg{
		width: 150px;
		height: 200px;
 		border-radius: 50%; 
		float: left;
		margin-right: 20px;
	}
	
	.detail{
 		border: solid 1px; 
		width: 800px;
		height: 300px;
		margin: 0 auto;
	}
	
	.content{
		border: solid 1px;
		width: 800px;
		margin: 0 auto;
		padding: 10px;
	}
	
	.phone{
		border: solid 1px;
		width: 800px;
		margin: 0 auto;
		padding: 10px;
	}
	
	.map{
		border: solid 1px;
		width: 800px;
		margin: 0 auto;
		padding: 10px;
	}
	
	#map{
		border: solid 1px;
	}
	.process1 div{
 		border: solid 1px;
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
		margin-left: 50px;
		margin-top: 20px;
	}
	
	.deadline{
		border: solid 1px; 
		margin-top: 20px;
	}
	
	.sdate{
		border: solid 1px; 
		margin-left: 50px;
		margin-top: 10px;
	}
	
	.edate{
		border: solid 1px; 
		margin-top: 10px;
	}
	.date{
  		border: solid 1px;  
		margin-left: 20px;
/* 		width: 500xp; */
		overflow: auto;
		height: 250px;
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
	
	.apply{
		float: left;
 		border: solid 1px;
		margin-left: 100px;
		margin-top: 10px;
	}
	
	.salary{
		border: solid 1px;
		margin-left: 50px;
		margin-top: 10px;
	}
	
	.button{
		margin-left: 50px;
		margin-top: 10px;
	}
	
	.button input{
		width: 100px;
		height: 30px;
		
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
			<div class="process1">
				<div class="wanted">지원  ></div><div class="process">진행  ></div><div class="complete">완료</div>
			</div>
			
			<img alt="찜하기아이콘" src="resources/img/service_1.jpg" class="wish">
			<img alt="긴급" src="resources/img/service_1.jpg" class="sos">
			<div class=views>조회수
				<div>10</div>
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
				<div class="sdate">
					<div>
						<img alt="시작일" src="resources/img/service_1.jpg" class="dateIcon">
					</div>
					<div>시작일</div>
					<div>2020-20-20 20:20</div>
				</div>
				<div class="edate">
					<div>
						<img alt="종료일" src="resources/img/service_1.jpg" class="dateIcon">
					</div>
					<div>종료일</div>
					<div>2020-20-20 20:20</div>
				</div>
				<div class="salary">
					<div>금액</div>
					<div>10,000</div>
					<div>원</div>
				</div>	
				<div class="apply">
					<div>지원자</div>
					<div>0명</div>
				</div>
				<div class="button">
					<input type="button" value="신고하기">
					<input type="button" value="문의하기">
					<input type="button" value="프로필">
					<input type="button" value="지원하기">
				</div>
			</div>
			<div class="profileName">이름</div>
		</div>
		<div class="content">
			<div><b>내용</b></div>
			<div>내용이 들어갈 곳</div>
		</div>
		<div class="phone">
			<div><b>연락처</b></div>
			<div>연락처가 들어갈곳(비공개/매칭시 공개)</div>
		</div>
		<div class="map">
			<div><b>위치</b></div>
			<div>위치 설명 및 주소기입</div>
			<div id="map" style="width: 300px; height: 300px;"></div>
		</div>
	</div>
</div>
</body>
</html>
<%@include file="footer.jsp" %>