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
</style>
</head>
<body>
	<div class="leftside">
		<div class="wantedDetail" style="margin-top:84px;">
			<ul class=".flex-sm-column sideUl">
				<li class="nav-item">사이드메뉴1
					<ul class="nav-item sideUl">
						<li class="nav-item">하위메뉴1</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>