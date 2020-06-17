<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@include file="header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> -->
<script src="https://cdn.ckeditor.com/ckeditor5/12.0.0/classic/ckeditor.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e887771f798648cba38327947f996ee&libraries=services"></script>
<script type="text/javascript">
	var inputLoc = $("input[name='loc_name']").val();

	$(function() {
		var today = new Date();
		
		$(".pickdate").val(today.toISOString().substring(0, 10));
		
		
		
		$( "#deadline" ).datepicker({
			dateFormat: "yy-mm-dd",
			altField: "input[name='deadline']",
			changeMonth: "true",
			changeYear: "true",
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			minDate: today,
			defaultDate: today
	    });
		
		$( ".workdate" ).datepicker({
			showButtonPanel: "true",
			changeMonth: "true",
			changeYear: "true",
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dateFormat: "yy-mm-dd",
			currnetText: "오늘 날짜",
			minDate: today
	    });
		
		$("input[name='sdate']").change(function(){
			$("input[name='edate']").datepicker("option","minDate",$(this).val());
		});
		$("input[name='edate']").change(function(){
			$("input[name='sdate']").datepicker("option","maxDate",$(this).val());
		});
		
		
		setMap();
		
		var width = "500";
		var height = "600";
		
		var categories = ${cArray};
		//카테고리 셋팅
		

// 		console.log(categories);
		for(var i = 0; i < categories.length; i++){
			if(categories[i].category_name1 != " "){
				var bigC = $("<option value='"+categories[i].code1+"'>"+categories[i].category_name1+"</option>");
				$("select[name='bCategory']").append(bigC);
			}
		}
		
		
		$("select[name='bCategory']").change(function(){
			var selected = $("select[name='bCategory']").val();
			var selCate = $("<select name='category'></select>");
			
			for(var i = 0; i < categories.length; i++){
				if(categories[i].code1 == selected){
					var smallC = $("<option value='"+ categories[i].code2+"'>"+categories[i].category_name2+"</option>");
					selCate.append(smallC);
				}
			}
			
			$("select[name='category']").replaceWith(selCate);
		});
		
		//카테고리 셋팅 끝

		
		
		$("#getJuso").click(function(){
			new daum.Postcode({
				q: inputLoc,
				popupName: "주소찾기",
				width: width,
				height: height,
				oncomplete: function(data){
					
					var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수	
	                
// 	             	// 법정동명이 있을 경우 추가한다. (법정리는 제외)
// 	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
// 	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
// 	                    extraRoadAddr += data.bname;
// 	                }
// 	                // 건물명이 있고, 공동주택일 경우 추가한다.
// 	                if(data.buildingName !== '' && data.apartment === 'Y'){
// 	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
// 	                }
// 	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
// 	                if(extraRoadAddr !== ''){
// 	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
// 	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
// 	                document.getElementById('sample4_postcode').value = data.zonecode;
// 	                document.getElementById("sample4_roadAddress").value = roadAddr;
	                document.getElementById("jibun").value = data.jibunAddress;
					
// 	                if(roadAddr !== ''){
// 	                    document.getElementById("jibun_detail").value = extraRoadAddr;
// 	                } else {
// 	                    document.getElementById("jibun_detail").value = '';
// 	                }
				}
				
			}).open({
				left: (window.screen.width / 2) - (width / 2),
			    top: (window.screen.height / 2) - (height / 2)
			});
		});
		
		
		$("form").submit(function(){
			
			if(confirm("글을 등록하시겠습니까?")){

				
				$("input[name='stime']").val(
					"" +$("select[name='shour']").val() +$("select[name='smin']").val()
				);
				
				$("input[name='etime']").val(
					"" +$("select[name='ehour']").val() +$("select[name='emin']").val()
				);
				
				return true;
				
			}else{
				
				return false;
				
			}
			
		});
		
		
	});
	
	
	function getMyWantedList(){
		console.log("");
	}
	
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
 	
 	.ck-editor__editable {
 		min-height: 500px;

 	}
 	
 	.non-visible{
 		display: none;
 	}

</style>
<link href="resources/css/jquery-ui.css" rel="stylesheet" >


</head>
<body>
<div class="headerWrapper">
	<h1>구인글 등록</h1>
	<form action="writewanted.do" method="post" enctype="multipart/form-data">
		<div class="wantedWrite">
			<input type="radio" name="wanted" value="새 글 등록" checked/>새 글 등록&nbsp;&nbsp;
			<input type="radio" name="wanted" value="목록에서 복사" onclick="getMyWantedList()"/>목록에서 복사
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
					<th>카테고리</th>
					<td>
						<select name="bCategory">
							<option value="">--대분류--</option>
						</select>
						<select name="category">
							<option value="">--소분류--</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>긴급여부</th>
					<td><input type="radio" name="sosflag" id="sosY" value="Y"><label for="sosY">긴급</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="sosflag" id="sosN" value="N" checked="checked"><label for="sosN">일반</label></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" style="width: 600px;" name="title" required="required"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea id="content" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<th>제안금액</th>
					<td><input type="number" style="width: 200px;" name="salary" required="required">원</td>
				</tr>
				
				<tr>
					<th>위치</th>
					<td>
						현재 접속위치: ${location}<br>
						<input type="button" id="getJuso" value="새 주소 찾기">
						<input type="button" id="getMyJuso" value="회원정보 주소 불러오기">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>		
						주소 &nbsp;&nbsp;
						<input type="text" name="location" class="postcodify_address" id="jibun" readonly="readonly" value="${location}"/>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>		
						상세주소
						<input type="text" name="loc_detail" class="postcodify_details" id="jibun_detail" value="" />
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
					<td></td>
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
						<input type="text" id="deadline" class="pickdate" style="width: 300px;" required="required" >
						<input type="date" name="deadline" class="non-visible pickdate" >
					</td>	
				</tr>
				<tr>
					<th>일하는 날</th>
					<td>
						시작일 <input type="text" class="pickdate workdate" name="sdate" style="width: 300px;"><br/>
						시작시간 <select name="shour">
							<c:forEach begin="0" end="23" varStatus="i">
								<option value="${i.index < 10? '0':''}${i.index}">${i.index < 10? '0':''}${i.index}</option>
							</c:forEach>
						</select> 시
						<select name='smin'>
							<c:forEach begin="0" end="50" varStatus="i" step="10">
								<option value="${i.index < 10? '0':''}${i.index}">${i.index < 10? '0':''}${i.index}</option>
							</c:forEach>
						</select> 분
						<input type="hidden" name="stime">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						종료일 <input type="text" class="pickdate workdate" name="edate" style="width: 300px;"><br/>
						종료시간 
						<select name="ehour">
							<c:forEach begin="0" end="23" varStatus="i">
								<option value="${i.index < 10? '0':''}${i.index}">${i.index < 10? '0':''}${i.index}</option>
							</c:forEach>
						</select> 시
						<select name='emin'>
							<c:forEach begin="0" end="50" varStatus="i" step="10">
								<option value="${i.index < 10? '0':''}${i.index}">${i.index < 10? '0':''}${i.index}</option>
							</c:forEach>
						</select> 분
						<input type="hidden" name="etime">
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
						<input type="file" name="file" multiple="multiple" accept=".gif, .jpg, .png"><br>
						※ 첨부파일 용량은 개당 5MB 이하, 최대 5개 이하로 제한됩니다.
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

<script src="resources/js/ckeditor.js"></script>
<script type="text/javascript">

// 	var inputLocationD = $("input[name='detail']")[0].val();

	function setMap(){
		
		var location = "${location}";
		
// 		console.log(inputLoc);
		
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