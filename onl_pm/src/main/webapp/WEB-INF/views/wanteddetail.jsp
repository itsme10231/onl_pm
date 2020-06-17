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
/* 		border: solid gray 1px; */
/* 		margin: 0 auto; */
/* 		padding: 20px; */
/* 		border-radius: 5px; */
		
		border: solid lightgray 1px;
/* 		width: 800px; */
		margin: 0 auto;
		padding: 20px;
		border-radius: 5px;
		background-color: white;
		
		margin-top: 50px;
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
		top: 115px;
	}
	
	.sos{
		width: 25px;
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
	
	.depth{
		overflow: auto;
		margin-left: 150px;
		margin-bottom: 10px;
		
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
	}
	
	.button input{
		width: 100px;
		height: 30px;
		margin-right: 10px;
	}
	
	.modal-content{
		min-width: 600px;
	
	}
	
	.disable{
		display: none;
	}
</style>
<script src="https://cdn.ckeditor.com/ckeditor5/12.0.0/classic/ckeditor.js"></script>
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
		});
	});
	
	
	var wanted_seq = "";
	
	function addApply(){
		wanted_seq = $("input[name='seq']").val();
		
		$.ajax({
			url: "apply.do",
			method: "post",
			data: {"wanted_seq":wanted_seq},
			dataType: "text",
			success: function(msg){
				$("#apply").toggleClass("disable");
				$("#cancelApply").toggleClass("disable");
				alert(msg);
			},
			fail: function(msg){
				alert(msg);
			}
			
		});
	}
	
	function cancelApply(){
		wanted_seq = $("input[name='seq']").val();
		
		$.ajax({
			url: "cancelapply.do",
			method: "post",
			data: {"wanted_seq":wanted_seq},
			dataType: "text",
			success: function(msg){
				$("#apply").toggleClass("disable");
				$("#cancelApply").toggleClass("disable");
				alert(msg);
			},
			fail: function(msg){
				alert(msg);
			}
			
		});
	}

</script>
</head>
<body>
<div class="headerWrapper">
	<div class="depth">
		<div class="depth1">홈</div><div>></div><div>${wlist[0].categoryDto.category_name1}</div><div>></div><div class="depth5">${wdto.categoryDto.category_name2}</div>
	</div>	
	<div class="wantedDetail">
		<input type="hidden" name="seq" value="${wlist[0].seq}">
		<h1>${wlist[0].title}</h1>
		<div class="detail">
			<div class="process1">
				<div class="wanted">지원  ></div><div class="process">진행  ></div><div class="complete">완료</div>
			</div>
			<img alt="찜하기아이콘" src="resources/icon/WhiteHeart.jpg" class="wish">
			<img alt="긴급" src="resources/icon/emergency.png" class="sos"><b class="sosText">긴급</b>
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
					<div>${wlist[0].apply_c}명</div>
				</div>
				<div class="button">
					<sec:authorize access="hasRole('ROLE_USER')">
						<input type="button" value="신고하기" data-toggle="modal" data-target="#reportModal" data-whatever="${nickname}">
						<input type="button" value="문의하기">
						<input type="button" value="프로필">

						<input type="button" id="apply" class="${wlist[0].apply eq 'Y'? '':'disable'}" value="지원취소" onclick="cancelApply()">

						<input type="button" id="cancelApply" class="${wlist[0].apply eq 'N'? '':'disable'}" value="지원하기" onclick="addApply()">

					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<input type="button" value="로그인이 필요한 기능입니다.">
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
					<img src="resources/uploadimg/${wdto.fileDto.stored_name}" style="max-width:100%; height: auto;">
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
						매칭시 공개
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
			<div id="map" style="width: 300px; height: 300px;"></div>
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
        <form id="reportForm" method="post" action="doreport.do">
        	<input type="hidden" name="reported_id" value="${wdto.id}">;
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">유형:</label>
            <select name="category_seq"></select>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">상세내용:</label>
            <textarea class="form-control" id="content" name="content"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <input type="submit" class="btn btn-primary" value="신고">
      </div>
    </div>
  </div>
</div>
</body>
<script src="resources/js/ckeditor.js"></script>
<script type="text/javascript">
$(function(){
	
});
</script>
</html>
<%@include file="footer.jsp" %>