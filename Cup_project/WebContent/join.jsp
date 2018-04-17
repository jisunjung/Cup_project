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
<title>TeaFunny And Cup.</title>
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
	/* 회원가입 page */
	#join_page {
		width: 1200px;
		margin: 10px 360px;
		font-family: 'Nanum Gothic', serif;
		font-size: 13px;
	}
	.join_topline {
		height: 1px;
	 	background-color: #ededed;
		width: 1200px;
	}
	
	.mem_join {
		font-size: 16px;
		color: #555555;
		height: 28px;
		line-height: 24px;
		font-weight: bold;
	}
	
	.join_mulline {
		height: 0.2px;
		width: 1200px;
		background-color: #fcd3db;
	}
	.star {
		color: #FF6000;
	}
	
	.ps_check {
		padding: 0 70px 0 150px;
		color: #5D5D5D;
		letter-spacing: -1;
	}
	
	#birth_year {
		width: 60px;
	}
	
	#birth_month {
		width: 30px;
	}
	
	#birth_day {
		width: 30px;
	}
	#btn_succ{
		width: 200px;
		margin: 0 auto;
	}
	#btn_success { 
			color: #555555;
			padding: 7px 14px;
			font-size: 16px;
			cursor:pointer;		
			background-color: #ededed;
			border-radius: 5px;
			border: 1px solid white;
	}
	#btn_success:hover {
		border: 1px solid #ffdf24;
		background-color: white;
		color: #555555;
	}
	.btn{
		border: none;
		color: white;
		background-color: black;
		border-radius: 3px;
		font-size: 12px;
		line-height: 12px;
		height: 16px;
		text-align: center;
	}
	.err_check_msg {
		font-size: 5px;
		color: red;
		text-align: left;
		display: none;
		padding-left: 90px;
		padding-top: 3px;
	}
	
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(document).on("click", "#idck_btn", function() {
			//alert("버튼 눌림!!!")
			
			// 새창의 크기
			cw=550;
			ch=300;
			
			// 스크린의 크기
			sw=screen.availWidth;
			sh=screen.availHeight;
			
			// 팝업 창의 포지션
			px=(sw-cw)/2;
			py=(sh-ch)/2;
			
			var id = $("#id_input").val();
			var url = "id_olap_ck.bizpoll?memberid=" + id;
			window.open(url,"_blank_1",
						"toolbar=no, menubar=no, status=no, scrollbars=no, resisable=no, left=" + px + ", top=" + py + ",width=" + cw + ",height=" + ch);
		});
	});
</script>
</head>
<body>
	<div id="header">
		
		<!-- join -->
		<div id="join_page">
		<form name="frm_member" id="frm_member" action="memberinsert.bizpoll" method="POST">
			<table>
				<tbody>
					
					<tr class="mem_join">
						<th>J O I N</th>
					</tr>
					<tr>
						<td class="join_topline"></td>
					</tr>
					<tr>
							<td class="mem_inner" align="center">
								<table width="100%" cellpadding="5" cellspacing="8" border="0">
									<tr>
										<td id="member_id"><font class="star">*</font>아이디
										<input type="text" name="shopid" value="" maxlength="10" size="10"  id="id_input">&nbsp;&nbsp;&nbsp;
										<button class="btn" name="chk_id" id="idck_btn">아이디중복체크</button></td>
									</tr>
									<tr>
										<td class="err_check_msg" id="err_id">아이디를 입력해주세요.</td>
									</tr>
									<tr>
										<td id="member_ps"><font class="star">*</font>비밀번호
										<input type="password"  name="shoppw" id="pw_input" size="10"></td>
									</tr>
									<tr>
										<td id="ps_check"><font class="star">*</font>비밀번호 확인
										<input type="password"  id="pwck_input" size="10" ></td>
									</tr>
									<tr>
										<td class="err_check_msg" id="err_pw">비밀번호를 확인해주세요.</td>
									</tr>
									<tr>
										<td id="member_name"><font class="star">*</font>이름
										<input type="text" name="name" value="" size="10" id="name_input"></td>
									</tr>
									<tr>
										<td class="err_check_msg" id="err_name">이름을 입력해주세요.</td>
									</tr>
									<tr>
										<td class="member_bo">생년월일
										<input type="text">
										
									</tr>
									<tr>
										<td class="member_em">이메일
										<input type="text" name="eamil" value=""  size="30"></td>
									</tr>
									<tr>
										<td class="member_ph"><font class="star">*</font>연락처
										<input type="text" size="11" maxlength="11" id="phone_input">
										</td>
									</tr>
									<tr>
										<td class="err_check_msg" id="err_phone">-없이 전화번호를 입력해주세요</td>
									</tr>
									<tr>
										<td class="member_po"><font class="star">*</font>기본 배송지<input type="text" id="sample6_postcode">&nbsp;&nbsp;&nbsp;
										<input class="btn" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br><br>
										<input type="text" id="sample6_address">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" id="sample6_address2"></td>		
									</tr>
									<tr>
										<td class="err_check_msg" id="err_add">기본 배송지를 입력해주세요.</td>
									</tr>
								</table>
							</td>
							
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div id="btn_succ">
			<button id="btn_success">회원가입 작성완료</button>
		</div>
		
		
	</div>
</body>
</html>