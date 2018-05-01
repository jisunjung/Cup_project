<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TeaFunny & Cup</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="image/cupfavi.png">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
/* font-family: 'Nanum Gothic', serif; */
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
/* font-family: 'Hanna', serif; */
	body, ul {
		margin: 0;
		/* padding: 0; */
		list-style-type: none;
		font-family: 'Hanna', serif !important;
		/* font-family: 'Nanum Gothic', serif; */
	}
	
	body {
		background-color: #FFFFFF;
		min-width: 1080px;
	}
	
	#header {
		width: 100%;
		position: relative;
		clear: both;
	}
	
	/* 첫번째 줄 */
	#inner1 {
		height: 26px;
		background-color: #FFFFFF;
		border-bottom: 2px solid #FFDF24;
		box-sizing: border-box;
	}
	
	.inner {
		padding: 0 90px;
	}
	
	.head_inner {
		max-width: 1200px;
		margin: 0 auto;
		position: relative;
	}
	
	#link {
		width: 200px;
		display: inline-block;
	}
	
	#link>a {
		color: #555555;
		text-decoration: none;
		line-height: 26px;
		font-weight: bold;
	}
	
	#member {
		float: right;
	}
	
	#member li {
		float: left;
		font-size: 14px;
		line-height: 26px;
	}
	
	#member li a {
		color: #555555;
		text-decoration: none;
		margin: 0px 10px;
		display: inline-block;
	}
	
	#member li a:hover {
		color: #FFDF24;
		font-weight: bold;
	}
	
	#li_drop {
		position: relative;
		width: 110px;
	}
	
	#dropdown {
		width: 110px;
		position: absolute;
		left: -10px;
		display: none;
		z-index: 10;
	}
	
	#li_drop:hover #dropdown {
		display: block;
	}
	
	#dropdown ul {
		list-style-type: none;
	}
	
	#ul_dropdown li a {
		width: 110px;
		left: -10px;
	}
	
	#dropdown ul li {
		background-color: #FFFFFF;
	}
	
	#dropdown ul li:hover {
		border: 1px solid #FFDF24;
	}
	/* 두번째 줄 */
	#topArea {
		height: 100px;
		position: relative;
		background-color: #FFFFFF;
	}
	
	img#logo {
		width: auto;
		margin: 0 auto;
		display: block;
		height: 400px;
	}
	
	img#logo01 {
		width: auto;
		margin: 50px auto;
		display: block;
	}
	
	#line2_search {
		height: 34px;
		display: inline-block;
		float: right;
		position: absolute;
		right: 10px;
		top: 30px;
	}
	
	div#line2_wrap {
		height: 28px;
		border: 2px solid #a7a7a7;
		box-sizing: border-box;
	}
	
	input#search_keyword {
		width: 150px;
		height: 24px;
		font-size: 14px;
		box-sizing: border-box;
		display: block;
		float: left;
		border: 0px;
		padding-left: 5px;
		/* font-family: 'Nanum Gothic', serif; */
	}
	
	input#search_btn {
		width: 55px;
		height: 24px;
		float: left;
		background-color: #a7a7a7;
		color: #FFFFFF;
		display: block;
		border: 0px;
		/* font-family: 'Nanum Gothic', serif; */
	}
	
	input#search_btn:hover {
		background-color: #FFFFFF;
		color: #FFDF24;
	}
	/* 세번째 줄 */
	#category {
		height: 30px;
		background-color: #ebebeb;
		box-sizing: border-box;
		width: 100%;
	}
	
	.line3_li {
		float: left;
		box-sizing: border-box;
	}
	
	#category li>a {
		display: block;
		color: #555555;
		text-decoration: none;
		padding: 0px 48px;
		line-height: 30px;
		/* font-family: 'Nanum Gothic', serif; */
		font-size: 14px;
		height: 25px;
	}
	
	#category li:hover {
		background-color: #ebebeb;
		color: #01284a;
		/* border-top: 5px solid #FFFFFF; */
		border-top: 2px solid #FFDF24;
		height: 30px;
	}
	/* #head_inner {
			max-width: 1200px;
			margin: 0 310px;
		} */
	#category li:hover .cup_drop {
		display: block;
	}
	
	.cup_drop {
		display: none;
		z-index: 10;
		position: relative;
	}
	
	.cup_drop a {
		display: block;
		padding: 5px;
		height: 35px;
		/* color: #01284a; */
		color: #555555;
		text-decoration: none;
		/* font-family: 'Nanum Gothic', serif; */
		font-size: 16px;
		text-align: center;
		background-color: #ebebeb;
	}
	
	.cup_drop a:hover {
		background-color: #ebebeb;
		color: #d3d3d3;
	}
	 /* .cup_drop a:hover .nav_li {
			background-color: #fce8eb;
			color: #01284a;
			 border-top: 5px solid #FFFFFF; 
			 border-top: 1px solid #FFDF24; 
			height: 35px;
			position: absolute;
			} */
			
		#link #fafa {
		font-size: 16px;
		color: #555555;
	}
	
	button#myBtn {
		display: none;
		position: fixed;
		bottom: 30px;
		right: 260px;
		z-index: 9999;
		outline: none;
		background-color: white;
		color: #a7a7a7;
		cursor: pointer;
		border: none;
		font-size: 40px;
	}
	
	button#myBtn:hover {
		background-color: white;
		color: #FFDF24;
	}
	
	
	/* modal */
	.mask {
		width:100%;
		height:100%;
		position:fixed;
		left:0; top:0;
		z-index:10;
		background:#000;
		opacity:.5;
		filter:alpha(opacity=50);
	}
 	#modalLayer {
 		display:none;
 		position:relative;
 	}
 	#modalLayer .modalContent	{
 		width: 400px;
 		height: 350px;
 		padding:20px;
 		position:fixed;
 		left:50%;
 		top:50%;
 		z-index:200;
 		background:#fff;
 		border-radius: 10px;
 		border: 5px solid #FFDF24;
 	}
	#modalLayer .modalContent button {
		
		position:absolute;
		right:0; 
		top:0;
		cursor:pointer;
		border: none;
		background-color: white;
		color: #ddd;
		font-size: 20px;
		border: none;
		border-radius: 10px;
		margin: 5px 5px 0 0;
		
	}
	
	/* 로그인 */
	#login_header {
		height: 39px;
		padding: 5px auto;
		overflow: hidden;
	}
	
	#login_title {
		height: 22px;
		font-size: 20px;
		line-height: 0;
		letter-spacing: 3px;
		text-align: center;
		font-weight: bold;
		color: #555555;
		box-sizing: border-box;
		font-family: 'Hanna', serif;
	}
	
	#cup_content {
		margin: 0 auto;
		height: 300px;
		text-align: center;
	}
	
	#login_content {
		width: 270px;
		height: 250px;
		padding: 0;
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
		width: 254px;
		height: 22px;
		border: 1px solid #e5e5e5;
		border-radius: 5px;
		font-weight: normal;
		font-size: 15px;
		line-height: 22px;
		padding: 8px 0 8px 12px;
		margin-bottom: 15px;
		margin-top: 15px;
		outline: none;
		font-family: 'Hanna', serif;
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
		font-size: 20px;
	}
	
	#btn_login:hover {
		border: 1px solid #ffdf24;
		color: #ffdf24;
		font-weight: bold;
		background-color: white;
	}
	
	#login_help {
		margin-top: 30px;
		/* padding: 20px; */
		width: 270px;
		bottom: 20px;
		/* padding-top: 1px; */
		font-size: 14px;
		/* letter-spacing: -1px; */
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
		font-size: 14px;
		color: white;
		/* display: none;  */
		padding-top: 8px;
		padding-left: 70px;
	}
	
</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	//*로그인 모달창
	$(document).ready(function(){
		  var modalLayer = $("#modalLayer");
		  var modalLink = $(".modalLink");
		  var modalCont = $(".modalContent");
		  var marginLeft = modalCont.outerWidth()/2;
		  var marginTop = modalCont.outerHeight()/2; 
		 
		  modalLink.click(function(){
		    modalLayer.fadeIn("slow");
		    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
		    $(this).blur();
		    $(".modalContent > a").focus(); 
		    return false;
		  });
		 
		  $(".modalContent > button").click(function(){
		    modalLayer.fadeOut("slow");
		    modalLink.focus();
		  });        
		});

	//*유효성 체크
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
	
			if(lid != "" || lpw != "") {
					 $.ajax({
						 url: "loginajax.bizpoll",
						 type: "POST",
						 dataType: "JSON",
						 data:"id="+ lid +"&pw="+ lpw,
						 success: function(data) {
							 if(data.flag == "1"){
								 alert("로그인 성공");
								 $("#loginck").val("1");
								 location.reload();
							 } else{
								 alert("로그인 실패");
								 $("#login_id").select();
								 $("#err").text("일치하는 회원정보가 없습니다.").css("color","red");
								 $("#loginck").val("0");
								 return false; 
							 }
						 },
						 error:function() {
							 alert("System Error!!!");
						 }
					 });
					 
					
				 }
	});

	$(document).on("click", "#logout", function(){
		 $.ajax({
			 url:"loginout.bizpoll",
			 type: "POST",
			 dataType:"JSON",
			 success: function(data) {
				 if(data.flag == "1"){
					 alert("로그아웃 성공");
					 location.href="index.bizpoll";
				 } else if(data.flag == "0"){
					 alert("로그아웃 실패");
				 }
			 },
			 error:function() {
				 alert("System Error!!!");
			 }
		 });
	});
</script>
</head>
<body>
	<button onclick="topFunction()" id="myBtn">
		<i class="fa fa-arrow-circle-up"></i>
	</button>

	<div id="header">
		<!-- 첫번째 줄 시작, 로그인, 회원가입 등등 -->
		<div id="inner1" class="inner">
			<div class="head_inner">
				<div id="link">
					<a href="#">BOOKMARK+</a>
					<i id="fafa" class="fa fa-facebook-official"></i>
					<i id="fafa" class="fa fa-instagram"></i>
					<i id="fafa" class="fa fa-envelope-o"></i>
				</div>
				<ul id="member">
					<c:choose>
						<c:when test="${empty sessionScope.loginUser}">
							<li><a href="#modalLayer" class="modalLink">로그인</a></li>

							<li><a href="constract.bizpoll">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="code" id="code" value="0">
							<li>${sessionScope.loginUser.mname}
								(${sessionScope.loginUser.mid})</li>
							<li><a id="logout" href="#">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					<li id="li_drop"><a href="#">마이페이지 ▼</a>
						<div id="dropdown">
							<ul id="ul_dropdown">
								<li><a href="#">주문/배송 조회</a></li>
								<li><a href="#">장바구니</a></li>
								<li><a href="#">위시리스트</a></li>
								<li><a href="#">쿠폰조회</a></li>
							</ul>
						</div></li>
					<li><a href="qna.bizpoll">고객행복센터</a></li>
				</ul>
<!-- W3School 모달을 지운 위치 -->
				
				
				
			</div>
		</div>
		<!-- 두번째 줄 시작, 이미지 로고 -->
		<div id="topArea" class="inner">
			<div class="head_inner">
				<!-- <a href="index.html"><img id="logo" src=image/cup_main03.jpg></a> -->
				<a href="index.bizpoll"><img id="logo01" src=image/logo_1.png></a>
				<div id="line2_search">
					<!-- <div id="line2_wrap">
						<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어를 입력해주세요.">
						<input id="search_btn" type="submit" value="검색">
					</div> -->
				</div>
			</div>
		</div>
		<!-- 세번째 줄 시작, 네비게이션 -->
		<div id="category" class="inner">
			<div class="head_inner">
				<ul>
					<li class="line3_li"><a href="#" id="best" class="nav_li">BEST</a>
					</li>
					<li class="line3_li"><a href="#" id="mug" class="nav_li">MUG</a>
						<div class="cup_drop">
							<a href="#">WHITE</a> <a href="#">UNICOLOR</a> <a href="#">ILLUSTRATION</a>
							<a href="#">TEXT</a>
						</div></li>
					<li class="line3_li"><a href="#" id="glass" class="nav_li">GLASS</a>
						<div class="cup_drop">
							<a href="#">JUICE / WATER</a> <a href="#">HANDLE</a> <a href="#">DOUBLE
								WALL</a> <a href="#">COLOR</a>
						</div></li>
					<li class="line3_li"><a href="#" id="teapot" class="nav_li">TEAPOT</a>
						<div class="cup_drop">
							<a href="#">GLASS</a> <a href="#">CERAMIC</a> <a href="#">STAINLESS
								STEEL</a>
						</div></li>
					<li class="line3_li"><a href="#" id="sale" class="nav_li">SALE</a>
					</li>
					<li class="line3_li"><a href="#" id="event" class="nav_li">EVENT</a>
					</li>
					<li class="line3_li"><a href="#" id="only_you" class="nav_li">ONLY
							YOU</a></li>
					<li class="line3_li"><a href="qna.bizpoll" id="qna"
						class="nav_li">Q & A</a></li>
				</ul>
			</div>
		</div>
		
	</div>
	
<!-- modal_login -->
	<div id="modalLayer">
		<div class="modalContent">
				<div id="login_header">
					<h3 id="login_title">L O G I N</h3>
				</div>
				<div id="cup_content">
					<div id="login_content">
						<div id="login_area">
							<div id="subtitle"></div>
							<div id="container">
								<div id="login_form">
									<form action="index.bizpoll" method="POST" id="login_frm" name="login_frm">
										<input class="idpw" type="text" id="login_id" name="login_id" placeholder="ID" />
										<input class="idpw" type="password" id="login_pw" name="login_pw" placeholder="PASSWORD" />
										<input type="hidden" id="loginck">
									</form>
								</div>
							</div>
							<span class="err_check_msg" id="err">.</span>
							<a href="#" id="btn_login">sign in </a>
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
			<button type="button"><i id="fafa" class="fa fa-close"></i></button>
		</div>
	</div>
	
	
	
	
</body>
</html>