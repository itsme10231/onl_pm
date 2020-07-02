<%@page import="java.util.Map"%>
<%@page import="com.nl.onl.dtos.ReportDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

	#h2 {
	margin-left: 450px;
	margin-top: 50px;
	font-size: 30px;
}

#table2 {
	border-top: 2px solid gray;
/* 	border-bottom: 2px solid gray; */
	border-left: none;
	border-right: none;
	margin-left: 450px;
 	border-collapse: collapse; 
	margin-top: 100px;
	text-align: center;
	font-size: 15px;
}

 th { 
 background-color: #E6E6E6;
     border-bottom: 1px solid #444444; 
     padding: 10px; 
   } 
 td {
 
 	 border-bottom: 1px solid #444444; 
     padding: 10px;
 
 }
	
</style>

</head>
<body>
<%
	List<ReportDto> list=(List<ReportDto>)request.getAttribute("list");
// 	int count=(Integer) request.getAttribute("count");
	Map<String,Integer> map=(Map<String,Integer>)request.getAttribute("map");
// 	String qna_code = request.getParameter("qna_code");
%>


<div
		style="white-space: nowrap; overflow: auto; width: 1910px; height: 900px;">
<h2 id="h2">신고목록</h2>
<table id="table2">
			<tr>
				<th width="50px;">번호</th>
				<th width="100px;">날짜</th>
				<th width="495px;">유형</th>
				<th width="150px;">신고인</th>
				<th width="150px;">피신고인</th>
				<th width="100px;">처리상태</th>
			</tr>

			<c:forEach items="${list}" var="rdto">
				<tr>
					<td>${rdto.seq}</td>
					<td><f:formatDate pattern="yyyy-MM-dd" value="${rdto.regdate}"/></td>
					<td><a href="reportdetail.do?seqparam=${rdto.seq}">${rdto.c_content}</a></td>
					<td>${rdto.id}</td>
					<td>${rdto.reported_id}</td>
					<td>${rdto.process}</td>
				</tr>
			</c:forEach>

				<tr> 
			<td colspan="5" style="text-align: center;"> 
				<a href="reportlist.do?pnum=<%=map.get("prePageNum")%>">◀</a>
 				<%  
				for(int i=map.get("startPage") ;i<=map.get("endPage");i++){
 						%>
 						<a href="reportlist.do?pnum=<%=i%>"><%=i%></a> 
 						<% 
					} 
 				%> 
			<a href="reportlist.do?pnum=<%=map.get("nextPageNum")%>">▶</a> 
			</td> 
			<td>
			</td>
		</tr> 
		</table>
</div>
</body>
</html>
<%@include file="footer.jsp"%>