<%@include file="header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>

<script type="text/javascript" src="resources/js/sockjs.js"></script>



<script type="text/javascript">

	var sock = new SockJS('echo');

	sock.onopen = function() {
		var sendMsg = {type:"enter", receive_id: "${param.receive_id}"};
		sock.send(JSON.stringify(sendMsg));

	    $('#console').append('websocket opened' + '<br>');
	};
	
	sock.onmessage = function(message) {
	    $('#console').append('receive message : ' + message.data + '<br>');
	};
	
	sock.onclose = function(event) {
	    $('#console').append('연결이 끊겼습니다.');
	};
	
	sock.onerror = function(event) {
		$("#console").append('websocket error :' + event);
	}
	
	function messageSend() {
// 		JSON.stringify();
		var sendMsg = {type:"msg", receive_id: "${param.receive_id}", msg:$('#message').val()};
	    sock.send(JSON.stringify(sendMsg));
	    $("#console").append($("#message").val() +"<br/>");
	    $("#message").val("");
	}

</script>


</head>
<body>
<h1>CHAT</h1>
<input type="text" id="message" />

<input type="button" value="전송" onclick="messageSend();" />

<div id="console">
</div>


</body>
</html>
<%@include file="footer.jsp"%>