<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@include file="header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.registT{
		margin: 0px auto 100px auto;  
		
		min-height: 200px;
	}
	
	.registT th{
		background-color: whitesmoke;
		text-align: center;
		vertical-align: middle;
		width: 200px;
	}
	
	.registT td{
		text-align: center;

		max-width: 800px;
		vertical-align: middle;
	}
	
	.profileImgDiv{
		width: 200px;
		height: 200px;
		border-radius: 100px;
		border: 1px solid lightgray;
		overflow: hidden;
		margin: 20px auto;
	}

	
	.attention{
		color: darkorange;
		font-weight: 300;
	}
	
	.nick{
		font-weight: 300;
		font-size: 30px;
	}
	
	.scoreTitle{
		font-weight: 300;
		font-size: 20px;
	}
	
	.score{
		font-weight: 500;
		font-size: 20px;
	}
	
	.imp{
		font-weight: 700;

	}
</style>

</head>
<body>
<div class="headerWrapper">
	<%@include file="sidemenu_memberinfo.jsp" %>
	
	<div class="pageContent">
		<div class="depth">홈 > 회원정보 > 나의 프로필</div>
		<div class="contentDetail" style="min-height: 600px;">
			<div class="centerDiv">
				<h2 class="pageTitle wantedH">프로필</h2>
				<br>
				<br>
				<div class="profileDiv">
					
					<table class="registT table table-bordered normalT">
						<tr>
							<td colspan="2">
								<div class="profileImgDiv">
									<img alt="profile-image" class="profileImg" src="resources/${pdto.filedto.stored_name eq null? 'icon/':'uploadimg/'}${pdto.filedto.stored_name eq null? 'people2.jpg':pdto.filedto.stored_name}">
								</div>
								<span class="nick">
									${pdto.nickname}
								</span>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								자기소개
							</th>
						</tr>
						<tr>
							
							<td colspan="2">
								${pdto.intro}
							</td>
						</tr>
						<tr>
							<th colspan="2">
								선호지역
							</th>
						</tr>
						<tr>
							<td colspan="2">
								<c:choose>
									<c:when test="${pdto.location_able eq '0'}">
										아직 선택된 지역이 없습니다.
									</c:when>
									<c:otherwise>
									
										<c:set var="locs" value="${fn:split(pdto.location_able,'&')}" />
										<c:set var="loclength" value="${fn:length(locs)}"/>
										<c:forEach var="loc" items="${locs}" varStatus="i">
										     ${loc} <c:if test="i.index != loclength-1">, </c:if>
										</c:forEach> 

									</c:otherwise>
								</c:choose>

							</td>
						</tr>
						<tr style="height:300px;">
							<td>
								<div class="outScore">
									<div class="scoreTitle">
										구인점수
									</div>
									<div class="score">
										${pdto.offer_score eq '0'? '아직 내일리뷰가 없습니다.':pdto.offer_score}
									</div>
								</div>
							</td>
							<td>
								<div class="outScore">
									<div class="scoreTitle">
										구직점수
									</div>
									<div class="score">
										${pdto.search_score eq '0'? '아직 내일리뷰가 없습니다.':pdto.search_score}
									</div>
								</div>
							</td>
						</tr>
						
						<c:if test="pdto.search_score != '0' and pdto.offer_score != '0'">
							<tr>
								<td colspan="2">리뷰 전체보기</td>
							</tr>
						</c:if>
						
						<c:choose>
							<c:when test="${pdto.location_able eq '0'}">
							<tr>
								<td colspan="2"><a href='writeprofile.do' class="imp">프로필 작성하러 가기</a></td>
							</tr>
							</c:when>
							<c:otherwise>
							<tr>
								<td colspan="2"><a href='modifyprofile.do' class="imp">프로필 수정하러 가기</a></td>
							</tr>
							</c:otherwise>
						</c:choose>
					</table>
					
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

	//이미지 가운데에 맞추기
	$(".profileImg").on("load",function(){
		console.log("imgLoad");
		var imgWidth = this.naturalWidth;
		var imgHeight = this.naturalHeight;

		if(imgWidth > imgHeight){
			
			$(this).height("100%");
			
			if($(this).width() < 200){
				
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
</script>

</body>
</html>
<%@include file="footer.jsp"%>