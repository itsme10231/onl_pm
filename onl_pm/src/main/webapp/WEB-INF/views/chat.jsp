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
		var sendMsg = {type:"enter", receive_id: "K6"};
		sock.send(JSON.stringify(sendMsg));

	    $('#console').append('websocket opened' + '<br>');
	};
	
	sock.onmessage = function(message) {
	    $('#console').append('receive message : ' + message.data + '<br>');
	};
	
	sock.onclose = function(event) {
	    $('#console').append('websocket closed : ' + event);
	};
	
	sock.onerror = function(event) {
		$("#console").append('websocket error :' + event);
	}
	
	function messageSend() {
// 		JSON.stringify();
	    sock.send($('#message').val());
	    $("#console").append($("#message").val());
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