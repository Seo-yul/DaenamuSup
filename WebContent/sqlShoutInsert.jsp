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
		String userSendmsg = null;
        String method = request.getMethod(); 
        

        if(method.equalsIgnoreCase("POST")) { 
        userSendmsg = request.getParameter("userSendmsg"); 
        

        if( userSendmsg == null ) {
        out.println("<script>alert('어딜!?');</script>"); 
        }else if(4<userSendmsg.length()){
		DBCotrolShout dbcs = new DBCotrolShout();
		dbcs.insertSQL(userSendmsg);
        out.println("<script>alert('외치기 성공!');</script>");
        }else{
        out.println("<script>alert('에러');</script>");
        }
        }else{
        out.println("<script>alert('뭐냐?');</script>");
        }

		//dbcs.permitSQL(2);
	%>
	<meta http-equiv='refresh' content='0;url=/shout.html'>
</body>
</html>
