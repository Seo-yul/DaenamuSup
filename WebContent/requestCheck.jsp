<%@page import="java.util.ArrayList"%>
<%@page import="seoyulpage.DBCotrolToMe"%>
<%@page import="seoyulpage.DBCotrolShout"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Open+Sans|Roboto" >
	<link rel="stylesheet" href="css/seoyul_main.css?v=1" type="text/css"  media="screen,projection" />
	<link rel="stylesheet" href="css/frame.css?v=1">
	<script src="https://cdn.firebase.com/libs/firebaseui/2.5.1/firebaseui.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
	<script src="js/seoyul_check.js?v=1"></script>
	<script src="js/ie10-viewport-bug-workaround.js "></script>
	<script src="js/frame.js?v=1"></script>
<title>요청을 들어보자</title>
</head>
<body>
	<div class="container">
		<div class="header">
			<nav class="navbar navbar-inverse navbar-static-top">
				<div class="navbar-header">

					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#topbar" aria-expanded="false"
					 aria-controls="navbar">
						<span class="sr-only"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>

					<a class="navbar-brand" href="main.jsp" style="color: #f3f3f3; text-decoration: none;">
						<strong>대나무숲</strong>
					</a>

				</div>

				<div role="tabpanel">

					<div id="topbar" class="navbar-collapse collapse pull-right">

						<!-- Nav tabs -->
						<ul class="nav nav-pills pull-right" role="tablist">

							<li role="presentation" class="active" style="margin-left: 10px">
								<a href="main.jsp">Home</a>
							</li>

							<li role="presentation">
								<button disabled class="logout btn btn-primary btn-lg btn-block mdl-button mdl-button--raised" id="quickstart-sign-in" name="signin">나가기</button>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<%
		DBCotrolToMe dbcs = new DBCotrolToMe();
		ArrayList<String[]> arrStr = null;
		arrStr = dbcs.getSelect();
		int i = arrStr.size();
		String a = null;
		String b = null;
		%>
		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane fade in active">
				<div class="jumbotron send-msg" style="padding: 10px; background-color: #3c763d;">
					<form action="sqlShoutControljsp" method="post">
					<table class="table table-condensed">
					<tr>
					<td> #</td>
					<td> 내용</td>
					</tr>
					<%
					if(i!=0){
						for(int num=0;num<i;num++){
							a=arrStr.get(num)[0];
							a=a.replaceAll("(?i)<script", "&lt;script");
							b=arrStr.get(num)[1];
							b=b.replaceAll("(?i)<script", "&lt;script");
							%><tr><td>
							<%=a%></td>
							<td>
							<%=b%>
							</td></tr>
							
							<%
						}
					}
					%>
					</table>
					

<!-- 
						<textarea name="userSendmsg" class="send-msg-in" id="txtDetail" maxlength="495" style="background-color: #f3f3f3bb; margin: 1px; color: #000000; overflow: auto;"></textarea>

						<p>
							<input type="submit" class="btn btn-lg btn-success " role="button" style="padding: 8px; margin-top: 10px" value="승인하기">
						</p>
 -->
					</form>
				</div>
			</div>
		</div>

		<footer class="footer">
			<div style="display: none">
				<button class="mdl-button mdl-js-button mdl-button--raised" disabled id="quickstart-verify-email" name="verify-email">확인</button>
				<span id="quickstart-sign-in-status"></span>
				<code id="quickstart-account-details"></code>
			</div>
			<p>kakao @yul2</p>
		</footer>

	</div>
	<!-- /container -->
</body>
</html>
