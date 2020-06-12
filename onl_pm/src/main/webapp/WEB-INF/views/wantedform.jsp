<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@include file="header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e887771f798648cba38327947f996ee&libraries=services"></script>
<script type="text/javascript">
	$(function() {
		$("#postcodify_search_button").postcodifyPopUp(); 
	
		setMap();
		
	});
	
	
</script>
<style type="text/css">
	.wantedWrite{
		border: solid lightgray 1px;
/* 		width: 800px; */
		margin: 0 auto;
		padding: 20px;
		border-radius: 5px;
		background-color: white;
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
	<form action="writewanted.do" method="post" enctype="multipart/form-data">
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
			<p class="text1"></p>
		<div class="wantedWrite">
			<table>
				<colgroup>
					<col width="200px">
					<col width="500px">
				</colgroup>
				<tr>
					<th>제목</th>
					<td><input type="text" style="width: 600px;" name="title" required="required"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><input type="text" style="width: 600px; height: 200px;" name="content" required="required"></td>
				</tr>
				<tr>
					<th>제안금액</th>
					<td><input type="number" style="width: 200px;" name="salary" required="required">원</td>
				</tr>
				<tr>
					<th>위치</th>
					<td>
						현재 나의 위치: ${location}
						<button type="button" id="postcodify_search_button">새 주소 검색</button>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>		
						도로명 &nbsp;&nbsp;
						<input type="text" name="address" class="postcodify_address" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>		
						상세주소
						<input type="text" name="LOC_DETAIL" class="postcodify_details" value="" />
					</td>
				<tr>
					<td></td>
					<td>		

						<input type="button" value="위치 새로고침" onclick="setMap()">
						<div id="map" style="width: 500px; height: 400px;"></div>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>		
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="radio" name="telpub" value="N">비공개 &nbsp;&nbsp; &nbsp;&nbsp;
						<input type="radio" name="telpub" value="Y">매칭시 공개
					</td>
				</tr>
				<tr>
					<th>지원마감날짜</th>
					<td>
						<input type="date" style="width: 300px;">
					</td>	
				</tr>
				<tr>
					<th>일하는 날</th>
					<td>
						시작일 <input type="date" name="sdate" style="width: 300px;"><br/>
						시작시간 <select name="shour"></select> <select name='smin'></select>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						종료일 <input type="date" name="edate" style="width: 300px;"><br/>
						종료시간 <select name="ehour"></select> <select name='emin'></select>
					</td>
				</tr>
			</table>
		</div>
		<p></p>
		<div class="wantedWrite">
			<table>
				<colgroup>
					<col width="200px">
					<col width="500px">
				</colgroup>
				<tr>
					<td>사진첨부</td>
					<td>
						<input type="file" name="file" multiple="multiple"><br>※ 첨부파일 용량은 개당 5MB 이하, 최대 5개 이하로 제한됩니다.
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

// 	var inputLocationD = $("input[name='detail']")[0].val();

	function setMap(){
		
		var location = "${location}";
		var inputLoc = $("input[name='address']").val();
		console.log(inputLoc);
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};  
	
		//지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		if(inputLoc != null && inputLoc != ""){	
			location = inputLoc;
		}
		
		console.log(location);
		
		//주소로 좌표를 검색합니다
		geocoder.addressSearch(location, function(result, status) {
	
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