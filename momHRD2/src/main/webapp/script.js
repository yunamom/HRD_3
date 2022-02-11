
function fn_submit(){
	var f = document.frm;
	
	if(f.sno.value == null || f.sno.value == ""){
		alert("학번을 입력해주세요!");
		f.sno.focus(); return false;
	}
	if(f.ekor.value == null || f.ekor.value == ""){
		alert("국어점수를 입력해주세요!");
		f.ekor.focus(); return false;
	}
	if(f.emath.value == null || f.emath.value == ""){
		alert("수학점수를 입력해주세요!");
		f.emath.focus(); return false;
	}
	if(f.eeng.value == null || f.eeng.value == ""){
		alert("영어점수를 입력해주세요!");
		f.eeng.focus(); return false;
	}
	if(f.ehist.value == null || f.ehist.value == ""){
		alert("역사점수를 입력해주세요!");
		f.ehist.focus(); return false;
	}
	
	f.submit();
}