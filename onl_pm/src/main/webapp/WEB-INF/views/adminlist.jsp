<%@page import="java.util.Map"%>
<%@page import="com.nl.onl.dtos.LoginDto"%>
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
<script type="text/javascript">

</script>
<style type="text/css">
	
	#h2 {
	margin-left: 450px;
	margin-top: 50px;
	font-size: 30px;
}

#table2 {
	border-top: 2px solid gray;
	border-bottom: 2px solid gray;
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
	List<LoginDto> list=(List<LoginDto>)request.getAttribute("list");
	Map<String,Integer> map=(Map<String,Integer>)request.getAttribute("map");
%>
<div
		style="white-space: nowrap; overflow: auto; width: 1910px; height: 900px;">
<h2 id="h2">신고목록</h2>
<table id="table2">
			<tr>
				<th width="50px;">번호</th>
				<th width="495px;">유형</th>
				<th width="150px;">신고내역</th>
				<th width="100px;">정지여부</th>
			</tr>

			<c:forEach items="${list}" var="rdto">
				<tr>
					<td>${rdto.rn}</td>
					<td><a href="admindetail.do?idparam=${rdto.id}">${rdto.id}</a></td>
					<td>${rdto.complete}/${rdto.allcount}</td>
					<td>${rdto.delflag}</td>
				</tr>
			</c:forEach>
			<tr> 
			<td colspan="5" style="text-align: center;"> 
				<a href="adminlist.do?pnum=<%=map.get("prePageNum")%>">◀</a>
 				<%  
				for(int i=map.get("startPage") ;i<=map.get("endPage");i++){
 						%>
 						<a href="adminlist.do?pnum=<%=i%>"><%=i%></a> 
 						<% 
					} 
 				%> 
			<a href="adminlist.do?pnum=<%=map.get("nextPageNum")%>">▶</a> 
			</td> 
		</tr> 
			</table>
			</div>
</body>
</html>
<%@include file="footer.jsp"%>