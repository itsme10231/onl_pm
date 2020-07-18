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
	
	.sideUl ul{
		font-weight: 300;
		font-size: 15px;
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
					<li class="nav-item"><a href="mywanted.do">사람 구해요</a>
						<ul class="nav-item sideUl">
							<li class="nav-item"><a href="mywanted.do?state=WANTED">모집중</a></li>
							<li class="nav-item"><a href="mywanted.do?state=PROCESS">진행중</a></li>
							<li class="nav-item"><a href="mywanted.do?state=COMPLETE">완료</a></li>
						</ul>
					</li>
					<li class="nav-item"><a href='myapply.do'>지원글 보기</a>
						<ul class="nav-item sideUl">
							<li class="nav-item"><a href='myapply.do?state=WANTED'>모집중</a></li>
							<li class="nav-item"><a href='myapply.do?state=PROCESS'>진행중</a></li>
							<li class="nav-item"><a href='myapply.do?state=COMPLETE'>완료</a></li>
						</ul>
					</li>
					<li class="nav-item"><a href='mychat.do'>1대1 문의기록</a>

					</li>
					<li class="nav-item"><a href="myreview.do">후기</a>
						<ul class="nav-item sideUl">
							<li class="nav-item">
							<a href="myreview.do?type=0">내가 쓴 후기</a>
							</li>
							<li class="nav-item">
							<a href="myreview.do?type=1">내가 받은 후기</a>
							</li>
						</ul>
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
					<li class="nav-item"><a href='userlist.do'>유저리스트</a>
						<ul class="nav-item sideUl">
							<li class="nav-item"><a href='userlist.do?type=B'>블랙리스트</a></li>
							<li class="nav-item"><a href='userlist.do?type=W'>화이트리스트</a></li>
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