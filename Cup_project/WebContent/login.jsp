<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <!-- JSPL 라이브러리를 사용하기 위한 선언문 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TeaFunny & Cup.</title>
<link rel="icon" type="image/png" href="image/cupfavi.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
/* font-family: 'Nanum Gothic', serif; */
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
/* font-family: 'Hanna', serif; */
	body, ul {
		margin: 0;
		padding: 0;
		list-style-type: none;
		/* font-family: 'Nanum Gothic', serif; */
		font-family: 'Hanna', serif;
	}
	body {
		background-color: #FFFFFF;	
		min-width: 1080px;
	}
	
	#header {
		width: 100%;
		position: relative;
		padding-bottom: 42px;
		clear:both;
	}
	
	/* 로그인 */
	
	#wrap {
		margin: 15px auto;
		width: 466px;
		height: 350px;
	}
	#login_header {
		height: 39px;
		padding-top: 16px;
		padding-bottom: 5px;
		overflow: hidden;
	}
	#login_title {
		height: 22px !important;
		margin-top: 2px !important;
		font-size: 20px !important;
		line-height: 55px !important;
		letter-spacing: 3px !important;
		text-align: center !important;
		font-weight: bold !important;
		color: #555555 !important;
	}
	#cup_content {
		margin: 0 auto;
		height: 300px;
		text-align: center;
	}
	#login_content {
		width: 270px;
		height: 250px;
		padding: 0 25px;
		/* border: 1px solid #ededed; */
		text-align: left;
		display: inline-block;
		position: relative;
	}
	#login_area {
		width: 270px;
		height: 200px;
	}
	.idpw {
		color: #333;
		letter-spacing: -1px;
		background-color: white;
		width: 240px;
		height: 22px;
		border: 1px solid #e5e5e5;
		border-radius: 5px;
		font-weight: normal;
		font-size: 14px !important; 
		line-height: 22px;
		padding: 8px 12px;
		margin-bottom: 15px;
		margin-top: 15px;
		outline: none;
	}
	#login_form {
		margin-top: 10px;
	}
	#btn_login {
		display: inline-block;
		border: 1px solid white;
		background-color: #ededed;
		width: 268px;
		padding-top: 5px;
		line-height: 38px;
		text-align: center;
		border-radius: 5px;
		color: #555555;
		margin-top: 10px;
		text-decoration: none;
		font-size: 16px !important;
	}
	#btn_login:hover {
		border: 1px solid #ffdf24;
		color: #ffdf24;
		font-weight: bold;
		background-color: white;
	}
	#login_help {
		margin-top: 30px;
		/* padding: 5px; */
		width: 270px;
		bottom: 20px;
		padding-top: 1px;
		/* font-size: 14px; */
		letter-spacing: -1px;
	}
	#login_help a {
		text-decoration: none;
		color: #01284a;
		margin: 0 15px;
	}
	#login_help a:hover {
		text-decoration: underline;
	}
	#err {
		font-size: 13px !important;
		color: white;
		/* display: none;  */
		padding-top: 8px; 
		padding-left: 50px;
	}
</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">


		//유효성 체크
		$(document).on("click", "#btn_login", function(){
			
				var frm = $("#login_frm");
				var id = $("#login_id");
				var pw = $("#login_pw");
				
				var lid = id.val();
				if (lid == ""){
					id.focus();
					$("#err").text("아이디를 입력해주세요.").css("color","red");
					return false;
				}
				var lpw = pw.val();
				if (lpw == ""){
					pw.focus();
					$("#err").text("비밀번호를 입력해주세요.").css("color","red");
					return false;
				}
		
//			 if(lid != "" || lpw != "") {
				 $.ajax({
					 url: "loginajax.bizpoll",
					 type: "POST",
					 dataType: "JSON",
					 data:"id="+ lid +"&pw="+ lpw,
					 success: function(data) {
						 if(data.flag == "1"){
							 alert("로그인 성공");
							 $("#loginck").val("1");
							 frm.submit();
							 //index 페이지로 이동
						 } else if(data.flag == "0"){
							 alert("로그인 실패");
							 $("#login_id").select();
							 $("#err").text("일치하는 아이디 또는 패스워드가 없습니다.").css("display","red");
							 /* $("#loginck").val("0"); */
							 /* return false; */
						 }
					 },
					 error:function() {
						 alert("System Error!!!");
					 }
				 });
//			 }
		});
</script>
</head>
<body>
	<div id="header">
	
		<!-- 로그인 페이지 -->
	<div id="wrap">
		<div id="login_header" >
			<h3 id="login_title">L O G I N</h3>
		</div>
		<div id="cup_content">
			<div id="login_content">
				<div id="login_area">
					<div id="subtitle">
					</div>
					<div id="container">
						<div id="login_form">
							<form action="loginck.bizpoll" method="POST" id="login_frm" name="login_frm">
								<input class="idpw" type="text" id="login_id" name="login_id" placeholder="ID"/>
								<input class="idpw" type="password" id="login_pw" name="login_pw" placeholder="PASSWORD"/>
								<input type="hidden" id="loginck">
							</form>
						</div>
						</div>
						<span class="err_check_msg" id="err">.</span>
						<a href="#" id="btn_login">sign in
						</a>
					</div>
					<div id="login_help">
						<a href="constract.bizpoll">회원가입</a>
						<span class="right_bar"></span>
						<a href="#">아이디 찾기</a>
						<span class="right_bar"></span>
						<a href="#">비밀번호 찾기</a>
					</div>
				</div>
			</div>
		</div>
		
		
	</div>
</body>
</html>
<script type="text/javascript">
	window.onload = function() {
		var code = ${flag};
		if(code == 0){
			var errm = document.getElementById("err")
			errm.style.color="red";
			errm.innerHTML="아이디와 패스워드를 다시 입력해주세요.";
		}
	}
</script>