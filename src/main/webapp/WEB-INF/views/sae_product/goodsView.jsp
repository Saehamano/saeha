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
<meta charset="UTF-8">
<title>게시판 goodsView</title>
</head>
<script type="text/javascript">
   $(document).ready(function() {
      var formObj = $("form[name='readForm']");
      
      //수정
      $(".update_btn").on("click", function() {
         formObj.attr("action", "/board/updateView");
         formObj.attr("method", "get");
         formObj.submit();
      })
      //삭제
      $(".delete_btn").on("click", function() {
         var deleteYN = confirm("삭제하시겠습니까?");
         
         if (deleteYN == true) {
            formObj.attr("action", "/board/delete");
            formObj.attr("method", "post");
            formObj.submit();
         }
      })
      
      //목록
      $(".list_btn").on("click", function() {
         location.href = "/sae_product/goodslist?page=${scri.page}"+"&perPageNum=${scri.perPageNum}"+
                     "&searchType=${scri.searchType}&keyword=${scri.keyword}";
      })
      
})
</script>
<body>
	<section id="container">
   <form name="readForm" role="form" method="post">
   <input type="hidden" id="go_bno" name="go_bno" value="${gread.go_bno }" />
   <input type="hidden" id="page" name="page" value="${scri.page }" />
   <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }" />
   <input type="hidden" id="searchType" name="searchType" value="${scri.searchType }" />
   <input type="hidden" id="keyword" name="keyword" value="${scri.keyword }" />
   </form>
   
   <div class="form-grop">
   <label for="title" class="col-sm-2 control-label">굿즈 이름</label>
   <input type="text" id="go_name" name="go_name" class="form-control" value="${gread.go_name }" readonly="readonly"   />
   </div>
   
   <div class="form-grop">
   <label for="content" class="col-sm-2 control-label">상세설명</label>
   <input type="text" id="go_content" name="go_content" class="form-control" value="${gread.go_content }" readonly="readonly"   />
   </div>
   
   <div class="form-grop">
   <label for="title" class="col-sm-2 control-label">재고 수량</label>
   <input type="text" id="go_stock" name="go_stock" class="form-control" value="${gread.go_stock }" readonly="readonly"   />
   </div>
   
   <div class="form-grop">
   <label for="title" class="col-sm-2 control-label">가격</label>
   <input type="text" id="go_stock" name="go_stock" class="form-control" value="${gread.go_price }" readonly="readonly"   />
   </div>
   
   <div class="form-grop">
   <label for="go_date" class="col-sm-2 control-label">등록 날짜</label>
   <fmt:formatDate value = "${gread.go_date }" pattern="yyyy-MM-dd" />
   </div>
   
    <div class="form-grop">
    	<img src="/resources/goodsimg/${gread.go_file }"/>
    </div>
   
   <br>
   <div>
   <button type="button" class="update_btn btn btn-warning">수정</button>
   <button type="button" class="delete_btn btn btn-danger">삭제</button>
   <button type="button" class="list_btn btn btn-primary">목록</button>
   </div>
   </section>
</body>
</html>