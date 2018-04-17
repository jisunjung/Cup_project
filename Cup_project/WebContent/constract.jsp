<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cup_constract</title>
<style type="text/css">
	div#container {
		position: relative;
		/* border: 1px solid red; */
	}
	div.lang {
		position: absolute;
		top: 14px;
		right: 0px;
	}
	.lang > select {
		background: url('image/sel_arr.gif') 100% 50% no-repeat;
		-webkit-appearance: none;
		width: 98px;
		height: 30px;
		background-color: white;
	}
	select#langselect {
		font-size: 12px;
		font-weight: 400;
		height: 30px;
		padding: 6px 8px 5px 7px;
		min-width: 98px;
		color: #333;
		border: 1px solid #ccc;
	}
	option {
		padding: 0px 2px 1px;
		display: block;
	}
	
	/* container */
	form#join_content {
		width: 460px!important;
		margin: 0 auto!important;
	}
	.terms {
		margin-bottom: 20px;
		background-color: white;
		border: 1px solid #dadada;
	}
	.terms_span > input {
		position: absolute;
		right: 1px;
		top: 50%;
		width: 22px;
		height: 22px;
		margin-top: -11px;
		visibility: hidden;
	}
	.terms_span {
		position: relative;
		display: block;
		height: 58px;
	}
	.terms_p {
		display: block;
		padding: 15px;
		margin: 0px;
		position: relative;
	}
	.terms_span > label {
		background: url('image/check_off.gif') 100% 50% no-repeat;
		display: block;
		line-height: 20px;
		height: 58px;
		top: -1px;
		font-size: 15px;
		font-weight: 700;
	}
	.terms_span > input:checked +label{
		background-image: url('image/check_on.gif');
		/* background: url('image/check_on.gif') 100% 50% no-repeat; */
	}
	
	/* terms_li1 */
	#terms_ul {
		padding-left: 0;
		padding-bottom: 7px;
		list-style: none;
	}
	#terms_ul_li1 {
		border-top: 1px solid #f0f0f0;
	}
	ul#terms_ul > li {
		display: block;
		padding: 13px 15px 7px;
	}
	.ul_li_span {
		position: relative;
		display: block;
		height: 24px;
	}
	.label1 {
		height: 24px;
		font-size: 15px;
		font-weight: 700;
		line-height: 24px;
		position: absolute;
		color: #333;
		top: 0px;
		left: 0px;
		width: 100%;
	}
	.span_only {
		color: #d9b235;
		font-size: 14px;
		font-weight: 400;
	}
	.span_select {
		color: #8e8e8e;
		font-size: 14px;
		font-weight: 400;
	}
	.ul_li_span > input {
		visibility: hidden;
		position: absolute;
		right: 1px;
		width: 22px;
		height: 22px;
		margin-top: -11px;
		top: 50%;
	}
	.ul_li_span > label {
		background: url('image/check_off.gif') 100% 50% no-repeat;
		display: block;
	}
	.ul_li_span > input:checked +label {
		background-image: url('image/check_on.gif');
	}
	
	.terms_box {
		position: relative;
		box-sizing: border-box;
		height: 88px;
		margin-top: 11px;
		padding: 8px 10px;
		border: 1px solid #f0f0f0;
		background-color: #f7f7f7;
		overflow: auto;
	}
	.article {
		margin-top: 0px;
	}
	h3.article_title {
		font-size: 14px;
		font-weight: 700;
		line-height: 16px;
		color: #666;
	}
	.article > p {
		display: block;
		font-size: 14px;
		line-height: 16px;
		color: #666;
	}
	.btn_double_area {
		margin: 30px -5px 0px;
		overflow: hidden;
	}
	.btn_double_area > span {
		display: block;
		float: left;
		width: 50%;
	}
	.btn_type {
		width: auto;
		margin: 0px 5px;
		font-size: 20px;
		font-weight: 600;
		line-height: 61px;
		display: block;
		box-sizing: border-box;
		height: 61px;
		text-align: center;
	}
	.btn_default {
		color: #333;
		border: 1px solid #e7e7e7;
		background-color: #fff;
	}
	.btn_agree {
		color: #fff;
		border: 1px solid #ffdf24;
		background-color: #ffdf24;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
	.group_join {
		margin: 20px 0px 65px;
		text-align: center;
		color: #666;
		font-size: 12px;
	}
	.group_join > a {
		text-decoration: underline;
		color: #333;
	}
	#addr_logo {
		width: 63px;
		height: 11px;
	}
	#address {
		margin: 0px auto;
		text-align: center;
	}
	#address * {
		font: 9px verdana;
	}
	#address a {
		font-weight: bold;
	}
	#address a:hover {
		color: #1fbc02;
	}
	#err_check {
		display: none;
	}
	#err_check_msg {
		height: 24px;
		font-size: 11px;
		font-weight: 700;
		line-height: 24px;
		color: #f46665;
		padding: 0 15px;
		display: inline-block;
		width: 428px;
		text-align: center;
	}
</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	/*
	function allChecked() {
		var aCheck = document.getElementById("cbox").checked;
		if(aCheck == true) {
			document.getElementById("li1box").checked = true;
			document.getElementById("li2box").checked = true;
			document.getElementById("li3box").checked = true;
			document.getElementById("li4box").checked = true;
		} else if(aCheck == false){
			document.getElementById("li1box").checked = false;
			document.getElementById("li2box").checked = false;
			document.getElementById("li3box").checked = false;
			document.getElementById("li4box").checked = false;
		}
	}
	*/
	/* 체크 됐는지 안됐는지 확인하는 코드
		$("").is(":checked");
	   체크 / 해제 코드
	   	$("").prop("checked", true);
	*/
	//********************전체 (선택, 해제)********************//
	$(document).ready(function() {
		$("#cbox").on("click",function(){			// 콜백함수 , 익명함수... 안드로이드 개발에 많이 사용, 이벤트 시행시 함수 실행
			var cCheck = $("#cbox").is(":checked");
						   //this
				if(cCheck == true){
					$(".ckboxs").prop("checked",true);
				} else if(cCheck == false){
					$(".ckboxs").prop("checked",false);
				}
		});
	//---------------------------------------------------------//	
	//******하나라도 체크되지 않을 시 전체선택이 해제되게******//
		$(".ckboxs").on("click", function() {
			var ckLeng = $(".ckboxs:checkbox:checked").length;
			if(ckLeng == 4){
				$("#cbox").prop("checked", true);
			} else if(ckLeng != 4){
				$("#cbox").prop("checked", false);
			}
		});
	//---------------------------------------------------------//
	//************필수 체크안될시 오류메세지************//	
		$(".btn_agree").on("click",function(){
			/* alert("동의버튼을 클릭했을때"); */
			var filsu1 = $("#li1box").is(":checked");
			var filsu2 = $("#li2box").is(":checked");
			
			//----------------------------------------------
			//	if(filsu1 == true && filsu2 == true){
			//	var url = "join.bizpoll";
			//	$(location).attr('href',url);
			//		
			//	} else{
			//		alert("필수사항을 모두 체크해주세요."); 
			//		$("#err_check").css("display","block");
			//		return;
			//	} 
			//----------------------------------------------
			
				if(filsu1 == false && filsu2 == false){
					$("#err_check").css("display","block");
					return false;
				} else{
					
					$("#join_content").submit();
				}
		});
	//---------------------------------------------------------//
	});
	
	
</script>
</head>
<body>
	<div id="container">
		<form id="join_content" action="member.bizpoll" method="GET">
			<div class="terms">
				<p class="terms_p">
					<span class="terms_span">
						<input type="checkbox" id="cbox">
						<label for="cbox">
							이용약관, 개인정보 수집 및 이용,<br>
							위치정보 이용약관(선택), 프로모션 안내<br>
							메일 수신(선택)에 모두 동의합니다.
						</label>
					</span>
				</p>
				
				<ul id="terms_ul">
					<li id="terms_ul_li1">
						<span class="ul_li_span">
							<input type="checkbox" id="li1box" class="ckboxs">
							<label for="li1box" class="label1">
								이용약관 동의<span class="span_only">(필수)</span>
							</label>
						</span>
						<div class="terms_box">
							<div class="article">
								<h3 class="article_title">제 1 조 (목적)</h3>
								<p>이 약관은 TeaFunny & Cup. 회사가 제공하는 TeaFunny & Cup.이용 <br>
								및 사이트 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리,<br>
								의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p><br>
								
								<h3 class="article_title">제 2 조 (정의)</h3>
								<p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
								①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유<br>
								무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 네이버 및 네이<br>
								버 관련 제반 서비스를 의미합니다.</p>
							</div>
						</div>
					</li>
					<li id="terms_ul_li2">
						<span class="ul_li_span">
							<input type="checkbox" id="li2box" class="ckboxs">
							<label for="li2box" class="label1">
								개인정보 수집 및 이용에 대한 안내<span class="span_only">(필수)</span>
							</label>
						</span>
						<div class="terms_box">
							<div class="article">
								<p>정보통신망법 규정에 따라 티퍼니에 회원가입 신청하시는 분께 수집하는<br>
								개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이<br>
								용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p><br>
								
								<h3 class="article_title">1. 수집하는 개인정보</h3>
								<p>이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 티<br>
								퍼니 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 제품구매 및<br>
								주문 등과 같은 서비스 이용을 위하여 회원제 서비스를 이용하기 위해 회원<br>
								가입을 할 경우, 티퍼니는 서비스 이용을 위해 필요한 최소한의 개인정보를<br>
								수집합니다.</p>
							</div>
						</div>
					</li>
					<li id="terms_ul_li3">
						<span class="ul_li_span">
							<input type="checkbox" id="li3box" class="ckboxs">
							<label for="li3box" class="label1">
								위치정보 이용약관 동의<span class="span_select">(선택)</span>
							</label>
						</span>
						<div class="terms_box">
							<div class="article">
								<p>위치정보 이용약관에 동의하시면, <strong>위치를 활용한 광고 정보 수신</strong> 등을<br>
								포함하는 티퍼니 위치기반 서비스를 이용할 수 있습니다.</p><br>
								
								<h3 class="article_title">제 1 조 (목적)</h3>
								<p>이 약관은 티퍼니 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는<br>
								위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의<br>
								무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
							</div>
						</div>
					</li>
					<li id="terms_ul_li4">
						<span class="ul_li_span">
							<input type="checkbox" id="li4box" class="ckboxs">
							<label for="li4box" class="label1">
								이벤트 등 프로모션 알림 메일 수신<span class="span_select">(선택)</span>
							</label>
						</span>
					</li>
			<li>
			<div id="err_check">
				<span id="err_check_msg"> 티퍼니 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</span>
			</div>
			</li>
				</ul>
			</div>
			<div class="btn_double_area">
				<span><a href="index.bizpoll" class="btn_type btn_default">비동의</a></span>
				<span><a href="#" class="btn_type btn_agree">동의</a></span>
			</div>
		</form>
		<br>
		<br>
	</div>
</body>
</html>