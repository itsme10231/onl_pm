<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.registT{
		margin: 0 auto;  
		min-height: 200px;
	}
	
	.registT th{
		background-color: whitesmoke;
		text-align: center;
		vertical-align: middle;
		width: 200px;
	}
	
	.registT td{
		padding-left: 100px;
		min-width: 600px;
		max-width: 800px;
		vertical-align: middle;
	}
	

	
	.attention{
		color: darkorange;
		font-weight: 300;
	}
</style>
<script type="text/javascript">
	
	$(function(){
		
		$("body").on("click","select[name='bank_code']", function(){
			getBankCode();
		});
		
		$("body").on("submit", "form", function(){
			if(confirm("입력하신 정보로 계좌등록을 진행합니다.")){
				insertAccount();
				return false;
			}else{
				return false;
			}
		});
	});
	
	function getBankCode(){
		var thisO = $("select[name='bank_code']");
		if(!thisO.hasClass("already")){
			$.ajax({
				url: "getbank.do",
				method: "get",
				dataType: "json",
				success: function(result){
					thisO.addClass("already");
					var sel = thisO;
					
					for(var i = 0; i < result.length; i++){
						var opt = $("<option value="+ result[i].bank_code+">" +"(" +result[i].bank_code +")" +result[i].bank_name +"</option>");
						sel.append(opt);
					}
					
				},
				fail: function(){
					alert("은행코드를 불러올수 없습니다.");
				}
				
			});
		}else{
			return;
		}
	}
	
	function insertAccount(){
		var code= $("select[name='bank_code']").val();
		var account_num = $("input[name='account_num']").val();
		var identity = $("input[name='identity']").val();
		
		$.ajax({
			url: "insertaccount.do",
			method:"post",
			data:{
				"code":code,
				"account_num":account_num,
				"identity":identity
			},
			dataType:"text",
			success: function(msg){
				if(msg == "success"){
					alert("계좌등록에 성공했습니다.");
					location.href="myaccount.do";
				}else if(msg == "fail_1"){
					alert("계좌등록에 실패했습니다.");
				}else{
					alert("사용할 수 없는 계좌입니다.");
				}
			},
			fail: function(){
				alert("에러가 발생했습니다.");
			}
			
		});
	}
</script>
</head>
<body>
<div class="headerWrapper">
	<%@include file="sidemenu_memberinfo.jsp" %>
	
	<div class="pageContent">
		<div class="depth">홈 > 회원정보 > 나의 등록계좌</div>
		<div class="contentDetail" style="min-height: 600px;">
			<div class="centerDiv">
				<h2 class="pageTitle wantedH">계좌정보</h2>

				<c:choose>
					<c:when test="${adto ne null}">
						
						현재 <sec:authentication property="nickname"/>님의 등록된 계좌는
						<br>
						<br>
						<table class="registT table table-bordered normalT">
							<tr>
								<th>은행명</th>
								<td>${adto.bank_name}</td>
							</tr>
							<tr>
								<th>예금주</th>
								<td>${fn:substring(adto.name, 0, fn:length(adto.name) - (fn:length(adto.name) -1))}
									<c:forEach begin="0" end="${fn:length(adto.name) -1}">
										*
									</c:forEach>
								</td>
							</tr>
							<tr>
								<th>계좌번호</th>
								<td>${fn:substring(adto.account_number,0, fn:length(adto.account_number) -3)}***</td>
							</tr>
						</table>
					
					</c:when>
					<c:otherwise>
						
						현재 등록된 계좌가 없습니다.
						<br>
						<br>
						<form action="">
						<table class="registT table table-bordered normalT">
							<tr>
								<th>은행명</th>
								<td><select name="bank_code"><option>--은행을 선택해주세요.--</option></select></td>
							</tr>
							<tr>
								<th>예금주</th>
								<td>
									<span class="attention">※회원정보에 등록된 실명과 같은 예금주의 계좌만 등록할 수 있습니다.</span>
								</td>
							</tr>
							<tr>
								<th>계좌번호</th>
								<td>
									<input type="text" name="account_num" style="width:400px;">
								</td>
							</tr>
							<tr>
								<td colspan="2" style="text-align:center; padding: 0px;"><input type="submit" class="btn btn-danger btn-lg" value="계좌 등록" style="margin-top:20px; margin-bottom:20px;"></td>
							</tr>
						</table>
						
						</form>
					
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%@include file="footer.jsp" %>