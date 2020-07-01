<%@include file="header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<style type="text/css">
	.innerWantedDiv{
		margin: 0 auto;
		margin-top: 30px;
		width: 800px;
		height: 400px;
	}
	
	
	.wantedH{
		border-left: 10px solid crimson;
		padding-left: 5px;
		margin: 50px 0px 30px 0px;
	}
	

	.sosbox{
		display: inline-block;
		width: 230px;
		border: 1px solid darkgray;
		margin: 0px 10px 0px 10px;
		border-radius: 5px;
	}
	
	.sosbox:hover{
		cursor: pointer;
		-webkit-box-shadow: 0px 5px 5px 0px rgba(0,0,0,0.30);
		-moz-box-shadow: 0px 5px 5px 0px rgba(0,0,0,0.30);
		box-shadow: 0px 5px 5px 0px rgba(0,0,0,0.30);
	}
	
	.imgdiv{
		min-width: 100%;
		padding: 0px;
		height: 150px;
		margin: 0 auto;
		border-bottom: 1px solid lightgray;


		overflow: hidden;
	}
	
	.wantedImg{
		position: relative;
	}
	
	.textDiv{
		width: 100%;
		height: 200px;
		padding: 10px 10px 20px 10px;
	}
	

	
	.sosdate{
		font-size: 13px; 
		margin-top: 10px; 
		display: inline-block;

	}
	

	
	.normalT th{
		text-align: center;
	}
	
	.normalT td{
		vertical-align: middle;
		text-align: center;
	}

	.normalT tbody tr:hover{
		cursor: pointer;
		text-decoration: underline;
	}	
	
	.normalT td:first-child{
/* 		width: 150px; */
		word-break:keep-all;
		font-size: 14px;
	}
	
	.normalT td:nth-child(2){
/* 		width: 250px; */
		text-align: left;
	}
	
	.normalT td:nth-child(3){
		text-align: right;
/* 		width: 100px; */
	}
	
	.normalC{
		font-size: 13px;
	}
	
	.normalTitle{
		font-weight: 500;
		font-size: 18px;
	}
	

	
	.slick-prev{
		position: absolute;
		left: -30px;
		cursor: pointer;
		background: url("resources/img/s_nav-arrow-left.png") no-repeat;
		width: 18px;
		height:32px;
		border: none;
		outline: none;
		text-indent: -9999px;
		top: 168px;
	}
	
	.slick-next{
		position: absolute;
		left: 800px;
		background: url("resources/img/s_nav-arrow-right.png") no-repeat;
		width: 18px;
		height:32px;
		border: none;
		outline: none;
		text-indent: -9999px;
		top: 168px;
	}

</style>


</head>
<body>
<div class="headerWrapper">
	<%@include file="sidemenu_search.jsp" %>
	
	<div class="pageContent">
		<div class="depth">홈 > 검색결과</div>
		<div class="contentDetail">
			<div class="centerDiv">
					
					<c:choose>
						<c:when test="${!empty wlist}">
							<h2 class="pageTitle">총 ${wlist[0].result_c}건의 검색결과가 있습니다.</h2>
							<div class="wantedDiv">
								<h3 class="wantedH">긴급</h3>
								<div class="innerWantedDiv slick">
									
									<c:choose>
										<c:when test="${sosCount eq 0}">
											--긴급 구인글 검색결과가 없습니다.--
										</c:when>
										<c:otherwise>
											<c:forEach items="${wlist}" var="wdto" varStatus="i" begin="0" end="${sosCount-1}">
	
												<c:set var="imgsrc" value="${fn:substring(wdto.category,0,1)}_${(i.index mod 3)+1}.jpg"/>
		
		
													<div class="outsos">
														<span style="margin-left: 20px;">${wdto.categoryDto.category_name1} > ${wdto.categoryDto.category_name2}</span>
														<br>
														<div class="sosbox">
															<input type="hidden" name="seq" value="${wdto.seq}">
															<div class="imgdiv">
																<img alt="대표이미지" class="wantedImg"
																src="resources/${wdto.fileDto.stored_name eq null? 'img&sol;':'uploadimg&sol;'}${wdto.fileDto.stored_name eq null ? imgsrc : wdto.fileDto.stored_name}">
															</div>
															<div class="textDiv">
																<span style="font-size: 13px; margin-top: 10px; display: inline-block;">${wdto.location}</span>
																<br>
																<c:choose>
																	<c:when test="${fn:length(wdto.title) > 8}">
																		<h5>${fn:substring(wdto.title,0,8)}...</h5>
																	</c:when>
																	<c:otherwise>
																		<h5>${wdto.title}</h5>
																	</c:otherwise>	
																</c:choose>
																<span class="sosdate">등록일: <fmt:formatDate value="${wdto.regdate}" pattern="YYYY-MM-dd"/></span>
																<br>
																<span class="sosdate">마감일: <fmt:formatDate value="${wdto.deadline}" pattern="YYYY-MM-dd"/></span>
																<br>
																<div style="text-align:right; font-weight: 600; font-size: 25px; margin-top: 10px;"><fmt:formatNumber value="${wdto.salary}" pattern="#,###"/>&nbsp;원</div>
															</div>
															
														</div>	
													</div>
		
		
												
											</c:forEach>
										</c:otherwise>
									</c:choose>
									
								</div>
								<h3 class="wantedH">일반</h3>
								<div class="innerWantedDiv2">	
									<table class="table table-striped table-bordered normalT">
										<thead>
											<tr>
												<th style="width: 150px;">지역</th>
												<th style="width: 250px;">모집내용</th>
												<th style="width: 100px;">급여</th>
												<th>작성자</th>
												<th>등록일</th>
												<th>마감일</th>
											</tr>
										</thead>
										
										<c:choose>
											<c:when test="${(fn:length(wlist)) -sosCount ne 0}">
												<tbody>
												<c:forEach items="${wlist}" var="wdtoN" begin="${sosCount}">
		
														<tr>
															<td>${wdtoN.location}</td>
															<td>
																<span class="normalC">
																	${wdtoN.categoryDto.category_name1} > ${wdtoN.categoryDto.category_name2}
																</span>
																<br>
																<input type="hidden" name="seq" value="${wdtoN.seq}">
																<span class="normalTitle">
																	${wdtoN.title}
																</span>
															</td>
															<td><fmt:formatNumber value="${wdtoN.salary}" pattern="#,###"/>&nbsp;원</td>
															<td>${wdtoN.nickname}</td>
															<td><fmt:formatDate value="${wdtoN.regdate}" pattern="YYYY-MM-dd"/></td>
															<td><fmt:formatDate value="${wdtoN.deadline}" pattern="YYYY-MM-dd"/></td>
														</tr>
		
												</c:forEach>
												</tbody>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="6">--검색된 일반 구인글이 없습니다.--</td>
												</tr>
											</c:otherwise>
										</c:choose>
										
									</table>
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
						</c:when>
						<c:otherwise>
						
							<h2 class="pageTitle">검색결과가 없습니다.</h2>
						</c:otherwise>
					</c:choose>

			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
	var queryString = "";

	$(function(){
		
		//이미지 가운데에 맞추기
// 		$(".wantedImg").on("load",function(){
		$(".wantedImg").each(function(){
			var imgWidth = this.naturalWidth;
			var imgHeight = this.naturalHeight;

			if(imgWidth > imgHeight){
				
				$(this).height("100%");
				
				if($(this).width() < 230){
					
					$(this).css("height","");
					
					$(this).width("100%");
					$(this).css("top", "-"+(($(this).height()-150)/2)+"px");
					
				}else{
					$(this).css("left", "-"+(($(this).width()-230)/2)+"px");
				}
				

			}else{
				
				$(this).width("100%");
				$(this).css("top", "-"+(($(this).height()-150)/2)+"px");

			}
		});
// 		});
		
		$('.slick').slick({
		    slidesToShow: 3,
		    slidesToScroll: 1,
		    arrows: true
		 });
		
		queryString = location.search;
		var pnumI = queryString.indexOf("pnum");
		if(pnumI > 0){
			queryString = queryString.substring(0, pnumI-1);
		}

		
		$("body").on("click", ".sosbox", function(){
			var seq = $(this).find("input[name='seq']").val();
			location.href = "wanted.do?seq="+seq;
		});
		
		$("body").on("click", ".normalT tbody tr", function(){
			var seq = $(this).find("input[name='seq']").val();
			location.href = "wanted.do?seq="+seq;
		});
		
		
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
	
	

</script>


</body>
</html>
<%@include file="footer.jsp" %>