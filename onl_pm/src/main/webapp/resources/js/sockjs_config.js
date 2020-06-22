	var sock = new SockJS('echo');

	sock.onopen = function() {
		var sendMsg = {type:"enter", receive_id: "${wlist[0}.id"};
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
		var sendMsg = {type:"msg", receive_id: "${wlist[0].id}", msg:$('#message').val()};
	    sock.send(JSON.stringify(sendMsg));
	    $("#console").append($("#message").val() +"<br/>");
	    $("#message").val("");
	}