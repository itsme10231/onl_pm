<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
/* 		border: solid gray 1px; */
/* 		margin: 0 auto; */
/* 		padding: 20px; */
/* 		border-radius: 5px; */
		
		border: solid lightgray 1px;
/* 		width: 800px; */
		margin: 0 auto;
		padding: 20px;
		border-radius: 5px;
		background-color: white;
	}
	
	h1{
/*  		border: solid 1px;  */
		width: 800px;
 		margin: 0 auto;
		margin-bottom: 10px;
	}
	
	.wish{
/*  		border: solid 1px;  */
		width: 25px;
		height: 25px;
		position: absolute;
		right: 223px;
		top: 115px;
	}
	
	.sos{
		width: 25px;
		height: 25px;
		position: absolute;
		right: 716px;
		top: 115px;
	}
	
	.sosText{
/*  		border: solid 1px;  */
  		position: absolute; 
 		top: 115px; 
 		left: 425px; 
	}
	
	.views{
/*  		border: solid 1px;  */
		width: 50px;
		height: 25px;
		position: absolute;
		top: 115px;
		right: 410px;
	}
	
	.views div{
/*  		border: solid 1px;  */
		position: absolute;
 		top: -1px;
		left: 50px;
		height: 25px;
		width: 50px;
	}
	.profile{
/*  		border: solid 1px;  */
 		width: 150px;
 		height: 200px; 
		border-radius: 50%;
		margin-left: 5px;
	}
	
	.profileName{
/*  		border: solid 1px;  */
 		width: 150px;  
 		height: 20px;
		text-align: center;
 		position: relative; 
		top: -30px;
		
	}
	
	.profileImg{
		width: 150px;
		height: 200px;
 		border-radius: 50%; 
		float: left;
		margin-right: 20px;
	}
	
	.detail{
/*   		border: solid 1px;    */
		width: 800px;
		height: 280px;
		margin: 0 auto;
		
	}
	
	.content{
/* 		border: solid 1px; */
		width: 800px;
		margin: 0 auto;
		padding: 10px;
	}
	
	.phone{
/* 		border: solid 1px; */
		width: 800px;
		margin: 0 auto;
		padding: 10px;
	}
	
	.map{
/* 		border: solid 1px; */
		width: 800px;
		margin: 0 auto;
		padding: 10px;
	}
	
	#map{
		border: solid 1px;
	}
	.process1 div{
/*  		border: solid 1px; */
		margin-left: 10px;
		float: left; 
		text-align: center;	
	}
	
	.process1{
		margin-bottom: 10px;
		overflow: auto;
	}
	
	.regdate{
/*   		border: solid 1px;   */
		margin-left: 50px;
		margin-top: 10px;
	}
	
	.deadline{
/*  		border: solid 1px;   */
		margin-top: 10px;
		margin-left: 50px;
	}
	
	.sdate{
/*  		border: solid 1px;  */
		margin-left: 50px;
		margin-top: 10px;
	}
	
	.edate{
/*  		border: solid 1px;   */
		margin-top: 10px;
		margin-left: 50px;
	}
	.date{
/*    		border: solid 1px;    */
		margin-left: 20px;
		overflow: auto;
		height: 230px;
		
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
/*   		border: solid 1px;  */
		float: left;
		margin-left: 123px;
		margin-top: 10px;
	}
	
	.salary{
/*  		border: solid 1px;  */
		margin-left: 50px;
		margin-top: 10px;
	}
	
	.button{
		margin-left: 70px;
		margin-top: 10px;
	}
	
	.button input{
		width: 100px;
		height: 30px;
		margin-right: 10px;
	}
</style>
</head>

<body>
<div class="headerWrapper">
	<div class="depth">
		<div class="depth1">홈</div><div>></div><div>${wdto.category_name1}</div><div>></div><div class="depth5">${wdto.category_name2}</div>
	</div>	
	<div class="wantedDetail">
		<h1>${wdto.title}</h1>
		<div class="detail">
			<div class="process1">
				<div class="wanted">지원  ></div><div class="process">진행  ></div><div class="complete">완료</div>
			</div>
			<img alt="찜하기아이콘" src="resources/icon/WhiteHeart.jpg" class="wish">
			<img alt="긴급" src="resources/icon/emergency.png" class="sos"><b class="sosText">긴급</b>
			<div class=views>조회수
				<div>${wdto.views}</div>
			</div>
			<div class="profileImg">
				<img alt="프로필사진" src="resources/icon/Peaple2.jpg" class="profileImg">
			</div>
			<div class="date">
				<div class="regdate">
					<div>
						<img alt="등록일" src="resources/icon/write.png" class="dateIcon">
					</div>
					<div>등록일</div>
					<div>${wdto.regdate}</div>
				</div>
				<div class="deadline">
					<div>
						<img alt="마감일" src="resources/icon/write.png" class="dateIcon">
					</div>
					<div>마감일</div>
					<div>${fn:substring(wdto.deadline,0,4)}년 
						${fn:substring(wdto.deadline,4,6)}월
						${fn:substring(wdto.deadline,6,8)}일 
						${fn:substring(wdto.deadline,0,2)}시
						${fn:substring(wdto.deadline,2,4)}분</div>
				</div>
				<div class="sdate">
					<div>
						<img alt="시작일" src="resources/icon/Watch.png" class="dateIcon">
					</div>
					<div>시작일</div>
					<div>${fn:substring(wdto.sdate,0,4)}년 
						${fn:substring(wdto.sdate,4,6)}월
						${fn:substring(wdto.sdate,6,8)}일 
						${fn:substring(wdto.stime,0,2)}시
						${fn:substring(wdto.stime,2,4)}분</div>
				</div>
				<div class="edate">
					<div>
						<img alt="종료일" src="resources/icon/Watch.png" class="dateIcon">
					</div>
					<div>종료일</div>
					<div>${fn:substring(wdto.edate,0,4)}년 
						${fn:substring(wdto.edate,4,6)}월
						${fn:substring(wdto.edate,6,8)}일 
						${fn:substring(wdto.etime,0,2)}시
						${fn:substring(wdto.etime,2,4)}분
					</div>
				</div>
				<div class="salary">
					<div>제안금액</div>
					<div>${wdto.salary}</div>
					<div>원</div>
				</div>	
				<div class="apply">
					<div>지원자</div>
					<div>${wdto.apply_c}명</div>
				</div>
				<div class="button">
					<input type="button" value="신고하기">
					<input type="button" value="문의하기">
					<input type="button" value="프로필">
					<input type="button" value="지원하기">
				</div>
			</div>
			<div class="profileName">${wdto.nickname}</div>
		</div>
	</div>	
	<div class="wantedDetail">	
		<div class="content">
			<div><b>내용</b></div><br>
			<div><p>${wdto.content}</p></div>
		</div>
	</div>
	<div class="wantedDetail">	
		<div class="phone">
			<div><b>연락처</b></div><br>
			<div id="phone">
				<c:if test="${fn:substring(wdto.phone,0,1) == 'Y'}">
					매칭시 공개
				</c:if>
				
			</div>
		</div>
	</div>	
	<div class="wantedDetail">	
		<div class="map">
			<div><b>위치</b></div><br>
			<div>${wdto.loc_name}${wdto.loc_detail}</div>
			<div><P>위치 설명(생략가능)</P></div>
			<div id="map" style="width: 300px; height: 300px;"></div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
// $(function(){
// 	var phone = $("div[id='phone']").text();
// 	if(phone.substr(0,1)=="Y"){
// 		$("div[id='phone']").text(phone = phone.substr(1));
// 	}
		
// 	var sdate = $("div[id='sdate']").text();
// 	var stime = $("div[id='stime']").text();
	
// 	var YYYY = sdate.substr(0,4);
// 	var MM = sdate.substr(4,2);
// 	var DD = sdate.substr(6);
	
// 	var H = stime.substr(0,2);
// 	var M = stime.substr(2);
	
// 	$("div[id='sdate']").text(sdate = YYYY+"년"+" "+MM+"월"+" "+DD+"일"+" "+H+"시"+" "+M+"분");
	
// 	console.log(sdate);
// 	console.log(stime);
	
// });
</script>
</html>
<%@include file="footer.jsp" %>