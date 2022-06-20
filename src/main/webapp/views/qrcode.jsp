<%@page import="java.util.Date"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.font.ImageGraphicAttribute"%>
<%@page import="com.google.zxing.client.j2se.MatrixToImageWriter"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.google.zxing.BarcodeFormat"%>
<%@page import="com.google.zxing.common.BitMatrix"%>
<%@page import="com.google.zxing.qrcode.QRCodeWriter"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QR코드 확인</title>
<link rel="stylesheet" type="text/css" href="views/style.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
</head>

<body class="page05 tC">
	<div class="mXY">
		<div class="qrcode">
			<div class="qrimg" style="padding: 0">
				<%
				String savedFileName = "";
				String qrMsg = new Date().toString();//"{'name':'이지미'}";
				//한글깨짐 방지
				String data = new String(qrMsg.getBytes("UTF-8"), "ISO-8859-1");

				//파일 만들기
				File path = new File(application.getRealPath("/") + "garam/qrImages/");
				savedFileName = UUID.randomUUID().toString().replace("-", "");

				//폴더생성
				if (!path.exists())
					path.mkdirs(); //A파일만 만들땐 mkdir. A/B/C 파일 안의 파일을 만들땐 mkdirs.

				//폴더 위치 : D:\SmartLab\workspace\jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPStudy\garam\qrImages

				//폴더 속 파일삭제
				File[] delFile = path.listFiles();
				for (int i = 0; i < delFile.length; i++) {
					delFile[i].delete();
				}

				//QR 이미지 만들기. lib 안에 QR코드 생성 jar를 넣어야 사용가능.
				QRCodeWriter writer = new QRCodeWriter();
				BitMatrix qrCode = writer.encode(data, BarcodeFormat.QR_CODE, 200, 200);

				BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(qrCode);
				File file = new File(path, savedFileName + ".png");
				ImageIO.write(qrImage, "PNG", file);
				%>
				<img
					src="<%=request.getContextPath() + "/garam/qrImages/" + savedFileName + ".png"%>">
				<!-- 사이사이 / 중요하다. 경로 확인 잘하기. -->
			</div>
			<span>잔여횟수</span>
			<div class="count">
				<b id="txtHint"><c:out value="${vo.coupon}"></c:out></b>회
			</div>
		</div>
		<img src="views/img/logo_bt.png" class="mt40">
	</div>

	<div class="FAB">
		<ul class="ulFl">
			<li><a href="Mypage"><img src="views/img/ico01.png">
					<p>내정보</p></a></li>
			<li class="on"><a href="02_bus.jsp"><img
					src="views/img/ico02_on.png">
					<p>버스탑승</p></a></li>
			<li><a href="List"><img src="views/img/ico03.png">
					<p>이용내역</p></a></li>
		</ul>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		setTimeout(function coupon() {
			//jQuery ajax를 이용해서 실행.
			$.ajax({
				url : "Coupon", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				//data : {name : "홍길동"}, // HTTP 요청과 함께 서버로 보낼 데이터 
				method : "GET", // HTTP 요청 메소드(GET, POST 등) 
				dataType : "text" // 서버에서 보내줄 데이터의 타입 
			})
			// HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. 
			.done(function(text) {
				$("#txtHint").text(text);
			})
			// HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) {
				$("#txtHint").text("오류가 발생했다.");
			})
			// 
			.always(function(xhr, status) {
				//$("#textHint").html("요청이 완료되었습니다!");
			});

			setTimeout(coupon, 1000);
		}, 1000);
	</script>
</body>
</html>
<%
//file.delete();
%>