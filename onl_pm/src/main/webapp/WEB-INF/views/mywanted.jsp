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
		border: solid 1px;
		width: 700px;
		height: 200px;
		margin: 0 auto;
		margin-bottom: 20px;
		overflow: hidden;
	}	

	.op select{
		float: right;
	
	}
	
	.op{
		overflow: auto;
		margin-right: 80px;
		
	}
	
	.Cimg{
		width: 180px;
		height: 180px;
		margin-top: 10px;
		margin-left: 10px;
	}
	
	.con div{
/*    		border: solid 1px;   */
		width: 150px;
	}
	.Capply, .Csalary{
 		position: relative; 
		margin-left: 540px;
  		bottom: 360px; 
/*   		height: 50px; */
		text-align: right;
	}
	.Capply{
		margin-bottom: 25px;
	}
	.Ctitle, .Cdate, .Ccontent{
		margin-left: 200px;
		position: relative;
		bottom: 180px;
		height: 50px;
		width: 320px !important;
	}
	.Ctitle{
		margin-bottom: 10px;
		font-size: 16pt;
		height: 30px !important;
	}
	.Cdate{
		height: 100px;
		
	}
	.Capply div{
		height: 50px;
		font-size: 16pt;
	}
	.Csalary div{
		height: 50px;
		font-size: 16pt;
	}
	.Ccontent{
		height: 40px;
		overflow: hidden;
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
</style>
<title>Insert title here</title>
</head>
<body>
<div class="headerWrapper">
	<%@include file="sidemenu_mypage.jsp" %>
	
	<div class="pageContent">
		<div class="depth">홈 > 마이페이지 > 사람 구해요 > 모집중(변수처리예정)</div>
		<div class="contentDetail">
			<div class="centerDiv">
				<h2 class="pageTitle">여기에 페이지 타이틀이 들어갑니다.</h2>
				이 아래로 컨텐츠 영역입니다.	
				<div class="op">
<!-- 					<select> -->
<!-- 						<option value="" selected="selected">전체</option> -->
<!-- 						<option value="">모집중</option> -->
<!-- 						<option value="">진행중</option> -->
<!-- 						<option value="">완료</option> -->
<!-- 					</select> -->
					<select name="sortType">
						<option value="" selected="selected">등록일</option>
						<option value="">지원자</option>
						<option value="deadline">마감임박</option>
					</select>
					<br>
				</div>
				<c:choose>
					<c:when test="${fn:length(wlist)-1}==0">
						작성된 구인글이 없습니다.
					</c:when>
					<c:otherwise>
						<c:forEach begin="0" end="${fn:length(wlist)-1}" step="1" varStatus="i" var="wdto" items="${wlist}">
						<div class="con">
							<img class="Cimg" alt="썸네일" src="resources/img/1_1.jpg">
							<div class="Ctitle">${wdto.title}</div>
							<div class="Cdate">
								모집기간<br>
								<fmt:formatDate value="${wdto.regdate}" pattern="YYYY년 MM월 dd일  HH시 mm분"/>~<br>
								<fmt:formatDate value="${wdto.deadline}" pattern="YYYY년 MM월 dd일  HH시 mm분"/> 
								까지<br>
								일하는날 <br>
								${fn:substring(wdto.sdate,0,4)}년 ${fn:substring(wdto.sdate,4,6)}월 ${fn:substring(wdto.sdate,6,8)}일 ~  
								${fn:substring(wdto.edate,0,4)}년 ${fn:substring(wdto.edate,4,6)}월 ${fn:substring(wdto.edate,6,8)}일 <br>
							</div>
							<div class="Ccontent">
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${fn:length(wdto.content)>=25}"> --%>
<%-- 									${wdto.content}... --%>
<%-- 									${fn:length(wdto.content)} --%>
<%-- 								</c:when> --%>
<%-- 								<c:otherwise> --%>
<%-- 									${wdto.content} --%>
<%-- 								</c:otherwise> --%>
<%-- 							</c:choose> --%>
							</div>  
							<div class="Capply">지원자
								<div>${wdto.apply_c}명</div>
							</div>
							<div class="Csalary">금액
								<div>
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${wdto.salary}"/>원
								</div>
							</div>
						</div>
					</c:forEach>
					</c:otherwise>
				</c:choose>	
			</div>
		</div>
		<div class="pagingDiv">
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			  	
			  	<li class="page-item"><a class="page-link" href="mywanted.do?pnum=1">&Lt;</a></li>
			    <li class="page-item"><a class="page-link" href="mywanted.do?pnum=${prePageNum}">&lt;</a></li>
			    
				<c:forEach varStatus="i" begin="${startPage}" end="${endPage}">
			  		<li class="page-item ${i.index eq pnum? 'active':''}"><a class="page-link" href="mywanted.do?pnum=${i.index}" >${i.index}</a></li>
			  	</c:forEach>
			  	
			    <li class="page-item"><a class="page-link" href="mywanted.do?pnum=${nextPageNum}">&gt;</a></li>
			    <li class="page-item"><a class="page-link" href="mywanted.do?pnum=${allP}">&Gt;</a></li>
			  </ul>
			</nav>
		</div>
	</div>
</div>
</body>
</html>