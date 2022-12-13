<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
      <!-- 최소화된 최신 CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원 업데이트</title>
</head>
<script>
$(document).ready(function(){
	//취소
	$(".cencle").on("click", function(){
		location.href = "/sae_member/login";
	});
	
	$(".delete").on("click", function(){
		
		var result = confirm("정말 탈퇴하시겠습니까?");
		if(result){
			alert("이용해주셔서 감사합니다. 더 좋은 서비스로 찾아뵙겠습니다.");
		location.href = "/sae_member/memberDelete?userId=" + $("#userId").val();
		}else{
			alert("앞으로 더 좋은 서비스로 보답하겠습니다.");
		}
	});
	
	$("#submit").on("click", function(){
		if($("#userPass").val()==""){
			alert("비밀번호를 입력해 주세요");
			$("#userPass").focus();
			return false;
		}
		
		if($("#userBirth").val()==""){
			alert("생년월일을 입력해 주세요");
			$("#userBirth").focus();
			return false;
		}
		if($("#userTel").val()==""){
			alert("전화번호를 입력해 주세요");
			$("#userTel").focus();
			return false;
		}
		if($("#userMail").val()==""){
			alert("메일을 입력해 주세요");
			$("#userMail").focus();
			return false;
		}
		if($("#userAddress").val()==""){
			alert("주소를 입력해 주세요");
			$("#userAddress").focus();
			return false;
		}
	});
});
</script>
<body>
<section id="container">
<form action="/sae_member/memberUpdate" method="post">
<div class="form-group has-feedback">
<label class="control-label" for="userId">아이디</label>
<input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly">
</div>
<div class="form-group has-feedback">
<label class="control-label" for="userPass">패스워드</label>
<input class="form-control" type="password" id="userPass" name="userPass" value="${member.userPass}"/>
</div>
<div class="form-group has-feedback">
<label class="control-label" for="userName">성명</label>
<input class="form-control" type="text" id="userName" name="userName" value="${member.userName}" readonly="readonly"/>
</div>
<div class="form-group has-feedback">
<label class="control-label" for="userBirth">생년월일</label>
<input class="form-control" type="text" id="userBirth" name="userBirth" value="${member.userBirth}" readonly="readonly"/>
</div>
<div class="form-group has-feedback">
<label class="control-label" for="userTel">전화번호</label>
<input class="form-control" type="text" id="userTel" name="userTel" value="${member.userTel}" />
</div>
<div class="form-group has-feedback">
<label class="control-label" for="userMail">메일</label>
<input class="form-control" type="text" id="userMail" name="userMail" value="${member.userMail}" />
</div>
<div class="form-group has-feedback">
<label class="control-label" for="userAddress">주소</label>
<input class="form-control" type="text" id="userAddress" name="userAddress" value="${member.userAddress}" />
</div>
<div class="form-group has-feedback">
<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
<button class="cencle btn btn-danger" type="button">목록 이동</button>
<button class="delete" type="button" id="delete" name="delete">회원 탈퇴</button>
</div>
</form>
</section>
</body>
</html>