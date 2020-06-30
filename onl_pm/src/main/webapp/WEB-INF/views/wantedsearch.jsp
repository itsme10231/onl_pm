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
<style type="text/css">
	.innerWantedDiv{
		margin-top: 30px;
	}
	
	.wantedH{
		border-left: 10px solid crimson;
		padding-left: 5px;
		margin: 50px 0px 30px 0px;
	}
	
	.outsos{
		display: inline-block;
	}

	.sosbox{
		display: inline-block;
		width: 200px;
		border: 1px solid darkgray;
		margin: 0px 10px 0px 10px;
		padding: 20px 10px;
	}
	
	.imgdiv{
		width: 180px;
		height: 130px;
		margin: 0 auto;
		border: 1px solid lightgray;
		padding: 1px;
		overflow: auto;
	}
	
	.wantedImg{
		width: 100%;
		top: 50%;
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
	
	.normalT td:first-child{
		width: 150px;
		word-break:keep-all;
		font-size: 14px;
	}
	
	.normalT td:nth-child(2){
		width: 250px;
		text-align: left;
	}
	
	.normalT td:nth-child(3){
		text-align: right;
		width: 100px;
	}
	
	.normalC{
		font-size: 13px;
	}
	
	.normalTitle{
		font-weight: 500;
		font-size: 18px;
	}

</style>
<script type="text/javascript">
	

</script>
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
								<div class="innerWantedDiv">
									
									<c:forEach items="${wlist}" var="wdto" varStatus="i">
	
										<c:set var="imgsrc" value="${fn:substring(wdto.category,0,1)}_${(i.index mod 3)+1}.jpg"/>
										<c:if test="${wdto.sosflag eq 'Y'}">
											<div class="outsos">
												<span style="margin-left: 20px;">${wdto.categoryDto.category_name1} > ${wdto.categoryDto.category_name2}</span>
												<br>
												<div class="sosbox">
													
													<div class="imgdiv">
														<img alt="대표이미지" class="wantedImg"
														src="resources/${wdto.fileDto.stored_name eq null? 'img&sol;':'uploadimg&sol;'}${wdto.fileDto.stored_name eq null ? imgsrc : wdto.fileDto.stored_name}">
													</div>
													<span style="font-size: 13px; margin-top: 10px; display: inline-block;">${wdto.location}</span>
													<br>
													<h5>${wdto.title}</h5>
													<span class="sosdate">등록일: <fmt:formatDate value="${wdto.regdate}" pattern="YYYY-MM-dd"/></span>
													<br>
													<span class="sosdate">마감일: <fmt:formatDate value="${wdto.deadline}" pattern="YYYY-MM-dd"/></span>
													<br>
													<div style="text-align:right; font-weight: 500; font-size: 25px;"><fmt:formatNumber value="${wdto.salary}" pattern="#,###"/>&nbsp;원</div>
												</div>	
											</div>
										</c:if>
										
									</c:forEach>
								</div>
								<h3 class="wantedH">일반</h3>
								<div class="innerWantedDiv">	
									<table class="table table-striped table-bordered normalT">
										<thead>
											<tr>
												<th>지역</th>
												<th>모집내용</th>
												<th>급여</th>
												<th>작성자</th>
												<th>등록일</th>
												<th>마감일</th>
											</tr>
										</thead>
										
										<c:forEach items="${wlist}" var="wdtoN">
											<c:if test="${wdtoN.sosflag eq 'N'}">
												<tr>
													<td>${wdtoN.location}</td>
													<td>
														<span class="normalC">
															${wdtoN.categoryDto.category_name1} > ${wdtoN.categoryDto.category_name2}
														</span>
														<br>
														<span class="normalTitle">
															${wdtoN.title}
														</span>
													</td>
													<td><fmt:formatNumber value="${wdtoN.salary}" pattern="#,###"/>&nbsp;원</td>
													<td>${wdtoN.nickname}</td>
													<td><fmt:formatDate value="${wdtoN.regdate}" pattern="YYYY-MM-dd"/></td>
													<td><fmt:formatDate value="${wdtoN.deadline}" pattern="YYYY-MM-dd"/></td>
												</tr>
											</c:if>
										</c:forEach>
										
									</table>
									<div class="pagingDiv">
										<nav aria-label="Page navigation example">
										  <ul class="pagination justify-content-center">
										  	
										  	<li class="page-item"><a class="page-link" href="prepaid.do?pnum=1">&Lt;</a></li>
										    <li class="page-item"><a class="page-link" href="prepaid.do?pnum=${prePageNum}">&lt;</a></li>
										    
											<c:forEach varStatus="i" begin="${startPage}" end="${endPage}">
										  		<li class="page-item ${i.index eq pnum? 'active':''}"><a class="page-link" href="prepaid.do?pnum=${i.index}" >${i.index}</a></li>
										  	</c:forEach>
										  	
										    <li class="page-item"><a class="page-link" href="prepaid.do?pnum=${nextPageNum}">&gt;</a></li>
										    <li class="page-item"><a class="page-link" href="prepaid.do?pnum=${allP}">&Gt;</a></li>
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
</body>
</html>
<%@include file="footer.jsp" %>