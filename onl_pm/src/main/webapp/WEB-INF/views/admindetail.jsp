<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function updateDel(id){
	var chk = confirm("정말 정지처리 하시겠습니까?");
	if (chk) {
		location.href="updateDel.do?id="+id;
	}
}

function updateDel2(id){
	var chk = confirm("정말 활동처리 하시겠습니까?");
	if (chk) {
		location.href="updateDel2.do?id="+id;
	}
}


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
	#div2 {
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
.button2{
	width:50px;
	height: 100%;
	border: 0px;
 	background: #1b5ac2; 
	outline: none;
	color: #ffffff; 
}
.div3 {
	height: 40px;
	width: 80px;
	background-color: #1b5ac2;
	float: right;
 	margin-right: 5px; 
	display: block;
	border-radius: 5px;
	margin-top: 10px;
	border: 1px solid #1b5ac2;
	text-align: center;
}
</style>
</head>
<body>
<%
	

%>

<div
		style="white-space: nowrap; overflow: auto; width: 1910px; height: 900px;">
<h2 id="h2">회원신고 상세보기</h2>
<table id="table2">
			<tr>
				<th width="100px;">ID</th>
				<th width="50px;">번호</th>
				<th width="495px;">내용</th>
				<th width="100px;">날짜</th>
				<th width="100px;">처리상태</th>
				<th width="100px;">정지여부</th>
			</tr>

			<c:forEach items="${list}" var="ldto">
				<tr>
					<td>${ldto.id}</td>
					<td>${ldto.reportDto.seq}</td>
					<td>${ldto.reportDto.content}</td>
					<td><f:formatDate pattern="yyyy-MM-dd" value="${ldto.regdate}"/></td>
					<td>${ldto.reportDto.process}</td>
					<td>${ldto.delflag}</td>
				</tr>
			</c:forEach>
			</table>
			<c:if test="${fn:length(list) > 1 && list[0].reportDto.content ne ''}">
				<div id="div2">
					<button class="button2" type="button" onclick="updateDel2('${list[0].id}')">활동</button>
				</div>
				<div class="div3">
					<button class="button2" type="button" onclick="updateDel('${list[0].id}')">정지</button>
				</div>
			</c:if>
			
	</div>
			
</body>
</html>
<%@include file="footer.jsp"%>