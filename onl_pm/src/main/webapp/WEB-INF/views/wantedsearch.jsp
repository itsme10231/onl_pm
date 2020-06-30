<%@include file="header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="headerWrapper">
	<%@include file="sidemenu_search.jsp" %>
	
	<div class="pageContent">
		<div class="depth">홈 > 검색결과</div>
		<div class="contentDetail">
			<div class="centerDiv">
				<h2 class="pageTitle">
					<c:choose>
						<c:set var="loop_flag" value="false"/>
						<c:when test="${!empty wlist}">
							총 ${wlist[0].result_c}건의 검색결과가 있습니다.
							
							<div>
								<c:forEach items="${wlist}" var="wdto" >
									<c:if test="${not loop_flag}">
										
										<div>
											<img alt="대표이미지" src="${wdto.stored_name eq null ? '':wdto.stored_name}">
										</div>
										
										
										
										
										<c:if test="${wdto.sosflag eq 'N'}">
											<c:set var="loop_flag" value="true"/>
										</c:if>
									</c:if>
								</c:forEach>
							</div>
							<div>
							
							
							
							
							
							
							</div>
							
							
							
							
							
						</c:when>
						<c:otherwise>
							검색결과가 없습니다.
						</c:otherwise>
					</c:choose>
				</h2>
				이 아래로 컨텐츠 영역입니다.
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%@include file="footer.jsp" %>