<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="com.nl.onl.service.ScheduleServiceImp"%>
<%@page import="com.nl.onl.daos.ScheduleDaoImp"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="java.io.Console"%>
<%@page import="com.nl.onl.util.ScheduleDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.nl.onl.dtos.WantedDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
// 	$(function(){
// 		var countA;
// 		$(".countA").hover(function(){
// 			var spans = $(".caption").find("span");
// 			var year = spans.eq(0).text().trim();
// 			var month = spans.eq(1).text().trim();
// 			var date = $(this).text()trim();
// 			countA=$(this);
// 			countA.parent().find("span").css("display", "block");
// 			$.ajax({
// 				url:"ScheduleController.do",
// 				data:{"year":year,"month":month,"date":date},
// 				method: "post",
// 				datatype:"text",
// 				success: function(count){
// 					countA.parent().find("span").text(count);
// 				}
// 			});
// 		},function(){
// 			countA.parent().find("span").text("");
// 			countA.parent().find("span").css("display","none");
// 		});
// 	});
	
</script>
<style type="text/css">
	.schedule{
		border: solid lightgray 1px;
/* 		width: 800px; */
		margin: 0 auto;
		padding: 20px;
		border-radius: 5px;
		background-color: white;
 		
	}
	
	table{
		margin: 0 auto;
		width: 800px;
	
	}
	
	table td div{
		width: 130px;
	}
	.caption {
		width: 200px;
		text-align: center;
 		margin: 0 auto; 
 		height: 30px;
 		
	}
	
	.date div{
		float: left;
	}
	.date{
		overflow: auto;
		width: 260px;
		margin: 0 auto;
	}
	.week{
		text-align: center;
		
	}
	
	.other{
		color: gray;
	}
	
	.today{
/*  		position: absolute;  */
 		height: 30px; 
 		clear: both;
	}
	
	.conT{
		height: 100px;
		font-size: 8pt;
		
	}
	.conT p{
		margin-bottom: 0.5px !important;
	}
	.s p{
		background: red;
	}
	.w p{
		background: green;
	}
	.a p{
		background: orange;
	}
	.clist{
		
	}
</style>
</head>
<body>
<jsp:useBean id="scheduleDate" class="com.nl.onl.util.ScheduleDate" />
<div class="headerWrapper">
	<div class="schedule">
		<h1>일정관리</h1><br>
		<div class="date">	
			<div class="caption">
				<a href="calendarform.do?year=${year-1}&month=${month}">◁</a>
				<a href="calendarform.do?year=${year}&month=${month-1}">◀</a>
				<span>${year}</span>년<span>${month}</span>월
				<a href="calendarform.do?year=${year}&month=${month+1}">▶</a>
				<a href="calendarform.do?year=${year+1}&month=${month}">▷</a>
			</div>
			<button class="today" type="button" onclick="location.href='calendarform.do?year=${year2}&month=${month2}'">오늘</button>
		</div>	
		<table border="1">
			<tr class="week">
				<td>일</td>
				<td>월</td>
				<td>화</td>
				<td>수</td>
				<td>목</td>
				<td>금</td>
				<td>토</td>
			</tr>
			<tr>
				<c:forEach begin="0" end="${dayOfWeek-2}" step="1" varStatus="i" >
					<td></td>
				</c:forEach>
				<jsp:setProperty property="month" name="scheduleDate" value="${month}"/>
				<c:forEach begin="1" end="${lastDay}" step="1" varStatus="j">
					<td class="d">
						<a>${j.index}</a>
						<div class="conT" >
							<div class="s">
								<jsp:setProperty property="wlist" name="scheduleDate" value="${slist}"/>
								<jsp:setProperty property="date" name="scheduleDate" value="${j.index}"/>
								<jsp:getProperty property="calViewList" name="scheduleDate"/>
							</div>
							<div class="w">
								<jsp:setProperty property="wlist" name="scheduleDate" value="${wlist}"/>
								<jsp:getProperty property="calViewList" name="scheduleDate"/>
							</div>
							<div class="a"> 
								<jsp:setProperty property="wlist" name="scheduleDate" value="${alist}"/>
								<jsp:getProperty property="calViewList" name="scheduleDate"/>
							</div>
						</div>
					</td>
					<c:if test="${(dayOfWeek-1+j.index)%7==0}">
						</tr>
						<tr>
					</c:if>
				</c:forEach>
				<c:forEach begin="1" end="${(7-(dayOfWeek-1+lastDay)%7)%7}" step="1" varStatus="n">
					<td></td>
				</c:forEach>
			</tr>			
		</table>
	</div>	
</div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

$(function(){
	var today=new Date();//오늘 날짜 생성
	var month=today.getMonth()+1;
	var date=today.getDate();
	var calendarMonth=${month};
// 	class명="start54"
	//일정중에 21~25까지의 일정을 대상으로 하고 있음
// 	var start=$("p[class^=start]").eq(0);//start 엘리먼트
	var startList=$("p[class^=start]");//[p,p,p]
	var endList=$("p[class^=end]");
	
	
	//같은 seq끼리 같은 줄에 배치하기
	var seq = $(".d p").attr("class").split("_")[1]; //클래스명에 있는 seq
	
	
	
	console.log(seq);
	
	
	
	
	
	
	
	
	
// 	endList.each(function(){
// 		var end=$(this);
// 		var startNum=end.attr("class").split("_")[1];
// 		var start=$(".start_"+startNum+"_p");
		
// 		if(start.text()==""){//시작일이 없는 경우
// 			var firstDay=$(".d").eq(0).find("a").text().trim();
// 			var endDate=end.parents("td").children("a").text().trim();
		
// 			for(var i=0; i<endDate-1; i++){
// 				if(calendarMonth>month){
// 					$(".d").eq(i).find(".a").html("<p>&nbsp;</p>");
// 				}
// 			}
// 		}else{//시작일과 종료일이 같은 달에 있는 일정
// 			var startDate=start.parents("td").children("a").text().trim();//시작일
// 		    var endDate=end.parents("td").children("a").text().trim();//종료일
// 			for(var i=parseInt(startDate)+1;i<endDate;i++){
// 				if(date>endDate){
// 					$(".d").eq(i-1).find(".s").append("<p class=seq_"+startNum+">aaa</p><br>");
// 				}else if(date<endDate){
// 					$(".d").eq(i-1).find(".a").append("<p class=seq_"+startNum+">aaa</p><br>");
// // 					$(".d").eq(i-1).find(".a").html("<p>&nbsp;<p>");
// 				}else{
// 					$(".d").eq(i-1).find(".w").append("<p class=seq_"+startNum+">aaa</p><br>");
// // 					$(".d").eq(i-1).find(".w").html("<p>&nbsp;</p>");
// 				}
// 			}	
// 		}
// 	})

// 	startList.each(function(){
// 		var start=$(this);
// // 		var endNum=start.attr("class").substring(start.attr("class").lastIndexOf("t")+1); //seq값 추출
// 		var endNum=start.attr("class").split("_")[1];//"start_54_p"---> [start,54,p]
// 		var end=$(".end_"+endNum+"_o");//end 엘리먼트
	   
// 		if(end.text()==""){ // 시작일만 있고 종료일은 다음달인경우 일정
// 			var lastDay=$(".d").eq($(".d").length-1).find("a").text().trim();
// 			var startDate=start.parents("td").children("a").text().trim();//시작일
			
// 			for(var i=parseInt(startDate)+1;i<=lastDay;i++){
// 				if(calendarMonth<month&&start.attr("class").indexOf("p")!=-1){ //진행중
// 					$("td>a:contains("+i+")").parent("td").find(".s").html("<p>&nbsp;</p>");
// 				}
// // 				else if(date>startDate&&calendarMonth<month){
// // 					$("td>a:contains("+i+")").parent("td").find(".s").html("<p>&nbsp;</p>");
// // 				}
// 			}
// 		}
// // 		else{ //시작일과 종료일이 같은 달에 있는 일정
// // 			var startDate=start.parents("td").children("a").text().trim();//시작일
// // 		    var endDate=end.parents("td").children("a").text().trim();//종료일
		    
// // 			for(var i=parseInt(startDate)+1;i<endDate;i++){
// // 				if(date>endDate){
// // 					$(".d").eq(i-1).find(".s").append("<p>&nbsp;</p>");
// // 				}else if(date<endDate){
// // 					$(".d").eq(i-1).find(".a").html("<p>&nbsp;</p>");
// // 				}else{
// // 					$(".d").eq(i-1).find(".w").html("<p>&nbsp;</p>");
// // 				}
// // 			}	
// // 		}
// 	})
// 	console.log($(".d").)
// 	$(".conT p").css("margin-bottom","0.5px");
});
</script>
</html>
<%@include file="footer.jsp" %>