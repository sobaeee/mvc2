<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	
	String cookieId = "";
	String cookiePw = "";
	
	for(Cookie cookie : cookies){
		if("chkId".equals(cookie.getName())){
			cookieId = cookie.getValue();
		}
		if("chkPw".equals(cookie.getName())){
			cookiePw = cookie.getValue();
		}
	}
	
%>
<!DOCTYPE html>
<!-- 쿼리로 만든 쿠키 기록 남기기 -->
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
  <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
  <title>로그인</title>
  <link rel="stylesheet" type="text/css" href="views/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body class="page01 tC">
    <div class="mXY">
        <img src="views/img/logo.png">

        <div class="a01">
        	<form method="post" action="">
            	<div><span>ID</span><input type="text" name="uid" value="<%=cookieId %>"></div>
            	<div><span>PW</span><input type="password" name="upw" value="<%=cookiePw %>"></div>
            	<input type="checkbox" name="saveId" value="save" <%="".equals(cookieId)?"":"checked" %>><span>아이디/비밀번호 저장</span>
            	<div style="clear:both;"></div>
            	<button>Log in</button>
       		</form>
        </div>

        <div class="cscenter">
            <a href="Join01">회원가입</a>
        </div>
    </div>
<script>
//$("input[type=checkbox]") => checkbox가 하나라서 가능함. 
	$(document).ready(function(){
		$("input[type=checkbox]").on("click", function(){
			if($("input[type=checkbox]").is(":checked")){
				alert("공공장소에서는 사용하지 마세요.");
			}
		});
	});  
</script>
</body>
</html>
