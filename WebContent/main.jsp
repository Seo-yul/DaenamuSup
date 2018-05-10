<%@page import="java.util.ArrayList"%>
	<%@page import="seoyulpage.DBCotrolShout"%>
		<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page errorPage="iAmSorry.jsp" %>
			<!DOCTYPE html>
			<html lang="ko">

			<head>
				<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
				<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
				<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
				<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Open+Sans|Roboto" >
				<link rel="stylesheet" href="css/seoyul_main.css?v=1" type="text/css"  media="screen,projection" />
				<link rel="stylesheet" href="css/frame.css?v=1">
				<script src="https://cdn.firebase.com/libs/firebaseui/2.5.1/firebaseui.js"></script>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
				<script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
				<script src="js/ie10-viewport-bug-workaround.js "></script>
				<script src="js/seoyul_main.js?v=1"></script>
				<script src="js/frame.js?v=1"></script>
				
				<title>마스터이야기</title>
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
									<span class="icon-bar"></span>
								</button>

								<a class="navbar-brand" href="main.jsp" style="color: #f3f3f3; text-decoration: none;">
									<strong>마스터 이야기 </strong>
								</a>

							</div>

							<div role="tabpanel">

								<div id="topbar" class="navbar-collapse collapse pull-right">
									<!-- Nav tabs -->
									<ul class="nav nav-pills pull-right" role="tablist">

										<li role="presentation" class="active" style="margin-left: 10px">
											<a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a>
										</li>
										<li role="presentation">
											<a href="#board" aria-controls="board" role="tab" data-toggle="tab">게시판</a>
										</li>
										<li role="presentation">
											<a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">문의하기</a>
										</li>
										<li role="presentation">
											<button disabled class="logout btn btn-primary btn-lg btn-block mdl-button mdl-button--raised" id="quickstart-sign-in" name="signin">나가기</button>
										</li>
									</ul>
								</div>
							</div>
						</nav>
					</div>
					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="home">
							<div class="jumbotron ">
								<div style="font-size: 39px;">
									<strong>환영합니다.</strong>
								</div>

								<p class="lead " style="color: #3a6144">
                                이곳은 익명으로 이야기 하는<br> 공간입니다.
                                <div style="font-size: 14px">*인물 저격, 정치, 비방 등 분쟁의<br>여지가 있는 글은 필터링 됩니다.</div>
                                <div style="font-size: 11px">*xss등 악의적인 공격행위을 하는 경우<br>저를 경찰서에서 만나실 수 있습니다.</div>
								</p>
								<p>
									<a class="btn btn-lg btn-success " href="shout.html" role="button " style="padding: 8px">작성하기</a>
								</p>
							</div>

							<div class="row marketing " style="padding: 0 5px 0">
								<div class="col-lg-6 ">


									<h4>
										<strong>공지사항</strong>
									</h4>
									<p>
										<!-- 공지콜 -->
										방문해주셔서 감사합니다!!
										<br> 사이트 관련 모든 부분에서 의견을 받고 있습니다.
										<br> 우측상단 문의하기를 이용해주세요~
										<br>
										<br> [4월 28일] 제2회 정보처리기사 필기 시험
										<br> [5월 25일] 제1회 정보처리기사 실기 발표
										<br>

									</p>
									<iframe width="200" height="80" src="https://vclock.kr/embed/timer/#date=2018-12-28T18:00:00&title=35%EA%B8%B0+%EC%88%98%EB%A3%8C%EA%B9%8C%EC%A7%80&theme=0&ampm=1"
									 frameborder="0" allowfullscreen></iframe>
								</div>
								<%
						DBCotrolShout dbcs = new DBCotrolShout();
						String[] str = new String[3];
						String[] str1 = new String[3];
						String[] str2 = new String[3];
						//dbcs.selectTopSQL();
						//dbcs.allSelctSQL();
						str = dbcs.selectSQL(dbcs.getTop(0));
						str[1] =str[1].replaceAll("(?i)<script", "&lt;script");
                            str[1] =str[1].replaceAll("(?i)>", "&gt;");
						str[2] = (String)str[2].substring(0, 16);
						str1 = dbcs.selectSQL(dbcs.getTop(1));
						str1[1] =str1[1].replaceAll("(?i)<script", "&lt;script");
                            str1[1] =str1[1].replaceAll("(?i)>", "&gt;");
						str1[2] = (String)str1[2].substring(0, 16);
						str2 = dbcs.selectSQL(dbcs.getTop(2));
						str2[1] =str2[1].replaceAll("(?i)<script", "&lt;script");
                        str2[1] =str2[1].replaceAll("(?i)>", "&gt;");    
						str2[2] = (String)str2[2].substring(0, 16);
					%>
									<div class="col-lg-6 ">
										<h4>
											<%=str[2]%>
										</h4>
										<p>
											<pre><%=str[1]%></pre>
										</p>

										<h4>
											<%=str1[2]%>
										</h4>
										<p>
											<pre><%=str1[1]%></pre>
										</p>

										<h4>
											<%=str2[2]%>
										</h4>
										<p>
											<pre><%=str2[1]%></pre>
										</p>
									</div>
							</div>
						</div>
						<%
				
				ArrayList<String[]> arrStr = null;
				//String[] strAll = new String[2];
				arrStr = dbcs.getSelect();
				//arrStr.add(0, strAll);
				String shoutDay = null;
				String shoutDetail = null;
                String shoutNumber = null;
				int max = arrStr.size();
                int nam = max%6;
                boolean fst = true;
				int listNum = (max / 6);
                
				if(max%6!=0)listNum+=1;
				int aria = 1;

				int outputList = 0; //왼
				if(max!=0){
			%>
							<div role="tabpanel" class="tab-pane fade" id="board">
								<div class="row marketing " style="margin: 0;">
									<!--게시판 출력-->
									<div class="tab-content">
								<%
									for (; aria <= listNum; aria++) {
                                    if(aria==9)break;
										int tmp = 0;
										
										if (aria == 1) {
										
								%>
									<div role="tabpanel" class="tab-pane active" id="boardlist<%=aria%>">
								<%	}else{	%>
									<div role="tabpanel" class="tab-pane" id="boardlist<%=aria%>">
								<%	}	%>
									
								<%  
									for(;outputList<max-((listNum-aria)*6);outputList++){
										
										shoutDetail = arrStr.get(outputList)[1];
                                        shoutDetail=shoutDetail.replaceAll("(?i)<script", "&lt;script");
                                        shoutDetail=shoutDetail.replaceAll("(?i)script>", "script&gt;");   
										shoutDay = arrStr.get(outputList)[2].substring(0, 16);
                                        shoutNumber = arrStr.get(outputList)[0];
                                        
                                        if(tmp==0){
                                %>
                                <div class="col-lg-6 " style="text-align: center">
                                <%}if(tmp==3){%>
                                </div><div class="col-lg-6 " style="text-align: center">
                                <%}  tmp ++;%>
									<h4>#<%=shoutNumber%> &nbsp;<%=shoutDay%></h4>
									<p><pre><%=shoutDetail%></pre></p>
									<hr style="margin: 0;">
								<% 											} %>
									</div>
									</div>
																<% } %>
									</div>
									</div>
									<!--게시판 출력끝-->

									<!--nav 목록 밑바닥 -->
									<nav style="text-align: center; margin: 0;">
										<ul class="pagination .pagination-sm">
											<%
						for(int i =1; i<=listNum;i++){if(i==9)break;
							if(i==1){
							%>
												<li role="presentation" class="active">
													<%
							}else{%>
														<li role="presentation">
															<%
								
							}
						%>
																<a href="#boardlist<%=i%>" aria-controls="#boardlist<%=i%>" role="tab" data-toggle="tab">
																	<%=i%>
																</a>
														</li>
														<%} }%>
										</ul>
									</nav>
								</div>
							<div role="tabpanel" class="tab-pane fade page3rd" id="messages">
							<div class="send-msg">
							<form action="sqlToMeInsert.jsp" method="post">
							<p>
												사이트에 관하여 발견한 오류, 건의사항 등 하고싶은 말씀을 운영자에게 보내주세요!
												<br>답변 원하신다면 이메일을 적어주세요.

												<textarea name="userSendmsg" class="send-msg-in" maxlength="960" style="margin: 5px; color: #000000; overflow: auto;">답변받을 이메일 주소:</textarea>

											</p>
											<input type="submit" class="btn btn-lg btn-success " role="button " style="padding: 8px; margin-left: 46%" value="보내기">
										</form>
									</div>
								</div>
							</div>

							<footer class="footer">
                                <p>kakao @yul2</p>
                                
								<!-- 로그인 상태 컨트롤 -->
								<div style="display: none">
									<button class="mdl-button mdl-js-button mdl-button--raised" disabled id="quickstart-verify-email" name="verify-email">Verification</button>
									<div class="quickstart-user-details-container">
										Firebase sign-in status:
										<span id="quickstart-sign-in-status">Unknown</span>
										<div>Firebase auth
											<code>currentUser</code> object value:</div>
										<pre><code id="quickstart-account-details">null</code></pre>
									</div>
								</div>
								<!-- 로그인 상태 컨트롤-->
							</footer>

					</div>
				</div>
				<!-- /container -->
			</body>

			</html>

