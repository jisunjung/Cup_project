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
<title>member join</title>
<link rel="icon" type="image/png" href="image/cupfavi.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
/* font-family: 'Nanum Gothic', serif; */
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
/* font-family: 'Jeju Gothic', serif; */
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
/* font-family: 'Hanna', serif; */
	body {
		margin: 0;
		padding: 0;
		list-style-type: none;
		font-family: 'Hanna', serif;
		background-color: #FFFFFF;	
		min-width: 1080px;
		}
	#join_page {
		width: 1200px;
		margin: 100px 360px 100px 360px;
		font-size: 14px;
		}
	#mem_join {
		text-align: center;
		font-size: 20px;
		color: #555555;
		height: 28px;
		line-height: 24px;
		font-weight: bold;
	}
	#join_topline {
		border-bottom: 5px solid #ededed;
		width: 1200px;
	}
	#mem_inner {
		text-align: left;
		font-size: 16px;
	}
	.div_input{
		margin-top: 15px;
		margin-left: 400px;
		padding: 3px;
	}
	.err_check_msg {
		font-size: 13px;
		color: red;
		display: none; 
		padding-top: 8px; 
		padding-left: 50px;
	}
	.red_star {
		color: #FF6000;
	}
	.white_star {
		color: white;
	}
	.btn{
		border: none;
		color: white;
		background-color: black;
		border-radius: 3px;
		font-size: 16px;
		line-height: 12px;
		/* height: 16px; */
		text-align: center;
	}
	
	#btn_success { 
		margin-top: 40px;
		color: #555555;
		padding: 7px 14px;
		font-size: 16px;
		cursor:pointer;		
		background-color: #ededed;
		border-radius: 5px;
		border: 1px solid white;
		font-family: 'Hanna', serif;
	}
	#btn_success:hover {
		border: 1px solid #ffdf24;
		background-color: white;
		color: #555555;
	}
	#member_pw2 {
		padding-top: 5px;
	}
	.add {
		margin-top: 5px;
		margin-left: 77px;
	}
	.inputbox {
		width: 130px;
	}
	#selmail {
		font-family: 'Hanna', serif;
		font-size: 16px;
	}
	#add_btn {
		font-family: 'Hanna', serif;
		font-size: 16px;
		padding: 3px 6px;
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
	
	// 유효성 체크
	$(document).ready(function() {
	
		$(document).on("click", "#btn_success", function(){
			
			var form = $("#frm_member");
			
			var mid = $("#input_id");
			var mpw1 = $("#input_pw");
			var mpw2 = $("#input_pw2");
			var mname = $("#input_name");
			var mphone = $("#input_phone");
			var memail1 = $("#input_email1");
			var memail2 = $("#input_email2");
			/* var madd1 = $("#sample6_postcode"); */
			
			var memail = $.trim(memail1.val()) + "@" + $.trim(memail2.val());
						
			var idckval = $("#idckval");
			 // * id : not null
			//
			var id = $.trim(mid.val());
			var idck = idckval.val();
			if (id == ""){
				mid.focus();
				$("#err_id").css("display","block");
				return false;
			}  else if(idck == "0"){
				mid.focus();
				$("#err_id").css("display","block");
				return false;
			}
						
			 // * password : not null
			//
			var pw1 = $.trim(mpw1.val());
			var pw2 = $.trim(mpw2.val());
			
			// 비밀번호 정규식
			var regPass = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; // 6~20 자 이내 숫자 + 영문
			
			if (pw1 == ""){
				mpw1.focus();
				$("#err_pw").css("display","block");
				return false;
			} else if(!regPass.test(pw1)){
				mpw1.select();
				$("#err_pw").text("6~20 자 이내 숫자와 영문을 조합해서 입력하세요. ").css("display","block");
				return false;
			} else if (pw2 == ""){
				mpw2.focus();
				$("#err_pw").css("display","block");
				return false;
			} else if (pw1 != pw2){
				mpw2.select();
				$("#err_pw").text("비밀번호가 일치하지 않습니다.").css("display","block");
				return false;
			} 
						
			 // * name : not null
			//
			var name = $.trim(mname.val());
			
			if (name == ""){
				mname.focus();
				$("#err_name").css("display","block");
				return false;
			} 
						 
			 // * email : not null
			//
 			var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if (memail1.val() == ""){
				memail1.focus();
				$("#err_email").css("display","block");
				return false;
			} else if(memail2.val() == ""){
				memail2.focus();
				$("#err_email").css("display","block");
				return false;
			} else if(!regEmail.test(memail)){
				memail1.focus();
				$("#err_email").text("정확한 값을 입력하세요.").css("display", "block");
				return false;
			}
			
			 // * phone : not null
			//
			var phone = $.trim(mphone.val());
			var regPhone = /^(?:(010\d{4})|(01[1|6|7|8|9]\d{3,4}))(\d{4})$/;
			
			if (phone == ""){
				mphone.focus();
				$("#err_phone").css("display","block");
				return false;
			} else if($.isNumeric(phone) == false){
				mphone.focus();
				mphone.val("");
				return false;
			} else if(!regPhone.test(phone)){
				mphone.focus();
				$("#err_phone").text("정확한 값을 입력하세요.").css("display","block");
				return false;
			}
			
			// 아이디 중복체크 버튼 클릭 여부
			/* var idck = $("#idck").val();
			var idck2 = $("#idck2").val();
			alert(idck2);
			if (idck != 1){
		 		mid.focus();
				$("#err_id").text("아이디 중복확인을 해주세요.").css("display","block");
				return false;
			} else if (idck2 = false){
				mid.focus();
				$("#err_id").text("새로운 아이디를 입력해주세요.").css("display","block");
				return false;
			} */
			
			/* var idck = $("#idck").val();
			
			if (idck != 1){
		 		mid.focus();
				$("#err_id").text("아이디 중복확인을 해주세요.").css("display","block");
				return false;
			} 
			
			var idck2 = $("#idck2").val();
			if (idck2 = false){
				mid.focus();
				$("#err_id").text("새로운 아이디를 입력해주세요.").css("display","block");
				return false;
			} */
			
				form.submit();
			
		});
		
		 // *  아이디 중복체크 pop
		//
		$(document).on("click", "#idck_btn", function() {
			
			// 새창의 크기
			cw=550;
			ch=300;
			
			// 스크린의 크기
			sw=screen.availWidth;
			sh=screen.availHeight;
			
			// 팝업 창의 포지션
			px=(sw-cw)/2;
			py=(sh-ch)/2;
			
			var id = $("#input_id").val();
			var url = "id_olap_ck.bizpoll?memberid=" + id;
			

			window.open(url,"_blank_1",
						"toolbar=no, menubar=no, status=no, scrollbars=no, resisable=no, left=" + px + ", top=" + py + ",width=" + cw + ",height=" + ch);
				});
		
			});
			
		 // * 주소 선택창
		//
		$(document).on("change", "#selmail", function(){
			//alert("test");
			var selmail = $("#selmail").val();
			
			if(selmail == "directval"){
				$("#input_email2").val("");
				$("#input_email2").focus();
			} else{
				$("#input_email2").val(selmail);
			}
			
		});
		
		 $(document).on("blur", "#input_id", function(){
			 var id = $(this).val();
			 
			 if(id == "") {
				 $(this).focus();
				 $("#err_id").css("display","block");
				 return false;
			 } else if(id != "") {
				 $("#err_id").css("display","none");
			 	 $.ajax({
			 		 url: "memajax.bizpoll",
			 		 type: "POST",
			 		 dataType: "json",
			 		 data:"id="+ id,
			 		 success: function(data) {
			 			 if(data.flag == "0"){
			 				$("#err_id").text("중복된 아이디 입니다.").css("display","block");
			 				$("#idckval").val("0");
			 				
			 			 } else {
			 				$("#err_id").text("멋진 아이디 입니다.").css("display","block").css("color","blue");
			 				$("#idckval").val("1");
			 			 }
			 		 },
			 		 error: function() {
			 			 alert("System Error!!!");
			 		 }
			 	 });
			 }
		 });
		 
</script>
</head>
<body>
	<div id = "join_page">
		<div id="mem_join">J O I N</div>
		<div id="join_topline"></div>
		<form name="frm_member" id="frm_member" action="memberinsert.bizpoll" method="POST">
			<div id="mem_inner">
				<div id ="div_input">
					<div class="div_input" id="member_id">
						<font class="red_star">*</font>
						<label for="input_id">아이디:</label>
						<input type="text" id="input_id" name="input_id" class="inputbox">
						<input type="hidden" id="idckval" name="idckval" value="0">
						<!-- <input type="button" class="btn" name="idck_btn" id="idck_btn" value="아이디중복체크"> -->
						<input type="hidden" id="idck">
						<input type="hidden" id="idck2">
						<span class="err_check_msg" id="err_id">아이디를 입력해주세요.</span>
					</div>
					<div class="div_input" id="member_pw">
						<font class="red_star">*</font>
						<label for="input_pw">비밀번호:</label>
						<input type="password" id="input_pw" name="input_pw" class="inputbox" ><br>
						<div id="member_pw2">
						<font class="red_star">*</font>
						<label for="input_pw2">비밀번호 확인:</label>
						<input type="password" id="input_pw2" class="inputbox">
						<span class="err_check_msg" id="err_pw">비밀번호를 확인해주세요.</span>
						</div>
					</div>
					<div class="div_input" id="member_name">
						<font class="red_star">*</font>
						<label for="input_name">이름:</label>
						<input type="text" id="input_name" name="input_name" class="inputbox" size="10">
						<span class="err_check_msg" id="err_name">이름을 입력해주세요.</span>
					</div>
					<div class="div_input" id="member_birth">
						<font class="white_star">*</font>
						<label for="input_birth">생년월일:</label>
						<input type="text" id="input_birth1" name="input_birth" class="inputbox"><br>
					</div>
					<div class="div_input">
						<font class="red_star">*</font>
						<label for="input_email">E-mail:</label>
						<input type="text" id="input_email1" name="input_email1" size="10">
						<span>@</span>
						<input type="text" id="input_email2" name="input_email2" class="inputbox" size="20">
						<select id="selmail">
							<option value="-이메일 선택-">-이메일 선택-</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="yahoo.com">yahoo.com</option>
							<option value="empas.com">empas.com</option>
							<option value="korea.com">korea.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="directval" >직접입력</option>
						</select>
						<span class="err_check_msg" id="err_email">이메일을 입력해주세요.</span>
					</div>
					<div class="div_input">
						<font class="red_star">*</font>
						<label for="input_phone">연락처:</label>
						<input type="text" id="input_phone" name="input_phone" size="20">
						<span class="err_check_msg" id="err_phone">-없이 연락처를 입력해주세요.</span>
					</div>
					<div class="div_input">
						<font class="white_star">*</font>
						<label for="input_add">기본 배송지:</label>
						<input type="text" id="sample6_postcode" size="8" name="input_add">
						<input type="button" class="btn" id="add_btn"  onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" class="add" id="sample6_address"  size="50" name="input_add"><br>
						<input type="text" class="add" id="sample6_address2" size="50" name="input_add">
						<span class="err_check_msg" id="err_add">기본 배송지를 입력해주세요.</span>
					</div>
				</div>
			</div>
		</form>
		<center><input type="button" id="btn_success" value="회원가입 작성완료"></center>
	</div>

	<!-- footer 위치 -->
	<div id="footer">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>