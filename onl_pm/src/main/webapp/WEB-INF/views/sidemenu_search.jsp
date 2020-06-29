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
		padding-left: 7px;
	}
	
	.contentDetail{
 		border: solid lightgray 1px;

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
<script type="text/javascript">
	$(function(){
		var cjsonLoc = "/onl/resources/common/category.json";
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
	});

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
						var stag = $("<span><input type='checkbox' name='categories' class='sideCA smallS' value='"+cjson[j].code2+"' id='"+cjson[j].code2+"'> <label for='"+cjson[j].code2+"'>"+cjson[j].category_name2+"</label></span>");
						
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
	

</script>
</head>
<body>
	<div class="leftside">
		<div class="sidewrapper">
			<div class="contentDetail" style="margin-top:84px;">
				<ul class=".flex-sm-column sideUl">
					<li class="nav-item">선택된 필터
						<ul class="nav-item sideUl">
							<li class="nav-item">
								<div class="sideK" onclick="selectK()">검색키워드 <span class="cancelK">X</span></div>
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
					<li class="nav-item">시간대
						<ul class="nav-item sideUl">
							<li class="nav-item radioField">
								<input type="radio" name="timezone" value="00002400" id="t1" class="searchRadio"><label for="t1">전체</label><br>
								<input type="radio" name="timezone" value="00001200" id="t2" class="searchRadio"><label for="t2">오전</label><br>
								<input type="radio" name="timezone" value="12002400" id="t3" class="searchRadio"><label for="t3">오후</label><br>
							</li>
						</ul>
					</li>
					<li class="nav-item">위치
						<br><span class="sideDesc">※현재 접속위치를 기준으로 합니다.</span>
						<br>
						<c:choose>
							<c:when test="${location ne null}">
								${location}과
							</c:when>
							<c:otherwise>
								일시적인 오류로 인해 현재 위치를 불러올 수 없습니다.
							</c:otherwise>
						</c:choose>
						<ul class="nav-item sideUl">
							<li class="nav-item radioField">
								<input type="radio" name="location" value="00002400" id="l1" class="searchRadio"><label for="l1">전체</label><br>
								<input type="radio" name="location" value="00002400" id="l2" class="searchRadio"><label for="l2">시, 도까지 일치</label><br>
								<input type="radio" name="location" value="00002400" id="l3" class="searchRadio"><label for="l3">군, 구까지 일치</label><br>
								<input type="radio" name="location" value="00002400" id="l4" class="searchRadio"><label for="l4">읍, 면, 동, 리까지 일치</label><br>
								
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
				</ul>
			</div>
		</div>
	</div>
</body>
</html>