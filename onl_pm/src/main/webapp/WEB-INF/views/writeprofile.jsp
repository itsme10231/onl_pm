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
	
	textarea{
		width: 80%;
		min-height: 300px;
		overflow: auto;
		resize: none;
	}
</style>
<script type="text/javascript">
	$(function(){
		//이미지 가운데에 맞추기
// 		$(".wantedImg").on("load",function(){
		$(".profileImg").each(function(){
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
// 		});
		
		
		$("form").on("submit", function(){
			
			var loc = $("input[name='location_able']")
			loc.val("");
			$(".locations").each(function(){
				
				loc.val(loc.val +$(this).val() +"&");
				
			});
			loc.val(loc.val().substring(0, loc.val().length-1));
		});
	});

</script>
</head>
<body>
<div class="headerWrapper">
	<%@include file="sidemenu_memberinfo.jsp" %>
	
	<div class="pageContent">
		<div class="depth">홈 > 회원정보 > 나의 프로필 > 프로필 입력</div>
		<div class="contentDetail" style="min-height: 600px;">
			<div class="centerDiv">
				<h2 class="pageTitle wantedH">프로필</h2>
				<br>
				<br>
				<div class="profileDiv">
					
					<form action="updateprofile.do" method="post">
					<table class="registT table table-bordered normalT">
						<tr>
							<th colspan="2">
								자기소개
							</th>
						</tr>
						<tr>
							<td colspan="2">
								<textarea placeholder="자기소개 내용을 500자 이내로 써주세요." name="intro"></textarea>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								선호지역
							</th>
						</tr>
						<tr>
							<td colspan="2">
								
								선호지역1: <input type="text" name="location1" class="locations"><br>
								선호지역2: <input type="text" name="location2" class="locations"><br>
								선호지역3: <input type="text" name="location3" class="locations"><br>
								선호지역4: <input type="text" name="location4" class="locations"><br>
								선호지역5: <input type="text" name="location5" class="locations">
								<input type="hidden" name="location_able">
								
							</td>
						</tr>

						<tr>
							<td colspan="2"><input type="file" value="프로필 이미지 업로드" style="border: solid 1px lightgray;"/></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" class="btn btn-danger btn-lg" value="프로필 입력"/></td>
						</tr>

					</table>
					</form>
					
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%@include file="footer.jsp"%>