<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setContentType("text/html; charset=utf-8");
%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
h2 {
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
</style>
</head>
<body>
	<div
		style="white-space: nowrap; overflow: auto; width: 1910px; height: 900px;">
		<h2><a href="qnalist.do?pnum=1">QNA 수정</a></h2>
		<form action="qnaUpdate.do" method="post">
		<input type="hidden" name="seq" value="${qdto.seq}">
			<table>
				<tr>
					<th height="40px">문의유형</th>
					<td height="40px">
					<select name="qna_code">
							<option value="1" ${qdto.qna_code==1?"selected":""}>구인 회원가입</option>
							<option value="2" ${qdto.qna_code==2?"selected":""}>회원정보 수정</option>
							<option value="3" ${qdto.qna_code==3?"selected":""}>채용공고등록/관리</option>
							<option value="4" ${qdto.qna_code==4?"selected":""}>결제</option>
					</select>
					</td>
				</tr>
				<tr>
					<th height="40px">제목</th>
					<td height="40px"><input type="text" name="title" id="input2" value="${qdto.title}"/></td>
				</tr>
				<tr>
					<th height="230px">문의내용</th>
					<td height="230px"><textarea cols="70" rows="12" name="content">${qdto.content}</textarea></td>
				</tr>
<!-- 				<tr> -->
<!-- 					<th height="40px">첨부파일</th> -->
<!-- 					<td height="40px"><input type="file" name="FileName" -->
<!-- 						id="input3"></td> -->
<!-- 				</tr> -->
				<tr>
				<th height="40px">작성자</th>
				<td height="40px">${qdto.id}</td>
			</tr>
			</table>
			<div id="div2">
				<button class="button2" type="submit">수정완료</button>
			</div>
		</form>
	</div>


</body>
</html>
<%@include file="footer.jsp"%>