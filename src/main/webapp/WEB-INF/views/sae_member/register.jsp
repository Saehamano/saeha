<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 부트스트랩은 트위터에서 사용하는 각종 레이아웃, 버튼, 입력상 등의 디자인을 css와 javascript로 만들어 놓은 것이다. 
          .Easy to use : HTML 과 CSS 기본 지식을 가진 누구나 쉽게 접근 가능( + javascript)
          .Responsive features : 반응형 CSS를 포함한 단일 코드로 모든 디바이스에 적용할 수 있음
          .Browser compatibility : 모든 최신 브라우저와 호환
          
          부트스트앱의 CSS와 Javascript, 관련 이미지만 설치하고 미리 지정된 CSS 클래스나
          JavaScript 함수만 불러오면 트위터에서 쓰는 것과 비슷한 디자인이 뚝!딱! 만들어진다.
       -->
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		//목록 이동
		$(".cencle").on("click", function() {
			location.href = "/board/list";
		})
		$("#year").on("change", function(){
			var month = $("#month").val();
			if(month<10)
		{
				month = "0" + month;
		}
			var day = $("#day").val();
			if(day<10)
		{
				day = "0" + day;
		}
			var Birth = $("#year").val()+month+day;
			$("#userBirth").val(Birth);
			var year = $("#year").val();// 2015를 선택
			var now = new Date(); //현재 날짜 및 시간 2022
			var cur_year = now.getFullYear(); //연도 //현재나이 8살 now - year + 1
			if(cur_year - year + 1 < 6)
			{
				$("#type").text("미취학 회원입니다.");
			}
			else if(cur_year - year + 1 < 14)
			{
				$("#type").text("어린이 회원입니다.");
			}
			else if(cur_year - year + 1 < 25)
			{
				$("#type").text("청소년 회원입니다.");
			}
			else if(cur_year - year + 1 < 65)
			{
				$("#type").text("성인 회원입니다.");
			}
			else
			{
				$("#type").text("노인 회원입니다.")		
			}
		})
		$("#month").on("change", function(){
			var month = $("#month").val();
			if(month<10)
		{
				month = "0" + month;
		}
			var day = $("#day").val();
			if(day<10)
		{
				day = "0" + day;
		}
			var Birth2 = $("#year").val()+month+day;
			$("#userBirth").val(Birth2);
		})
		$("#day").on("change", function(){
			var month = $("#month").val();
			if(month<10)
		{
				month = "0" + month;
		}
			var day = $("#day").val();
			if(day<10)
		{
				day = "0" + day;
		}
			var Birth3 = $("#year").val()+month+day;
			$("#userBirth").val(Birth3);
		})
		$("#userId").on("keyup", function(){
			var xhr = new XMLHttpRequest();
			
			xhr.open("GET", "http://localhost:8080/saeha/over?userId="+$("#userId").val(), true);
			xhr.send();
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
					$("#over1").text(xhr.responseText);
					
					var over1 = xhr.responseText;
					if(over1 == " 사용할 수 있는 ID입니다."){
						$("#over1").attr("style", "color:#3333FF");
					}else{
						$("#over1").attr("style", "color:#FF0099");
					}
				}
			}
		})
		$("#userPass").on("keyup", function(){
			if($("#userPass").val() == $("#userPass2").val()){
				$("#warning").text("비밀번호가 일치합니다.");
				$("#warning").attr("style", "color:#3333FF");
			}else{
				$("#warning").attr("style", "color:#FF0099");
				$("#warning").text("비밀번호가 일치하지 않습니다.");
			}
		})
		$("#userPass2").on("keyup", function(){
			if($("#userPass").val() == $("#userPass2").val()){
				$("#warning").text("비밀번호가 일치합니다.");
				$("#warning").attr("style", "color:#3333FF");
			}else{
				$("#warning").attr("style", "color:#FF0099");
				$("#warning").text("비밀번호가 일치하지 않습니다.");
			}
		})
		$("#submit").on("click", function() {
			if ($("#userId").val() == "") {
				alert("아이디를 입력해 주세요.");
				$("#userId").focus();
				return false;
			}
			if ($("#userPass").val() == "") {
				alert("비밀번호를 입력해 주세요.");
				$("#userPass").focus();
				return false;
			}
			if ($("#userName").val() == "") {
				alert("성명을 입력해 주세요");
				$("#userName").focus();
				return false;
			}
			if ($("#userBirth").val() == "") {
				alert("생년월일을 입력해 주세요");
				$("#userBirth").focus();
				return false;
			}
			if ($("#userTel").val() == "") {
				alert("휴대전화 번호를 입력해 주세요");
				$("#userTel").focus();
				return false;
			}
			if ($("#userMail").val() == "") {
				alert("이메일을 입력해 주세요");
				$("#userMail").focus();
				return false;
			}
			if ($("#userAddress").val() == "") {
				alert("주소를 입력해 주세요");
				$("#userAddress").focus();
				return false;
			}
		});
	});
</script>
<body>
	<section id="container">
		<form action="/saeha/sae_member/register" method="post">
			<div class="form-group has-feedback">
				<label class="control-label" for="userId">아이디</label><span id="over1">&nbsp;&nbsp;&nbsp;</span><input
					class="form-control" type="text" id="userId" name="userId" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userPass">패스워드</label> <input
					class="form-control" type="password" id="userPass" name="userPass" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userPass2">패스워드 확인</label> <input
					class="form-control" type="password" id="userPass2" name="userPass2" />
			</div>
			<div id="warning" name="warning">
			</div>
			<div class="form-group has-feedback" style="margin-top:8px">
				<label class="control-label" for="userName">성명</label> <input
					class="form-control" type="text" id="userName" name="userName" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userBirth">생년월일</label>
				
				 <select
					id="year" name="year">
					<% for (int i = 1900; i< 2023; i++)
					{
					%>
					<option value="<%=i %>"><%=i %>년</option>
					<%
					}
					%>
				</select> 
					 <select
					id="month" name="month">
					<% for (int i = 1; i< 13; i++)
					{
					%>
					<option value="<%=i %>"><%=i %>월</option>
					<%
					}
					%>
				</select> 
					 <select
					id="day" name="day">
					<% for (int i = 1; i< 32; i++)
					{
					%>
					<option value="<%=i %>"><%=i %>일</option>
					<%
					}
					%>
				</select> 
				<input class="form-control" type="text" id="userBirth"
					name="userBirth" readonly/>
			</div>
			<div id="type" name="type">
			</div>
			<div class="form-group has-feedback" style="margin-top:8px">
				<label class="control-label" for="userTel">전화번호</label> <input
					class="form-control" type="tel"  id="userTel" name="userTel" 
					pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="010-0000-0000"
       required />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userMail">메일</label> <input
					class="form-control" type="email" id="userMail" name="userMail" placeholder="email@address" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userAddress">주소</label> <input
					class="form-control" type="text" id="userAddress"
					name="userAddress" />
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원가입</button>
				<button class="cancle btn btn-danger" type="button">목록 이동</button>
			</div>
		</form>
	</section>

</body>
</html>