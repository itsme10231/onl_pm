<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
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
		<h2>QNA 상세보기</h2>
		<table>
			<tr>
				<th height="40px">문의유형</th>
				<td height="40px">${dto.qna_code}</td>
			</tr>
			<tr>
				<th height="40px">제목</th>
				<td height="40px">${dto.title}</td>
			</tr>
			<tr>
				<th height="230px">문의내용</th>
				<td><textarea class="form-control" rows="10" cols="60" readonly="readonly">${dto.content}</textarea></td>
			</tr>
			<tr>
				<th height="40px">첨부파일</th>
				<td height="40px"><input type="file" name="FileName"></td>
			</tr>
			<tr>
				<th height="40px">작성자</th>
				<td height="40px">${dto.id}</td>
			</tr>
		</table>
		<div id="div2">
			<button class="button2" onclick="deleteQna(${dto.seq})">삭제</button>
			</div>
		<div class="div3">
			<button class="button2" onclick="updateQna(${dto.seq})">수정</button>
			</div>
		<div class="div3">
			<button class="button2">답글</button>
			</div>


	</div>
</body>
</html>