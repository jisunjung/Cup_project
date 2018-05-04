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
		margin: 100px 360px;
	}
	#board_table > tr {
		height: 30px;
	}
	.no {
		width: 100px!important;
		text-align: center;
	}
	.contents {
		width: 650px!important;
		text-align: left;
		padding-left: 10px; 
	}
	.upload{
		width: 50px!important;
		text-align: center;
		font-size: 16px;
		color: #FFDF24;
		font-weight: bold;
	
	}
	.point {
		width: 50px;
		text-align: center;
	}
	#contents {
		text-align: center;
	}
	.name {
		width: 130px!important;
		text-align: center;
	}
	.date {
		width: 140px!important;
		text-align: center;
	}
	.view {
		width: 130px!important;
		text-align: center;
		padding-right: 30px;
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
		font-family: 'Hanna', serif;
	}
	#table_top {
		border-top: 2px solid #FFDF24;
		border-bottom : 2px solid #FFDF24;
		width: 1200px;
		height: 40px;
		background-color: #FFDF24;
		color: white;
		border-radius: 5px;
	}
	.lineup {
		color: white;
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
		font-style: oblique;
		font-family: 'Hanna', serif;
	}
	#qnasearch_btn {
		width: 50px;
		height: 26px;
		background-color: #FFDF24; 
		color: #FFFFFF;
		display: block;
		border: 0px;
		font-family: 'Hanna', serif;
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
		margin: 20px auto; 
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
	/* #page_wrap {
		text-align: center;
	} */
	#pageline {
		text-align: center;
		float: none;
		margin: 25px 550px;
	}
	#pagetable {
		border-collapse: collapse;
		text-align: center;
	 	line-height: 40px;
	 	background-color: white;
	 	font-weight: bold;
	 	color: #FFDF24;
	}
	#pagetable tr, #pagetable td {
		border: 1px solid #FFDF24;
	 }
	 #pagetable tr {
	 	height: 40px;
	 }
	 #pagetable td {
	 	width: 40px;
	 }
	 #pagetable td > a{
	 	color: #FFDF24;
	 } 
	 .active > a{
	 	color: #990000;
	 }
	 #big_table {
	 	margin-bottom: 30px;
	 }
	  #recount{
	 	color: #990000;
	 } 
	 #selsearch {
		width: 80px;
		height: 26px;
		font-family: 'Hanna', serif;
	}
	.searchkey_ms {
		text-align: center;
		padding-bottom: 10px;
    	padding-top: 5px;
    	font-size: 17px;
	}
	#key {
		color: #FFBB00;
	}
	#new {
		color: #FFBB00;
		border: 1px solid #FFBB00;
		font-size: 14px;
		background-color: white;
		border-radius: 5px;
		padding: 1px 3px;
	}
	#new_lineup {
		color: white;
		border: 1px solid white;
		font-size: 14px;
		background-color: #FFDF24;
		border-radius: 5px;
		padding: 1px 3px;
	}
	#fafa_icon, #good_fafa {
		color: #FFBB00;
	}
	#viewcnt, #goodcnt {
		color: #555555;
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
				
			// 댓글 수 표시
			var bnoform = $("#bnoform");
			bnoform.submit();
		
	});
	
	// 게시판 검색
	$(document).on("click", "#qnasearch_btn",function(){
		//alert("test");
		
		$("#frm_search").submit();
		/* 
		$("#searchkey_ms").css("color","#555555");
		$("#key").css("display", "block"); */
		
		
	});
	
	var lineup_code = $("#lineup_code").val();
	// 게시판 정렬
	$(document).on("click", "#l_no", function(){
		//alert("게시글 번호순 정렬클릭 test");
		/* $("#lineup_code").val(l_no);
		alert($("#lineup_code").val()); */
		location.href="qna.bizpoll?lineup_code=" + "l_no";
		//$("#frm_lineup").submit();
	});
	$(document).on("click", "#l_contents", function(){
		location.href="qna.bizpoll?lineup_code=" + "l_contents";
	});
	$(document).on("click", "#l_name", function(){
		location.href="qna.bizpoll?lineup_code=" + "l_name";
	});
	$(document).on("click", "#l_date", function(){
		location.href="qna.bizpoll?lineup_code=" + "l_date";
	});
	$(document).on("click", "#l_view", function(){
		location.href="qna.bizpoll?lineup_code=" + "l_view";
	});
	$(document).on("click", "#l_good", function(){
		location.href="qna.bizpoll?lineup_code=" + "l_good";
	});
	/* $(document).ready(function(){
		var listcounter = $("#listcounter").val();
		var searchkeyword_block = $("#searchkeyword_block").val();
		var searchkeyword_none = $("#searchkeyword_none").val();
		
		if(listcounter == true){
			searchkeyword_block = 1;
		} else{
			searchkeyword_none = 1;
		}
		
	}) */
</script>
</head>
<body>
<div id="board">
	<div id="table">
		<div id="subject">
			<span>Q & A</span>
		</div>
		<form action="boardsearch.bizpoll" method="GET" name ="frm_search">
				<div>
					<input type="hidden" name="code" id="code" value="${code}">
					<span width="100">&nbsp;</span> <span><a href="#">
					<input type="button" id="wr_btn" value="글쓰기"></a></span>
					<!-- <input type = "hidden" id="Session" name="Session" value=""> -->
					<input id="qnasearch_btn" class="qnasearch" type="submit" value="검색">
					<input id="qnasearch_keyword" class="qnasearch" name="search_keyword" type="text" placeholder="검색어">
					<select id="selsearch" name="selsearch" class="qnasearch" >
							<option value="1">전체</option>
							<option value="---------------">---------------</option>
							<option value="2">제목</option>
							<option value="3">내용</option>
							<option value="4">제목 + 내용</option>
							<option value="5">작성자</option>
						</select>
				</div>
			</form>
		<table id="big_table">
			<tbody>
				<tr>
			<!-- 검색결과 표시줄 -->
			<%-- <input type="hidden" id="listcounter" name="listcounter" value="${listcounter}"> --%>
			<c:if test="${!empty keyword}">
					<td class="searchkey_ms"  id="searchkeyword_block">
						<span>『 ${selflag} 』&nbsp;&nbsp;</span>
						<span id="key">"${keyword}"</span>
						<span>&nbsp;&nbsp;검색&nbsp;&nbsp;결과&nbsp;:&nbsp;&nbsp;${boardlist.size()}&nbsp;건</span>
					</td>
			</c:if>
					<td class="searchkey_ms" id="searchkeyword_none">
						<span>&nbsp;</span>
					</td>
				</tr>
				<tr>
					<td id="table_top">
					<!-- <form action="boardlineup_no.bizpoll" method="GET" id="frm_lineup" name="frm_lineup"> -->
					<form action="qna.bizpoll" method="GET" id="frm_lineup" name="frm_lineup">
						<input type="hidden" name="lineup_code" value="">
						<table>
							<tbody>
								<tr>
									<td class="no">
										<a href="#" id="l_no" class="lineup">
											<!-- <input type="hidden" name="lineup_value" value="l_no"> -->
											<span>NO</span>
										</a>
									</td>
									<td class="point"></td>
									<td class="upload"></td>
									<td class="contents" id="contents">
										<a href="#"  id="l_contents"  class="lineup">
											<!-- <input type="hidden" name="lineup_value" value="l_contents"> -->
											<span>CONTENTS</span>
										</a>
									</td>
									<td class="name" id="name">
										<a href="#"  id="l_name" class="lineup">
											<!-- <input type="hidden" name="lineup_value" value="l_name"> -->
											<span>NAME</span></a>
										</td>
									<td class="date" id="date">
										<a href="#"  id="l_date" class="lineup">
											<!-- <input type="hidden" name="lineup_value" value="l_date"> -->
											<span>DATE</span>
										</a>
									</td>
									<td class="view" id="view">
										<a href="#"  id="l_view" class="lineup">
											<!-- <input type="hidden" name="lineup_value" value="l_view"> -->
											<span><i class="fa fa-eye"></i></span>
										</a>
										<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
										<a href="#" id="l_good"  class="lineup">
											<!-- <input type="hidden" name="lineup_value" value="l_good"> -->
											<span><i class="fa fa-heart"></i></span>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					</td>
				</tr>
				
			<!-- 게시물 시작 -->
				<tr>
					<td id="board_table">
						<table>
							<tbody>
							
								<c:forEach items="${boardlist}" var="bDto">
								<tr id="line">
									<td class="no"><span>${bDto.bno}</span></td>
									<td class="point">
										<c:if test="${today2 == regdate2}">
											<span id="new">new</span>
										</c:if>
									</td>
									
									<td class="upload">
										<span>&nbsp;
											<c:if test="${bDto.filesize > 0}">
											<i class="fa fa-file"></i>
											</c:if>
										</span>
									</td>
									<td class="contents">
										<table>
											<tr>
												<td>
													<a href="boarddetail.bizpoll?bno=${bDto.bno}">
														<span class="text_black">
															<c:forEach var ="i" begin="1" end="${bDto.re_level}">
																&nbsp;&nbsp;&nbsp;
															</c:forEach>
															${bDto.title}&nbsp;&nbsp;&nbsp;
															</span>
														<c:if test="${bDto.replycnt!='0'}">
															<span id="recount">(${bDto.replycnt})</span>
														</c:if>
													</a>
												</td>
											</tr>
										</table>
									</td>
									<td class="name"><span>${bDto.writer}</span></td>
									<td class="date">
										<span>
											<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today2"/>
											<fmt:formatDate value="${bDto.regdate}" pattern="yyyy-MM-dd" var="regdate2"/>
										</span>
										<c:choose>
											<c:when test="${today2 == regdate2}">
												<fmt:formatDate pattern="HH:mm:ss"  value="${bDto.regdate}"/>
											</c:when>
											<c:otherwise>
												<fmt:formatDate pattern="yyyy-MM-dd" value="${bDto.regdate}"/>
											</c:otherwise>
										</c:choose>
									</td>
									<td class="view" id="view">
										<i id="fafa_icon" class="fa fa-eye"></i>
										<span id="viewcnt">${bDto.viewcnt}</span>
										&nbsp;&nbsp;
										<c:choose>
											<c:when test="${bDto.goodcnt > 0}">
												<i id="good_fafa" class="fa fa-heart"></i>
											</c:when>
											<c:otherwise>
												<i id="good_fafa" class="fa fa-heart-o"></i>
											</c:otherwise>
										</c:choose>
												<span id="goodcnt">${bDto.goodcnt}</span>
									</td>
								</tr>
								<tr>
									<td colspan="7" bgcolor="#ddd" height="1"></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<div id="page_wrap">
			<div id="pageline">
				<table id="pagetable">
						<tr>
							<c:if test="${pageMaker.prev}">
								<td>
									<a href="qna.bizpoll?page=${pageMaker.startPage - 1}">◀</a>
								</td>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<td>
									<a <c:out value="${pageMaker.criDto.page == idx? 'class=active':''}"/>></a>
									<a href="qna.bizpoll?page=${idx}">${idx}</a>
								</td>
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<td>
									<a href="qna.bizpoll?page=${pageMaker.endPage + 1}">▶</a>
								</td>
							</c:if>
						</tr>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- footer 위치 -->
	<div id="footer">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>