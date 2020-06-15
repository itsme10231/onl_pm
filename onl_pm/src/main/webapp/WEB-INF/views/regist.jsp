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
		
		
		$("input[name=password2]").blur(function(){
			if($("input[name=password1]").val() != $(this).val()){
				$("isS2").text("비밀번호를 확인해주세요.");
			}
		});
		
		
		
		$("form").submit(function(){
			//가입완료 버튼을 눌렀을 경우
			if($("#isS1").attr("class")=="N"){
				
				$("#isS1").text("이메일 인증을 진행해주세요.");
				return false;
				
			}else if($("#isS2").attr("class")=="N"){
				
				$("#isS2").text("비밀번호를 확인해주세요.");
				return false;
				
			}
			
			
		});
		
	});



	function pass(){
		//입력된 아이디값 구하기
		var confirm=document.getElementsByName("confirm").text();
		
	}
	
	function requestCode(){
		
		if($("select[name='emailCheck']").val() != "" && $("select[name='emailCheck']").val() != "--"){
			
			email = $("input[name='email01']").val() +"@" +$("select[name='emailCheck']").val();
			
		}else if($("select[name='emailCheck']").val() == ""){
			
			email = $("input[name='email01']").val();
			
		}else{
			$("#isS1").text("이메일 도메인을 선택해주세요.");
		}
		
		console.log(email);
		
		if(!mailRegex.test(email)){
			$("#isS1").text("유효하지 않은 이메일 주소입니다.");
		}else{
			$.ajax({
				url: "emailchk.do",
				method: "post",
				data: {"email":email},
				dataType:"text",
				success: function(data){
					
					if(data == "DISABLE"){
						$("#isS1").text("이미 사용중인 이메일 주소입니다.");
					}else {
						
						$("#isS1").text("인증번호를 발송중입니다.");
						$("#codeBtn").attr("disabled",true);
						$.ajax({
							url:"mailConfirm.do",
							data:{"email":email},
							method:"post",
							dataType:"text",
							success:function(result){
								code=result;
								console.log(result);
								$("#isS1").text("인증번호가 발송되었습니다.");
					// 			console.log(uran);
							},
							fail:function(){
								$("#isS1").text("인증번호 발송에 실패했습니다.");
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
	
	.registT th{
		padding-right: 50px;
	}
	
	.registT td{
		padding-left: 100px;
	}
	
	th{
		border-right: 1px solid lightgray;
	}
	
	.phoneInput {
		width: 100px;
		display: inline-block;
	}
	
	.attention{
		text-align: right;
		color: darkgray;
		font-weight: 100;
	}
</style>
</head>
<body>

<div class="headerWrapper">

<h1>회원가입</h1>
	<div class="contentBox1">
	<form action="regist.do" method="post">
		<table class="registT" style="margin: 0 auto;  height: 1000px;">
			<tr>
				<td colspan="2" class="attention">
					* 표시는 필수입력항목입니다.
				</td>
			</tr>
			<tr>
				<th>이메일*</th>
				<td id="email">
					<input type="text" name="email01" required="required" class="form-control" style="width: 300px; display: inline-block;">@
					<select name="emailCheck" class="custom-select" style="width:150px;">
						<option value="--" selected="selected">---선택하세요---</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.com">daum.com</option>
						<option value="nate.com">nate.com</option>
						<option value="">---직접입력---</option>
					</select>

					
					<input type="button" id="codeBtn" class="btn btn-outline-secondary" value="인증번호 요청" onclick="requestCode()">
					<input type="hidden" name="email">
					<p class='N' id='isS1'></p>
				</td>
				
			</tr>	
			<tr>
				<th>인증번호 확인*</th>
				<td>
					<div class="input-group mb-3">
						<input type="text" name="confirm" class="form-control">
						<div class="input-group-append">
							<input type="button" value="인증번호 확인" class="btn btn-outline-secondary" id="confirmBtn" onclick="confirmCode()">
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>비밀번호*</th>
				<td><input type="password" class="form-control" name="password1" required="required"></td>
			</tr>
			<tr>
				<th>비밀번호 확인*</th>
				<td>
					<input type="password" class="form-control" name="password2" required="required">
					<p class='N' id='isS2'></p>
				</td>
			</tr>
			<tr>
				<th>이름*</th>
				<td><input type="text"  class="form-control" name="name" required="required"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" class="form-control" name="nickname" placeholder="입력하지 않을시 자동으로 실명이 입력됩니다."></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" class="form-control" name="birth"></td>
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
				<td><input type="text" name="address_3" class="form-control" id="jibun_detail" value="" /></td>
			</tr>
	
			<tr>
				<td colspan='2' style="text-align: center; padding: 0px;">
					<input type="submit" class="btn btn-primary btn-lg" value="가입완료" style="width: 175px;">
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>

</body>
</html>
<%@include file="footer.jsp" %>