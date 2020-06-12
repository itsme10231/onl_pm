<%@page import="com.nl.onl.util.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@include file="header.jsp" %>
<!DOCTYPE>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery와 Postcodify를 로딩한다 -->
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> -->
<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	var code;
	var inputLoc = $("input[name='loc_name']").val();
	var email = "";    // 사용자 입력
	
	var mailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	
	// 	var emailTail = document.all("email02") // Select box

	$(function() {
		
		var width = "500";
		var height = "600";
		
		$("#getJuso").click(function(){
			new daum.Postcode({
				q: inputLoc,
				popupName: "주소찾기",
				width: width,
				height: height,
				oncomplete: function(data){
					
					var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수	
	                
	//	             	// 법정동명이 있을 경우 추가한다. (법정리는 제외)
	//	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	//	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	//	                    extraRoadAddr += data.bname;
	//	                }
	//	                // 건물명이 있고, 공동주택일 경우 추가한다.
	//	                if(data.buildingName !== '' && data.apartment === 'Y'){
	//	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	//	                }
	//	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	//	                if(extraRoadAddr !== ''){
	//	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	//	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postcode').value = data.zonecode;
	//	                document.getElementById("sample4_roadAddress").value = roadAddr;
	               		document.getElementById("jibun").value = data.jibunAddress;
					
	//	                if(roadAddr !== ''){
	//	                    document.getElementById("jibun_detail").value = extraRoadAddr;
	//	                } else {
	//	                    document.getElementById("jibun_detail").value = '';
	//	                }
				}
				
			}).open({
				left: (window.screen.width / 2) - (width / 2),
			    top: (window.screen.height / 2) - (height / 2)
			});
		});
		
		
		
		
		$("form").submit(function(){
			//가입완료 버튼을 눌렀을 경우

			
			
		});
		
	});



	function pass(){
		//입력된 아이디값 구하기
		var confirm=document.getElementsByName("confirm").text();
		
		
	}
	function requestCode(){
		
		if($("select[name='emailCheck']").val() != ""){
			email = $("input[name='email01']").val() +"@" +$("select[name='emailCheck']").val();
		}else{
			email = $("input[name='email01']").val();
		}
		
		console.log(email);
		
		if(!mailRegex.test(email)){
			$("#isS").text("유효하지 않은 이메일 주소입니다.");
		}else{
			$.ajax({
				url: "emailchk.do",
				method: "post",
				data: {"email":email},
				dataType:"text",
				success: function(data){
					
					if(data == "DISABLE"){
						$("#isS").text("이미 사용중인 이메일 주소입니다.");
					}else {
						
						$("#isS").text("인증번호를 발송중입니다.");
						$("#codeBtn").attr("disabled",true);
						$.ajax({
							url:"mailConfirm.do",
							data:{"email":email},
							method:"post",
							dataType:"text",
							success:function(result){
								code=result;
								console.log(result);
								$("#isS").text("인증번호가 발송되었습니다.");
					// 			console.log(uran);
							},
							fail:function(){
								$("#isS").text("인증번호 발송에 실패했습니다.");
							}
						});
						
					}
				}
				
			});
		}
		
	}
	
	function confirmCode(){
		var confirm = $("input[name='confirm']").val();
		
		if(code==confirm){
			
			$("#isS").attr("class","Y").text("인증코드가 일치합니다.");
			$("#confirmBtn").attr("disabled",true);
			
		}else{
			$("#isS").text("인증코드를 확인해주세요.");
		}
		
	}
	



</script>
<style type="text/css">
	.N{
		color: red;
	}
	
	.Y{
		color: green;
	}
</style>
</head>
<body>

<div class="headerWrapper">

<h1>회원가입</h1>
	<div class="contentBox1">
	<form action="regist.do" method="post">
		<table style="margin: 0 auto; width: 700px; height: 1000px;">
			<tr>
				<td>이메일*</td>
				<td id="email">
					<input type="text" name="email01" required="required">@
					<select name="emailCheck" >
						<option value="" selected="selected">---선택하세요---</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.com">daum.com</option>
						<option value="nate.com">nate.com</option>
						<option value="">---직접입력---</option>
					</select>
					<input type="button" id="codeBtn" value="인증번호 요청" onclick="requestCode()">
					<input type="hidden" name="email">
					<p class='N' id='isS'></p>
				</td>
				
			</tr>	
			<tr>
				<td>인증번호 확인*</td>
				<td><input type="text" name="confirm">
					<input type="button" value="인증번호 확인" id="confirmBtn" onclick="confirmCode()">
				</td>
			</tr>
			<tr>
				<td>비밀번호*</td>
				<td><input type="password" name="password1" required="required"></td>
			</tr>
			<tr>
				<td>비밀번호 확인*</td>
				<td><input type="password" name="passowrd2" required="required"></td>
			</tr>
			<tr>
				<td>이름*</td>
				<td><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="nickName" placeholder="입력하지 않을시 자동으로 실명이 입력됩니다."></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth" required="required"></td>
			</tr>
			<tr>
				<td>휴대폰번호*</td>
				<td>
					<input type="text" name="phone" required="required" size="4"> - 
					<input type="text" name="phone" required="required" size="4"> - 
					<input type="text" name="phone" required="required" size="4">
				</td>
				
			</tr>
			<tr>
				<td>주소*</td>
				<td>우편번호
					<input type="text" name="address_1" id="postcode" readonly="readonly" style="width:100px;">
					<input type="button" id="getJuso" value="주소 찾기">
				</td>
			</tr>
			<tr>
				<td></td>	
				<td><input type="text" name="address_2" class="postcodify_address" id="jibun" readonly="readonly" value=""/></td>
			</tr>
			<tr>
				<td>상세주소</td>	
				<td><input type="text" name="address_3" class="postcodify_details" id="jibun_detail" value="" /></td>
			</tr>
	
			<tr>
				<td></td>
				<td>
					<input type="submit" value="가입완료" style="width: 175px;">
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>

</body>
</html>
<%@include file="footer.jsp" %>