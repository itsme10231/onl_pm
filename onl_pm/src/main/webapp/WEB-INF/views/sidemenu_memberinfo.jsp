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
	.nav_item{

	}
	
	.sideUl{
		list-style: none;
		padding: 5px;
/* 		border: 1px solid red; */
		font-weight: 500;
		font-size: 18px;
	}
	

	.sideUl li{
		padding: 10px;
	}
	
	.sideTitle{
		
		border-bottom: 1px solid lightgray;
		width: 100%;
		margin-bottom: 30px;
	}
</style>
</head>
<body>
	<div class="leftside">
		<div class="sidewrapper">
			<div class="contentDetail" style="margin-top:84px;">
				<div class="sideTitle">
					<h4>회원정보</h4>
				</div>
				<ul class=".flex-sm-column sideUl">
					<li class="nav-item"><a href='myinfo.do'>나의 정보</a>

					</li>
					<li class="nav-item"><a href='myprofile.do'>프로필 관리</a>

					</li>
					<li class="nav-item"><a href="myaccount.do">등록계좌관리</a>

					</li>
					<li class="nav-item"><a href='mywishlist.do'>내가 찜한 글</a>

					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>