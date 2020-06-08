<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.outUl{
		overflow: visible;
	}
	
	.bigC{
		list-style: none;
		margin: 10px 30px;
		padding: 5px;
		float: left;
	}
	
	.innerUl{
		display: none;
		position: relative;
		z-index: 10;
		list-style: none;
	}
	
	.clear{
		clear: both;
	}
	
	header{
		text-align: center;
	}
</style>
<script type="text/javascript" src="/onl/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

$(function(){
	$.ajax({
		url:"getcategory.do",
		dataType:"json",
		method:"get",
		success:function(cjson){
			makeCategory(cjson);
		},
		fail:function(){
			console.log("서버 통신 실패");
		}
	});
	
	$("body").on("mouseenter", ".bigC", function(e){
		$(this).find(".innerUl").stop().slideDown();
	});
	
	$("body").on("mouseleave", ".bigC", function(e){
		$(this).find(".innerUl").stop().slideUp();
	});
	
});





function makeCategory(cjson){
	
	var categories = $("<ul class='outUl'></ul>");
	for(var i = 0; i < cjson.length; i++){

		if(cjson[i].category_name1 != " "){

			var bigC = $("<li class='bigC'></li>");
			var innerUl = $("<ul class='innerUl'></ul>");
			
			var btag = $("<a href='/categry.do?code="+cjson[i].code1+"'>"+cjson[i].category_name1+"</a>");
			
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
					var innerLi = document.createElement("li");
					var stag = $("<a href='/category.do?code="+cjson[j].code2+"'>"+cjson[j].category_name2+"</a>");
					
					$(innerLi).append(stag);
					$(innerUl).append(innerLi);
					j++;
				}
			}
			
			bigC.append(innerUl);
			categories.append(bigC);
		}
		
	}
	
	$(".categoryfield").append(categories);
}


</script>
</head>
<body>
<header>
	<div class="loginbar">
	고객센터|회원가입|로그인
	</div>
	<div class="searchbox">
		<h2>ONL</h2><input type="text" placeholder="검색어를 입력하세요" name="searchval"><input type="button" name="searchbto" value="검색"><input type="button" value="알림"><input type="button" value="마이페이지"><input type="button" value="회원정보관리">
	</div>
	<div class="searchdetail">
		
	</div>
	<div class="categoryfield">

	</div>
	<div class="clear"></div>

</header>
이하 본문영역
</body>
</html>