<%@include file="header.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.chargetable{

	}
	
	.chargetable td:first-child{
		background-color: whitesmoke;
	}
	
	input[name='payment']{
		margin-top: 6px;
	}
</style>

<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js" type="text/javascript"></script>
<script type="text/javascript">

	$(function(){
		
		//아임포트 js 초기화
		IMP.init('imp23293892');
		
	});
	
	
	//결제버튼을 눌렀을시 ONL서버에서 사용자 정보를 호출
	function getCharge(){
		
		var p_pg = $("input[name='charge_method']:checked").val();
		var p_pay_method = "";
		var p_amount = $("input[name='payment']:checked").val();
		
		if(p_pg == "html5_inicis"){
			p_pay_method = "card";
		}else if(p_pg == "kakaopay"){
			p_pay_method = "card";
		}else{
			p_pay_method = "trans";
		}
		
		$.ajax({
			url: "ajaxgetinfo.do",
			method: "post",
			dataType: "json",
			success: function(jObj){
				launchIamPort(p_pg, p_pay_method, p_amount, jObj);
			},
			fail: function(){
				alert("사용자 정보를 불러오는데 실패하였습니다.");
			}
		});
		
	}
	
	//아임포트 호출
	function launchIamPort(p_pg, p_pay_method, p_amount, jObj){		
		
		IMP.request_pay({
		    pg : p_pg, // version 1.1.0부터 지원.
		    pay_method : p_pay_method,
		    merchant_uid : jObj.id + "_"+ new Date().getTime(),
		    name : 'ONL 예치금: '+p_amount,
		    amount : p_amount,
		    buyer_email : '',
		    buyer_name : jObj.name,
		    buyer_tel : jObj.phone,
		    buyer_addr : jObj.address,
		    buyer_postcode : jObj.postcode,

		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        
		        var merchant_log = {
		        		pay_method: p_pay_method,
		        		merchant_uid: rsp.merchant_uid,
		        		paid_amount: p_amount,
		        		apply_num: rsp.apply_num
		        };
		        
		        $.ajax({
		        	url:"ajaxcharge.do",
		        	method: "post",
		        	data: merchant_log,
		        	dataType: "text",
		        	success: function(s){
		        		if(s == "SUCCESS"){
		        			alert("화면을 이동합니다.");
		        			location.href="prepaid.do";
		        		}else{
		        			alert("결제에 실패하였습니다. 관리자에게 문의해주세요");
		        		}
		        	},
		        	fail: function(s){
		        		alert("결제에 실패하였습니다. 관리자에게 문의해주세요");
		        	}
		        });
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
		
	}
	
	

</script>
</head>
<body>
	<div class="headerWrapper">
		<%@include file="sidemenu_mypage.jsp" %>
		
		<div class="pageContent">
			<div class="depth">홈 > 마이페이지 > 나의 지갑 > 예치금 충전</div>
			<div class="contentDetail">
				<div class="centerDiv">
					<form action="">
						<h2 class="pageTitle">예치금 충전</h2>
						<div style="text-align: center; margin-top: 50px; margin-bottom: 20px;">
							<img alt="wallet" src="resources/icon/wallet.png" style="width:200px;">
							<h4>예치금 미리 결제해두고<br> 구인글 등록할때 편하게 사용하세요!</h4>
						</div>
						<table class="table table-bordered chargetable" style="text-align: center;">
							<thead>
								<tr>
									<th>
										&nbsp;
									</th>
									<th colspan="2">
										충전금액
									</th>
									<th>
										결제금액
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<input type="radio" name="payment" value="1000">
									</td>
									<td style="width:300px;">
										1,000원
									</td>
									<td style="width:300px;">
										1,000원
									</td>
									<td>
										1,000원
									</td>
								</tr>
								<tr>
									<td>
										<input type="radio" name="payment" value="5000">
									</td>
									<td style="width:300px;">
										5,000원
									</td>
									<td style="width:300px;">
										5,000원
									</td>
									<td>
										5,000원
									</td>
								</tr>
								<tr>
									<td>
										<input type="radio" name="payment" value="10000" checked="checked">
									</td>
									<td style="width:300px;">
										10,100원
									</td>
									<td style="width:300px;">
										10,000원 +보너스 1%
									</td>
									<td>
										10,000원
									</td>
								</tr>
								<tr>
									<td>
										<input type="radio" name="payment" value="50000">
									</td>
									<td style="width:300px;">
										50,500원
									</td>
									<td style="width:300px;">
										50,000원 +보너스 1%
									</td>
									<td>
										50,000원
									</td>
								</tr>
								<tr>
									<td>
										<input type="radio" name="payment" value="100000">
									</td>
									<td style="width:300px;">
										102,000원
									</td>
									<td style="width:300px;">
										100,000원 +보너스 2%
									</td>
									<td>
										100,000원
									</td>
								</tr>
								<tr>
									<td>
										<input type="radio" name="payment" value="500000">
									</td>
									<td style="width:300px;">
										515,000원
									</td>
									<td style="width:300px;">
										500,000원 +보너스 3%
									</td>
									<td>
										500,000원
									</td>
								</tr>
								<tr>
									<td>
										<input type="radio" name="payment" value="1000000">
									</td>
									<td style="width:300px;">
										1,040,000원
									</td>
									<td style="width:300px;">
										1,000,000원 +보너스 4%
									</td>
									<td>
										1,000,000원
									</td>
								</tr>
							</tbody>
						</table>
						<div class="pagingDiv">
							<input type="radio" id="banking" name="charge_method" value="danal_tpay" checked="checked"> <label for="banking">계좌이체</label> &nbsp;&nbsp;
							<input type="radio" id="card"  name="charge_method" value="html5_inicis"> <label for="card">카드결제</label> &nbsp;&nbsp;
							<input type="radio" id="kakao" name="charge_method" value="kakaopay"> <label for="kakao">카카오페이</label>
							<br><br>
							<input type="button" class="btn btn-danger" style="width: 300px;" value="결제" onclick="getCharge()">
						</div>
					</form>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>
<%@include file="footer.jsp"%>