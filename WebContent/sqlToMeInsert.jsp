<%@page import="seoyulpage.DBCotrolToMe"%>
<%@page import="seoyulpage.DBCotrolShout"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insertToMe</title>
</head>
<body>


	<%
		request.setCharacterEncoding("UTF-8");
		String method = request.getMethod(); 
		String userSendmsg = null;

		if(method.equalsIgnoreCase("POST")) { 
		userSendmsg = request.getParameter("userSendmsg"); 
		}

		if( userSendmsg == null ) {
		out.println("<script>alert('ERROR...');</script>"); 
		}else{


		DBCotrolToMe dbcs = new DBCotrolToMe();
		dbcs.insertSQL(userSendmsg);
        }
		//dbcs.permitSQL(1);
	%>
	<meta http-equiv='refresh' content='0;url=/main.jsp'>
</body>
</html>
