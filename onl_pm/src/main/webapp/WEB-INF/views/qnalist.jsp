<%@page import="java.util.Map"%>
<%@page import="com.nl.onl.dtos.QnaDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
input:-ms-input-placeholder {
	color: #a8a8a8;
}

input::-webkit-input-placeholder {
	color: #a8a8a8;
}

input::-moz-placeholder {
	color: #a8a8a8;
}
/* 	크롬,익스플로러,파이어폭스 에서도 구동하게해주는 소스 */
h2 {
	margin-left: 450px;
	margin-top: 50px;
	font-size: 30px;
}

#table1 {
	text-align: center;
	border: 2px solid gray;
	width: 50%;
	height: 70px;
	margin-left: 450px;
	border-collapse: collapse;
	margin-top: 100px;
	font-size: 15px;
}

#div2 {
	height: 40px;
	width: 400px;
	border: 1px solid #1b5ac2;
	background: #ffffff;
	float: right;
	margin-right: 505px;
	display: block;
	border-radius: 5px;
}

input {
	font-size: 16px;
	width: 325px;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;
}

#button1 {
	width: 50px;
	height: 100%;
	border: 0px;
	background: #1b5ac2;
	outline: none;
	float: right;
	color: #ffffff;
}

.td1 {
	width: 100px;
	border: 1px solid gray;
}

#table2 {
	border-top: 2px solid gray;
	border-bottom: 1px solid gray;
	border-left: none;
	border-right: none;
	margin-left: 450px;
	border-collapse: collapse;
	margin-top: 100px;
	text-align: center;
	font-size: 15px;
}

th {
	height: 40px;
	background-color: #E6E6E6;
}

.td2 {
	width: 100px;
	border: none;
	border-bottom: 1px solid gray;
	border-top: 1px solid gray;
	height: 40px;
}

.td3 {
	width: 100px;
	border: none;
	border-bottom: 2px solid gray;
	border-top: 1px solid gray;
	height: 40px;
}

#div3 {
	height: 40px;
	width: 80px;
	background-color: #1b5ac2;
	float: right;
	margin-right: 507px;
	display: block;
	border-radius: 5px;
	margin-top: 10px;
	border: 1px solid #1b5ac2;
	text-align: center;
}

#button2 {
	width: 50px;
	height: 100%;
	border: 0px;
	background: #1b5ac2;
	outline: none;
	color: #ffffff;
}
</style>
</head>
<body>
<%
	List<QnaDto> list=(List<QnaDto>)request.getAttribute("list");
	int count=(Integer) request.getAttribute("count");
	Map<String,Integer> map=(Map<String,Integer>)request.getAttribute("map");
%>
	<div
		style="white-space: nowrap; overflow: auto; width: 1910px; height: 900px;">
		<h2>사용자 QnA</h2>
		<div id="div2">
			<input type="text" placeholder="검색어 입력">
			<button id="button1">검색</button>
		</div>
		<table id="table1">
			<tr>
				<td class="td1">전체</td>
				<td class="td1">구인 회원가입</td>
				<td class="td1">회원정보 수정</td>
				<td class="td1">채용공고등록/관리</td>
				<td class="td1">결제</td>
			</tr>
			<tr>
				<td class="td1">기타</td>
				<td class="td1"></td>
				<td class="td1"></td>
				<td class="td1"></td>
				<td class="td1"></td>
			</tr>
		</table>

		<table id="table2">
			<tr>
				<th width="150px;">문의유형</th>
				<th width="495px;">질문</th>
				<th width="150px;">질문답변상황</th>
				<th width="150px;">작성일</th>
			</tr>

			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.category_name}</td>
					<td><a href="qnadetail.do?seqparam=${dto.seq}">${dto.title}</a></td>
					<td>${dto.process}</td>
					<td><f:formatDate pattern="yyyy-MM-dd" value="${dto.regdate}"/></td>
				</tr>
			</c:forEach>
<!-- 			<tr> -->
<%-- 				<td colspan="5" style="text-align: center;"><a href="">◀</a> <% --%>
<!-- //  	for (int i = 1; i <= count; i++) { -->
<%--  %> <a href="qnalist.do?pnum=<%=i%>"><%=i%></a> --%>
<%-- 					<% --%>
<!-- // 						} -->
<%-- 					%> <a href="">▶</a></td> --%>
<!-- 			</tr> -->

		<tr>
			<td colspan="5" style="text-align: center;">
				<a href="qnalist.do?pnum=<%=map.get("prePageNum")%>">◀</a>
				<%
				for(int i=map.get("startPage"); i<=map.get("endPage"); i++){
						%>
						<a href="qnalist.do?pnum=<%=i%>"><%=i%></a>
						<%
					}
				%>
				<a href="qnalist.do?pnum=<%=map.get("nextPageNum")%>">▶</a>
			</td>
		</tr>
		</table>
		
		<div id="div3">
			<button id="button2" onclick="location.href='addForm.do'">글쓰기</button>
		</div>
	</div>
</body>
</html>
<%@include file="footer.jsp"%>