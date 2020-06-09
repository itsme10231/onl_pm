<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$(function(){
	
	$(".addWish").on("click", function(){
		var seq = $(this).find("input[name='seq']").val();
		$.ajax({
			url: "addwish.do",
			method: "post",
			data: seq,
			dataType: "text",
			success: function(log){
				
			},
			fail: function(log){
				
			}
			
		});
		
	});
	
	
	
});


</script>
</head>
<body>

</body>
</html>