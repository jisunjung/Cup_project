<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>footer</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
/* font-family: 'Hanna', serif; */
	/* footer */
	#footer_wrap{
		/* position:fixed; */
		left:0px;
 		bottom:0px;
  		width:100%; 
  		height: 200px;
  		margin-bottom: 35px;
	}
		
	#footer_start {
		margin: 0;
		padding: 0;
		border-top: 3px dashed #ddd;
		/* border-bottom: 3px dashed #ddd; */
		height: 120px;
		width: auto;
		background-color: white;
	}
	#footer_logo {
		/* border: 1px solid yellow; */
		/* width: 400px; */
		/* height: 70px; */
		margin-top: 85px;
		margin-left: 250px;
		margin-right: 20px;
		/* padding: 10px; */
		float: left;
		
	}
	#footer_intro {
/* 		border: 1px solid blue; */
		/* margin-left: 200px; */
		margin-top: 50px;
		/* margin-bottom:50px; */
		padding: 10px;
		height: 60px;
		color: #666666;
		font-family: 'Hanna', serif;
		font-size: 17px;
		width: 750px;
		float: left;
	}
	#footer_intro > span {
		width: 750px !important;
		line-height: 25px;
	}
	#footer_project_date {
		/* border: 1px solid black; */
		width: 400px;
		margin-right: 250px;
		margin-top: 50px;
		/* margin-bottom:50px; */
		padding: 20px; 
		height: 60px;
		color: #555555;
		font-family: 'Hanna', serif;
		font-size: 18px;
		float: right;
	}
	#footer_project_date > span {
		line-height: 25px;
	}
	
</style>
</head>
<body>
	<!-- footer -->
	<div id="footer_wrap">
		<div id="footer_start">
			<div id="footer_logo">
				<a href="index.bizpoll"><img src="image/logo_3.png"></a>
			</div> 
			
			<div id="footer_intro">
				<span>
					(*)티퍼니앤컵
					
					<br>
					대표이사 : 정지선&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					사업자등록번호 : 123-45-67890&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					통신판매신고번호 : 제 2018-광주전남-00001 호
					
					<br>
					주소 : 광주광역시 북구 중흥동 7123 한경빌딩 5층 501호
					<br>
					teafunny & cup. ⓒ all rights reserved.
				</span>
			</div>
				<div id="footer_project_date">
				<span>
					/ 프로젝트 기간 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2018.02.01 ~ 2018.05.01
					<br>
					<br>
					/ 작성자 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정 지 선
				</span>
				</div>
		</div>
	</div>
</body>
</html>