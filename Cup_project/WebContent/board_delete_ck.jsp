<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 삭제 확인</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
/* font-family: 'Hanna', serif; */
	body {
		background-color: #FFFFFF;
	}
	body, div, ul {
		margin: 0px;
		padding: 0px;
		font-family: 'Hanna', serif;
	}
	#popup {
		width: 180px;
		margin: 59px auto;
		text-align: center;
	}
	#text {
		font-size: 15px;
		
	}
	.btn{
		font-family: 'Hanna', serif;
		margin-top: 50px;
		margin: 50px 10px 0 10px;
		color: #555555;
		padding: 7px 14px;
		font-size: 15px;
		cursor:pointer;		
		background-color: #ededed;
		border-radius: 5px;
		border: 1px solid white;
		/* text-align: center; */
	}
	.btn:hover {
		border: 1px solid #ffdf24;
		background-color: white;
		color: #ffdf24;
	}
</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	/* function closeOK() {
		opener.document.frm_member.input_pw.focus();
		opener.document.frm_member.idckval.value = "1";
		
		self.close();
	}
	function closeNG() {
		opener.document.frm_member.input_id.select();
		self.close();
		
	} */
	$(document).ready(function() {
		var formObj = $("#frm1");
		
		/* if(window.opener && !window.opener.closed){
			
		var url = window.opener.location;
		
		} */
		
	// 삭제버튼 클릭
	$("#remove_btn").on("click", function(){
		//alert($("#bno").val());
		formObj.attr("action", "boarddelete.bizpoll");
		formObj.attr("method", "get");
		formObj.submit();
		
		window.close();
		 

		//window.opener.top.location.href="연결할파일"
			//window.opener.top.location.reload();//새로고침
			//window.close()
		
	});
	
	// 취소버튼 클릭
	$("#cancel_btn").on("click", function(){
		self.close();
	});
	
});
</script>
</head>
<body>
	<div id="popup">
		<span id="text">글을 삭제하시겠습니까?</span>
	<form method="post" id="frm1">
		<input type="hidden" name="bno" id="bno" value="${bno}">
		<br>
		<button class="btn" id="remove_btn">삭제</button>
	</form>
		<button class="btn" id="cancel_btn">취소</button>
	
							
	
	</div>
</body>
</html>