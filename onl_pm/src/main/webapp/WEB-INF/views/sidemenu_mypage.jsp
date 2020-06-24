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
		border: 1px solid red;
		font-weight: 500;
		font-size: 18px;
	}
	
	.contentDetail{
 		border: solid lightgray 1px;

		margin: 0 auto;
		padding: 20px;

		background-color: white;
		
		margin-bottom: 50px;
		
		-webkit-box-shadow:  0px 1px 1px 0px rgba(0,0,0,0.1);
		-moz-box-shadow:  0px 1px 1px 0px rgba(0,0,0,0.1);
		box-shadow:  0px 1px 1px 0px rgba(0,0,0,0.1);
	}
</style>
</head>
<body>
	<div class="leftside">
		<div class="contentDetail" style="margin-top:84px;">
			<div class="sideTitle">
				<h4>-마이페이지</h4>
			</div>
			<ul class=".flex-sm-column sideUl">
				<li class="nav-item">사이드메뉴1
					<ul class="nav-item sideUl">
						<li class="nav-item">하위메뉴1</li>
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
			</ul>
		</div>
	</div>
</body>
</html>