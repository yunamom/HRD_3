<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.DAO" %>
<%

request.setCharacterEncoding("UTF-8");

Connection conn = DAO.getConnection(); //DB연결

Statement stmt = conn.createStatement();

String sql = " SELECT ";
       sql+= " sno, ";
       sql+= " sname, ";
       sql+= " substr(sno,1,1)sno1, ";
       sql+= " substr(sno,2,2)sno2, ";
       sql+= " substr(sno,4,2)sno3, ";
       sql+= " sphone, ";
       sql+= " DECODE(sgender,'F','여','남')sgender, ";
       sql+= " saddress ";
       sql+= " FROM student_tbl_03 ";

ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>＊학생목록＊</title>
</head>
<body>
<%@ include file="topmenu.jsp" %>
<section>
<div class="box">
	<h2>＊학생목록＊</h2>
</div>
<div class="box">
	<table style="width:650px">
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학년</th>
			<th>반</th>
			<th>번호</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
		<%while(rs.next()){ 
		String sno=rs.getString("sno");
		String sname=rs.getString("sname");
		%>
		<tr>
			<td><%=sno%></td>
			<td>
			<a style="padding:0.2em" href="modify.jsp?sno=<%=sno%>&&sname=<%=sname%>">
			<%=rs.getString("sname")%>
			</a></td>
			<td><%=rs.getString("sno1")%></td>
			<td><%=rs.getString("sno2")%></td>
			<td><%=rs.getString("sno3")%></td>
			<td><%=rs.getString("sgender")%></td>
			<td><%=rs.getString("sphone")%></td>
			<td><%=rs.getString("saddress")%></td>
		</tr>
		<%} %>
	</table>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>