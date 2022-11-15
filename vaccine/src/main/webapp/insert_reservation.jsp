<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    String sql = "INSERT INTO TBL_VACCRESV_202108 VALUES(?,?,?,?,?,?)";
    
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement(sql);
    
    request.setCharacterEncoding("UTF-8");
    
    ps.setString(1, request.getParameter("rNum"));
    ps.setString(2, request.getParameter("jNum"));
    ps.setString(3, request.getParameter("hCode"));
   	ps.setString(4, request.getParameter("rDate"));
    ps.setString(5, request.getParameter("rTime"));
    ps.setString(6, request.getParameter("vCode"));
    
    ps.executeUpdate();
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>