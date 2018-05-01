<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   

<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>item_detail/title></title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
/* font-family: 'Hanna', serif; */
	#detailpage_body {
		text-align: center;
		width: 100%;
		/* border: 1px solid red; */
		height: auto;
		margin: 0 auto;
		/* background-color: #ebebeb; */
	}
	#item_info {
		border: 2px solid #ededed; 
		margin: 0 auto;
		margin-top: 100px;
		width: 1200px;
		height: 400px;
	}
	#detail_img_area {
		/* border: 1px solid blue; */
		margin: 20px auto;
		width: 1200px;
		
		
	}
	#item_img {
		/* background-color: white; */
		width: 370px;
		height: 390px;
		/* border: 1px solid orange; */
		margin-left: 150px;
		float: left;
	}
	#item_img  > img {
		width: 350px;
		height: 370px;
	}
	#detail_info {
		/* border: 1px solid red; */
		width: 400px;
		height: 370px;
		float: right;
		margin-right: 150px;
		/* padding: 20px; */
	}
	#detail_info_name {
		margin: 50px;
	 	font-family: 'Hanna', serif;
	 	font-size: 20px;
	 	font-weight: bold;
	 	color: #555555;
	}
	#info_contain {
		margin: 0 50px 10px 50px;
		/* border: 1px solid green; */
		width: 300px;
		height: 100px;
	}
	#code_area {
		height: 25px;
		width: 300px;
		margin-bottom: 10px;
	}
	#price_area {
		height: 25px;
		width: 300px;
		margin-bottom: 30px;
	}
	.info_tag{
		/* border: 1px solid red; */
		text-align: left;
		width: 146px;
		float: left;
		font-size: 16px;
		color: #555555;
	}
	.info_tag_val{
		/* border: 1px solid blue; */
		text-align: right;
		width: 146px;
		float: right;
		font-size: 16px;
		color: #555555;
	}
	#tip_area {
		/* border: 1px solid orange; */
		width: 292px;
		height: 50px;
		text-align: left;
		padding: 3px;
		font-size: 15px;
		line-height: 20px;
		/* margin: 0 6px; */
		background-color: #ebebeb;
	}
	#tip_area_title {
		color: #FFBB00;
	}
	#tip_area_content {
		padding: 0 10px;
		color: #555555;
	}
	#btn_area {
		margin: 70px 50px 0 50px;
		/* border: 1px solid black; */
		width: 300px;
		height: 70px;
	}
	.detail_btn {
		border-radius: 50px;
		width: 60px;
		height: 60px;
		text-align: center;
		font-family: 'Hanna', serif;
		font-size: 18px;
		margin: 3px 15px;
	}
	#buy_btn {
		color: white;
		border: 1px solid #FFDF24;
		background-color: #FFDF24;
	}
	#cart_btn, #wish_btn {
		color: #555555;
		border: 1px solid #ededed;
		background-color: #ededed;
	}
</style>
</head>
<body>

	<div id="detailpage_body">

	<!-- 상세정보 -->
		<div id="item_info">
			<div id="item_img">
				<img src="image/cup_maingallery/${items.p_img}" >
			</div>
			<div id="detail_info">
				<div id ="detail_info_name">
					<span>${items.p_name}</span>
				</div>
				<div id="info_contain">
					<div id="code_area">
						<div class="info_tag" id="info_code">
							<span>CODE ː </span>
						</div>
						<div class="info_tag_val" id="info_code_val">
							<span>${items.p_code}</span>
						</div>
					</div>
					<div id="price_area">
						<div class="info_tag"  id="info_price">
							<span>PRICE ː </span>
						</div>
						<div class="info_tag_val" id="info_price_val">
							<fmt:formatNumber value="${items.p_price2}" type="currency" />
						</div>
					</div>
					<div id="tip_area">
						<div id="tip_area_title">
							<span>● shopping tip</span>
						</div>
						<div id="tip_area_content">
							<span>- 7만원 이상 무료배송</span>
						</div>
					</div>
				</div>
				
				<div id="btn_area">
						<input type="button" class="detail_btn" id="buy_btn" value="buy">
						<input type="button" class="detail_btn" id="cart_btn" value="cart">
						<input type="button" class="detail_btn" id="wish_btn" value="wish">
				</div>
			</div>
			
		</div>	
		
		<!-- 상세이미지 -->
		
		<div id="detail_img_area">
			<div id="detail_img">
				<img src="image/item_detail/${items.p_detailimg}" >
			</div>
		</div>
	</div>
	
	
	<!-- footer 위치 -->
	<div id="footer">
		<%@ include file="footer.jsp"%>
	</div>
	
</body>
</html>