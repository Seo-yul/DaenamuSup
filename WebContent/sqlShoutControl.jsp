<%@page import="seoyulpage.DBCotrolShout"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insertShout</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String userSendmsg = request.getParameter("userSendmsg");
		DBCotrolShout dbcs = new DBCotrolShout();
		dbcs.insertSQL(userSendmsg);
		//dbcs.permitSQL(2);
	%>
	<script type="text/javascript"></script>
	<meta http-equiv='refresh' content='0;url=/shout.html'>
</body>
</html>
