<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<a id="kakao-login-btn"></a>
<h2>JSON 파싱</h2>
<p id="demo"></p>
<script type="text/javascript">
  // input your appkey
  Kakao.init('4256f43891c9d18b2a718ee8751b2b5a')
  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function(res) {
        	document.getElementById("demo").innerHTML=res.id+","+res.connected_at+","+res.properties['nickname']
//         	document.getElementById("demo").innerHTML=res.profile_image+","+res.thumbnail_image
//         	document.getElementById("demo").innerHTML=res.kakao_account.profile.nickname
// 			document.getElementById("demo").innerHTML=res.properties.kaccount_email
        	alert(JSON.stringify(res))
//           alert(JSON.stringify(res))
        },
        fail: function(error) {
          alert(
            'login success, but failed to request user information: ' +
              JSON.stringify(error)
          )
        },
      })
    },
    fail: function(err) {
      alert('failed to login: ' + JSON.stringify(err))
    },
  })

</script>
</body>
</html>