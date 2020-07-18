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

	.userlistDiv{
		text-align: center;
	}
	
	.listItem{
		width: 150px;
		height: 200px;
		display: inline-block;
		margin: 0px 20px 20px 0px;
		text-align: center;
		border: 1px solid black;

	}
	
	.listItem:hover{
		-webkit-box-shadow: 0px 5px 5px 0px rgba(0,0,0,0.30);
		-moz-box-shadow: 0px 5px 5px 0px rgba(0,0,0,0.30);
		box-shadow: 0px 5px 5px 0px rgba(0,0,0,0.30);
	}
	
	.listItem > h5{
		margin-bottom: 15px;
	}
	
	.white{
		border: 1px solid lightgray;
	}
	
	.black{
		background-color: 444444;
		color: white;
	}
	
	.btn-outline-secondary{
		background-color: white;
	}
	
	.imgDiv{
		width: 80px;
		height: 80px;
		border-radius: 40px;
/* 		border: 1px solid black; */
		margin: 20px auto 10px auto;
		position: relative;
		overflow: hidden;
	}
	
	.white>.imgDiv{
		border: solid 1px lightgray;
	
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
		<div class="depth">홈 > 마이페이지 > 유저리스트 > 
			<c:choose>
				<c:when test="${param.type ne null}">
					${param.type eq 'B' ? '블랙리스트':''}
					${param.type eq 'W' ? '화이트리스트':''}
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
						<c:when test="${param.type ne null}">
							${param.type eq 'B' ? '블랙리스트':''}
							${param.type eq 'W' ? '화이트리스트':''}
						</c:when>
						<c:otherwise>
							유저리스트
						</c:otherwise>
					</c:choose>
				</h2>
				
				<div class="userlistDiv">
					<c:choose>
						<c:when test="${empty ulist}">
							아직 유저리스트에 등록한 회원이 없습니다.<br><br>
							<div class="listItem black">
								<div class="imgDiv">
									<img alt="profile-image" class="profileImg" src="resources/icon/people2.jpg">
								</div>
								<h5>닉네임</h5>
								<input type="button" class="btn btn-outline-secondary" name="modify" value="변경"> <input type="button" class="btn btn-secondary" name="delete" value="삭제">
							</div>
							<div class="listItem white">
								<div class="imgDiv">
									<img alt="profile-image" class="profileImg" src="resources/icon/people2.jpg">
								</div>
								<h5>닉네임</h5>
								<input type="button" class="btn btn-outline-danger" name="modify" value="변경"> <input type="button" class="btn btn-danger" name="delete" value="삭제">
							</div>
							<div class="listItem">
								<div class="imgDiv"></div>
								<h5>닉네임</h5>
								<input type="button" class="btn btn-outline-danger" name="modify" value="변경"> <input type="button" class="btn btn-danger" name="delete" value="삭제">
							</div>
							<div class="listItem">
								<div class="imgDiv">
									
								</div>
								<h5>닉네임</h5>
								<input type="button" class="btn btn-outline-danger" name="modify" value="변경"> <input type="button" class="btn btn-danger" name="delete" value="삭제">
							</div>
						
						</c:when>
						<c:otherwise>
							<c:forEach items="${ulist}" var="udto">
								<div class="listItem ${udto.type eq 'W' ? 'white':'black'}">
									<div class="imgDiv">
										<img alt="profile-image" class="profileImg" src="resources/${udto.stored_name eq null? 'icon/':'uploadimg/'}${udto.stored_name eq null? 'people2.jpg':udto.stored_name}">
									</div>
									<h5>${udto.nickname}</h5><br>
									<input type="button" class="ulist-modify btn btn-outline-secondary" name="modify" value="변경"> <input type="button" class="ulist-delete btn btn-danger" name="modify" value="삭제">
									<input type="hidden" name="seq" value="${udto.seq}">
									
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>	
				</div>
				
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
		
		
			
		queryString = location.search;
		var pnumI = queryString.indexOf("pnum");
		if(pnumI > 0){
			queryString = queryString.substring(0, pnumI-1);
		}
		
		$("body").on("click", ".page-link", function(){
			if($(this).hasClass("pre-page")){
				
				location.href= "userlist.do" +queryString +"&pnum=${prePageNum}";
				
			}else if ($(this).hasClass("first-page")){
				
				location.href= "userlist.do" +queryString +"&pnum=1";
				
				
			}else if ($(this).hasClass("next-page")){
				
				location.href= "userlist.do" +queryString +"&pnum=${nextPageNum}";
				
			}else if ($(this).hasClass("last-page")){
				
				location.href= "userlist.do" +queryString +"&pnum=${allP}";
				
			}else{
				
				location.href= "userlist.do" +queryString +"&pnum=" +$(this).text();
				
			}
		});
		
		
		$("body").on("click","input[name='modify']",function(){
			
			if(confirm("유저리스트를 갱신하시겠습니까?")){
				
				var userDiv = $(this).parent();
				
				var btnType = "";
				var type = "";
				var seq = $(this).siblings("input[name='seq']").val();
				
				if($(this).hasClass("ulist-modify")){
					btnType = "modify";
				}else{
					btnType = "delete";
				}
				
				if(userDiv.hasClass("white")){
					type = "W";
				}else{
					type = "B";
				}
				
				$.ajax({
					
					url: "userlist_modify.do",
					method: "post",
					data: {
						"btnType": btnType,
						"seq": seq,
						"type": type
					},
					dataType: "text",
					success: function(msg){
						if(msg = "success"){
							if(btnType = "modify"){
								
								userDiv.toggleClass("white");
								userDiv.toggleClass("black");
								
							}else{
								$(this).parent().remove();
							}
							
							alert("유저리스트 갱신에 성공하였습니다.");
							
						}else{
							alert("유저리스트 갱신에 실패하였습니다.");
						}
					},
					fail: function(msg){
						alert("서버 오류: 관리자에게 문의하세요.");
					}
					
				});
				
			}else{
				
				return;
				
			}
			
		});
	});
	
	$(".profileImg").on("load",function(){
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