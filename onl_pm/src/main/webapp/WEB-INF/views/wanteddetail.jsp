<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<style type="text/css">

	


	.wantedDetail{
 		border: solid lightgray 1px; 
/* 		margin: 0 auto; */
/* 		padding: 20px; */

/* 		width: 800px; */
		margin: 0 auto;
		padding: 20px;
/* 		border-radius: 5px; */
		background-color: white;
		
		
		margin-bottom: 50px;
	}
	
	h1{
/*  		border: solid 1px;  */
		width: 800px;
 		margin: 0 auto;
		margin-bottom: 10px;
	}
	
	.wish{
/*  		border: solid 1px;   */
		width: 25px;
		height: 25px;
		position: absolute;
		right: 223px;
		top: 110px;
	}
	
	.state{
		background-color: crimson;
		color: white;
		border-radius: 5px;
		padding-left: 2px;
		padding-right: 2px;
	}
	
	.sos{
		width: 50px;
		height: 25px;
		position: absolute;
		right: 716px;
		top: 115px;
	}
	
	.sosText{
/*   		border: solid 1px;   */
  		position: absolute; 
 		top: 115px; 
 		left: 425px; 
	}
	
	.views{
/* 		border: solid 1px;  */
		width: 50px;
		height: 25px;
		position: absolute;
		top: 115px;
		right: 410px;
	}
	
	.views div{
/* 		border: solid 1px; */
		position: absolute;
 		top: -1px;
		left: 50px;
		height: 25px;
		width: 50px;
	}
	.profile{
/*  		border: solid 1px;  */
 		width: 150px;
 		height: 200px; 
		border-radius: 50%;
		margin-left: 5px;
	}
	
	.profileName{
/*  		border: solid 1px;  */
 		width: 150px;  
 		height: 20px;
		text-align: center;
 		position: relative; 
		top: -30px;
		
	}
	
	.profileImg{
		width: 150px;
		height: 200px;
 		border-radius: 50%; 
		float: left;
		margin-right: 20px;
	}
	
	.detail{
/*   		border: solid 1px;    */
		width: 800px;
		height: 280px;
		margin: 0 auto;
		
	}
	
	.content{
/*  		border: solid 1px;  */
		width: 800px;
		margin: 0 auto;
		padding: 10px;
	}
	
	.phone{
/* 		border: solid 1px;  */
		width: 800px;
		margin: 0 auto;
		padding: 10px;
	}
	
	.map{
/* 		border: solid 1px; */
		width: 800px;
		margin: 0 auto;
		padding: 10px;
	}
	
	#map{
		border: solid 1px;
	}
	.process1 div{
/*  		border: solid 1px; */
		margin-left: 10px;
		float: left; 
		text-align: center;	
	}
	
	.process1{
		margin-bottom: 10px;
		overflow: auto;
	}
	
	.regdate{
/*   		border: solid 1px;  */
		margin-left: 40px;
		margin-top: 10px;
		font-size: 9pt;
	}
	
	.deadline{
/*   		border: solid 1px;    */
		margin-top: 10px;
		margin-left: 50px;
		font-size: 9pt;
	}
	
	.sdate{
/*  		border: solid 1px;   */
		margin-left: 40px;
		margin-top: 10px;
		font-size: 9pt;
	}
	
	.edate{
/*    		border: solid 1px;     */
		margin-top: 10px;
		margin-left: 50px;
		font-size: 9pt;
	}
	.date{
/*    		border: solid 1px;   */
		margin-left: 20px;
		overflow: auto;
		height: 230px;
		
	}
	
	.date div{
		float: left;
 		padding: 5px; 
	
	}
	
	.dateIcon{
		width: 25px;
		height: 25px;
		float: left;
	}
	
	.depth div{
		float: left;
		margin-left: 5px;
	}
	

	
	.apply{
/*   		border: solid 1px;   */
		float: left;
		margin-left: 147px;
		margin-top: 10px;
	}
	
	.salary{
/*  		border: solid 1px;  */
		margin-left: 40px;
		margin-top: 10px;
	}
	
	.button{
		margin-left: 70px;
		margin-top: 10px;
		both: clean;
	}
	
	.button input{
		width: 100px;
		margin-right: 10px;
	}
	
	.modal-content{
		min-width: 600px;
	
	}
	
	.ck-editor__editable {
 		min-height: 200px;
 	}
	
	.disable{
		display: none;
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
<script src="https://cdn.ckeditor.com/ckeditor5/12.0.0/classic/ckeditor.js"></script>
<script type="text/javascript" src="resources/js/sockjs.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e887771f798648cba38327947f996ee&libraries=services"></script>

<script type="text/javascript">
	
	$(function(){
		$('#exampleModal').on('show.bs.modal', function (event) {
			  var button = $(event.relatedTarget) // Button that triggered the modal
			  var recipient = button.data('whatever') // Extract info from data-* attributes
			  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			  var modal = $(this)
			  modal.find('.modal-title').text('신고하기: ' + recipient)
			  modal.find('.modal-body input').val(recipient)
			  
// 			  editor.setData("<p>500자 이내로 신고내용을 적어주세요.<br/>자세하게 적어주실수록 신고내용을 처리하는데 도움이 됩니다.</p>");
		});
		
		setMap();
		
		$("#message").keypress(function(e) {
	        if (e.keyCode == 13){
	            messageSend();
	        }
	    });
	});
	
	var sock = new SockJS('echo');


	sock.onopen = function() {
		var sendMsg = {type:"enter", receive_id: "${wlist[0].id}"};
		sock.send(JSON.stringify(sendMsg));

	    $('#console').append('<p>1 대 1 문의하기 입니다.<br>사이트 이용규칙에 어긋나는 대화는 신고 및 제재대상이 될 수 있습니다.</p>');
	};
	
	sock.onmessage = function(message) {
		//나와의 대화 중이 아니면 표시하지 않음
		if(message.data.id == "${wlist[0].id}"){
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
	};
	
	sock.onclose = function(event) {
	    $('#console').append('<p>연결이 끊겼습니다.</p>');
	};
	
	sock.onerror = function(event) {
		$("#console").append('<p>에러 발생: 관리자에게 문의해 주세요.</p>');
	}
	
	function messageSend() {
// 		JSON.stringify();
		var thisDate = new Date();
		var dateString = thisDate.format('yyyy년 MM월 dd일 HH시 mm분');
		
		var myMsg = $('#message').val();
		var sendMsg = {type:"msg", receive_id: "${wlist[0].id}", msg:myMsg, wanted_seq: "${wlist[0].seq}", chatdate: dateString };
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
	
	
	var wanted_seq = "";
	
	function toggleApply(){
		var wanted_seq = $("input[name='seq']").val();
		
		
		var targetUrl = "apply.do";
		var textValue = "지원취소";
		
		if($("#applyBto").hasClass("already")){
			targetUrl = "cancelapply.do";
			textValue = "지원하기";
		}
		
		$.ajax({
			url: targetUrl,
			method: "post",
			data: {"wanted_seq":wanted_seq},
			dataType: "text",
			success: function(msg){
				$("#applyBto").toggleClass("already").val(textValue);
				alert(msg);
			},
			fail: function(msg){
				alert(msg);
			}
			
		});
	}
	
	
	function getReportC(){
		if($(this).hasClass("already")){
			return;
		}else{
			$.ajax({
				url: "getreportc.do",
				method: "post",
				dataType: "json",
				success: function(data){
					
					
					for(var i = 0; i < data.length; i++){
						var opt = $("<option value='"+data[i].category_seq+"'>"+data[i].category_seq +". " +data[i].c_content+"</option>");
						$("#reportC").append(opt);
					}
					
					$(this).toggleClass("already");
				},
				fail: function(){
					alert("error: 신고 카테고리 불러오기 실패");
				}
			});
		}
	}
	
	function toggleWish(){
		var wanted_seq = $("input[name='seq']").val();
		var targetUrl = "addwish.do";
		var heartImg = "resources/icon/heart_fill.png";
		var textMsg = "위시리스트에 추가되었습니다.";
		
		if($("#wishBto").hasClass("already")){
			targetUrl = "delwish.do";
			heartImg = "resources/icon/heart_outline.png";
			textMsg = "위시리스트에서 삭제되었습니다.";
		}
		
		$.ajax({
			url: targetUrl,
			method: "post",
			data: {"wanted_seq":wanted_seq},
			dataType: "text",
			success: function(msg){
				
				$("#wishBto").attr("src", heartImg).toggleClass("already");
				
				if(msg == "success"){
					alert(textMsg);

				}
			},
			fail: function(msg){
				alert(msg);
			}
			
		});
	}

	function doReport(){
		
		var ckeditorVal = $(".ck-editor__editable").val();
		
		if(ckeditorVal == null || ckeditorVal == ""){
			alert("신고내용은 한글자 이상 작성해야 합니다.");
		}else{
			
			var option = {
				url:"doreport.do",
				method: "post",
				data: {
					"category_seq" : $("select[name='category_seq']").val(),
					"reported_id" : $("input[name='reported_id']").val(),
					"content" : ckeditorVal
				},
				dataType: "text",
				success: function(result){
					if(result == "success"){
						alert("신고되었습니다. 관리자가 확인 후 처리할때까지 기다려주세요.");
						$("#closeR").trigger("click");
					}
				},
				fail: function(){
					alert("신고 작성 실패");
				}	
					
			};
			
		}
	}
	
	function getChatLog(){
		var thisO = $("#chatBto");
		if(!thisO.hasClass("already")){
			$.ajax({
				url: "getMessage.do",
				method: "post",
				data: {"target_id": "${wlist[0].id}", "wanted_seq": "${wlist[0].seq}"},
				dataType: "json",
				success: function(result){
					thisO.addClass("already");
// 					console.log(result);
					makeBalloons(result);
					toBottom();
				},
				fail: function(){
					alert("채팅로그를 불러올 수 없습니다.");
				}
				
			});
		}else{
			return;
		}
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
</head>
<body>
<div class="headerWrapper">
	<%@include file="sidemenu.jsp" %>
	<div class="pagecontent">
		<div class="depth">
			<div class="depth1">홈</div><div>></div><div>${wlist[0].categoryDto.category_name1}</div><div>></div><div class="depth5">${wlist[0].categoryDto.category_name2}</div>
		</div>	
		<div class="wantedDetail">
			<input type="hidden" name="seq" value="${wlist[0].seq}">
			<h1>${wlist[0].title}</h1>
			<div class="detail">
				<div class="process1">
					<div class="wanted ${wlist[0].state eq 'WANTED'? 'state':''}">지원  ></div><div class="process ${wlist[0].state eq 'PROCESS'? 'state':''}">진행  ></div><div class="complete ${wlist[0].state eq 'COMPLETE'? 'state':''}">완료</div>
				</div>
				<div class="wish">
					<img alt="찜하기" width="30px" src="resources/icon/${wlist[0].wishlist eq 'Y' ? 'heart_fill.png':'heart_outline.png'}" class="${wlist[0].wishlist eq 'Y' ? 'already':''}" id="wishBto" onclick="toggleWish()">
				</div>
				<div class="sos">
					<c:choose>
						<c:when test="${sosflag eq 'Y'}">
							<img alt="긴급" src="resources/icon/emergency.png" width="25px"><b>긴급</b>
						</c:when>
						<c:otherwise>
							<b>일반</b>
						</c:otherwise>
					</c:choose>
				</div>
				
				<div class=views>조회수
					<div>${wlist[0].views}</div>
				</div>
				<div class="profileImg">
					<img alt="프로필사진" src="resources/icon/Peaple2.jpg" class="profileImg">
				</div>
				<div class="date">
					<div class="regdate">
						<div>
							<img alt="등록일" src="resources/icon/write.png" class="dateIcon">
						</div>
						<div>등록일</div>
						<div id=regdate>
							<fmt:formatDate value="${wlist[0].regdate}" pattern="YYYY년 MM월 dd일  HH시 mm분"/>
						</div>
					</div>
					<div class="deadline">
						<div>
							<img alt="마감일" src="resources/icon/write.png" class="dateIcon">
						</div>
						<div>마감일</div>
						<div id=deadline>
							<fmt:formatDate value="${wlist[0].deadline}" pattern="YYYY년 MM월 dd일  HH시 mm분"/>
						</div>
					</div>
					<div class="sdate">
						<div>
							<img alt="시작일" src="resources/icon/Watch.png" class="dateIcon">
						</div>
						<div>시작일</div>
						<div>${fn:substring(wlist[0].sdate,0,4)}년 
							${fn:substring(wlist[0].sdate,4,6)}월
							${fn:substring(wlist[0].sdate,6,8)}일 
							${fn:substring(wlist[0].stime,0,2)}시
							${fn:substring(wlist[0].stime,2,4)}분
						</div>
					</div>
					<div class="edate">
						<div>
							<img alt="종료일" src="resources/icon/Watch.png" class="dateIcon">
						</div>
						<div>종료일</div>
						<div>${fn:substring(wlist[0].edate,0,4)}년 
							${fn:substring(wlist[0].edate,4,6)}월
							${fn:substring(wlist[0].edate,6,8)}일 
							${fn:substring(wlist[0].etime,0,2)}시
							${fn:substring(wlist[0].etime,2,4)}분
						</div>
					</div>
					<div class="salary">
						<div>제안금액</div>
						<div>${wlist[0].salary}</div>
						<div>원</div>
					</div>	
					<div class="apply">
						<div>지원자</div>
						<div id="applycount">${wlist[0].apply_c}명</div>
					</div>
					<div class="button">
						<sec:authorize access="hasRole('ROLE_USER')">
							<input type="button" class="btn btn-outline-danger" value="신고하기" data-toggle="modal" data-target="#reportModal" data-whatever="${nickname}" onclick="getReportC()">
							<input type="button" class="btn btn-outline-danger" value="문의하기" data-toggle="modal" data-target="#chatModal" id="chatBto" onclick="getChatLog()">
							<input type="button" class="btn btn-outline-danger" value="프로필">
	
							<input type="button" id="applyBto" class="btn btn-danger ${wlist[0].apply eq 'Y'? 'already':''}" value="${wlist[0].apply eq 'Y'? '지원취소':'지원하기'}" onclick="toggleApply()">
	
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<p><a href='login.do'>로그인 해주세요!</a></p>
						</sec:authorize>
					</div>
				</div>
				<div class="profileName">${wlist[0].nickname}</div>
			</div>
		</div>	
		<div class="wantedDetail">	
			<div class="content">
				<div><b>내용</b></div><br>
				<div>
					<c:forEach items="${wlist}" var="wdto">
						<c:if test="${!empty wdto.fileDto.stored_name}">
						<img src="resources/uploadimg/${wdto.fileDto.stored_name}" style="max-width:100%; height: auto;">
						</c:if>
					</c:forEach>
					<p>${wlist[0].content}</p>
				</div>
			</div>
		</div>
		<div class="wantedDetail">	
			<div class="phone">
				<div><b>연락처</b></div><br>
				<div id="phone">
					<c:choose>
						<c:when test="${fn:substring(wlist[0].phone,0,1)=='Y'}">
							<c:choose>
								<c:when test="${wlist[0].selected eq 'Y'}">
									${fn:substring(wlist[0].phone,1,length-1)=='Y'}
								</c:when>
								<c:otherwise>
									매칭시 공개
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							비공개
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>	
		<div class="wantedDetail">	
			<div class="map">
				<div><b>위치</b></div><br>
				<div>${wlist[0].location}&nbsp;${wlist[0].loc_detail}</div>
				<div><P>위치 설명(생략가능)</P></div>
				<div id="map" style="width: 780px; height: 300px;"></div>
			</div>
		</div>
	</div>
</div>

<!-- 모달 영역 -->
<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
        <form name="reportForm">
        	<input type="hidden" name="reported_id" value="${wlist[0].id}">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">유형:</label>
            <select name="category_seq" id="reportC"></select>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">상세내용:</label>
            <textarea class="form-control" id="content" name="content">이 구인글의 번호: ${wlist[0].seq}<br>500자 이내로 신고내용을 적어주세요.<br> 자세하게 적어주실수록 신고내용을 처리하는데 도움이 됩니다.</textarea>
          </div>
        </form>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="closeR" data-dismiss="modal">닫기</button>
        <input type="button" class="btn btn-danger" value="신고" onclick="doReport()">
      </div>
    </div>
  </div>
</div>

<!-- 채팅 모달영역 -->
<!-- Scrollable modal -->

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
<script src="resources/js/ckeditor.js"></script>
<script type="text/javascript">
function setMap(){
	
		var defaultLoc = "${wlist[0].location}";
	
			console.log(defaultLoc);
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};  
	
		//지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		
		//주소로 좌표를 검색합니다
		geocoder.addressSearch(defaultLoc, function(result, status) {
	
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
			
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker({
				    map: map,
				    position: coords
				});
		
				// 인포윈도우로 장소에 대한 설명을 표시합니다
				var infowindow = new kakao.maps.InfoWindow({
				    content: '<div style="width:150px;text-align:center;padding:6px 0;">'+result[0].address_name+'</div>'
				});
				infowindow.open(map, marker);
				
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
		
			}
			
		});
	}
</script>
</html>
<%@include file="footer.jsp" %>