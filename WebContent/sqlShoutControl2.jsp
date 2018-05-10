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


	<%//관리자가 체크를 해서 db에 승인 해제를 해버림
		request.setCharacterEncoding("UTF-8");
		int checkNumber = Integer.parseInt(request.getParameter("checkNum"));

		DBCotrolShout dbcs = new DBCotrolShout(1);
		//dbcs.deletSQL(checkNumber);
		dbcs.permitSQL(checkNumber);
		out.print(checkNumber);

	%>
	<meta http-equiv='refresh' content='0;url=/shoutCheck.jsp'>
</body>
</html>