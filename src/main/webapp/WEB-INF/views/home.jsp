<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
	<title>임시 메인페이지</title>
<style type="text/css">
body{justify-content: center;}
div{margin: 0 auto;}
ul li{list-style:none;}
a{ text-decoration: none; color:inherit;}
.head {width:1200px; text-align: right; line-height: 36px; }
.mainmenu1{height:70px; width:1200px; text-align: right;border-bottom: 1px solid #ccc;}
.menu {width: 99%; border-bottom:1px solid #ccc; }
.mainmenu2{
	display:block;
	height:70px;
	float: right;
	margin: 0 auto;
	}
	
.mainmenu2>li {
	height: 70px;
	display:inline-block;
	position: relative;
	width:110px;
	}
.li {display:flex; justify-content: center; align-items: center; height: 70px;}
.menu:hover .sub1 {opacity: 98%; } 
.mainmenu2>li:hover {text-decoration: underline;}
.sub1{
	width: 99%; 
	height:250px;
	background-color: white;
	z-index: 2;
	opacity:0%;
	transition: 1s all;
	position:absolute;
}
.sub2{
	width:1200px;  
	text-align: left; 
	margin: 0 auto; 
	padding-left: 10px;
	}
span{display:block;}
.submenu {
	vertical-align: top;
	width: 15%;
	display:inline-block; 
	border-right: 1px solid #ccc;
	padding: 5px;
	height: 95%;
}
.subtitle{
	border-bottom: 1px solid #ccc;
	height:30px;
	font-weight: middle;
	}
.slider_main{z-index: -1; width:1600px; height: 370px;position: absolute;}
.container{width: 1600px;margin: 0 auto;}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>
 	$(document).ready(function() {
		$('.slider_main').bxSlider();
	});
 
</script>
</head>

<body>
<div style="width: 99%; border-bottom: 1px solid #ccc;">
<div class="head">
	<a href="http://www.royalpalace.go.kr:8080/html/eng_gbg/main/main.jsp" target="_blank" title="경복궁 영문사이트 새창으로 이동">ENGLISH</a>
&nbsp;
	<a href="https://twitter.com/royalpalacego" target="_blank">
			<img src="<spring:url value='/resources/img/ico_tweeter.png'/>"style="width:26px;"> </a>&nbsp;
	<a href="https://www.instagram.com/gyeongbokgung_palace_official/" target="_blank">
			<img src="<spring:url value='/resources/img/ico_insta.png'/>"style="width:26px;"> </a>&nbsp;
	<a href="http://www.mois.go.kr/frt/sub/popup/p_taegugki_banner/screen.do" target="_blank">
			<img src="<spring:url value='/resources/img/korea.png'/>" style="width:127px;"></a>
</div>
</div>

<div class="menu">

	<div class="mainmenu1">
	<div style="display: inline-block; float: left; height: 70px;">
			<img src="<spring:url value='/resources/img/logo.png'/>"style="height:40px;"></div>
	
	<div style="height: 70px;">
	<ul class="mainmenu2">
		<li><div class="li"><a href="#">관람안내</a></div></li>
		<li><div class="li"><a href="#">관람예약</a></div></li>
		<li><div class="li"><a href="#">구매</a></div></li>
		<li><div class="li"><a href="#">참여마당</a></div></li>
		<li><div class="li"><a href="#">경복궁안내</a></div></li>
		<li><div class="li"><a href="#">마이페이지</a></div></li>
	</ul>
	</div>
	</div>
	
	<div class="sub1">
	<div class="sub2">
		<div class="submenu">
			<span class="subtitle">관람안내</span><br>
			<span><a href="#">관람규칙</a></span><br>
			<span><a href="#">오시는길</a></span><br>
			<span><a href="#">편의시설</a></span><br>
			<span><a href="#">관람시간/요금</a></span>
		</div>
		<div class="submenu">
			<span class="subtitle">관람예약</span><br>
			<span><a href="#">온라인프로그램</a></span><br>
			<span><a href="#">어린이프로그램</a></span><br>
			<span><a href="#">단체프로그램</a></span><br>
		</div>
		<div class="submenu">
			<span class="subtitle">구매하기</span><br>
			<span><a href="#">입장권</a></span><br>
			<span><a href="#">굿즈</a></span><br>
			<span><a href="#">한복대여</a></span><br>
			<span><a href="#">관람시간/요금</a></span>
		</div>
		<div class="submenu">
			<span class="subtitle">참여마당</span><br>
			<span><a href="#">1:1채팅</a></span><br>
			<span><a href="#">FAQ</a></span><br>
			<span><a href="#">공지사항</a></span><br>
		</div>
		<div class="submenu">
			<span class="subtitle">경복궁안내</span><br>
			<span><a href="#">사계</a></span><br>
			<span><a href="#">역사</a></span><br>
		</div>
		<div style="width: 16%; display: inline-block;padding: 5px;">
			<span class="subtitle">마이페이지</span><br>
			<span><a href="#">내정보</a></span><br>
			<span><a href="#">찜목록</a></span><br>
			<span><a href="#">구매내역</a></span><br>
			<span><a href="#">쿠폰</a></span>
		</div>
	</div>
	</div>
</div>

<div class="container">

	<div class="slider_main">
		<div class="slider_main_img">
			<img src="<spring:url value='/resources/img/main_slider1.jpg'/>">
		</div>
		<div class="slider_main_img">
			<img src="<spring:url value='/resources/img/main_slider2.jpg'/>">
		</div>
		<div class="slider_main_img">
			<img src="<spring:url value='/resources/img/main_slider3.jpg'/>">
		</div>
		<div class="slider_main_img">
			<img src="<spring:url value='/resources/img/main_slider4.jpg'/>">
		</div>
	</div>
	
	<div class="contents">
		
	</div>	
	
</div>	
<footer></footer>
</body>
</html>
