<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	body, ul {
		margin: 0;
		padding: 0;
		list-style-type: none;
		font-family: 'Nanum Gothic', serif;
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
	
	/* 첫번째 줄 */

	#inner1 {
		height: 26px;
		background-color: #FFFFFF;
		border-bottom: 1px solid #FFDF24;
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
	#link > a {
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
		font-size: 13px;
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
	#topArea{
		height: 400px; 
		position: relative;
		background-color: #FFFFFF;
	}
	
	img#logo {
		width: auto;
		margin: 0 auto;
		display: block;
		height: 400px;
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
		border: 2px solid #FFFFFF;
		box-sizing: border-box;
	}
	input#search_keyword {
		width: 150px;
		height: 24px;
		font-size: 13px;
		box-sizing: border-box;
		display: block;
		float: left;
		border: 0px;
		padding-left: 5px;
		font-family: 'Nanum Gothic', serif;
	}
	input#search_btn {
		width: 55px;
		height: 24px;
		float: left;
		background-color: #a7a7a7;
		color: #FFFFFF;
		display: block;
		border: 0px;
		font-family: 'Nanum Gothic', serif;
	}
	input#search_btn:hover {
		background-color: #FFFFFF;
		color: #FFDF24;
	}
	/* 세번째 줄 */
	#category{
		height: 30px;
		background-color: #ebebeb;
		box-sizing: border-box;
		width: 100%;
	}
	.line3_li {
		float: left;
		box-sizing: border-box;
	}
	#category li > a{
		display: block;
		color: #555555;
		text-decoration: none;
		padding : 0px 48px;		
		line-height: 30px;
		font-family: 'Nanum Gothic', serif;
		font-size: 14px;
		height: 25px;
	}
	#category li:hover {
		background-color: #ebebeb;
		color: #01284a;
		border-top: 5px solid #FFFFFF;
		height: 30px;
	}
	#head_inner {
		max-width: 1200px;
		margin: 0 310px;
	}
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
		height: 20px;
		color: #01284a;
		text-decoration: none;
		font-family: 'Nanum Gothic', serif;
		font-size: 16px;
		text-align: center;
		background-color: #ebebeb;
	}
	.cup_drop a:hover {
		background-color: #ebebeb;
 		color: #d3d3d3;
	}
	.cup_drop a:hover .nav_li {
		background-color: #fce8eb;
		color: #01284a;
		border-top: 5px solid #FFFFFF;
		height: 35px;
		position: absolute;
	}
	#fafa {
		font-size: 16px;
		color: #555555;
	}
	.new {
		font-weight: bold;
		font-size: 20px;
		color: #555555;
	}
	div.gallery {
		margin: 30px;
		border: 1px solid  #ebebeb;
		float: left;
		width: 220px;
	}
	div.gallery img {
		width: 220px;
		height: 220px;
	}
	div.desc {
		padding: 10px;
		color: #555555;
		text-align: center;
		font-size: 15px;
	}
	div.price {
		padding: 5px;
		color: #555555;
		text-align: center;
		font-size: 13px;
	}
	#main_gallery {
		width: 1200px;
		margin: 50px 400px;
	}
	
	button#myBtn {
		display: none; 
		position: fixed;
		bottom: 30px;
		right: 260px;
		z-index: 99;
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
	
	
</style>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	window.onscroll = function() { scrollFunction()};
	
	function scrollFunction() {
		if(document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
			document.getElementById("myBtn").style.display = "block";
		} else {
			document.getElementById("myBtn").style.display = "none";
		}
	}
	
	function topFunction() {
		document.body.scrollTop = 0;
		document.documentElement.scrollTop = 0;
	}
</script>
</head>
<body>
	<button onclick="topFunction()" id="myBtn"><i class="fa fa-arrow-circle-up"></i></button>
	
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
						<li><a href="login.html">로그인</a></li>
						<li><a href="join_pluspost.html">회원가입</a></li>
						<li id="li_drop">
							<a href="#">마이페이지 ▼</a>
							<div id="dropdown">
								<ul id="ul_dropdown">
									<li><a href="#">주문/배송 조회</a></li>
									<li><a href="#">장바구니</a></li>
									<li><a href="#">위시리스트</a></li>
									<li><a href="#">쿠폰조회</a></li>
								</ul>
							</div>
						</li>
						<li><a href="#">고객행복센터</a></li>
					</ul>
				</div>
			</div>
		<!-- 두번째 줄 시작, 이미지 로고 -->
		<div id="topArea" class="inner">
			<div class="head_inner">
				<a href="index.html"><img id="logo" src=image/cup_main03.jpg></a>
				<div id="line2_search">
					<div id="line2_wrap">
						<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어를 입력해주세요.">
						<input id="search_btn" type="submit" value="검색">
					</div>				
				</div>
			</div>
		</div>
		<!-- 세번째 줄 시작, 네비게이션 -->
		<div id="category" class="inner">
			<div id="head_inner">
				<ul>
					<li class="line3_li">
						<a href="#" id="best" class="nav_li" >BEST</a>
					</li>
					<li class="line3_li">
						<a href="#" id="mug" class="nav_li">MUG</a>
						<div class="cup_drop">
							<a href="#">WHITE</a>
							<a href="#">UNICOLOR</a>
							<a href="#">ILLUSTRATION</a>
							<a href="#">TEXT</a>
						</div>	
					</li>
					<li class="line3_li">
						<a href="#" id="glass" class="nav_li">GLASS</a>
						<div class="cup_drop">
							<a href="#">JUICE / WATER</a>
							<a href="#">HANDLE</a>
							<a href="#">DOUBLE WALL</a>
							<a href="#">COLOR</a>
						</div>	
					</li>
					<li class="line3_li">
						<a href="#" id="teapot" class="nav_li" >TEAPOT</a>
						<div class="cup_drop">
							<a href="#">GLASS</a>
							<a href="#">CERAMIC</a>
							<a href="#">STAINLESS STEEL</a>
						</div>
					</li>
					<li class="line3_li">
						<a href="#" id="sale" class="nav_li">SALE</a>
					</li>
					<li class="line3_li">
						<a href="#" id="event" class="nav_li">EVENT</a>
					</li>
					<li class="line3_li">
						<a href="#" id="only_you" class="nav_li">ONLY YOU</a>
					</li>
					<li class="line3_li">
						<a href="#" id="qna" class="nav_li">Q & A</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- 메인 갤러리 -->
		<div id="main_gallery">
			<div>
				<div class="new">N E W ▼</div>
			</div>
			<div class="gallery">
				<a href="#" target="_blank">
				<img src="image/cup_maingallery/mug08.jpg" alt="maingall" width="180px" height="200px">
				</a>
				<div class="desc">WHITE LINE MUG a</div>
				<div class="price">16,000 won</div>
			</div>
			<div class="gallery">
				<a href="#" target="_blank">
				<img src="image/cup_maingallery/mug09.jpg" alt="maingall" width="180px" height="200px">
				</a>
				<div class="desc">WHITE LINE MUG b</div>
				<div class="price">16,000 won</div>
			</div>
			<div class="gallery">
				<a href="#" target="_blank">
				<img src="image/cup_maingallery/mug10.jpg" alt="maingall" width="180px" height="200px">
				</a>
				<div class="desc">BLACK LINE MUG a</div>
				<div class="price">16,000 won</div>
			</div>
			<div class="gallery">
				<a href="#" target="_blank">
				<img src="image/cup_maingallery/mug11.jpg" alt="maingall" width="180px" height="200px">
				</a>
				<div class="desc">BLACK LINE MUG b</div>
				<div class="price">16,000 won</div>
			</div>
			<div class="gallery">
				<a href="#" target="_blank">
				<img src="image/cup_maingallery/glass01.jpg" alt="maingall" width="180px" height="200px">
				</a>
				<div class="desc">HIGH BALL GLASS EIFFEL</div>
				<div class="price">10,000 won</div>
			</div>
			<div class="gallery">
				<a href="#" target="_blank">
				<img src="image/cup_maingallery/glass02.jpg" alt="maingall" width="180px" height="200px">
				</a>
				<div class="desc">HIGH BALL GLASS MOON</div>
				<div class="price">10,000 won</div>
			</div>
			<div class="gallery">
				<a href="#" target="_blank">
				<img src="image/cup_maingallery/glass03.jpg" alt="maingall" width="180px" height="200px">
				</a>
				<div class="desc">HIGH BALL GLASS SNOW</div>
				<div class="price">10,000 won</div>
			</div>
			<div class="gallery">
				<a href="#" target="_blank">
				<img src="image/cup_maingallery/glass04.jpg" alt="maingall" width="180px" height="200px">
				</a>
				<div class="desc">HIGH BALL GLASS HART</div>
				<div class="price">10,000 won</div>
			</div>
			<div class="gallery">
				<a href="#" target="_blank">
				<img src="image/cup_maingallery/glass05.jpg" alt="maingall" width="180px" height="200px">
				</a>
				<div class="desc">JUICE GLASS </div>
				<div class="price">9,500 won</div>
			</div>
			<div class="gallery">
				<a href="#" target="_blank">
				<img src="image/cup_maingallery/glass06.jpg" alt="maingall" width="180px" height="200px">
				</a>
				<div class="desc">JUICE GLASS </div>
				<div class="price">9,500 won</div>
			</div>	
			<div class="gallery">
				<a href="#" target="_blank">
				<img src="image/cup_maingallery/glass07.jpg" alt="maingall" width="180px" height="200px">
				</a>
				<div class="desc">JUICE GLASS </div>
				<div class="price">9,500 won</div>
			</div>
			<div class="gallery">
				<a href="#" target="_blank">
				<img src="image/cup_maingallery/glass08.jpg" alt="maingall" width="180px" height="200px">
				</a>
				<div class="desc">JUICE GLASS </div>
				<div class="price">9,500 won</div>
			</div>	
			<div class="gallery">
				<a href="#" target="_blank">
				<img src="image/cup_maingallery/glass09.jpg" alt="maingall" width="180px" height="200px">
				</a>
				<div class="desc">JUICE GLASS </div>
				<div class="price">9,500 won</div>
			</div>
			<div class="gallery">
				<a href="#" target="_blank">
				<img src="image/cup_maingallery/wine01.jpg" alt="maingall" width="180px" height="200px">
				</a>
				<div class="desc">WINE GLASS 2P</div>
				<div class="price">39,000 won</div>
			</div>
			<div class="gallery">
				<a href="#" target="_blank">
				<img src="image/cup_maingallery/wine02.jpg" alt="maingall" width="180px" height="200px">
				</a>
				<div class="desc">WINE GLASS 2P</div>
				<div class="price">39,000 won</div>
			</div>
			<div class="gallery">
				<a href="#" target="_blank">
				<img src="image/cup_maingallery/beer01.jpg" alt="maingall" width="180px" height="200px">
				</a>
				<div class="desc">BEER GLASS</div>
				<div class="price">13,000 won</div>
			</div>
		</div>
	</div>
</body>
</html>