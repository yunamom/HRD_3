
function fn_submit(){
	var f = document.frm;	
	var score = [f.ekor,f.emath,f.eeng,f.ehist];
	var scorecheck = ["국어","수학","영어","역사"];
	for(var i=0; i<score.length; i++){		
		if(f.sno.value === null || f.sno.value === "" || f.sno.value.length > 5 || f.sno.value.length < 5){
			alert("학번을 확인해주세요!");
			f.sno.value = null;
			f.sno.focus();
			return false;
		}
		if(score[i].value === null || score[i].value === "" || score[i].value > 100 || score[i].value < 0){
			alert(scorecheck[i]+" 점수를 확인해주세요!");
			score[i].value = null;
			score[i].focus();
			return false;
		}
	}
	f.submit();
}

function fn_reset(){
	alert("정보를 지우고 다시 작성하겠습니다.");
	location='studentWrite.jsp';
}