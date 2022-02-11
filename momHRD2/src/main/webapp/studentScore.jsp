<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.DAO" %>
<%
Connection conn = DAO.getConnection();
Statement stmt = conn.createStatement();

String sql = " SELECT ";
       sql+= " substr(sno,1,1)sno1, ";
       sql+= " substr(sno,2,2)sno2, ";
       sql+= " substr(sno,4,2)sno3, ";
       sql+= " sname, ";
       sql+= " (SELECT ekor FROM exam_tbl_03 E WHERE S.sno = E.sno )ekor, ";
       sql+= " (SELECT emath FROM exam_tbl_03 E WHERE S.sno = E.sno )emath, ";
       sql+= " (SELECT eeng FROM exam_tbl_03 E WHERE S.sno = E.sno )eeng, ";
       sql+= " (SELECT ehist FROM exam_tbl_03 E WHERE S.sno = E.sno )ehist, ";
       sql+= " (SELECT ekor+emath+eeng+ehist FROM exam_tbl_03 E WHERE S.sno = E.sno )total, ";
       sql+= " (SELECT sum(ekor) FROM exam_tbl_03 E )ktotal, ";
       sql+= " (SELECT sum(emath) FROM exam_tbl_03 E )mtotal, ";
       sql+= " (SELECT sum(eeng) FROM exam_tbl_03 E )etotal, ";
       sql+= " (SELECT sum(ehist) FROM exam_tbl_03 E )htotal, ";
       sql+= " (SELECT sum(ekor+emath+eeng+ehist) FROM exam_tbl_03 E )studenttotal, ";
       sql+= " (SELECT sum((ekor+emath+eeng+ehist)/4) FROM exam_tbl_03 E )studentavg, ";
       sql+= " (SELECT count(*) FROM exam_tbl_03 E WHERE E.sno = S.sno )cnt ";
       sql+= " FROM student_tbl_03 S ";
       sql+= " ORDER BY total DESC nulls last";

 
ResultSet rs = stmt.executeQuery(sql);

ArrayList<String[]> list = new ArrayList<String[]>();
ArrayList<Double[]> total = new ArrayList<Double[]>();
int cnt = 0; 
while(rs.next()){
	String token[] = new String[11];
	Double token2[] = new Double[6];
	int rank = cnt;
	cnt += rs.getInt("cnt");
	
	token[0] = rs.getString("sno1");
	token[1] = rs.getString("sno2");
	token[2] = rs.getString("sno3");
	token[3] = rs.getString("sname");
	token[4] = rs.getString("ekor");
	token[5] = rs.getString("emath");
	token[6] = rs.getString("eeng");
	token[7] = rs.getString("ehist");
	token[8] = rs.getString("total");
	token[9] = rs.getString("total");
	token[10] = (rank == cnt)?"":cnt+"";
	list.add(token); //배열을 어레이리스트에 담아줍니다.
	
	token2[0] = rs.getDouble("ktotal");
	token2[1] = rs.getDouble("mtotal");
	token2[2] = rs.getDouble("etotal");
	token2[3] = rs.getDouble("htotal");
	token2[4] = rs.getDouble("studenttotal");
	token2[5] = rs.getDouble("studentavg");
	total.add(token2);	
}
	String titlename[] = {"학년","반","번호","이름","국어","수학","영어","역사","합계","평균","순위"};
	double studentAvgTotal = 0; //학생들의 평균 총합을 넣을 변수 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>＊학생성적＊</title>

</head>
<body>
<%@ include file="topmenu.jsp" %>
<section>
<div class="box">
	<h2>＊학생성적＊</h2>
</div>
<div class="box">
	<table width="600px">
		<tr>
		<%
		for(String title:titlename){
		%>
		<th><%=title %></th>
		<%
		}
		%>
		</tr>
		<%
		
		for(int i=0; i<list.size(); i++){
			String studentlist[] = list.get(i);
			%>
		<tr>
			<%for(int j=0; j<studentlist.length; j++){
				String value = (studentlist[j]==null)?"":studentlist[j]; //데이터가없을때 공백이 나오게한다.
			
				if(j == 9 && !value.equals("")){ //평균을 구해주자.
				Double studentavg = Double.parseDouble(value)/4;
				%>
				<td><%=studentavg%></td>
				<%
				}else{
			%>
				<td><%=value%></td>		
			<%
				}
			}
			%>	
		<tr>
		<%}%>
		<tr>
			<th colspan="4">총합</th>		
			<%
			Double studenttotal[] = total.get(0);
			for(Double totalscore:studenttotal){
			%>
			<td><%=totalscore%></td>
			<%} %>
			<td></td>
		</tr>
		<tr>
			<th colspan="4">총평균</th>
			<%
			for(Double avgscore:studenttotal){
			%>
			<td><%=Math.ceil((avgscore/cnt)*2)/2%></td>
			<%} %>
			<td></td>
		</tr>
	</table>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>