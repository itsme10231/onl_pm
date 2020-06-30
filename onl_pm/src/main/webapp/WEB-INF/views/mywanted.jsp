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
/*   		border: solid 1px;   */
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
	.Ctitle, .Ccontent{
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
	.Ccontent{
		height: 140px;
		
	}
	.Capply div{
		height: 50px;
		font-size: 16pt;
	}
	.Csalary div{
		height: 50px;
		font-size: 16pt;
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
					<select>
						<option value="" selected="selected">전체</option>
						<option value="">모집중</option>
						<option value="">진행중</option>
						<option value="">완료</option>
					</select>
					<select>
						<option value="" selected="selected">등록일</option>
						<option value="">지원자</option>
						<option value="">마감임박</option>
					</select>
					<br>
				</div>
				<c:choose>
					<c:when test="${fn:length(wlist)-1}==0">
						작성된 구인글이 없습니다.
					</c:when>
				</c:choose>	
				<c:forEach begin="0" end="${fn:length(wlist)-1}" step="1" varStatus="i" var="wdto" items="${wlist}">
					<div class="con">
						<img class="Cimg" alt="썸네일" src="resources/img/service_1.jpg">
						<div class="Ctitle">${wdto.title}</div>
						<div class="Ccontent">모집기간<br>
<%-- 							<fmt:formatDate value="${wdto.regdate}" pattern="YYYY년 MM월 dd일  HH시 mm분"/>~<br> --%>
							<fmt:formatDate value="${wdto.deadline}" pattern="YYYY년 MM월 dd일  HH시 mm분"/> 까지<br>
							일하는날 <br>
							${fn:substring(wdto.sdate,0,4)}년 ${fn:substring(wdto.sdate,4,6)}월 ${fn:substring(wdto.sdate,6,8)}일 ~  
							${fn:substring(wdto.edate,0,4)}년 ${fn:substring(wdto.edate,4,6)}월 ${fn:substring(wdto.edate,6,8)}일 <br>
							${wdto.content }
						</div>
						<div class="Capply">지원자
							<div>${wdto.apply_c}명</div>
						</div>
						<div class="Csalary">금액
							<div>
								
							${wdto.salary}원</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</body>
</html>