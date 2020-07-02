<%@include file="WEB-INF/views/header.jsp" %>
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
/* 	body{ */
/* 		background-color: snow; */
/* 	} */
</style>
<script type="text/javascript">
	$(function(){
		var msg = "${msg}";
		if(msg!=null && msg!=""){
			alert(msg);
		}
	});


</script>
</head>
<body>
	<div class="headerwrapper">
		<div class="contentDetail" style="min-height: 1000px;">
			<div class="centerDiv">
				INDEX
			</div>
		</div>
	</div>
</body>
</html>
<%@include file="WEB-INF/views/footer.jsp"%>