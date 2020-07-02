<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="headerWrapper">
		<%@include file="sidemenu_memberinfo.jsp" %>
		
		<div class="pageContent">
			<div class="depth">홈 > 회원정보 > 나의 정보</div>
			<div class="contentDetail">
				<div class="centerDiv">
					<h2 class="pageTitle">나의 정보</h2>
					<form action="updatememberinfo" method="post">
					
						<table class="infoT">
							<tr>
								<td colspan="2" class="attention">
									* 표시는 필수입력항목입니다.
								</td>
							</tr>
							<tr>
								<th>현 비밀번호</th>
								<td>
									<input type="password" class="form-control pass" name="password" required="required">
								</td>
							</tr>
							<tr>
								<th>새 비밀번호</th>
								<td>
									<input type="password" class="form-control pass" name="password" required="required">
								</td>
							</tr>
							<tr>
								<th>새 비밀번호 확인</th>
								<td>
									<input type="password" class="form-control pass" name="password2" required="required">
									<p class='N' id='isS2'></p>
								</td>
							</tr>
							<tr>
								<th>이름*</th>
								<td><input type="text"  class="form-control" name="name" required="required" ></td>
							</tr>
							<tr>
								<th>닉네임</th>
								<td><input type="text" class="form-control" name="nickname" placeholder="입력하지 않을시 자동으로 실명이 입력됩니다."></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="date" class="form-control" name="birth" value="1900-01-01" min="1900-01-01"></td>
							</tr>
							<tr>
								<th>휴대폰번호*</th>
								<td>
									<input type="text" class="form-control phoneInput" name="phone1" required="required" > - 
									<input type="text" class="form-control phoneInput" name="phone2" required="required" > - 
									<input type="text" class="form-control phoneInput" name="phone3" required="required" >
									<input type="hidden" name="phone">
								</td>
								
							</tr>
							<tr>
								<th>주소*</th>
								<td>우편번호
									<div class="input-group mb-3" style="width:300px;">
										<input type="text" class="form-control" name="address_1" id="postcode" readonly="readonly" >
										<div class="input-group-append">
											<input type="button" class="btn btn-outline-secondary" id="getJuso" value="주소 찾기">
										</div>
									</div>
									<input type="text" name="address_2" class="form-control" id="jibun" readonly="readonly" value=""/>
								</td>
							</tr>
				
							<tr>
								<th>상세주소</th>	
								<td>
									<input type="text" name="address_3" class="form-control" id="jibun_detail" value="" />
									
								</td>
							</tr>
					
							<tr>
								<td colspan='2' style="text-align: center; padding: 0px;">
									<input type="submit" class="btn btn-danger btn-lg" value="수정완료" style="width: 175px;">
								</td>
							</tr>
						</table>
					
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>