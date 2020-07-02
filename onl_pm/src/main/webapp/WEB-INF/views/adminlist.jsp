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
</head>
<body>
<div
		style="white-space: nowrap; overflow: auto; width: 1910px; height: 900px;">
<h2>신고목록</h2>
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
					<td>${rdto.id}</td>
					<td><f:formatDate pattern="yyyy-MM-dd" value="${rdto.regdate}"/></td>
					<td><a href="reportdetail.do?seqparam=${rdto.seq}">${rdto.c_content}</a></td>
					<td>${rdto.reported_id}</td>
					<td>${rdto.process}</td>
				</tr>
			</c:forEach>
			</table>
			</div>
</body>
</html>
<%@include file="footer.jsp"%>