<%@page import="java.sql.Date"%>
<%@page import="java.io.Console"%>
<%@page import="com.nl.onl.util.ScheduleDate"%>
<%@page import="java.util.Calendar"%>
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
</style>
</head>
<%
	String pYear=request.getParameter("year");
	String pMonth=request.getParameter("month");
	
	
	Calendar cal=Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	int toyear = cal.get(Calendar.YEAR);
 	int today = cal.get(Calendar.MONTH)+1;
	
	if(pYear!=null){
		year=Integer.parseInt(pYear);
	}
	if(pMonth!=null){
		month=Integer.parseInt(pMonth);
	}
	
	if(month>12){
		month=1;
		year++;
	}
	if(month<1){
		month=12;
		year--;
	}
	
	cal.set(year, month-1, 1);
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	
	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	cal.set(year, month-2, 1);
	int lastDay2 = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			
	
%>
<body>
<div class="headerWrapper">
	<div class="schedule">
		<h1>일정관리</h1><br>
		<div class="date">	
			<div class="caption">
				<a href="calendarform.do?year=<%=year-1%>&month=<%=month%>">◁</a>
				<a href="calendarform.do?year=<%=year%>&month=<%=month-1%>">◀</a>
				<span><%=year%></span>년<span><%=month%></span>월
				<a href="calendarform.do?year=<%=year%>&month=<%=month+1%>">▶</a>
				<a href="calendarform.do?year=<%=year+1%>&month=<%=month%>">▷</a>
			</div>
			<button class="today" type="button" onclick="location.href='calendarform.do?year=<%=toyear%>&month=<%=today%>'">오늘</button>
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
				<%
					for(int i=dayOfWeek-2; i>=0; i--){
// 						out.print("<td>&nbsp;</td>");
						%>
						<td>
							<p class="other">
							<%=lastDay2-i%>
							</p>
							<div style="font-size: 6px; height: 50px;"></div>
						</td>
						<%
					}
				
					for(int i=1; i<=lastDay; i++){
						%>
						<td>
							<p class="countA" style="color:<%=ScheduleDate.fontColor(dayOfWeek, i) %>">
								<%=i %>
							</p>
							<div style="font-size: 6px; height: 50px;"></div>
							<span class="count"></span>
						</td>
						<%
						if((dayOfWeek-1+i)%7==0){
							out.print("</tr><tr>");
						}
					}
					int nbsp=(7-(dayOfWeek-1+lastDay)%7)%7;
					for(int i=1; i<nbsp+1; i++){
						%>
						<td>
							<p class="other">
							<%=i %>
							</p>
							<div style="font-size: 6px; height: 50px;"></div>	
						</td>
						<%
// 						out.print("<td>&nbsp;</td>");
					}
 				 %>
			</tr>
		</table>
	</div>	
</div>
</body>
</html>
<%@include file="footer.jsp" %>