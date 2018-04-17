<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="header.jsp" %>

<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
	
		$("#btn_success").on("click", function(){
				form.submit();
		});
	});
	$(document).ready(function() {
		$("#sub_input").val("");
		$("#name_input").val("");
		$("#con_input").val("");
	});
	
	
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
/* font-family: 'Hanna', serif; */
	body {
		font-family: 'Hanna', serif;
	}
	table {
		border-left: none;
		border-right: none;
		border-top: 2px solid #FFDF24;
		border-bottom : 2px solid #FFDF24; 
 		border-collapse: collapse;
 		width: 1000px;
	}
	tr {
		height: 100px;
		border: 1px solid #ddd;
		border-left: none;
		border-right: none;
	}
	tr, td {
		padding: 15px;
	}
	#contents {
		width: 1200px;
		margin: 10px 460px;
	}
	.tx_cen {
		text-align: center;
	}
	#sub_input {
		width: 500px;
	}
	#name_input {
		width: 150px;
	}
	#con_input {
		width: 700px;
		height: 200px;
	}
	#qna_select {
		width: 150px;
		height: 26px;
	}
	.empty {
		width: 25px;
	}
	#title {
		text-indent: 230px;
		font-size: 25px;
		font-weight: bold;
		color: #a7a7a7;
	}
	#btn_succ{
		text-indent: 230px;
		width: 200px;
		
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
		color: #ffdf24;
	}
	#page_footer {
		height: 200px;
	}
</style>
</head>
<body>
	<div id="contents">
			<form role="form" action="boardinsertsave.bizpoll" method="post">
		<table>
			<tbody>
				<tr class="bin">
					<td class="empty">
						<span>&nbsp;</span>
					</td>
					<td class="tx_cen">
						<span>&nbsp;</span>
					</td>
					<td class="empty">
						<span>&nbsp;</span>
					</td>
					<td id="title">
						<span>Q & A 작성하기</span>
					</td>
					<td class="empty">
						<span>&nbsp;</span>
					</td>
				</tr>
				<tr>
					<td class="empty">
						<span>&nbsp;</span>
					</td>
					<td class="tx_cen">
						<span>질문분류</span>
					</td>
					<td class="empty">
						<span>&nbsp;</span>
					</td>
					<td>
						<span>
							<select id="qna_select">
									<option value="선택해주세요.">선택해주세요.</option>
									<option value="-------------">-------------</option>
									<option value="상품관련">상품관련</option>
									<option value="주문/결제 관련">주문/결제 관련</option>
									<option value="교환/환불 관련">교환/환불 관련</option>
									<option value="배송관련">배송관련</option>
									<option value="품절관련">품절관련</option>
									<option value="해외배송">해외배송</option>
									<option value="기타문의">기타문의</option>
							</select>
						</span>
						<span id="select_m">
							&nbsp;&nbsp;&nbsp;※ 상품관련 문의시에는 해당 상품명을 반드시 기재해 주시기 바랍니다.
						</span>
					</td>
					<td class="empty">
						<span>&nbsp;</span>
					</td>
				</tr>
				<tr>
					<td class="empty">
						<span>&nbsp;</span>
					</td>
					<td class="tx_cen">
						<span>제목</span>
					</td>
					<td class="empty">
						<span>&nbsp;</span>
					</td>
					<td>
						<input type="text" id="sub_input" name="title">
					</td>
					<td class="empty">
						<span>&nbsp;</span>
					</td>
				</tr>
				<tr>
					<td class="empty">
						<span>&nbsp;</span>
					</td>
					<td class="tx_cen">
						<span>작성자</span>
					</td>
					<td class="empty">
						<span>&nbsp;</span>
					</td>
					<td>
						<input type="text" id="name_input" name="writer">
					</td>
					<td class="empty">
						<span>&nbsp;</span>
					</td>
				</tr>
				<tr>
					<td class="empty">
						<span>&nbsp;</span>
					</td>
					<td class="tx_cen">
						<span>문의내용</span>
					</td>
					<td class="empty">
						<span>&nbsp;</span>
					</td>
					<td>
						<input type="text" id="con_input" name="content">
					</td>
					<td class="empty">
						<span>&nbsp;</span>
					</td>
				</tr>
				<tr class="bin">
					<td class="empty">
						<span>&nbsp;</span>
					</td>
					<td class="tx_cen">
						<span>&nbsp;</span>
					</td>
					<td class="empty">
						<span>&nbsp;</span>
					</td>
					<td>
						<div id="btn_succ">
							<button id="btn_success">문의사항 작성완료</button>
						</div>
					</td>
					<td class="empty">
						<span>&nbsp;</span>
					</td>
				</tr>
			</tbody>
		</table>
			</form>
	</div>
	<div id="page_footer">
		<span>&nbsp;</span>
	</div>
</body>
</html>