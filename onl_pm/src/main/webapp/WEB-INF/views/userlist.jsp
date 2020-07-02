<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

	
	.con{
		border: 1px solid darkgray;
		width: 800px;
		height: 200px;
		margin: 20px auto;
		padding: 20px 30px 20px 20px;
		overflow: auto;
		overflow-y: hidden;
	}
	
	.con:hover{
		cursor: pointer;
		-webkit-box-shadow: 0px 5px 5px 0px rgba(0,0,0,0.30);
		-moz-box-shadow: 0px 5px 5px 0px rgba(0,0,0,0.30);
		box-shadow: 0px 5px 5px 0px rgba(0,0,0,0.30);
	}

	
	.con > div{
		margin-right: 10px;
/* 		display: inline-block; */
		height: 160px;

		position: relative;
		
	}

	.op select{
		float: right;
	}
	
	.op{
		overflow: auto;
		margin-right: 80px;
		
	}
	
	.Cimg{
		width: 160px;
		float: left;

		border: 1px solid lightgray;
		overflow: hidden;

	}
	
	.wantedImg{
		position: relative;
	}
	
	.con_div1{
		width:350px;
		float: left;
		font-size: 16px;

	}
	
	.Ctitle{
		padding-top: 10px;
		font-size: 20px;
		font-weight: 700;
	}
	
	.Cdate{
		padding-top: 20px;
		font-size: 15px;
	}
	
	.con_div2{
		width:150px;
		float: right;
		font-size: 16px;
		margin-left: 50px;
		border-left: 1px solid lightgray;
		padding-left: 20px;
		display: table-cell;
		vertical-align: middle;
	}
	
	
	.Capply{


	}
	.Csalary{

	}
	
	
	.Ccontent{
		padding-top: 10px;
		height: 40px;

	}
	
	.paging{
		margin: 0 auto;
		width: 500px;
		text-align: center;
		bottom: 200px;

	}

	.paging p{
		border-radius: 50%;
		display: inline-block;
		padding-right: 5px;
	}
	
	.attention-1{
		font-size: 40px;
		font-weight: 700;
	}
	
	.attention-2{
		font-size: 30px;
		font-weight: 700;
	}
	
	.attention-3{
		font-size: 50px;
		font-weight: 1000;
	}
	
	.attention-4{
		font-size: 40px;
		font-weight: 1000;
	}
</style>

<title>Insert title here</title>
</head>
<body>
<div class="headerWrapper">
	<%@include file="sidemenu_mypage.jsp" %>
	
	<div class="pageContent">
		<div class="depth">홈 > 마이페이지 > 유저리스트 > 
			<c:choose>
				<c:when test="${param.state ne null}">
					${param.state eq 'B' ? '블랙리스트':''}
					${param.state eq 'W' ? '화이트리스트':''}
				</c:when>
				<c:otherwise>
					전체
				</c:otherwise>
			</c:choose>
		</div>
		<div class="contentDetail">
			<div class="centerDiv">
				<h2 class="pageTitle wantedH">
					<c:choose>
						<c:when test="${param.state ne null}">
							${param.state eq 'B' ? '블랙리스트':''}
							${param.state eq 'W' ? '화이트리스트':''}
						</c:when>
						<c:otherwise>
							유저리스트
						</c:otherwise>
					</c:choose>
				</h2>

				
				
				<div class="pagingDiv">
						<nav aria-label="Page navigation example">
						  <ul class="pagination justify-content-center">
						  	
						  	<li class="page-item"><a class="page-link first-page">&Lt;</a></li>
						    <li class="page-item"><a class="page-link pre-page" >&lt;</a></li>
						    
							<c:forEach varStatus="i" begin="${startPage}" end="${endPage}">
						  		<li class="page-item ${i.index eq pnum? 'active':''}"><a class="page-link" >${i.index}</a></li>
						  	</c:forEach>
						  	
						    <li class="page-item"><a class="page-link next-page">&gt;</a></li>
						    <li class="page-item"><a class="page-link last-page">&Gt;</a></li>
						  </ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</div>

<script type="text/javascript">

	$(function(){
		
		$("body").on("click", ".con", function(){
			
			location.href="wanted.do?seq="+$(this).find("input[name='seq']").val();
			
		});
			
		queryString = location.search;
		var pnumI = queryString.indexOf("pnum");
		if(pnumI > 0){
			queryString = queryString.substring(0, pnumI-1);
		}
		
		$("body").on("click", ".page-link", function(){
			if($(this).hasClass("pre-page")){
				
				location.href= "search.do" +queryString +"&pnum=${prePageNum}";
				
			}else if ($(this).hasClass("first-page")){
				
				location.href= "search.do" +queryString +"&pnum=1";
				
				
			}else if ($(this).hasClass("next-page")){
				
				location.href= "search.do" +queryString +"&pnum=${nextPageNum}";
				
			}else if ($(this).hasClass("last-page")){
				
				location.href= "search.do" +queryString +"&pnum=${allP}";
				
			}else{
				
				location.href= "search.do" +queryString +"&pnum=" +$(this).text();
				
			}
		});
	});
	
	$(".wantedImg").on("load",function(){
		//이미지 가운데에 맞추기


			var imgWidth = this.naturalWidth;
			var imgHeight = this.naturalHeight;
	
			if(imgWidth >= imgHeight){
				
				$(this).height("100%");
				
				console.log(this.width);
				if(this.width >= 160){
					
					$(this).css("left", "-"+(($(this).width()-160)/2)+"px");
					
				}else{
					$(this).css("height","");
					
					$(this).width("100%");
					$(this).css("top", "-"+(($(this).height()-160)/2)+"px");
				}

			}else{
				
				$(this).width("100%");
				$(this).css("top", "-"+(($(this).height()-160)/2)+"px");
	
			}
			
// 			console.log($(this).width());

	});	
</script>
</body>
</html>
<%@include file="footer.jsp"%>