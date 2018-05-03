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
		/* border-top: 2px solid #FFDF24; */
		border-bottom : 2px solid #FFDF24; 
	}
	table {
		 /* border-collapse: collapse; */
		 table-layout: fixed;
		 /* word-break: break-all; */
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
		border-radius: 5px;
	}
	.contents {
		width: 500px !important;
		text-align: left;
		padding-left: 100px !important; 
	}
	#con {
		width: 700px !important;
		text-align: center;
	}
	#re_con{
		width: 700px;
		padding-left: 90px;
		text-align: left;
	}
	#rewrite{
		width: 700px !important;
		text-align: left;
	}
	.name {
		width: 130px !important;
		text-align: center;
		border-radius: 5px;
	}
	.date {
		width: 170px !important;
		text-align: center;
		border-radius: 5px;
	}
	.view {
		width: 100px !important;
		text-align: center;
		border-radius: 5px;
		
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
		width: 550px;
		height: 145px;
		font-family: 'Hanna', serif;
		font-size: 18px;
		color: #ddd;
		border: 1px solid #ededed;
	}
	#rn_input {
		width: 100px;
		height: 145px;
		border: none;
		text-align: center;
		font-family: 'Hanna', serif;
		font-size: 16px;
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
		font-family: 'Hanna', serif;
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
		font-family: 'Hanna', serif;
		}
	#bno {
		border: 1px solid white;
		text-align: center;
		font-family: 'Hanna', serif;
		width: 100px !important;
		font-size: 15px;
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
		font-family: 'Hanna', serif !important;	
	}
	#noreply {
		text-align: center;
		padding-bottom: 20px;
	}
	#file_upload{
		font-size: 16px;
		color: #FFDF24;
		background-color: white;
		text-align: center;
		font-weight: bold;
	}
	/* #good_fafa {
		color: #FFDF24;
		font-size: 30px;
		background-color: white;
		border: none;
		text-align: right;
		height: 36px;
		line-height: 25px;
		text-align: center;
	}  */
	#goodcnt {
		/* border: 2px solid #FFDF24;  */
		background-color: white;
		width:70px;
		height: 25px;
		margin-bottom: 10px;
		//font-size: 20px;
		//color: #FFBB00;
		text-align: center;
		/* border-radius: 5px; */
		line-height: 25px;
		border: none;
	}
	#down {
		text-decoration: none;
	}
	#download {
		color: #a7a7a7;
	}
	#downcnt {
		margin-left: 50px;
		color: #FFBB00;
	}
	#fafa_icon, #good_fafa {
		color: #FFBB00;
	}
	#viewcnt, #goodcnt {
		color: #555555;
	}
	#table_top {
		background-color: #FFDF24;
		color: white;
		border-radius: 5px;
		border: #FFDF24;
		height: 40px;
	}
	
	
	
	
	
	
	.mask {
 		width:100%;
 		height:100%;
 		position:fixed;
 		left:0;
 		top:0;
 		z-index:10;
 	}
 	#mo_board_del {
 		display:none;
 		position:relative;
 		font-family: 'Hanna', serif;
 	}
 	#mo_board_del .modal_del {
 		width: 180px;
 		height: 120px;
 		padding: 35px;
 		border:1px solid #ccc;
 		border-radius: 15px;
 		position:fixed;
 		left:50%;
 		top:50%; 
 		z-index:11;
 		background:#fff;
 		text-align: center;
 	}
	#text {
		font-size: 15px;
	}
	#sel_bbtn{
		margin: 0 auto;
	}
	#remove_btn2 {
		float: left;
	}
	#cancel_bbtn {
		float: right;
	}
	.bbtn{
		font-family: 'Hanna', serif;
		margin: 50px 15px 0 15px;
		color: #555555;
		padding: 7px 14px;
		font-size: 15px;
		cursor:pointer;		
		background-color: #ededed;
		border-radius: 5px;
		border: 1px solid white;
	}
	.bbtn:hover {
		border: 1px solid #ffdf24;
		background-color: white;
		color: #ffdf24;
	}
</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">

	/* var formObj2 = $("#frm2");
	var formObj3 = $("#frm3"); */
	
	$(document).ready(function(){
		  var mo_board_del = $("#mo_board_del");
		  var del_link = $(".del_link");
		  var modalCont = $(".modal_del");
		  var marginLeft = modalCont.outerWidth()/2;
		  var marginTop = modalCont.outerHeight()/2; 
		 
		  del_link.click(function(){
		    mo_board_del.fadeIn("slow");
		    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
		    $(this).blur();
		    $(".modal_del > a").focus(); 
		    return false;
		  });
		  
	/* // 삭제버튼 클릭
		  $("#remove_btn2").on("click", function(){
			formObj2.attr("action", "boarddelete.bizpoll");
			formObj2.attr("method", "get");
			formObj2.submit();
		  }); */
	
		  $("#cancel_btn").click(function(){
		    mo_board_del.fadeOut("slow");
		    del_link.focus();
		  });
		  
		  $("#okay_btn").click(function(){
			mo_board_del.fadeOut("slow");
			del_link.focus();
		  });        
		});

	$(document).ready(function() {
		var formObj = $("#frm1");
		
		comment_list();
		
		
		
		// 좋아요 버튼 클릭
		/*  $("#good_fafa").on("click", function(){
			 
			 $(this).attr("class", "fa fa-heart");
			alert("좋아요?");
			location.href="goodpoint.bizpoll";
		});  */
		
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
		 /*  $("#remove_btn").on("click", function(){ */
			/* formObj.attr("method", "get");
			formObj.submit();  */
			
			/* var bno = $("#bno").val();
			var pcode = $("#pcode").val();
			//alert(bno);
			var replycnt = $("#re_count").val();
			
			if(replycnt > 0) {
				alert("댓글이 있는 글은 삭제하실 수 없습니다.");
				//$("#knboard_detail_rspan".focus();
				return false;
			} else{
				
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
				/* window.open(url,"_blank_1", "toolbar=no, menubar=no, status=no, scrollbars=no, resisable=no, left=" 
						+ px + ", top=" + py + ",width=" + cw + ",height=" + ch);
				
				
				alert(pcode);
				
				if(pcode == 1){
					location.href="qna.bizpoll";
				}  else if(code != 1){
					location.href="index.bizpoll";
				}
				
			}
			
			
		}); */   
				
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
				
			var replyinsert = $("#replyinsert");
			
			/* $("#re_btn").on("click", function(){
				alert("댓글달기 버튼 클릭!!!!!!!!");
				replyinsert.submit();
			}); */		
				
		 
	});
		
	$(document).ready(function(){
		  var mo_board_del = $("#mo_board_del");
		  var del_link = $(".del_link");
		  var modalCont = $(".modal_del");
		  var marginLeft = modalCont.outerWidth()/2;
		  var marginTop = modalCont.outerHeight()/2; 
		 
		  del_link.click(function(){
		    mo_board_del.fadeIn("slow");
		    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
		    $(this).blur();
		    $(".modal_del > a").focus(); 
		    return false;
		  });
		 
		  $(".modal_del > button").click(function(){
		    mo_board_del.fadeOut("slow");
		    del_link.focus();
		  });        
		});
	
		
	// 댓글 등록 AJAX
	$(document).on("click", "#re_btn", function(){
		
		// 댓글 내용
		var re_input = $("#re_input").val();
		
		// 댓글 작성자
		var rn_input = $("#rn_input").val();
		
		// 댓글 번호
		var re_bno = $("#re_bno").val();
		$.ajax({
			url: "reply.bizpoll",
			type: "POST",
			dataType: "json",
			data: "re_input="+ re_input + "&rn_input=" + rn_input + "&re_bno=" + re_bno,
			success: function(data) {
				//alert("댓글 등록 성공");
				comment_list();
			},
			error: function() {
				alert("System Error!!!");
			}
		});
		
		
	});
	
	
	// 댓글 삭제 AJAX
	$(document).on("click", ".reply_del", function(){
		var rno = $(this).attr("data_num");
		//alert("rno =" + rno);
		//alert("test");
		// ajax : 비동기 데이터 처리
		// ( 페이지 이동 없이 데이터 이동이 가능하며 컨트롤러와 모델단을 타고다녀와 원래의 페이지로 돌아오는 것)
		 $.ajax({
	 		 url: "replydelete.bizpoll",
	 		 type: "POST",	// 타입은 뭐로 보내든 상관이 없어요, 뭐든 갔다 돌아오기 때문에
	 		 dataType: "json",
	 		 data: "rno=" + rno,
	 		 success: function(data) {
	 			//alert("댓글 삭제 성공");
	 			comment_list();
	 		 },
	 		 error: function() {
	 			 alert("System Error!!!");
	 		 }
	 	 });
	});
		
		
		
	function comment_list() {
		var bno = ${boardview.bno};
		$.ajax({
			type: "post",
			url: "commentlist.bizpoll",
			data: "bno=" + bno,
			success: function(result) {
				$("#commentList").html(result);
			}
		});
	}
		 $(document).on("click", "#good_fafa", function(){
			alert("좋아요 클릭!");
			
			var gpoint = $("#gpoint").val();
			var bno = ${boardview.bno};
			$.ajax({
				url: "goodpoint.bizpoll",
				type: "POST",
				dataType: "json",
				data: "bno=" + bno,
				success: function(data) {
							alert(data.gpoint);
						if(data.gpoint >= "0"){
							alert("좋아요 포인트 증가 성공");
							location.reload();
							$("#good_fafa").attr('class', 'fa fa-heart');
						} else{
							 alert("좋아요 포인트 증가 실패");
							 return false; 
						 }
				},
				error: function() {
					alert("System Error!!!");
				}
			});
			
		});  
		$(document).on("click", "#rewrite_btn", function(){
			location.href="answer.bizpoll?bno=${boardview.bno}";
		});
		
		
	/* $(document).ready(function() {
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
				
		
		
	}); */
	/* $(document).ready(function() {
		
		var replyinsert = $("#replyinsert");
		
		$("#re_btn").on("click", function(){
			alert("댓글달기 버튼 클릭!!!!!!!!");
			replyinsert.submit();
		});
	}); */
	
	



	/* // 댓글 등록 AJAX
	$(document).on("click", "#re_btn", function(){
		
		// 댓글 내용
		var re_input = $("#re_input").val();
		
		// 댓글 작성자
		var rn_input = $("#rn_input").val();
		
		// 댓글 번호
		var re_bno = $("#re_bno").val();
		$.ajax({
			url: "reply.bizpoll",
			type: "POST",
			dataType: "json",
			data: "re_input="+ re_input + "&rn_input=" + rn_input + "&re_bno=" + re_bno,
			success: function(data) {
				//alert("댓글 등록 성공");
				comment_list();
			},
			error: function() {
				alert("System Error!!!");
			}
		});
		
		
	}); */






	 /* // 댓글 삭제 AJAX
	$(document).on("click", ".reply_del", function(){
		var rno = $(this).attr("data_num");
		//alert("rno =" + rno);
		//alert("test");
		// ajax : 비동기 데이터 처리
		// ( 페이지 이동 없이 데이터 이동이 가능하며 컨트롤러와 모델단을 타고다녀와 원래의 페이지로 돌아오는 것)
		 $.ajax({
	 		 url: "replydelete.bizpoll",
	 		 type: "POST",	// 타입은 뭐로 보내든 상관이 없어요, 뭐든 갔다 돌아오기 때문에
	 		 dataType: "json",
	 		 data: "rno=" + rno,
	 		 /* success: function(data) {
	 			//alert("댓글 삭제 성공");
	 			comment_list();
	 		 },
	 		 error: function() {
	 			 alert("System Error!!!");
	 		 }
	 	 });
	});   */
	

/* 	$(document).ready(function() {
		comment_list();
	});
	
	function comment_list() {
		var bno = ${boardview.bno};
		$.ajax({
			type: "post",
			url: "commentlist.bizpoll",
			data: "bno=" + bno,
			success: function(result) {
				$("#commentList").html(result);
			}
		});
	} */
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
			
			
			
			
		</div>
		
			<table id="table_top">
				<tbody>
					<tr>
						<td class="no"><span>NO</span></td>
						<td id="con"><span>CONTENTS</span></td>
						<td class="name"><span>NAME</span></td>
						<td class="date"><span>DATE</span></td>
						<td class="view"><span>&nbsp;</span></td>
					</tr>
				</tbody>
			</table>
			<table id="table_contents">
				<tbody>
					<!-- <tr>
						<td colspan="5" bgcolor="#FFDF24" height="1"></td>
					</tr> -->
			<!-- 작성 정보 -->
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
							<i id="fafa_icon" class="fa fa-eye"></i>
							<span id="viewcnt">${boardview.viewcnt}</span>
							&nbsp;&nbsp;
							<i id="good_fafa" name="good_fafa" class="fa fa-heart-o"></i>
							<input type="hidden" id="gpoint" value="${gpoint}" readonly="readonly">
							<span id="goodcnt">${boardview.goodcnt}</span>
						</td>
					</tr>
			<!-- 첨부파일 -->
			<c:if test="${boardview.filesize > 0}">
					<tr>
						<td id="file_upload">
							<span><i class="fa fa-file"></i></span>
						</td>
						<td class="contents">
							<a href="download.bizpoll?bno=${boardview.bno}" id="down">
								<span id ="download">${boardview.filename}</span>
								<span id="downcnt">
									<i class="fa fa-arrow-circle-o-down"></i>
									${boardview.downcnt}
								</span>
							</a>
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
			</c:if>
				
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
						<td id="rewrite">
							<c:choose>
								<c:when test="${empty sessionScope.loginUser}">
									<span>&nbsp;</span>
								</c:when>
								<c:otherwise>
									<input type="button" class="board_btn" id="rewrite_btn" value="답변">
								</c:otherwise>
							</c:choose>
						</td>
						<c:choose>
							<c:when test="${sessionScope.loginUser.mid == boardview.writer}">
								<td class="name">
									<input type="button" class="board_btn" id="modify_btn"  value="수정">
								</td>
								<td class="date">
									<a href="#mo_board_del" class="del_link"><input type="button" class="board_btn" id="remove_btn"  value="삭제"></a>
									<input type="hidden" name="pcode" id="pcode" value="${pcode}">
								</td>
							</c:when>
							<c:otherwise>
								<td class="name">
									<span>&nbsp;</span>
								</td>
								<td class="date">
									<span>&nbsp;</span>
								</td>
							</c:otherwise>
						</c:choose>
						<td class="view">
							<a href="#"><input type="button" id="wr_btn" value="글쓰기"></a>
						</td>
						
					</tr>
					<tr>
						<td colspan="5" bgcolor="white" height="50"></td>
					</tr>
					
					<!-- <tr>
						<td colspan="5" bgcolor="#ddd" height="1"></td>
					</tr> -->
					</tbody>
					
					<!-- 댓글 -->
					<input type="hidden" id="re_count" name="re_count" value=" ${re_count}">
					<tbody id="commentList"></tbody>
					
					<!-- 댓글 등록 -->
					
					<tbody>
					
					<tr>
						<td colspan="5" bgcolor="#EEEEEE" height="1"></td>
					</tr>
					<tr>
					
				<c:choose>
					<c:when test="${empty sessionScope.loginUser}">
							<td colspan="5" id="re_login">
								<span id="re_idch"><a href="#" id="login">로그인</a>을 하시면 댓글과 답변을 등록하실 수 있습니다.</span>
							</td>
					</c:when>
					<c:otherwise>
							<td class="no" >
								<span>&nbsp;</span>
							</td>
					<form id="replyinsert" name="replyinsert" action="reply.bizpoll" method="post">
					<input type="hidden" name="re_bno" id="re_bno" value="${boardview.bno}" >
							<td id="re_con">
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
					</c:otherwise>
				</c:choose>
						</tr>
				</tbody>
			</table>
	</div>
	<div id="page_footer">
		<span>&nbsp;</span>
	</div> 
	
	<!-- footer 위치 -->
	<div id="footer">
		<%@ include file="footer.jsp"%>
	</div>
	
<!-- 게시글 삭제 확인 모달창 -->
	<div id="mo_board_del">
	  <div class="modal_del">
	  	<c:choose>
			<c:when test="${bno != '0'}">
						<span id="text">글을 삭제하시겠습니까?</span>
					<div id="sel_bbtn">
							<br>
							<a href="boarddelete.bizpoll?bno=${boardview.bno}">
								<button class="bbtn" id="remove_btn2">삭제</button>
							</a>
							<button class="bbtn" id="cancel_btn">취소</button>
					</div>
			</c:when>
			<c:when test="${re_count !='0'}">
						<span id="text">해당 글은 댓글이 있어 삭제가 불가 합니다.</span>
				<div id="sel_bbtn">
						<br>
						<button class="bbtn" id="okay_btn">확인</button>
				</div>
			</c:when>
		</c:choose>
		</div>
	</div>
	
</div>
</body>
</html>