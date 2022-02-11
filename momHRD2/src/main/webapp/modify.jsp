<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.DAO" %>
<%
String strReferer = request.getHeader("referer");
if(strReferer == null){
%>
	<script>
	alert("정상적인 경로를 통해 다시 접근해 주십시오.");
	location='index.jsp';
	</script>
<%
	return;
}
//비정상적인 경로의 접근을 차단한다.
String sno = request.getParameter("sno");
String sname = request.getParameter("sname");
if(sno == null || sno.equals("") || sname == null || sname.equals("")){
%>
	<script>
	alert("잘못된 경로의 접근입니다.");
	location='index.jsp';
	</script>	
<%
	return;
}

Connection conn = DAO.getConnection();
Statement stmt = conn.createStatement();

String sql = " SELECT ";
       sql+= " COUNT(*)cnt ";
       sql+= " FROM exam_tbl_03 ";
       sql+= " WHERE sno='"+sno+"' ";
       
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt");
if(cnt == 0 ){ //학생성적이 입력이 안되어있을경우 성적표입력 화면으로 보낸다.
%>
	<script>
	alert("학생 성적표 입력화면으로 이동합니다.");
	location='studentWrite.jsp';
	</script>
<%
	return;
}
String sql1 = " SELECT ";
       sql1+= " ekor, ";
       sql1+= " emath, ";
       sql1+= " eeng, ";
       sql1+= " ehist ";
       sql1+= " FROM exam_tbl_03 ";
       sql1+= " WHERE sno='"+sno+"' ";
 rs = stmt.executeQuery(sql1);
 rs.next();
 
 String sno1 = sno.substring(0,1)+"학년 ";
 String sno2 = sno.substring(2,3)+"반 ";
 String sno3 = sno.substring(4)+"번";
sno1+=sno2+sno3;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>＊학생점수수정＊</title>
<style>
td{
	text-align:left;
}
</style>
</head>
<body onload="document.frm.ekor.focus()">
<%@ include file="topmenu.jsp" %>
<section>
<div class="box">
	<h2>＊<%=sname%>학생 성적표＊</h2>
</div>
<div class="box">
<form name="frm" method="post" action="modifyAction.jsp">
<input type="hidden" name="sno" value="<%=sno %>">
	<table style="width:400px">
		<tr>
			<th>학번/이름</th>
			<td><%=sno1%> <%=sname%></td>
		</tr>	
		<tr>
			<th>국어점수</th>
			<td>
			<input type="number" name="ekor" maxlength="3" value="<%=rs.getString("ekor")%>">
			</td>
		</tr>	
		<tr>
			<th>수학점수</th>
			<td>
			<input type="number" name="emath" maxlength="3" value="<%=rs.getString("emath")%>">
			</td>
		</tr>	
		<tr>
			<th>영어점수</th>
			<td>
			<input type="number" name="eeng" maxlength="3" value="<%=rs.getString("eeng")%>">
			</td>
		</tr>
		<tr>
			<th>역사점수</th>
			<td>
			<input type="number" name="ehist" maxlength="3" value="<%=rs.getString("ehist")%>">
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center">
			<input type="submit" onclick="fn_submit();return false;" value="수정하기">
			<input type="button" onclick="history.back()" value="취소">
			</td>
		</tr>
	</table>
	</form>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
<script src="script.js"></script>
</html>