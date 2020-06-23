<%@include file="header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	.centerDiv{
		width: 90%;
		margin: 0 auto;
	}
	
	.myBal{
		text-align: right;
		padding-right: 20px;
		line-height: 60px;
		font-weight: 700;
		font-size: 25px;
		margin-bottom: 10px;
		margin-right: 10px;
	}
	
	.balNum{
		border-radius: 10px;
/* 		border: 1px solid maroon; */
		background-color: crimson;
		padding-right: 5px;
		font-weight: 900;
		font-size: 35px;
		color: white;
		position: relative;
		top: -7px;
		min-width: 170px;
		display: inline-block;
		-webkit-box-shadow: inset 2px 2px 5px 0px rgba(0,0,0,0.50);
		-moz-box-shadow: inset 2px 2px 5px 0px rgba(0,0,0,0.50);
		box-shadow: inset 2px 2px 5px 0px rgba(0,0,0,0.50);
	}
	

	
	.pagingDiv{
		margin-top: 50px;
		margin-bottom: 50px;
	}
</style>
</head>
<body>
	<div class="headerWrapper">
		<%@include file="sidemenu_mypage.jsp" %>
		
		<div class="pageContent">
			<div class="depth">홈 > 마이페이지 > 나의 지갑</div>
			<div class="contentDetail">
				<div class="centerDiv">
					<h2>나의 지갑</h2>
					<div class="walletDetail">
						<div class="myBal">
							현재 사용 가능한 예치금 잔액은<br>
							총 &nbsp;
							<div class="balNum">
							&nbsp;
								
								<c:choose>
									<c:when test="${empty clist}">
										0
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${clist[0].allbal}" pattern="#,###"/>
									</c:otherwise>
								</c:choose>
								
							</div>
							원입니다.
						</div>
						<table class="table table-striped table-bordered" style="text-align: center;">
							<thead>
								<tr>
									<th scope="col">날짜</th>
									<th scope="col" style="width:300px;">금액</th>
									<th scope="col">유형</th>
									<th scope="col">환불여부</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty clist}">
										<tr>
											<td colspan="4">
												아직 거래내역이 없습니다.
											</td>							
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${clist}" var="cdto">
										
											<tr>
												<td>
													<fmt:formatDate value="${cdto.regdate}" pattern="YYYY-MM-dd"/>
												</td>
												<td>
													<c:if test="${cdto.type ne 'RECEIVE'}">${cdto.money > 0 ? '+':'-'}</c:if><fmt:formatNumber value="${cdto.money}" pattern="#,###"/>
												</td>
												<td>
													<c:choose>
														<c:when test="${cdto.type eq 'CHARGE'}">
															충전
														</c:when>
														<c:when test="${cdto.type eq 'PAY'}">
															결제
														</c:when>
														<c:when test="${cdto.type eq 'REFUND'}">
															환불
														</c:when>
														<c:when test="${cdto.type eq 'CANCEL'}">
															구인취소
														</c:when>
														<c:when test="${cdto.type eq 'RECEIVE'}">
															지급
														</c:when>
													</c:choose>
												</td>
												<td>
													<c:choose>
														<c:when test="${cdto.type eq 'CHARGE'}">
															<c:choose>
																<c:when test="${cdto.money eq cdto.balance}">
																	<c:choose>
																		<c:when test="${cdto.cancelflag eq 'N'}">
																			<a href='refund.do?seq=${cdto.seq}'>환불가능</a>
																		</c:when>
																		<c:otherwise>
																			환불완료
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																	환불불가
																</c:otherwise>	
															</c:choose>
														</c:when>
														<c:otherwise>
															-
														</c:otherwise>
													</c:choose>
												</td>
											</tr>
										
										</c:forEach>	
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div class="pagingDiv">
							<nav aria-label="Page navigation example">
							  <ul class="pagination justify-content-center">
							  	
							  	<li class="page-item"><a class="page-link" href="wallet.do?pnum=1">&Lt;</a></li>
							    <li class="page-item"><a class="page-link" href="wallet.do?pnum=${prePageNum}">&lt;</a></li>
							    
								<c:forEach varStatus="i" begin="${startPage}" end="${endPage}">
							  		<li class="page-item ${i.index eq pnum? 'active':''}"><a class="page-link" href="wallet.do?pnum=${i.index}" >${i.index}</a></li>
							  	</c:forEach>
							  	
							    <li class="page-item"><a class="page-link" href="wallet.do?pnum=${nextPageNum}">&gt;</a></li>
							    <li class="page-item"><a class="page-link" href="wallet.do?pnum=${allP}">&Gt;</a></li>
							  </ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@include file="footer.jsp"%>