<%@page import="domain.ListInfos"%>
<%@page import="java.util.Iterator"%>
<%@page import="domain.UseHistoryVO"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
ListInfos list = (ListInfos) request.getAttribute("list");
Collection<UseHistoryVO> goList = list.getGoList();
Collection<UseHistoryVO> backList = list.getBackList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용내역</title>
<link rel="stylesheet" type="text/css" href="views/style.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
</head>

<body class="page04">
	<div class="d01 pd16">
		<div class="tC title">
			<h2>이용내역</h2>
		</div>
		<ul class="ulFl school">
			<li class="on">등교</li>
			<li>하교</li>
		</ul>
	</div>

	<ul class="list pd16">
		<c:forEach var= "aList" items="${list.goList}">
  
         <li>
                <div class="fL">
                    <strong>${aList.start} ~ ${aList.end}</strong><br>
                    <span>${aList.bpdate}</span>
                </div>
                <div class="fR">
                    <span>2022. 02. 18</span><br>
                    <b>${aList.status}</b>
                </div>
            </li>
     </c:forEach>


	</ul>

	<ul class="list pd16">
		<c:forEach var= "aList" items="${list.goList}">
  
         <li>
                <div class="fL">
                    <strong>${aList.end} ~ ${aList.start}</strong><br>
                    <span>${aList.bpdate}</span>
                </div>
                <div class="fR">
                    <span>2022. 02. 18</span><br>
                    <b>${aList.status}</b>
                </div>
            </li>
     </c:forEach>


	</ul>


	<div class="FAB">
		<ul class="ulFl">
			<li><a href="Mypage"><img src="views/img/ico01.png">
				<p>내정보</p></a></li>
			<li><a href="bus.jsp"><img src="views/img/ico02.png">
				<p>버스탑승</p></a></li>
			<li class="on"><a href="list.jsp"><img
					src="views/img/ico03_on.png">
				<p>이용내역</p></a></li>
		</ul>
	</div>
</body>
</html>
