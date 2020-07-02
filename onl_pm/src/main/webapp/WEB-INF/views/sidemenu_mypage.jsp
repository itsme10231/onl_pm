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
					<h4>마이페이지</h4>
				</div>
				<ul class=".flex-sm-column sideUl">
					<li class="nav-item">사람 구해요
						<ul class="nav-item sideUl">
							<li class="nav-item">모집중</li>
							<li class="nav-item">진행중</li>
							<li class="nav-item">완료</li>
						</ul>
					</li>
					<li class="nav-item">지원글 보기
						<ul class="nav-item sideUl">
							<li class="nav-item">모집중</li>
							<li class="nav-item">진행중</li>
							<li class="nav-item">완료</li>
						</ul>
					</li>
					<li class="nav-item">1대1 문의기록

					</li>
					<li class="nav-item">
						<a href="wallet.do">나의 지갑</a>
						<ul class="nav-item sideUl">
							<li class="nav-item">
							<a href='prepaid.do'>예치금 내역</a>
							</li>
							<li class="nav-item">
							<a href='charge.do'>예치금 충전</a>
							</li>
							<li class="nav-item">
							<a href="received.do">지급내역</a>
							</li>
						</ul>
					</li>
					<li class="nav-item">
						내일 캘린더
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>