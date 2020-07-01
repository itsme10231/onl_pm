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
	.headerWrapper{
		min-width: 1200px;
		max-width: 70%;
		
		margin: 0 auto;
		position: relative;
	}
	
	.contentBox1{
		border: solid lightgray 1px;
		margin: 0 auto;
		padding: 20px;
		border-radius: 5px;
		background-color: white;
	}
	
	.outUl{
		overflow: visible;
		display: inline-block;
		height: 60px;
		line-height: 50px;
		padding: 0;
		margin: 0;
	}
	
	.bigC{
		list-style: none;
		margin: 0;
		padding: 5px 20px;
		float: left;
		box-sizing: border-box;
		position: relative;
		z-index: 11;
	}
	
	.innerUl{
		display: none;
		position: absolute;
		z-index: 10;
		list-style: none;
		text-align: left;
		padding-left: 20px;
		padding-bottom: 10px;
		background-color: white;
		border: 1px solid lightgray;
		border-top: 0px;

		width: 150px;
		margin-top: 0px;
		top: 60px;
		left: 0px;
	}
	
	.innerLi{
		
	}
	
	.categoryfield{
		margin: 0;
		padding: 0;
		border: 1px solid lightgray;
		
	}
	
	.categoryfield a:link{
		text-decoration: none;
		color: black;
		font-size: 18px;
		font-weight: 500;
	}
	

	
	.memberfield{
		float: right;
		border: 1px solid red;
		margin-top: 10px;
	}
	
	.loginbar{
		text-align: right;
		border: 1px solid lightgray;
		height: 50px;
	}
	

	

	
	.clear{
		clear: both;
	}
	
	.remotediv{
		position: fixed; 
		right: 10%; 
		bottom: 50px; 
		width: 60px; 
		height: 80px;
		font-size: 12px;
		text-align: center;
		z-index: 1000;
	}
	
	.writebtodiv{
		width: 60px; 
		height: 60px;
		border-radius: 30px;
		background-color: white;
		border: 1px solid whitesmoke;
		-webkit-box-shadow: 0px 3px 3px 0px rgba(0,0,0,0.15);
		-moz-box-shadow: 0px 3px 3px 0px rgba(0,0,0,0.15);
		box-shadow: 0px 3px 3px 0px rgba(0,0,0,0.15);
	}
	
	.writebto{
		position: relative;
		top: 10px;

	}
	
	.searchbox{
		position: relative;
/* 		display: inline-block; */
		height: 100px;
/* 		top: 40px; */
	}
	
	.searchbox div{
		border: solid 1px red;
	}
	
	.headerlogo{
		width: 100px;
		display: inline-block;
		
	}
	
	.searchElement{


	}
	
	.searchbto{
		height: 50px;
		
		
		width: 100px;

	}
	
	.searchfield{

		width: 500px;

	}
	
	.searchdetail{
		clear: both;
	
	}
	
	.searchdetail>.downarrow{
		font-size: 14px;
		margin: 0;
		padding: 0;
	}
	
	
	
	
	.leftside{
		float: left;
		width: 250px;
		margin: 0;
		padding-right: 20px;
	}
	
	.pageTitle{
		margin-top: 30px;
	}
	
	.pagecontent{
		float: left;
		min-width: 1000px;
		min-height: 500px;
		margin:0;
	}
	
	.depth{
		overflow: auto;
		margin-left: 50px;
		margin-bottom: 10px;
		margin-top: 50px;
	}
	
	.centerDiv{
		width: 90%;
		margin: 0 auto;
	}
	
	.pagingDiv{
		margin-top: 50px;
		margin-bottom: 50px;
		text-align: center;
	}
	
	.radioField{
		font-size: 14px;
		font-weight: 400;
	}
	
	h1{
		margin-left: 80px;
		margin-top: 30px;
	}
	
	header{
		text-align: center;

/* 		border-bottom: 1px solid gray; */
		
		-webkit-box-shadow: 0px 5px 5px 0px rgba(0,0,0,0.15);
		-moz-box-shadow: 0px 5px 5px 0px rgba(0,0,0,0.15);
		box-shadow: 0px 5px 5px 0px rgba(0,0,0,0.15);
		
		background-color: white;
	}
	
	body{
		font-family: 'Noto Sans KR', sans-serif;
		background-color: whitesmoke;
	}
	
	a, a:link, a:hover, a:visited{
		color: black;
	}
	
	.pagination > li > a
	{
	    background-color: white;
	    color: #5A4181;
	}
	
	.pagination > li > a:focus,
	.pagination > li > a:hover,
	.pagination > li > span:focus,
	.pagination > li > span:hover
	{
	    color: #5a5a5a;
	    background-color: #eee;
	    border-color: #ddd;
	}
	
	.pagination > .active > a
	{
	    color: white;
	    background-color: crimson !Important;
	    border: solid 1px crimson !Important;
	}
	
	.pagination > .active > a:hover
	{
	    background-color: crimson !Important;
	    border: solid 1px crimson;
	}
 	
</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">


<script type="text/javascript" src="/onl/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/onl/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/onl/resources/js/dateformat.js"></script>


<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript">

$(function(){
	var cjsonLoc = "/onl/resources/common/category.json";

// 	$.ajax({
// 		url:"getcategory.do",
// 		dataType:"json",
// 		method:"get",
// 		success:function(cjson){
// 			$("#test").html(cjson);
// 			makeCategory(cjson);
// 		},
// 		fail:function(){
// 			console.log("서버 통신 실패");
// 		}
		
// 	});

	$.getJSON(cjsonLoc, function(data){	
		makeCategory(data);
	});

	
	$("body").on("mouseenter", ".bigC", function(e){
		$(this).find(".innerUl").stop().show();
	});
	
	$("body").on("mouseleave", ".bigC", function(e){
		$(this).find(".innerUl").stop().hide();
	});
	
	//검색
	$("input[name='searchbto']").on("click", function(){
		var param = $("input[name='searchval']").val();
		
		if(param.length < 1){
			alert("검색어는 한글자 이상 입력해주세요.");
		}else{
			location.href="search.do?title="+param;
		}
		
	});
	
});





function makeCategory(cjson){
	
	var categories = $("<ul class='outUl nav justify-content-center'></ul>");
	for(var i = 0; i < cjson.length; i++){

		if(cjson[i].category_name1 != " "){

			var bigC = $("<li class='bigC'></li>");
			var innerUl = $("<ul class='innerUl'></ul>");
			
			var btag = $("<a href='search.do?category="+cjson[i].code1+"'>"+cjson[i].category_name1+"</a>");
			
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
					var stag = $("<a href='search.do?category="+cjson[j].code2+"'>"+cjson[j].category_name2+"</a>");
					
					innerLi.append(stag);
					innerUl.append(innerLi);
					j++;
				}
			}
			
			bigC.append(innerUl);
			categories.append(bigC);
		}
		
	}
	
	$("#defaultC").replaceWith(categories);
}

//Adobe font
// (function(d) {
//     var config = {
//       kitId: 'fpr3sxh',
//       scriptTimeout: 3000,
//       async: true
//     },
//     h=d.documentElement,t=setTimeout(function(){h.className=h.className.replace(/\bwf-loading\b/g,"")+" wf-inactive";},config.scriptTimeout),tk=d.createElement("script"),f=false,s=d.getElementsByTagName("script")[0],a;h.className+=" wf-loading";tk.src='https://use.typekit.net/'+config.kitId+'.js';tk.async=true;tk.onload=tk.onreadystatechange=function(){a=this.readyState;if(f||a&&a!="complete"&&a!="loaded")return;f=true;clearTimeout(t);try{Typekit.load(config)}catch(e){}};s.parentNode.insertBefore(tk,s)
//   })(document);
</script>
</head>
<body>
<header>

		<div class="loginbar">
			<div class="headerWrapper">
				<div class="memberfield">
					고객센터 | <sec:authorize access="isAnonymous()"><a href='registform.do'>회원가입</a> | </sec:authorize>
					<sec:authorize access="isAuthenticated()"><a href='mypage.do'>마이페이지</a> | </sec:authorize>
					<sec:authorize access="isAuthenticated()"><a href='memberinfo.do'>회원정보관리</a> | </sec:authorize>
					<sec:authorize access="isAnonymous()"><a href='login.do'>로그인</a></sec:authorize>
					<sec:authorize access="isAuthenticated()"><a href='logout.do'>로그아웃</a></sec:authorize>
				</div>
			</div>
		</div>
		
		<div class="headerWrapper">
		
			<p id="test"></p>
			
			<div class="searchbox">
				<div class="searchElement">
					<div class="headerlogo">
						<h2><a href="index.do">ONL</a></h2> 			
					</div>
					<div class="searchfield input-group mb-3">
						<input class="form-control" type="text" placeholder="검색어를 입력하세요" name="searchval" >
						<div class="input-group-append">
							<input class="searchbto btn btn-danger" type="button" name="searchbto" value="검색">
						</div>
					</div>
				</div>
			</div><br>

		</div>
		<div class="searchdetail">
			<p class="downarrow">상세검색<img src="/onl/resources/icon/paragraph_center.png" width="15px"></p>
			<div class="details">
				
			</div>
		</div>
		
		<div class="categoryfield">
			<ul class='outUl nav justify-content-center' id="defaultC"><li>&nbsp;</li></ul>
		</div>

		<div class="clear"></div>

		
	

</header>

<div class="remotediv">
	<div class="writebtodiv">
		<a href='writewantedform.do'><img class="writebto" alt="구인글 쓰기" src="/onl/resources/icon/write.png" width="40px"></a>
		
	</div>
	▲TOP
</div>


</body>
</html>