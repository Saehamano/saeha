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
$(document).ready(function(){
   //목록 이동
   $(".cencle").on("click",function(){
      location.href = "/board/list";
   })
   $("#submit").on("click",function(){
      if($("#userId").val()==""){
         alert("아이디를 입력해 주세요.");
         $("#userId").focus();
         return false;
      }
      if ($("#userPass").val()=="") {
         alert("비밀번호를 입력해 주세요.");
         $("#userPass").focus();
         return false;
      }
      if ($("#userName").val()=="") {
         alert("성명을 입력해 주세요");
         $("#userName").focus();
         return false;
      }
   });
});
</script>
<body>
  <section id="container">
  <form action="/saeha/sae_member/register" method="post">
  <div class="form-group has-feedback">
  <label class="control-label" for="userId">아이디 333</label>
  <input class="form-control" type="text" id="userId" name="userId"/>
  </div>
  <div class="form-group has-feedback">
  <label class="control-label" for="userPass">패스워드 333</label>
  <input class="form-control" type="password" id="userPass" name="userPass"/>
  </div>
  <div class="form-group has-feedback">
  <label class="control-label" for="userName">성명</label>
  <input class="form-control" type="text" id="userName" name="userName"/>
  </div>
  <div class="form-group has-feedback">
  <button class="btn btn-success" type="submit" id="submit">회원가입</button>
  <button class="cancle btn btn-danger" type="button">목록 이동</button>
  </div>
  </form>  
  </section>

</body>
</html>