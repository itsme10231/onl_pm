<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<style type="text/css">
	.outUl{
		overflow: visible;
		display: inline-block;
	}
	
	.bigC{
		list-style: none;
		margin: 0;
		padding: 10px 30px;
		float: left;
		
		position: relative;
		z-index: 11;
	}
	
	.innerUl{
		display: none;
		position: absolute;
		z-index: 10;
		list-style: none;
		text-align: left;
		padding-left: 10px;
		background-color: white;

		width: 150px;
		margin-top: 10px;
		top: 50px;
		left: 1px;
	}
	
	.innerLi{
		
	}
	
	.categoryfield{
		margin: 0;
		border-bottom: 1px solid gray;
	}
	
	.clear{
		clear: both;
	}
	
	header{
		text-align: center;
	}
	
	body{
		font-family: source-han-sans-korean, sans-serif;
	}
</style>
<script type="text/javascript" src="/onl/resources/js/jquery-3.5.1.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
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
		$(this).find(".innerUl").stop().show();
	});
	
	$("body").on("mouseleave", ".bigC", function(e){
		$(this).find(".innerUl").stop().hide();
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
					var innerLi = $("<li class='innerLi'></li>");
					var stag = $("<a href='/category.do?code="+cjson[j].code2+"'>"+cjson[j].category_name2+"</a>");
					
					innerLi.append(stag);
					innerUl.append(innerLi);
					j++;
				}
			}
			
			bigC.append(innerUl);
			categories.append(bigC);
		}
		
	}
	
	$(".categoryfield").append(categories);
}

//Adobe font
(function(d) {
    var config = {
      kitId: 'fpr3sxh',
      scriptTimeout: 3000,
      async: true
    },
    h=d.documentElement,t=setTimeout(function(){h.className=h.className.replace(/\bwf-loading\b/g,"")+" wf-inactive";},config.scriptTimeout),tk=d.createElement("script"),f=false,s=d.getElementsByTagName("script")[0],a;h.className+=" wf-loading";tk.src='https://use.typekit.net/'+config.kitId+'.js';tk.async=true;tk.onload=tk.onreadystatechange=function(){a=this.readyState;if(f||a&&a!="complete"&&a!="loaded")return;f=true;clearTimeout(t);try{Typekit.load(config)}catch(e){}};s.parentNode.insertBefore(tk,s)
  })(document);
</script>
</head>
<body>
<header>
	<div class="loginbar">
	고객센터 | <a href='registform.do'>회원가입</a> | <a href='login.do'>로그인</a>
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