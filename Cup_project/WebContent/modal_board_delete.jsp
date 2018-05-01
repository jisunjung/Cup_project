<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
/* font-family: 'Hanna', serif; */
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
	#remove_bbtn {
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



</script>
</head>
<body>
	<a href="#mo_board_del" class="del_link">게시글삭제</a>
	
<div id="mo_board_del">
  <div class="modal_del">
		<input type="hidden" name="bno" id="bno" value="${bno}">
				<span id="text">글을 삭제하시겠습니까?</span>
			<div id="sel_bbtn">
				<form method="post" id="frm1">
					<br>
					<button class="bbtn" id="remove_bbtn">삭제</button>
				</form>
					<button class="bbtn" id="cancel_bbtn">취소</button>
			</div>
	</div>
  </div>
</body>
</html>