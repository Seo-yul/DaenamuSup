<%@page isErrorPage="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setStatus(200);
%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Open+Sans|Roboto">
<link rel="stylesheet" href="css/seoyul_main.css?ver=1" type="text/css" media="screen,projection" />
<link rel="stylesheet" href="css/frame.css?ver=1">
<title>대나무숲 에러</title>
</head>

<body>
	<div class="container">
		<!-- Tab panes -->
		<div class="tab-content">
			<div class="jumbotron send-msg"
				style="padding: 10px; background-color: #3c763d;">
				<p>에러에 접근! 죄송합니다. 수정중입니다!<br><%=exception.getClass().getName()%></p>
				<img alt="construction" src="images/error.png"
					style="max-width: 100%; height: auto;">
			</div>
		</div>

		<footer class="footer">

			<p>kakao @yul2</p>
		</footer>

	</div>
	<!-- /container -->
</body>

</html>