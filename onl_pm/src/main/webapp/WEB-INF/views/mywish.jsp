<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="header.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
</style>
<script type="text/javascript">
	$(function(){
		$("body").on("click", ".normalT tbody tr", function(){
			var seq = $(this).find("input[name='seq']").val();
			location.href = "wanted.do?seq="+seq;
		});
	});

</script>
</head>
<body>
<div class="headerWrapper">
	<%@include file="sidemenu_memberinfo.jsp" %>
	
	<div class="pageContent">
		<div class="depth">홈 > 회원정보 > 나의 찜글</div>
		<div class="contentDetail">
			<div class="centerDiv">
				<h2 class="pageTitle wantedH">찜글 목록</h2>
				<br>
				<br>
				<table class="table table-striped table-bordered normalT">
					<thead>
						<tr>
							<th style="width: 150px;">지역</th>
							<th style="width: 250px;">모집내용</th>
							<th style="width: 100px;">급여</th>
							<th>상태</th>
							<th>등록일</th>
							<th>마감일</th>
						</tr>
					</thead>
					
					<c:choose>
						<c:when test="${!empty wlist}">
							<tbody>
							<c:forEach items="${wlist}" var="wdtoN">

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
										<td>
											
											<c:choose>
												<c:when test="${wdtoN.state eq 'WANTED'}">
													구인중
												</c:when>
												<c:when test="${wdtoN.state eq 'PROCESS'}">
													진행중
												</c:when>
												<c:otherwise>
													완료
												</c:otherwise>
											</c:choose>
										
										</td>
										<td><fmt:formatDate value="${wdtoN.regdate}" pattern="YYYY-MM-dd"/></td>
										<td><fmt:formatDate value="${wdtoN.deadline}" pattern="YYYY-MM-dd"/></td>
									</tr>

							</c:forEach>
							</tbody>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6">--찜해놓은 구인글이 없습니다.--</td>
							</tr>
						</c:otherwise>
					</c:choose>
					
				</table>
				<div class="pagingDiv">
					<nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center">
					  	
					  	<li class="page-item"><a class="page-link" href="mywishlist.do?pnum=1">&Lt;</a></li>
					    <li class="page-item"><a class="page-link" href="mywishlist.do?pnum=${prePageNum}">&lt;</a></li>
					    
						<c:forEach varStatus="i" begin="${startPage}" end="${endPage}">
					  		<li class="page-item ${i.index eq pnum? 'active':''}"><a class="page-link" href="mywishlist.do?pnum=${i.index}" >${i.index}</a></li>
					  	</c:forEach>
					  	
					    <li class="page-item"><a class="page-link" href="mywishlist.do?pnum=${nextPageNum}">&gt;</a></li>
					    <li class="page-item"><a class="page-link" href="mywishlist.do?pnum=${allP}">&Gt;</a></li>
					  </ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%@include file="footer.jsp"%>