# Vaccine_Web
# 정보처리 산업기사(예비 문제)

## Q.문제 1번 페이지는 몇개를 생성해야 할까?
A.총10개 뷰 페이지 8개 백그라운드 페이지 2개. 

* header,nav,section,footer,index.jsp (view)
<img src="https://user-images.githubusercontent.com/102125786/201573411-acfee07c-967c-4a7b-93f0-e2b496068b75.png">

 * reservation.jsp (view) / reservation_p.jsp (back)
<img src="https://user-images.githubusercontent.com/102125786/201575170-6f1977f4-acca-41e8-b6d9-f5b6c86de94f.png">

* inquiry.jsp (view) 
<img src="https://user-images.githubusercontent.com/102125786/201575191-77183b2c-63a4-4be4-8b2a-18818d9b2dfb.png">

* inquiry_p.jsp (back)
<img src="https://user-images.githubusercontent.com/102125786/201575219-528c1fe2-c4e8-4044-bbdf-7e09de76674b.png"> 
<img src="(https://user-images.githubusercontent.com/102125786/201575238-90398b01-aa7c-4382-9ca9-19d2e8387088.png"> 

* result.jsp (view)
<img src="https://user-images.githubusercontent.com/102125786/201575252-60e6d12e-f6c7-4ed0-a025-2a61f3e21415.png"> 


## 문제2 테이블 생성

* TBL_JUMIN_202108
<img src="https://user-images.githubusercontent.com/102125786/201573900-b7d139b3-a57a-40e2-9602-6848074d12de.png">

* TBL_HOSP_202108
<img src="https://user-images.githubusercontent.com/102125786/201573997-ea3f1a35-e524-409b-bae9-d50a2c5e89b2.png">

* TBL_VACCRESC_202108
<img src="https://user-images.githubusercontent.com/102125786/201574011-826114a7-047c-4c84-b025-b77c1bfd76b4.png">

# 기능 설명

## reservation.jsp

![image](https://user-images.githubusercontent.com/102028778/201931947-23f62792-c13a-413a-aae0-5eaeba4cb0a8.png)

### 회원번호 자동발생 코드

```java
<%
    
   
    String sql =" select max(RESVNO) from TBL_VACCRESV_202108 " ;                                                  
    
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();
    
    rs.next();
	int num = rs.getInt(1)+1;
        
    %>
```

### 유효성검사

```javascript
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

```javascript
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
```

## insert_reservation.jsp

### 파라미터값 받아서 데이터베이스에 INSERT하기

```javascript

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


```

### 동작 끝난 다음에 보여줄 페이지

```javascript

<jsp:forward page="index.jsp"></jsp:forward>

```

## search_reservation.jsp

### 조회페이지 유효성검사 

```javasciprt

<script type="text/javascript">
	function checkValue2() {
		if(!document.sData.rNum.value) {
			alert("회원번호를 입력하세요.");
			sData.rNum.focus();
			return false;
		} 
		return true;}
</script>

```

### 페이지 내 테이블 생성

```javascript

<header>
	  <jsp:include page="layout/header.jsp"></jsp:include>
 </header>

 <nav>
   	 <jsp:include page="layout/nav.jsp"></jsp:include>
 </nav>
		
 <section>
	<div class="section">
		<div class="title">백신예약조회</div>
		<div>
		<form name="sData" action="search_reservation_table.jsp" method="post" onsubmit="return checkValue2()">
			<table class="table_list">
				<tr>
					<th>예약번호</th>
					<td><input type="text" name="rNum"></td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="btn_st" type="submit" value="조회하기">
						<input class="btn_st" type="button" value="홈으로" onclick="location.href='index.jsp'">
					</th>
				</tr>
			</table>
		</form>
		</div>
	</div>
 </section>	
 <footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
 </footer>	

```

## search_reservation_table.jsp

### 테이블에서 값을 불러와 select문으로 데이터값 가져오기

```javascript

<%
    
    int rNo = Integer.parseInt(request.getParameter("rNum"));
    
    StringBuffer sb = new StringBuffer();
    
    sb.append(" select v.RESVNO                                                                 ")
    .append(" ,j.NAME                                                                       ")
    .append(" ,case substr(v.jumin, 8, 1)                                                   ")
    .append(" 	when '1' then '남'                                                          ")
    .append(" 	when '2' then '여'                                                          ")
    .append(" end as gender                                                                 ")
    .append(" ,case v.HOSPCODE                                                              ")
    .append(" 	when 'H001' then '가_병원'                                                    ")
    .append(" 	when 'H002' then '나_병원'                                                    ")
    .append(" 	when 'H003' then '다_병원'                                                    ")
    .append(" 	when 'H004' then '라_병원'                                                    ")
    .append(" end as hospcode                                                               ")
    .append(" ,to_char(v.RESVDATE,'yyyy\"년\"mm\"월\"dd\"일\"') as  RESVDATE                  ")
    .append(" ,substr(to_char(v.RESVTIME, 'FM0000'),1,2)                                      ")
    .append(" 	|| ':' || substr(to_char(v.RESVTIME, 'FM0000'),3,2) as RESVTIME               ")
    .append(" ,case VCODE                                                                     ")
    .append(" 	when 'V001' then 'A백신'                                                      ")
    .append(" 	when 'V002' then 'B백신'                                                      ")
    .append(" 	when 'V003' then 'C백신'                                                      ")
    .append(" end as vcode                                                                    ")
    .append(" ,case h.HOSPADDR                                                                ")
    .append(" 	when '10' then '서울'                                                         ")
    .append(" 	when '20' then '대전'                                                         ")
    .append(" 	when '30' then '대구'                                                         ")
    .append(" 	when '40' then '광주'                                                         ")
    .append(" end as HOSPADDR                                                                 ")
    .append(" from TBL_VACCRESV_202108 v, TBL_JUMIN_202108 j, TBL_HOSP_202108 h               ")
    .append(" where v.JUMIN = j.JUMIN and v.hospcode = h.hospcode                             ")
    .append(" and v.RESVNO =").append(rNo);
    
    
    String sql = sb.toString();
    
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();   
    
    %>

```

### 예약조회 테이블 생성

```javascript

<div class="section">
		<div class="title">예약번호 <%=rNo %>님의 예약조회</div>
		<div>
		 <%if(rs.next()){ %>
			<table class="table_list align_center">
				<tr>
					<th>예약번호</th>
					<th>성명</th>
					<th>성별</th>
					<th>병원이름</th>
					<th>예약날짜</th>
					<th>예약시간</th>
					<th>백신코드</th>
					<th>병원지역</th>
				</tr>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(6) %></td>
					<td><%=rs.getString(7) %></td>
					<td><%=rs.getString(8) %></td>
				</tr>
			</table>
			<%}else{ %>
				<p align="center">회원번호 <%= rNo %>의 회원 정보가 없습니다.</p>
				
						
		   <% } %>
			<div class="btn_align">
				<input class="btn_st" type="button" value="돌아가기" onclick="location.href='search_reservation.jsp'">
			</div>

```




