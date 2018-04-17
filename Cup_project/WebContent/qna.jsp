<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="header.jsp" %> 


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA</title>
<!-- <link rel="stylesheet" href="css/bootstrap.css"> -->
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
/* font-family: 'Nanum Gothic', serif; */
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
/* font-family: 'Hanna', serif; */
	body {
		font-family: 'Hanna', serif;
		line-height: 0 ;
	}
	#table {
		width: 1200px;
		margin: 10px 360px;
	}
	#board_table > tr {
		height: 30px;
	}
	.no {
		width: 100px;
		text-align: center;
	}
	.contents {
		width: 700px;
		text-align: left;
		padding-left: 100px; 
	}
	#contents {
		text-align: center;
	}
	.name {
		width: 130px;
		text-align: center;
	}
	.date {
		width: 170px;
		text-align: center;
	}
	.view {
		width: 100px;
		text-align: center;
	}
	#re {
		color: #990000;
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
	}
	#table_top {
		border-top: 2px solid #FFDF24;
		border-bottom : 2px solid #FFDF24;
	}
	.qnasearch {
		float: right;
	}
	#qnasearch_keyword {
		width: 140px;
		height: 26px;
		font-size: 13px;
		box-sizing: border-box;
		display: block;
		border: 1px solid #FFDF24;
		padding-left: 5px;
		margin-left: 15px;
	}
	#qnasearch_btn {
		width: 50px;
		height: 26px;
		background-color: #FFDF24; 
		color: #FFFFFF;
		display: block;
		border: 0px;
	}
	#page_num {
		text-align: center;
		margin-bottom: 100px;
		color: black!important;
	}
	#subject {
		font-size: 45px;
		text-align: center;
		/* font-weight: bold; */
		color: #a7a7a7;
	}
	#reline {
		height: 30px;
	}
	#line {
		height: 80px;
	}
	#number_tr {
		height: 100px;
	}
	#page_td {
		width: 700px;
		padding-left: 382px;
	}
	.text_black {
		color: black!important;
	}
	a {
		text-decoration: none;
	}
	#pagenumtr {
		
	}
	#pagenumber_table {
		border-collapse: collapse;
		border: 1px solid #ddd;
	}
	#pagenumber_table tr, #pagenumber_table td {
		/* border: 1px solid #ddd; */
		border: 1px solid #FFDF24;
	 }
	 #pagenumber_table tr {
	 	height: 40px;
	 }
	 .active > a{
	 	color: #990000;
	 }
	 #pagenumber_table td {
	 	text-align: center;
	 	width: 40px;
	 	line-height: 40px;
	 	background-color: white;
	 	font-weight: bold;
	 	color: #FFDF24;
	 }
	 #big_table {
	 	margin-bottom: 150px;
	 }
	 /* #recount{
	 	color: #990000;
	 } */
	 #qna_select {
		width: 150px;
		height: 26px;
	}
</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//alert("모달창123");
		
		var code = $("#code").val();
		
		$("#wr_btn").on("click", function(){
			//location.href="writeqna.bizpoll";
			location.href="boardloginck.bizpoll";
		
			//alert(code);
		
		});
	
			if(code == 1){
				//alert("모달창 나와랏");
				$("#id01").css("display","block");
				
				code != 1;
				
			} else if(code != 1){
				$("#id01").css("display","none");
			}
				
		
		
});
	$(document).on("click","#qnasearch_btn",function(){
		//alert("test");
		$("#frm_search").submit();
	});
</script>
</head>
<body>
<div id="board_table">
	<div id="table">
		<div id="subject">
			<span>Q & A</span>
		</div>
		<div>
			<input type="hidden" name="code" id="code" value="${code}">
			<span width="100">&nbsp;</span>
			<span><a href="#"><input type="button" id="wr_btn" value="글쓰기"></a></span>
			<!-- <input type = "hidden" id="Session" name="Session" value=""> -->
		<form action="boardsearch.bizpoll" method="GET" name ="frm_search">
			<input id="qnasearch_btn" class="qnasearch" type="submit" value="검색">
			<input id="qnasearch_keyword" class="qnasearch" name="search_keyword" type="text" placeholder="검색할 값을 입력해주세요.">
		</form>
		</div>
		<table id="big_table">
			<tbody>
				<tr>
					<td>
					
						<table width="1200" height="40" id="table_top">
							<tbody>
								<tr>
									<td class="no">
										<span>NO</span>
									</td>
									<td class="contents" id="contents">
										<span>CONTENTS</span>
									</td>
									<td class="name" id="name">
										<span>NAME</span>
									</td>
									<td class="date" id="date">
										<span>DATE</span>
									</td>
									<td class="view" id="view">
										<span>VIEW</span>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
			<!-- 게시물 시작 -->
			<tbody>
				<tr>
					<td>
						<table id="board_table">
							<tbody>
						<c:forEach items="${boardlist}" var="bDto">
								<tr id="line">
									<td class="no">
										<span>${bDto.bno}</span>
									</td>
									<td class="contents">
										<table>
											<tr>
												<td>
													<a href="boarddetail.bizpoll?bno=${bDto.bno}">
														<span class="text_black">${bDto.title}&nbsp;&nbsp;&nbsp;</span>
														<%-- <span id="recount">(${re_count})</span> --%>
													</a>
												</td>
											</tr>
										</table>
									</td>
									<td class="name">
										<span>${bDto.writer}</span>
									</td>
									<td class="date">
										<%-- <span>${bDto.regdate}</span> --%>
										<span><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${bDto.regdate}"/></span>
									</td>
									</td>
									<td class="view" id="view">
										<span>${bDto.viewcnt}</span>
									</td>
								</tr>
								<!-- <tr id="reline">
									<td class="no">
										<span>&nbsp;</span>
									</td>
									<td class="contents">
										<a>
											<span id="re">RE:</span>
											<span class="text_black">답변완료♥</span>
										</a>
									</td>
									<td class="name">
										<span>관리자</span>
									</td>
									<td class="date">
										<span>&nbsp;</span>
									</td>
									<td class="view">
										<span>&nbsp;</span>
									</td>
								</tr> -->
								<tr>
									<td colspan="5" bgcolor="#ddd" height="1"></td>
								</tr>
						
						</c:forEach>
							</tbody>
								<tr id="number_tr">
									<td class="no">
										<span>&nbsp;</span>
									</td>
									<td id="page_td">
										<table id="pagenumber_table">
											<tr id="pagenumtr">
											<c:if test="${pageMaker.prev}">
												<td><a href="qna.bizpoll?page=${pageMaker.startPage - 1}">◀</a></td>
											</c:if>
											
											<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
												<td <c:out value="${pageMaker.criDto.page == idx? 'class=active':''}"/>>
													<a href="qna.bizpoll?page=${idx}">${idx}</a>
												</td>
											</c:forEach>
											
											<c:if test="${pageMaker.next}">
												<td><a href="qna.bizpoll?page=${pageMaker.endPage + 1}">▶</a></td>
											</c:if>
											</tr>
										</table>
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
						</table>
					</td>
				</tr>
			</tbody>
		</table>
</div>
</body>
</html>