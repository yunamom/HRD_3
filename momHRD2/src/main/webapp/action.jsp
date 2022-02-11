<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.DAO"%>

<%
request.setCharacterEncoding("UTF-8");

String sno = request.getParameter("sno");
String ekor = request.getParameter("ekor");
String emath = request.getParameter("emath");
String eeng = request.getParameter("eeng");
String ehist = request.getParameter("ehist");


//유효성체크 
String check[] = {"sno","ekor","emath","eeng","ehist"};
int s = 0; //변수생성
for(String value:check){
	int score = (s==0)?0:(Integer.parseInt(value)); //유효성추가 점수가 0이하 거나 100이상이면 이전화면으로 돌려보낸다.
	if(value == null || value.equals("") || score < 0 || score > 100){
		s++;
	%>
		<script>
		alert("입력화면을 확인해주세요.");
		history.back();
		</script>
	<%
		return;
	}
}

Connection conn = DAO.getConnection();
Statement stmt = conn.createStatement();

String sql1 = " SELECT count(*)cnt FROM student_tbl_03 WHERE sno = "+sno+" ";

ResultSet rs = stmt.executeQuery(sql1);
rs.next();
int cnt = rs.getInt("cnt");
if(cnt == 0){ //학생목록에 해당학생번호가 없을때 
	%>
	<script>
	alert("학생번호를 확인해주세요.\n 존재하지 않는 학생입니다.");
	location='studentWrite.jsp';
	</script>
	<%
		return;
}
String sql2 = " SELECT count(*)cnt FROM exam_tbl_03 WHERE sno = "+sno+" ";

rs = stmt.executeQuery(sql2);
rs.next();
cnt = rs.getInt("cnt");
if(cnt > 0){ //이미 입력된 학생일때 
	%>
	<script>
	alert("이미 입력된 학생입니다.");
	location='studentWrite.jsp';
	</script>
	<%
		return;
}
//데이터 넣기
String sql = " INSERT INTO exam_tbl_03 ";
       sql+= " VALUES( ";
       sql+= " '"+sno+"', ";
       sql+= " "+ekor+", ";
       sql+= " "+emath+", ";
       sql+= " "+eeng+", ";
       sql+= " "+ehist+") ";
       
int result = stmt.executeUpdate(sql);
if(result == 1){
%>
	<script>
	alert("저장되었습니다!");
	location="studentWrite.jsp";
	</script>
<%
}else{
%>
	<script>
	alert("저장실패하였습니다!\n관리자에게 연락해주세요!");
	location="index.jsp";
	</script>
<%} %>