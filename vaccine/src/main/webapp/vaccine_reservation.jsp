<%@page import="DB.DBConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
   
    String sql =" select max(RESVNO) from TBL_VACCRESV_202108 " ;                                                  
    
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();
    
    rs.next();
	int num = rs.getInt(1)+1;
        
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript">
	function remove() {
		alert("정보를 지우고 다시 입력합니다.");
		document.rData.reset();
		rData.rNum.focus();
	}
	
	function checkVal(){
		if(!document.rData.rNum.value){
			alert("예약번호가 입력되지 않았습니다.");
			rData.rNum.focus();
			return false;
		}else if(!document.rData.jNum.value){
			alert("주민번호가 입력되지 않았습니다.");
			rData.jNum.focus();
			return false;
		}
		else if(!document.rData.vCode.value){
			alert("백신코드가 입력되지 않았습니다.");
					return false;
		}
		else if(!document.rData.hCode.value){
			alert("병원코드가 입력되지 않았습니다.");
					return false;
		}
		else if(!document.rData.rDate.value){
			alert("예약날짜가 입력되지 않았습니다.");
			rData.rDate.focus();
			return false;
		}
		else if(!document.rData.rTime.value){
			alert("예약시간이 입력되지 않았습니다.");
			rData.rTime.focus();
			return false;
		}
	}
	
</script>
</head>
<body>
	<header>
	  <jsp:include page="layout/header.jsp"></jsp:include>
 </header>

 <nav>
   	 <jsp:include page="layout/nav.jsp"></jsp:include>
 </nav>
	<section>	<div class="section">
		<div class="title">백신예약</div>
		<div>
			<form name="rData" method="post" action="insert_reservation.jsp" onsubmit="return checkVal()">
			<table class="table_list">
				<tr>
					<th>예약번호</th>
					<td><input type="text" name="rNum" readonly="readonly" value="<%=num%>"> 예)20210011</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="jNum"> 예)790101-1111111</td>
				</tr>
				<tr>
					<th>백신코드</th>
					<td>
					<select name="vCode">
						<option value="">백신선택</option>
						<option value="V001">A백신</option>
						<option value="V002">B백신</option>
						<option value="V003">C백신</option>
					</select>
					 예)V001, V002, V003</td>
				</tr>
				<tr>
					<th>병원코드</th>
					<td>
					<label><input type="radio" name="hCode" value="H001">가_병원</label>
					<label><input type="radio" name="hCode" value="H002">나_병원</label>
					<label><input type="radio" name="hCode" value="H003">다_병원</label>
					<label><input type="radio" name="hCode" value="H004">라_병원</label>
					 예)H001, H002, H003, H004</td>
				</tr>
				<tr>
					<th>병원코드</th>
					<td>
					<label><input type="checkbox" name="hCode" value="H001">가_병원</label>
					<label><input type="checkbox" name="hCode" value="H002">나_병원</label>
					<label><input type="checkbox" name="hCode" value="H003">다_병원</label>
					<label><input type="checkbox" name="hCode" value="H004">라_병원</label>
					 예)H001, H002, H003, H004</td>
				</tr>
				<tr>
					<th>예약날짜</th>
					<td><input type="text" name="rDate"> 예)20210101</td>
				</tr>
				<tr>
					<th>예약시간</th>
					<td><input type="text" name="rTime"> 예)0930, 1130</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="등록">
						<input type="button" value="취소" onclick="remove()">
					</th>
				</tr>
			</table>
			</form>
		</div>
	</div></section>
 <footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>	
</body>
</html>