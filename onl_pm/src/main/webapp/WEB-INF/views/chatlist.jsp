<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.ctable th{
		text-align: center;
	}
	
	.ctable tr td:first-child{
		text-align: center;
	}
	
	.ctable tr td:nth-child(2):hover{
		text-decoration: underline;
		cursor: pointer;
		font-weight: 700;

	}
	
	.ctable tr td:nth-child(3){
		text-align: center;
	}
	.ctable tr td:nth-child(4){
		text-align: center;
	}
	
	.chatModal{
		min-height: 500px;
		max-height: 500px;
	}
	
	.dialog-balloon{
		
	}
	
	.dateBalloon{
		font-size: 5px;
		text-align: right;
		padding-right: 10px;
	}
	
	.dialog-target{
		width: 300px;
		margin-top: 20px;
		background-color: lightgray;
		border-radius: 5px;
		padding: 10px;
		float:left;
	}
	
	.dialog-mine{
		width: 300px;
		margin-top: 20px;
		background-color: crimson;
		color: white;
		border-radius: 5px;
		padding: 10px;
		float: right;
	}

</style>

<script type="text/javascript" src="resources/js/sockjs.js"></script>
<script type="text/javascript">

	var sock = new SockJS('echo');
	var thisTarget = "";
	var thisSeq = "";
	
	$(function(){
		
		$('#chatModal').on('show.bs.modal', function (event) {
			  var button = $(event.relatedTarget) // Button that triggered the modal
			  var recipient = button.data('whatever') // Extract info from data-* attributes
			  var target_id = button.data('target_id');
			  var seq = button.data('seq');
			  
			  thisTarget = target_id;
			  thisSeq = seq;
			  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			  var modal = $(this)
			  modal.find('.modal-title').text(recipient +" 님과의 대화")
			  modal.find('.modal-body input').val(recipient)
			  
			  getChatLog(target_id, seq);
			  
			  var sendMsg = {type:"enter", receive_id: target_id};
			  sock.send(JSON.stringify(sendMsg));

	    	  $('#console').append('<p>1 대 1 문의하기 입니다.<br>사이트 이용규칙에 어긋나는 대화는 신고 및 제재대상이 될 수 있습니다.</p>');
//			  editor.setData("<p>500자 이내로 신고내용을 적어주세요.<br/>자세하게 적어주실수록 신고내용을 처리하는데 도움이 됩니다.</p>");
		});
		
		$('#chatModal').on('hidden.bs.modal', function (event) {
			
			var sendMsg = {type:"leave", receive_id: thisTarget};
			sock.send(JSON.stringify(sendMsg));
			
			thisTarget = "";
			thisSeq = "";
			
		});
		
		$("#message").keypress(function(e) {
	        if (e.keyCode == 13){
	            messageSend();
	        }
	    });
		
	});
	
	
	
	sock.onopen = function() {
		console.log("sockjs 로딩 완료");
	};
	
	sock.onmessage = function(message) {
		//나와의 대화 중이 아니면 표시하지 않음
		if(message.data.id == thisTarget){
			var outBalloon = $("<div class='dialog-balloon'></div>");
			var balloon = $("<div class='dialog-target'></div>");
			var dateBalloon = $("<div class='dateBalloon'></div>");
			
		    dateBalloon.append(jsons[i].chatdate);

		    balloon.append(message.data);
		    balloon.append(dateBalloon);
		    
		    outBalloon,append(balloon);
		    $('#console').append(outBalloon);
		    toBottom();
		}else{
			console.log("메시지는 도착했으나 현재 사용자와의 메시지가 아님");
		}
	}
	
	sock.onclose = function(event) {
	    $('#console').append('<p>연결이 끊겼습니다.</p>');
	    targetId = "";
	    thisSeq = "";
	}
	
	sock.onerror = function(event) {
		$("#console").append('<p>에러 발생: 관리자에게 문의해 주세요.</p>');
	}
	
	function messageSend() {
// 		JSON.stringify();
		var thisDate = new Date();
		var dateString = thisDate.format('yyyy년 MM월 dd일 HH시 mm분');
		
		var myMsg = $('#message').val();
		var sendMsg = {type:"msg", receive_id: thisTarget, msg:myMsg, wanted_seq: thisSeq+"", chatdate: dateString };
	    sock.send(JSON.stringify(sendMsg));
	    
	    var outBalloon = $("<div class='dialog-balloon'></div>");
	    var balloon = $("<div class='dialog-balloon dialog-mine'></div>");
	    var dateBalloon = $("<div class='dateBalloon'></div>");
	    
	    dateBalloon.append(dateString);

	    balloon.append(myMsg);
	    balloon.append(dateBalloon);
	    
	    outBalloon.append(balloon);
	    
	    $("#console").append(outBalloon);
	    $("#message").val("");
	}
	
	function getChatLog(target_id, seq){
			$("#console").text("");
			$.ajax({
				url: "getMessage.do",
				method: "post",
				data: {"target_id": target_id, "wanted_seq": seq},
				dataType: "json",
				success: function(result){

// 					console.log(result);
					makeBalloons(result);
					toBottom();
				},
				fail: function(){
					alert("채팅로그를 불러올 수 없습니다.");
				}
				
			});

	}
	
	function makeBalloons(jsons){
		var dialogDiv = $("#console");
		
		for(var i = 0; i < jsons.length; i++){
			
			var outBalloon = $("<div class='dialog-balloon'></div>");
			var balloon = $('<div></div>');
			var dateBalloon = $("<div class='dateBalloon'></div>");
			
			if(jsons[i].send_id == "${wlist[0].id}"){
				balloon.addClass("dialog-target");
			}else{
				balloon.addClass("dialog-mine");
			}
			console.log(jsons[i].chatdate);
			dateBalloon.append(jsons[i].chatdate);
			
			balloon.append(jsons[i].content);
			balloon.append(dateBalloon);
			
			outBalloon.append(balloon);
			
			dialogDiv.append(outBalloon);
		}
	}
	
	function toBottom(){
		$("#console").scrollTop($("#console")[0].scrollHeight);
	}
</script>
<title>Insert title here</title>
</head>
<body>
<div class="headerWrapper">
	<%@include file="sidemenu_mypage.jsp" %>
	
	<div class="pageContent">
		<div class="depth">홈 > 마이페이지 > 1대1 문의내역 

		</div>
		<div class="contentDetail">
			<div class="centerDiv">
				<h2 class="pageTitle wantedH">1대1 문의내역
				</h2>
				메시지 내용을 클릭하면 대화창이 열립니다.
				<table class="table table-striped table-bordered ctable">
					<thead>
						<tr>
							<th scope="col" style="width:150px;">닉네임</th>
							<th scope="col" style="width:300px;">마지막 메시지</th>
							<th scope="col" style="width:100px;">마지막 수신시간</th>
							<th scope="col" style="width:200px;">구인글 바로가기</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty clist}">
								<tr>
									<td colspan="4">문의내역이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${clist}" var="cdto">
								<tr>
									<td>${cdto.nickname}</td>
									<td data-toggle="modal" data-target="#chatModal" data-whatever="${cdto.nickname}" data-target_id="${cdto.target}" data-seq="${cdto.wanted_seq}">${cdto.content}</td>
									<td><fmt:formatDate value="${cdto.chatdate}" pattern="YYYY-MM-dd HH시 mm분"/></td>
									<td><a href='wanted.do?seq=${cdto.wanted_seq}'>${cdto.title}</a></td>
								</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				
				
			</div>
		</div>
		<div class="pagingDiv">
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			  	
			  	<li class="page-item"><a class="page-link" href="mywanted.do?pnum=1">&Lt;</a></li>
			    <li class="page-item"><a class="page-link" href="mywanted.do?pnum=${prePageNum}">&lt;</a></li>
			    
				<c:forEach varStatus="i" begin="${startPage}" end="${endPage}">
			  		<li class="page-item ${i.index eq pnum? 'active':''}"><a class="page-link" href="mywanted.do?pnum=${i.index}" >${i.index}</a></li>
			  	</c:forEach>
			  	
			    <li class="page-item"><a class="page-link" href="mywanted.do?pnum=${nextPageNum}">&gt;</a></li>
			    <li class="page-item"><a class="page-link" href="mywanted.do?pnum=${allP}">&Gt;</a></li>
			  </ul>
			</nav>
		</div>
	</div>
</div>

<div class="modal fade" id="chatModal">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">1대1 문의하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body chatModal" id="console">
      

      </div>
      <div>
      	<div class="input-group mb-3" style="width:80%; margin: 0 auto;">
	      	<input type="text" class="form-control" id="message">
	      	<div class="input-group-append">
	      		<button type="button" class="btn btn-outline-danger" id="message" onclick="messageSend()">전송</button>
	      	</div>
      	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
	</div>
</div>
</body>
</html>
<%@include file="footer.jsp"%>