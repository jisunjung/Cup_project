<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <!-- JSPL 라이브러리를 사용하기 위한 선언문 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="header.jsp" %>

<%@ page import="java.util.Date" %>
<c:set var="date" value="<%=new Date()%>"/>
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
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
/* font-family: 'Hanna', serif; */
	body, ul {
		margin: 0;
		padding: 0;
		list-style-type: none;
		/* font-family: 'Nanum Gothic', serif; */
		font-family: 'Hanna', serif;
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


	.list_top {
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
		width: 215px;
		height: 220px;
	}
	div.desc {
		padding: 10px;
		color: #555555;
		text-align: center;
		font-size: 15px;
		text-decoration: none;
	}
	div.price {
		padding: 5px;
		color: #555555;
		text-align: center;
		font-size: 13px;
		text-decoration: none;
	}
	#main_gallery {
		width: 1200px;
		margin: 50px 400px;
		text-decoration: none;
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
	.pdt_item{
		float: left;
		margin: 0 10px;
		position: relative;
	}
	.item_list{
		padding-top: 30px;
		clear: left;
	}
	.item.list2{
		padding-top: 20px;
		clear: left;
	}
</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
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
	<div id="main_gallery">
		<div class="item_list">
			<div class="list_top">N E W ▼</div>
			
			<hr>
				<c:forEach items="${newProductList}" var="pDto">	<!-- foreach : item은 jstl 태그의 코어라인 var는 변수생성 el태크 -->
					<div class="gallery">
						
							<img alt="신상품" src="image/cup_maingallery/${pDto.p_img}" width="180px" height="200px">
							<div>
								<div class="desc">${pDto.p_name}</div>
								<div class="price">
									<fmt:setLocale value="ko_kr"/>
									<%-- <fmt:setLocale value="en_us"/> --%>
									<%-- <fmt:setLocale value="ja_jp"/> --%>
									
									<!--  currency = 접속하는 현지의 화폐단위 -->
									<fmt:formatNumber value="${pDto.p_price2}" type="currency"/>
									<%-- <fmt:formatDate value="${date}" /> --%>
									<%-- <fmt:formatDate value="${date}" type="time"/> --%>
									<%-- <fmt:formatDate value="${date}" type="time" timeStyle="full"/> --%>
									<%-- <fmt:formatDate value="${date}" type="date" timeStyle="yyyy/mm/dd"/> --%>
									<%-- <fmt:formatNumber value="0.15" type="percent"/> : 세일 퍼센트--%>
									<%-- <fmt:formatNumber value="553654789834" pattern="###,###,###,###"/> --%>
									
								</div>
							</div>
						
					</div>
				</c:forEach>
		</div>
		<div class="item_list">
			<div class="list_top">B E S T ▼</div>
			
			<hr>
				<c:forEach items="${bestProductList}" var="pDto">
					<div class="gallery">
						
							<img alt="인기상품" src="image/cup_maingallery/${pDto.p_img}" width="180px" height="200px">
							<div>
								<div class="desc">${pDto.p_name}</div>
								<div class="price">
									<fmt:setLocale value="ko_kr"/>
									<!--  currency = 접속하는 현지의 화폐단위 -->
									<fmt:formatNumber value="${pDto.p_price2}" type="currency"/>
								</div>
							</div>
						
					</div>
				</c:forEach>
		</div>
	</div>	
		
</body>
</html>