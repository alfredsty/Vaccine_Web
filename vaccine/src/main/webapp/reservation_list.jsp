<%@page import="DB.DBConnection"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String sql="select resvno, jumin, vcode, hospcode, resvdate, resvtime "
		     +"from TBL_VACCRESV_202108 order by resvno";

   Connection conn = DBConnection.getConnection();
   PreparedStatement ps = conn.prepareStatement(sql);
   ResultSet rs= ps.executeQuery();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>
 <header>
	  <jsp:include page="layout/header.jsp"></jsp:include>
 </header>

 <nav>
   	 <jsp:include page="layout/nav.jsp"></jsp:include>
 </nav>
		
	<section><div class="section">
		<div class="title">예악정보리스트</div>
		<div class="scroll"><table class="table_list">
		 <tr><th>예약번호</th><th>주민번호</th><th>백신코드</th><th>병원코드</th><th>예약날짜</th><th>예약시간</th></tr>
		
		<% while(rs.next()){%>
		<tr>
		  <td><%= rs.getString(1) %></td>
		  <td><%= rs.getString(2) %></td>
		  <td><%= rs.getString(3) %></td>
		  <td><%= rs.getString(4) %></td>
		  <td><%= rs.getString(5) %></td>
		  <td><%= rs.getString(6) %></td>
		
		<%} %>
		</tr></table></div>
	</div></section>
 <footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
 </footer>
</body>
</html>