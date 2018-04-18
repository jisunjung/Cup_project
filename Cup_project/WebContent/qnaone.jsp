<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<%@ include file="header.jsp" %> 


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
/* font-family: 'Hanna', serif; */
	
	body{
		margin: 0;
		padding: 0;
		/* font-family: 'Nanum Gothic', serif; */
		font-family: 'Hanna', serif;
		background-color: #FFFFFF;	
		min-width: 960px;
	}
	#table {
		width: 1200px;
		margin: 100px 360px;
	}
	#table_contents, #inner_contents {
		border-left: none;
		border-right: none;
		border-top: 2px solid #FFDF24;
		border-bottom : 2px solid #FFDF24; 
	}
	table {
		 /* border-collapse: collapse; */
		 table-layout: fixed;
		 word-break: break-all;
	}
	#subject {
		font-size: 45px;
		text-align: center;
		/* font-weight: bold; */
		color: #a7a7a7;
	}
	tr {
		height: auto;
	}
	.no, .contents, .name, .date {
		/* border: 1px solid #ddd; */
		padding: 5px 0;
	}
	#table_contents {
		width: 1200px;
		margin: 0;
	}
	.no {
		width: 100px !important; 
		text-align: center;
	}
	.contents {
		width: 700px !important;
		text-align: left;
		padding-left: 100px !important; 
	}
	con {
		width: 700px !important;
		text-align: left;
	}
	.name {
		width: 130px !important;
		text-align: center;
	}
	.date {
		width: 170px !important;
		text-align: center;
	}
	.view {
		width: 100px !important;
		text-align: center;
	}
	#inner_consub {
		text-align: center;
	}
	#list {
		text-align: left;
	}
	#re {
		color: #990000;
		font-size: 16px;
		background-color: white;
		border: 1px solid #990000;
		border-radius: 5px;
		width: 120px;
		padding: 5px;
	}
	#re_count {
		color: black;
	}
	#con_size {
		height: 200px;
	}
	#re_input {
		width: 700px;
		height: 145px;
	}
	#rn_input {
		width: 100px;
		height: 145px;
		border: none;
		text-align: center;
	}
	#page_footer {
		height: 200px;
	}
	#re_btn {
		border-radius: 5px;
		background-color: #FFDF24;
		border: none;
		width: 100px;
		height: 26px;
		margin-bottom: 10px;
		color: white;
		/* font-weight: bold; */
		font-size: 15px;
		cursor:pointer;	
	}
	.board_btn {
		border-radius: 5px;
		background-color: #FFDF24;
		border: none;
		width: 70px;
		height: 26px;
		margin-bottom: 10px;
		color: white;
		/* font-weight: bold; */
		font-size: 15px;
		cursor:pointer;	
		border: 0 15px;
		}
	#bno {
		border: 1px solid white;
		text-align: center;
	}
	#re_login {
		text-align: center;
		height: 100px;
	}
	#re_idch {
		color: black;
	}
	#login {
		color: #FFBB00;
		text-decoration: none;
		font-size: 17px;
	}
	form {
		font-family: 'Hanna', serif !important;	
	}
	#wr_btn {
		background-color: #FFDF24;
		border: none;
		width: 100px;
		height: 26px;
		margin-bottom: 10px;
		border-radius: 5px;
		color: white;
		/* font-weight: bold; */
		font-size: 15px;	
		cursor:pointer;
		font-family: 'Hanna', serif !important;	
		
	}
	#recount {
		font-size: 18px;
		padding-left: 0px !important;
	}
	#remove_rebtn {
		border-radius: 5px;
		background-color: #FFDF24;
		width: 50px;
		height: 26px;
		margin-bottom: 10px;
		color: white;
		font-size: 15px;
		cursor:pointer;	
		border: none;
	}
</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		var formObj = $("#frm1");
		// 목록버튼 클릭
		$("#list_btn").on("click", function(){
			//alert("안녕");
			location.href="qna.bizpoll";
		});
		// 수정버튼 클릭
		$("#modify_btn").on("click", function(){
			//alert("dkdds");
			formObj.attr("action", "boardupdateview.bizpoll");
			formObj.attr("method", "get");
			formObj.submit();
		});
		// 삭제버튼 클릭
		$("#remove_btn").on("click", function(){
			/* formObj.attr("method", "get");
			formObj.submit();  */
			
			var bno = $("#bno").val();
			var pcode = $("#pcode").val();
			//alert(bno);
			// 새창의 크기
			cw=400;
			ch=200;
			// 스크린의 크기
			sw=screen.availWidth;
			sh=screen.availHeight;
			// 팝업 창의 포지션
			px=(sw-cw)/2;
			py=(sh-ch)/2;
			var url = "board_delete_ck.bizpoll?bno=" + bno;
			/* var url = "board_delete_ck.bizpoll"; */
			window.open(url,"_blank_1", "toolbar=no, menubar=no, status=no, scrollbars=no, resisable=no, left=" 
					+ px + ", top=" + py + ",width=" + cw + ",height=" + ch);
			
			
			alert(pcode);
			if(pcode == 1){
				location.href="qna.bizpoll";
			}  else if(code != 1){
				location.href="index.bizpoll";
			}
			
		});
	});
	$(document).ready(function() {
		//alert("모달창123");
		
		var code = $("#code").val();
		
		$("#wr_btn").on("click", function(){
			//location.href="writeqna.bizpoll";
			location.href="boardloginck.bizpoll";
		
			alert(code);
		
		});
	
			if(code == 1){
				alert("모달창 나와랏");
				$("#id01").css("display","block");
			} else if(code != 1){
				$("#id01").css("display","none");
			}
				
		
		
	});
	$(document).ready(function() {
		
		var replyinsert = $("#replyinsert");
		
		$("#re_btn").on("click", function(){
			alert("댓글달기 버튼 클릭!!!!!!!!");
			replyinsert.submit();
		});
	});
</script>
<script type="text/javascript">
	$(document).on("click", ".reply_del", function(){
		var rno = $(this).attr("data_num");
		alert("rno =" + rno);
		//alert("test");
		// ajax : 비동기 데이터 처리
		// ( 페이지 이동 없이 데이터 이동이 가능하며 컨트롤러와 모델단을 타고다녀와 원래의 페이지로 돌아오는 것)
		 $.ajax({
	 		 url: "replydelete.bizpoll",
	 		 type: "POST",	// 타입은 뭐로 보내든 상관이 없어요, 뭐든 갔다 돌아오기 때문에
	 		 dataType: "json",
	 		 data: "rno=" + rno,
	 		 success: function(data) {
	 			alert("댓글 삭제 성공");
	 			//location
	 		 },
	 		 error: function() {
	 			 alert("System Error!!!");
	 		 }
	 	 });
	});
</script>
</head>
<body>
<div id="board">
	<div id="table">
		<div id="subject">
			<span>Q & A</span>
		</div>
		<div>
			<input type="hidden" name="code" id="code" value="${code}">
			<span width="100">&nbsp;</span>
			<span><a href="#"><input type="button" id="wr_btn" value="글쓰기"></a></span>
		</div>
			<table id="table_contents">
				<tbody>
					<tr>
						<td class="no">
							<span>NO</span>
						</td>
						<td id="con">
							<span>CONTENTS</span>
						</td>
						<td class="name">
							<span>NAME</span>
						</td>
						<td class="date">
							<span>DATE</span>
						</td>
						<td class="view">
							<span>VIEW</span>
						</td>
					</tr>
					<tr>
						<td colspan="5" bgcolor="#FFDF24" height="1"></td>
					</tr>
			<!-- 작성자 정보 -->
					<tr>
						<td class="no">
					<form method="post" id="frm1">
							<input type="text" name="bno" id="bno" value="${boardview.bno}" >
					</form>
						</td>
						<td class="contents">
							<span>${boardview.title}</span>
						</td>
						<td class="name">
							<span>${boardview.writer}</span>
						</td>
						<td class="date">
							<span>${boardview.regdate}</span>
						</td>
						<td class="view">
							<span>${boardview.viewcnt}</span>
						</td>
					</tr>
					<tr>
						<td colspan="5" bgcolor="#ddd" height="1"></td>
					</tr>
			<!-- 본문 -->
					<tr id="con_size">
						<td class="no">
							<span>문의내용</span>
						</td>
						<td class="contents">
							<span>
								${boardview.content}
							</span>
						</td>
						<td class="name">
							<span>&nbsp;</span>
						</td>
						<td class="date">
							<span>&nbsp;</span>
						</td>
						<td class="view">
							<span>&nbsp;</span>
						</td>
					</tr>
					<tr>
						<td colspan="5" bgcolor="#ddd" height="1"></td>
					</tr>
					<tr>
						<td colspan="5" bgcolor="white" height="10"></td>
					</tr>
					<tr>
						<td class="no" id="list">
							<input type="button" class="board_btn" id="list_btn" value="목록">
						</td>
						<td class="contents">
							<span>&nbsp;</span>
						</td>
						<td class="name">
							<span>&nbsp;</span>
						</td>
						<c:if test="${sessionScope.loginUser.mid == boardview.writer}">
						<td class="date">
							<input type="button" class="board_btn" id="modify_btn"  value="수정">
						</td>
						<td class="view">
							<input type="button" class="board_btn" id="remove_btn"  value="삭제">
							<input type="hidden" name="pcode" id="pcode" value="${pcode}">
						</td>
						</c:if>
					</tr>
					<tr>
						<td colspan="5" bgcolor="white" height="50"></td>
					</tr>
					<!-- <tr>
						<td colspan="5" bgcolor="#ddd" height="1"></td>
					</tr> -->
			<!-- 댓글 -->
					<tr>
						<td class="no">
							<span id="re">댓글&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="re_count">${re_count}</span></span>
						</td>
						<td class="contents" id="recount">
							<span>&nbsp;</span>
							<%-- <span>${re_count}</span> --%>	
							<%-- <span>${replyview.size()}</span> --%>
						</td>
						<td class="name">
							<span>&nbsp;</span>
						</td>
						<td class="date">
							<span>&nbsp;</span>
						</td>
						<td class="view">
							<span>&nbsp;</span>
						</td>
					</tr>
				<c:forEach items="${replyview}" var="replyview">
					<tr>
						<td colspan="5" bgcolor="#EEEEEE" height="1"></td>
					</tr>
					<tr>
						<td class="no">
							<span></span>
						</td>
						<td class="contents">
							<span>${replyview.content}</span>
						</td>
						<td class="name">
							<span>${replyview.writer}</span>
						</td>
						<td class="date">
							<span>${replyview.regdate}</span>
						</td>
						<c:if test="${sessionScope.loginUser.mid == replyview.writer}">
						<td class="view">
							<input type="button" value="삭제" id="remove_rebtn"  class="reply_del" name="input_rno" data_num="${replyview.rno}">
							<%-- <input type="button" id="remove_rebtn"  value="삭제" data_num="${replyview.rno}"> --%>
							<%-- <a href="#" id="reply_del">
							</a> --%>
						</td>
						</c:if>
					</tr>
				</c:forEach>
					
					
					<tr>
						<td colspan="5" bgcolor="#EEEEEE" height="1"></td>
					</tr>
					
				<c:choose>
					<c:when test="${empty sessionScope.loginUser}">
						<tr>
							<td class="no" >
								<span>&nbsp;</span>
							</td>
							<td class="contents" id="re_login">
								<span id="re_idch"><a href="#" id="login">로그인</a>을 하시면 댓글을 등록하실 수 있습니다.</span>
							</td>
							<td class="name">
								<span>&nbsp;</span>
							</td>
							<td class="date">
								<span>&nbsp;</span>
							</td>
							<td class="view">
								<span>&nbsp;</span>
							</td>
						</tr>
					</c:when>
					
					<c:otherwise>
						<tr>
							<td class="no" >
								<span>&nbsp;</span>
							</td>
					<form id="replyinsert" name="replyinsert" action="reply.bizpoll" method="post">
					<input type="hidden" name="re_bno" id="re_bno" value="${boardview.bno}" >
							<td class="contents">
								<input type="text" id="re_input" name="re_input" placeholder="댓글 작성하기" >
							</td>
							<td class="name">
								<input type="text" id="rn_input" name="rn_input" value="${sessionScope.loginUser.mid}">
							</td>
							<td class="date">
								<input type="button" id="re_btn" name="re_btn" value="댓글달기">
							</td>
					</form>
							<td class="view">
								<span>&nbsp;</span>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
				
				</tbody>
			</table>
	</div>
	<div id="page_footer">
		<span>&nbsp;</span>
	</div>
</div>
</body>
</html>