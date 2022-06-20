<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 자바스크립트로 만든 쿠키 기록 남기기 -->
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
            	<div><span>ID</span><input type="text" name="uid" value=""></div>
            	<div><span>PW</span><input type="password" name="upw" value=""></div>
            	<input type="checkbox" name="saveId" id="saveId" value="save"><span>아이디/비밀번호 저장</span>
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
		
		//쿠키 만들기
		//document.cookie = "chkId=" + encodeURIComponent("한글");
		//encodeURIComponent => 한글을 URI로 인코딩시킴
		
		//alert(document.cookie);
		//console.log(document.cookie.split('=')[1]);
		console.log(document.cookie.split('=')[1]);
		$('input[name=uid]').val(document.cookie.split('=')[1]);
		
		if(document.cookie.split('=')[1] != undefined && document.cookie.split('=')[1] != ""){
			$('#saveId').prop("checked", true);
		}
		
		$("input[type=checkbox]").on("click", function(){
			if($("input[type=checkbox]").is(":checked")){
				alert("공공장소에서는 사용하지 마세요.");
				
				let saveId = $("input[name=uid]").val();
				let expires = new Date(Date.now()+((60*60*24)*1000));
				
				document.cookie =  "chkId="+saveId+"; path=/; expires=" + expires;
			} else {
				document.cookie =  "chkId=; path=/; expires=-1";
			}
		});
	});  
</script>
</body>
</html>
