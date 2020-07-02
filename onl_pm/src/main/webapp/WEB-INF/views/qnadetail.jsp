<%@page import="com.nl.onl.dtos.LoginDto"%>
<%@page import="com.nl.onl.daos.LoginDaoImp"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.nl.onl.dtos.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
		function updateQna(seq){
			location.href="updateQna.do?seq="+seq;
		}
		function deleteQna(seq){
			var chk = confirm("정말 삭제하시겠습니까?");
			if (chk) {
				location.href="deleteQna.do?seq="+seq;
			}
		}
</script>

<style type="text/css">
#h2 {
	margin-left: 450px;
	margin-top: 50px;
	font-size: 30px;
}

table {
	border-top: 2px solid gray;
	border-bottom: 1px solid gray;
	border-left: none;
	border-right: none;
	margin-left: 450px;
	border-collapse: collapse;
	margin-top: 100px;
	font-size: 15px;
}

td {
	width: 100px;
	border: none;
	border-bottom: 1px solid gray;
	border-top: 1px solid gray;
	width: 798px;
}

th {
	border-bottom: 1px solid gray;
	border-top: 1px solid gray;
	text-align: center;
	width: 150px;
	background-color: #E6E6E6;
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

#replyForm{display: none;}


</style>
</head>
<body>
<%-- 	<% LoginDto ldto=(LoginDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); %> --%>

	<div
		style="white-space: nowrap; overflow: auto; width: 1910px; height: 900px;">
		<h2 id="h2"><a href="qnalist.do?pnum=1">QNA 상세보기</a></h2>
		<table>
			<tr>
				<th height="40px">문의유형</th>
				<td height="40px">${qList[0].category_name}</td>
			</tr>
			<tr>
				<th height="40px">제목</th>
				<td height="40px">${qList[0].title}</td>
			</tr>
			<tr>
				<th height="230px">문의내용</th>
				<td><textarea class="form-control" rows="10" cols="60" readonly="readonly">${qList[0].content}</textarea></td>
			</tr>
			<tr>
				<th height="40px">첨부파일</th>
				<td height="40px"><input type="file" name="FileName"></td>
			</tr>
			<tr>
				<th height="40px">작성자</th>
				<td height="40px">${qList[0].id}</td>
			</tr>
			
		</table>
		<sec:authorize access="hasRole('ROLE_USER')" var="u">
		<div id="div2">
			<button class="button2" type="button" onclick="deleteQna(${qList[0].seq})">삭제</button>
			</div>
		<div class="div3">
			<button class="button2" onclick="updateQna(${qList[0].seq})">수정</button>
			</div>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ADMIN')" var="u">
		<div id="div2">
			<button class="button2" type="button" onclick="deleteQna(${qList[0].seq})">삭제</button>
			</div>
		<div class="div3">
			<button class="button2" onclick="updateQna(${qList[0].seq})">수정</button>
			</div>
			</sec:authorize>
			<form method="post">
			<input type="hidden" name="qna_code" value="${qList[0].qna_code}">
			<input type="hidden" name="seq" value="${qList[0].seq}">
			<input type="hidden" name="seq1" value="${qList[1].seq}">
			<table>
				<tr>
				<th height="230px">답변</th>
				<td>
				<sec:authorize access="hasRole('ROLE_ADMIN')" var="u">
				<textarea class="form-control" rows="10" cols="60" name="content">${qList[1].content}</textarea>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_USER')" var="u">
				<textarea class="form-control" rows="10" cols="60" readonly="readonly">${qList[1].content}</textarea>
				</sec:authorize>
				</td>
			</tr>
			</table>
			<sec:authorize access="hasRole('ROLE_ADMIN')" var="u">
			<div id="div2">
			<button ${qList[1] != null?"":"disabled style='opacity:0.5;'"} class="button2" type="button" onclick="deleteQna(${qList[1].seq})">삭제</button>
			</div>
		<div class="div3">
			<button ${qList[1] != null?"":"disabled style='opacity:0.5;'"} class="button2" type="submit" formaction="qnaReplyUpdate.do">수정</button>
			</div>
			<div class="div3">
			<button ${qList[1] == null?"":"disabled style='opacity:0.5;'"}   class="button2" type="submit" formaction="replyQna.do" >쓰기</button>
			</div>
			</sec:authorize>
			</form>
</div>

</body>
</html>
<%@include file="footer.jsp"%>