<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>＊성적입력＊</title>
<style>
td{
	text-align:left;
}
</style>
</head>
<body onload="document.frm.sno.focus()">
<%@ include file="topmenu.jsp" %>
<section>
<div class="box">
	<h2>＊성적입력＊</h2>
</div>
<div class="box">
<form name="frm" method="post" action="action.jsp">
	<table width="400px">
		<tr>
			<th>학번</th>
			<td>
			<input type="number" name="sno" maxlength="6" pattern="^[0-9]$" required title="숫자를 입력해주세요">
			</td>
		</tr>	
		<tr>
			<th>국어점수</th>
			<td>
			<input type="number" name="ekor" maxlength="3">
			</td>
		</tr>	
		<tr>
			<th>수학점수</th>
			<td>
			<input type="number" name="emath" maxlength="3">
			</td>
		</tr>	
		<tr>
			<th>영어점수</th>
			<td>
			<input type="number" name="eeng" maxlength="3">
			</td>
		</tr>
		<tr>
			<th>역사점수</th>
			<td>
			<input type="number" name="ehist" maxlength="3">
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center">
			<input type="submit" onclick="fn_submit();return false;" value="등록하기">
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