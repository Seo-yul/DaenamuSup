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
	<link rel="stylesheet" href="css/seoyul_main.css?v=1" type="text/css" media="screen,projection" />
	<link rel="stylesheet" href="css/frame.css?v=1">
	<script src="https://cdn.firebase.com/libs/firebaseui/2.5.1/firebaseui.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
	<script src="js/seoyul_check.js?v=1"></script>
	<script src="js/ie10-viewport-bug-workaround.js "></script>
	<script src="js/frame.js?v=1"></script>
<title>외침을 들어보자</title>
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
		DBCotrolShout dbcs = new DBCotrolShout(1);
		ArrayList<String[]> arrStr = null;
		arrStr = dbcs.getSelect();
		
		int max = arrStr.size();
		int dan = 10;
		if(max>0)dan=10;
		int listNum = (max / dan);
		if(max%dan!=0)listNum+=1;
		int aria = 1;
		int num = 0;
		String a = null;
		String b = null;
		
		
		%>현재 총 외침 수 :
		<%=max%>
		
		
		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane fade in active" id="board">
				<div class="jumbotron send-msg" style="padding: 10px; background-color: #3c763d;">
					<form action="sqlShoutControl2.jsp" method="post">
					<p>
					<input type="submit" class="btn btn-lg btn-success " role="button" style="padding: 8px; margin-top: 10px" value="승인하기">
					</p>
					
																		
								<div class="tab-content">	
						<%
						for (; aria <= listNum; aria++) {
						if (aria == 1) { 
						%>
						<div role="tabpanel" class="tab-pane active" id="shoutlist<%=aria%>">
						
						<%
							} else {	
						%>
						<div role="tabpanel" class="tab-pane" id="shoutlist<%=aria%>">
						<%
							}						
								%>
					<table class="table table-condensed" style="color: #f3f3f3">
					
					<tr>
					<td> #</td>
					<td> 내용</td>
					<td> 체크</td>
					</tr>
					
								<%
								if(max!=0){
									
									for(;num<max-((listNum-aria)*10);num++){
										a=arrStr.get(num)[0];
										a=a.replaceAll("(?i)<script", "&lt;script");
										a=a.replaceAll("(?i)script>", "script&gt;");
										a=a.replaceAll("(?i)<", "&lt;");
										a=a.replaceAll("(?i)>", "&gt;");
										b=arrStr.get(num)[1];
										b=b.replaceAll("(?i)<script", "&lt;script");
										b=b.replaceAll("(?i)script>", "script&gt;");
										b=b.replaceAll("(?i)<", "&lt;");
										b=b.replaceAll("(?i)>", "&gt;");
										%><tr>
										<td>
										<%=a%>
										</td>
										<td>
										<%=b%>
										</td>
										<td>
										<input type="radio" name="checkNum" value="<%=arrStr.get(num)[0]%>">
										</td>
										</tr>
										<%
									}
								}
							 %>
					</table>
								
								
								</div>
								<%} %>
								</div>
								</div>
								
								</form>
								
						<!--nav 목록 밑바닥 -->
						<nav style="text-align: center; margin: 0;">
						<ul class="pagination .pagination-sm">
											<%
						for(int i=1; i<=listNum;i++){
							if(i==1){		%>
						<li role="presentation" class="active">
						<%	}else{%>
						<li role="presentation"><%} %>
						<a href="#shoutlist<%=i%>" aria-controls="#shoutlist<%=i%>" role="tab" data-toggle="tab">
						<%=i%></a></li><% }%>
						</ul>
						</nav>
						</div>				
										
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

