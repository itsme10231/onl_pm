<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="header.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.infoT{
		margin: 0 auto;  
		min-height: 800px;
	}
	
	.infoT th{
		padding-right: 50px;
	}
	
	.infoT td{
		padding-left: 100px;
		min-width: 600px;
		max-width: 800px;
	}
	
	th{
		border-right: 1px solid lightgray;
	}
	
	.phoneInput {
		width: 100px;
		display: inline-block;
	}
	
	.N{
		color: red;
	}
	
	.Y{
		color: green;
	}
	
</style>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		var width = "500";
		var height = "600";
		
		
		$("#getJuso").click(function(){
			new daum.Postcode({
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
			if($("input[name='password']").val() != ""){
				
				if($("#isS2").attr("class")=="N"){
					$("#isS2").text("비밀번호를 확인해주세요.");
					return false;
					
				}else if($("input[name='old_password']").val == ""){
					$("#isS2").text("비밀번호 변경시 이전 비밀번호는 필수로 입력해야 합니다.");
					return false;
				}
				
			}else{
// 				var nickname = $("input[name='nickname']").val();
		//			var address_2 = $("input[name='address_2']").val();
		//			var address_3 = $("input[name='address_3']").val();
				
		//			$("input[name='address_3']").val(address_2.substring(address_2.indexOf("동")+2) +" " +address_3);
		//			$("input[name='address_2']").val(address_2.substring(0,address_2.indexOf("동")+1));
				
		//			console.log(address_2);
		//			console.log(address_3);
				
				$("input[name='phone']").val(
						$("input[name='phone1']").val()+"-"+
						$("input[name='phone2']").val()+"-"+
						$("input[name='phone3']").val()
				);
				
				return confirm("입력하신 정보로 회원정보를 수정하시겠습니까?");
			}
			
			
		});
		
		$(".pass").keyup(function(){
			if($("input[name=password]").val() != $("input[name=password2]").val()){
				$("#isS2").attr("class","N");
				$("#isS2").text("비밀번호를 확인해주세요.");
			}else{
				$("#isS2").attr("class","Y");
				$("#isS2").text("비밀번호가 일치합니다.");
			}
		});
	});
	
</script>
</head>
<body>
	<div class="headerWrapper">
		<%@include file="sidemenu_memberinfo.jsp" %>
		
		<div class="pageContent">
			<div class="depth">홈 > 회원정보 > 나의 정보</div>
			<div class="contentDetail">
				<div class="centerDiv">
					<h2 class="pageTitle wantedH">나의 정보</h2>
					<form action="updatememberinfo.do" method="post">
					
						<table class="infoT">
							<tr>
								<th>이름</th>
								<td><input type="text"  class="form-control" name="name" required="required" value="${ldto.name}"></td>
							</tr>
							<tr>
								<th>닉네임</th>
								<td><input type="text" class="form-control" name="nickname" required="required" value="${ldto.nickname}"></td>
							</tr>
							<tr>
								<th>현 비밀번호</th>
								<td>
									<input type="password" class="form-control" name="old_password" placeholder="새 비밀번호 입력시 필수로 입력">
								</td>
							</tr>
							<tr>
								<th>새 비밀번호</th>
								<td>
									<input type="password" class="form-control pass" name="password">
								</td>
							</tr>
							<tr>
								<th>새 비밀번호 확인</th>
								<td>
									<input type="password" class="form-control pass" name="password2">
									<p class='N' id='isS2'></p>
								</td>
							</tr>
							
							<tr>
								<th>생년월일</th>
								<td><input type="date" class="form-control" name="birth" value="${ldto.birth eq null? '1900-01-01':ldto.birth}" min="1900-01-01"></td>
							</tr>
							<tr>
								<th>휴대폰번호</th>
								<td>
									<input type="text" class="form-control phoneInput" name="phone1" required="required" value="${fn:substring(ldto.phone,0,3)}"> - 
									<input type="text" class="form-control phoneInput" name="phone2" required="required" value="${fn:substring(ldto.phone,4,8)}"> - 
									<input type="text" class="form-control phoneInput" name="phone3" required="required" value="${fn:substring(ldto.phone,9,13)}">
									<input type="hidden" name="phone">
								</td>
								
							</tr>
							<tr>
								<th>주소</th>
								<td>우편번호
									<div class="input-group mb-3" style="width:300px;">
										<input type="text" class="form-control" name="address_1" id="postcode" readonly="readonly" value="${ldto.address_1}">
										<div class="input-group-append">
											<input type="button" class="btn btn-outline-secondary" id="getJuso" value="주소 찾기">
										</div>
									</div>
									<input type="text" name="address_2" class="form-control" id="jibun" readonly="readonly" value="${ldto.address_2}"/>
								</td>
							</tr>
				
							<tr>
								<th>상세주소</th>	
								<td>
									<input type="text" name="address_3" class="form-control" id="jibun_detail" value="${ldto.address_3}" />
									
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
<%@include file="footer.jsp"%>