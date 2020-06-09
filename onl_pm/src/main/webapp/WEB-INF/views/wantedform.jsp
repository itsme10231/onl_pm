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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e887771f798648cba38327947f996ee&libraries=services"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript">

$(function() {
	$("#postcodify_search_button").postcodifyPopUp(); 
});

   
</script>
<style type="text/css">
	.wantedWrite{
		border: solid gray 1px;
		width: 800px;
		margin: 0 auto;
		padding: 20px;
		border-radius: 5px;
	}
	
	.text1{
/* 		border: solid 1px; */
		width: 200px;
		margin-left: 250px;
 		padding: 20px; 
		color: red;
		margin-bottom: 0px;
	}
	
	.text2{
/* 		border: solid 1px; */
		width: 200px;
		margin-left: 250px;
 		padding: 20px; 
		color: blue;
		margin-bottom: 0px;
	}
	
	table{
		width: 750px;
		margin: 0 auto;
	}
	
	td{
		padding: 10px;
	}
	
	.final{
		padding: 10px;
		width: 100px;
		margin-left: 30px;
	}
	
	h1{
		margin-bottom: 50px;
	}
	
 	#map{ 
 		border: solid 1px; 
 		width: 500px; 
 		height: 300px; 
 	} 
</style>
</head>
<body>
<div class="headerWrapper">
	<h1>구인글 등록</h1>
	<form action="">
		<div class="wantedWrite">
			<input type="radio" name="wanted" value="새 글 등록"/>새 글 등록
			<input type="radio" name="wanted" value="목록에서 복사"/>목록에서 복사
			<select>
				<option value="선택" selected="selected">선택하세요</option>
				<option value="구인글1">구인글1</option>
				<option value="구인글2">구인글2</option>
				<option value="구인글3">구인글3</option>
			</select>
		</div>
			<p class="text1">필수 입력</p>
		<div class="wantedWrite">
			<table>
				<colgroup>
					<col width="200px">
					<col width="500px">
				</colgroup>
				<tr>
					<td>제목</td>
					<td><input type="text" style="width: 600px;"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><input type="text" style="width: 600px; height: 200px;"></td>
				</tr>
				<tr>
					<td>제안금액</td>
					<td><input type="text" style="width: 200px;"></td>
				</tr>
				<tr>
					<td>위치</td>
					<td>
						우편번호
						<input type="text" name="postcode" class="postcodify_postcode5" readonly="readonly" value="" />
						<button id="postcodify_search_button">검색</button>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>		
						도로명 &nbsp;&nbsp;
						<input type="text" name="address" class="postcodify_address" readonly="readonly" value="" />
					</td>
				</tr>
				<tr>
					<td></td>
					<td>		
						상세주소
						<input type="text" name="details" class="postcodify_details" value="" />
					</td>
				<tr>
					<td></td>
					<td>		
						참고항목
						<input type="text" name="extra_info" class="postcodify_extra_info" readonly="readonly" value="" />
					</td>
				</tr>
				<tr>
					<td></td>
					<td>		
						<input type="checkbox" >현재 주소를 프로필에 저장
						<div id="map" style="width: 500px; height: 400px;"></div>
					</td>
				</tr>
				<tr>
					<td>거리 설정</td>
					<td>
						<input type="radio" name="space">거리 무관 &nbsp;&nbsp;
						<input type="radio" name="space">30km 이내  &nbsp;&nbsp;
						<input type="checkbox">입력하신 거리설정으로 검색된 관련 거래를 알림 받습니다.
					</td>
				</tr>
				<tr>
					<td></td>
					<td>		
					</td>
				</tr>
			</table>
		</div>
		<p class="text2">선택 입력</p>
		<div class="wantedWrite">
			<table>
				<colgroup>
					<col width="200px">
					<col width="500px">
				</colgroup>
				<tr>
					<td>연락처</td>
					<td>
						<input type="radio" name="phone">공개 &nbsp;&nbsp; &nbsp;&nbsp;
						<input type="radio" name="phone">매칭시 공개
					</td>
				</tr>
				<tr>
					<td>지원마감날짜</td>
					<td>
						<input type="date" style="width: 300px;">
					</td>	
				</tr>
				<tr>
					<td>사진첨부</td>
					<td>
						<button>첨부파일</button><br>※ 첨부파일 용량은 개당 5MB 이하, 최대 5개 이하로 제한됩니다.
					</td>	
				</tr>
				<tr>
					<td></td>
					<td> 
						<input type="submit" class="final" value="등록"> 
						<input type="button" class="final" value="취소">
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
</body>
<script type="text/javascript">
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
	geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
	
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
	        content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	    });
	    infowindow.open(map, marker);
	
	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	} 
	}); 
</script>
</html>
<%@include file="footer.jsp" %>