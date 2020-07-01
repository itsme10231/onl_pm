<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.nav_item{

	}
	
	.sideUl{
		list-style: none;
		padding: 5px;
/* 		border: 1px solid red; */
		font-weight: 500;
		font-size: 18px;
	}
	
	.sideUl>li{
		padding-top: 5px;
		padding-bottom: 5px;
		padding-left: 3px;
	}
	
	.contentDetail{
 		border: solid lightgray 1px;
		min-height: 800px;
		
		margin: 0 auto;
		padding: 20px;

		background-color: white;
		
		margin-bottom: 50px;
		
		-webkit-box-shadow:  0px 1px 1px 0px rgba(0,0,0,0.1);
		-moz-box-shadow:  0px 1px 1px 0px rgba(0,0,0,0.1);
		box-shadow:  0px 1px 1px 0px rgba(0,0,0,0.1);
	}
	
	.sideTitle{
		
		border-bottom: 1px solid lightgray;
		width: 100%;
		margin-bottom: 30px;
	}
	
	.sideC{
		font-size: 15px;

	}
	
	.sideC ul{
		font-weight: 400;
		list-style: none;
		padding:  2px 0px 0px 15px ;
		display: none;
	}
	
	.sideC ul li{
		padding: 3px;

	}
	
	.sideK{
		padding: 5px 10px 5px 10px;
		font-size: 15px;
		border: 1px solid lightgray;
		display: inline-block;
		font-weight: 400;
		color: dimgray;
		border-radius: 15px;
	}
	

	.sideDesc{
		font-size: 11px;
		color: orange;
	}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	var oParams = {};
	$(function(){
		var cjsonLoc = "/onl/resources/common/category.json";
		
		var width = "500";
		var height = "600";
		
		
		
		$.getJSON(cjsonLoc, function(data){	
			makeCategoryS(data);
		});
		

		
		$("body").on("mouseenter", ".sideBC", function(e){
			$(this).find(".op").text("-");
			$(this).find("ul").stop().show();
		});
		
		$("body").on("mouseleave", ".sideBC", function(e){
			$(this).find(".op").text("+");
			$(this).find("ul").stop().hide();
		});
		
		$("body").on("click", ".allchk", function(e){
			
			if($(this).is(":checked")){
				console.log("");
				$(this).parents(".sideBC").find("ul").find("input[type='checkbox']").prop("checked",true);
			}else{
				$(this).parents(".sideBC").find("ul").find("input[type='checkbox']").prop("checked",false);
			}

		});
		
		
		$("#searchNewLoc").click(function(){
			
			
			
			new daum.Postcode({
				popupName: "주소찾기",
				width: width,
				height: height,
				oncomplete: function(data){
					
					var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수	
	                var newLoc = data.jibunAddress;
	                
	                
	                
	               	$("textarea[name='location']").val(newLoc);
					

				}
				
			}).open({
				left: (window.screen.width / 2) - (width / 2),
			    top: (window.screen.height / 2) - (height / 2)
			});
			
			
		});
		
		oParams = getUrlParams();
		setFilters(oParams);
		
		
	});
	
	function getUrlParams() {
	    var params = {};
	    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
	    return params;
	}
	
	//필터에 쿼리값 셋팅
	function setFilters(oParams){
		console.log(oParams);
		
		if(oParams.title != null){
			$("input[name='title']").val(decodeURI(oParams.title));
		}
		if(oParams.score != null){
			$("input[name='score']").val(oParams.score);
		}
		if(oParams.category != null){
			console.log();
			for(var i = 0; i < oParams.category.length; i++){
				$("input[name='category']").each(function() {
					console.log($(this).val());
				    if($(this).val() == oParams.category[i]){ //값 비교
				    	
				    	$(this).prop("checked", true); //checked 처리
				    }
				});
			}
		}
		if(oParams.salary != null){
			$("input[name='salary']").val(oParams.salary);
		}
		if(oParams.timezone != null){
			$("#"+oParams.timezone).attr("checked", true);
		}
		if(oParams.time != null){
			$("input[name='time']").val(oParams.time);
		}
		if(oParams.locrange != null){
			$("#"+oParams.locrange).attr("checked", true);
		}
		if(oParams.location != null){
			$("textarea[name='location']").val(decodeURI(oParams.location).replace(/\+/g," "));
		}
	}

	function makeCategoryS(cjson){
		
		var categories = $(".sideC");
		for(var i = 0; i < cjson.length; i++){

			if(cjson[i].category_name1 != " "){

				var bigC = $("<li class='sideBC'></li>");
				var innerUl = $("<ul></ul>");
				
				var btag = $("<span><input type='checkbox' class='sideCA allchk' id='"+cjson[i].code1+"'> <label for='"+cjson[i].code1+"'>"+cjson[i].category_name1+"<span class='op'>+</span></label></span>");
				
				bigC.append(btag);
				
				var code = cjson[i].code1;	
				var j = i;
				var runStatus = true;
				
				
				while(runStatus){
					
					if(j == cjson.length){
						runStatus = false;
					}else if(cjson[j].code1 != code){
						runStatus = false;
					}else{
						var innerLi = $("<li></li>");
						var stag = $("<span><input type='checkbox' name='category' class='sideCA smallS' value='"+cjson[j].code2+"' id='"+cjson[j].code2+"'> <label for='"+cjson[j].code2+"'>"+cjson[j].category_name2+"</label></span>");
						
						innerLi.append(stag);
						innerUl.append(innerLi);
						j++;
					}
				}
				
				bigC.append(innerUl);
				categories.append(bigC);
			}
			
		}
		

	}
	
	function selectK(){
		var keyDiv = $(this);
	}
	
	function searchDetailS(){
		$("form[name='detailsearch']").submit();
	}
	

</script>
</head>
<body>
	<div class="leftside">
		<div class="sidewrapper">
			<div class="contentDetail" style="margin-top:84px;">
				<form action="search.do" method="get" name="detailsearch">
				<ul class=".flex-sm-column sideUl">
					<li class="nav-item">검색어
						<ul class="nav-item sideUl">
							<li class="nav-item">
								<input type="text" name="title" style="width:160px;">
							</li>
						</ul>
					</li>
					<li class="nav-item">
						카테고리
						<ul class="nav-item sideUl sideC">
							
						</ul>
					</li>
					<li class="nav-item">급여
						<ul class="nav-item sideUl">
							<li class="nav-item" style="text-align: right;">
								<input type="text" name="salary" style="width:160px;"><br>
								원 이상만
							</li>
						</ul>
					</li>
					<li class="nav-item">시간
						<ul class="nav-item sideUl">
							<li class="nav-item" style="text-align: right;">
								<input type="text" name="time" style="width:160px;"><br>
								시간 이내
							</li>
						</ul>
					</li>
					<li class="nav-item">시간대
						<ul class="nav-item sideUl">
							<li class="nav-item radioField">
								<input type="radio" name="timezone" value="00002400" id="00002400" class="searchRadio"><label for="00002400">전체</label><br>
								<input type="radio" name="timezone" value="00001200" id="00001200" class="searchRadio"><label for="00001200">오전</label><br>
								<input type="radio" name="timezone" value="12002400" id="12002400" class="searchRadio"><label for="12002400">오후</label><br>
							</li>
						</ul>
					</li>
					<li class="nav-item">위치
						<input type="button" class="btn btn-outline-danger" id="searchNewLoc" value="새 위치 지정" style="height:24px; line-height: 12px; font-size: 12px; float: right;">
						<br>
						<textarea readonly="readonly" name="location" style="border:0px; resize: none; width: 180px; word-break:keep-all; font-size: 16px;"><c:if test="${location ne null}">${location}</c:if></textarea>
						<span style="color: orange; font-size: 10px;">※현 위치정보는 부정확할 수 있습니다.</span>
						<ul class="nav-item sideUl">
							<li class="nav-item radioField">
								<input type="radio" name="locrange" value="l1" id="l1" class="searchRadio"><label for="l1">전체</label><br>
								<input type="radio" name="locrange" value="l2" id="l2" class="searchRadio"><label for="l2">시, 도까지 일치</label><br>
								<input type="radio" name="locrange" value="l3" id="l3" class="searchRadio"><label for="l3">군, 구까지 일치</label><br>
								<input type="radio" name="locrange" value="l4" id="l4" class="searchRadio"><label for="l4">읍, 면, 동, 리까지 일치</label><br>
								
							</li>
						</ul>
						
					</li>
					<li class="nav-item">회원평가
						<ul class="nav-item sideUl">
							<li class="nav-item">
								<input type="text" name="score" style="width:50px; font-size:30px;">
								점 이상만
							</li>
						</ul>
					</li>
					<li class="nav-item">
						<input type="button" class="btn btn-danger" value="검색" style="margin-bottom: 5px; width:100%;" onclick="searchDetailS()"><br>
						<input type="button" class="btn btn-outline-secondary" value="검색조건 초기화" style="width:100%;">
					</li>
				</ul>
				</form>
			</div>
		</div>
	</div>
</body>
</html>