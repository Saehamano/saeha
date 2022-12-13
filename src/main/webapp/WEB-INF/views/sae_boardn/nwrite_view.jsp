<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지게시판 글 등록</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var nform = $("form[name='nwriteForm']")
	
	$(".nwrite_btn").on("click", function(){
		nform.attr("action", "/sae_boardn/nwrite_view");
		nform.attr("method", "post");
		nform.submit();
		});
	});
$(document).ready(function(){
	var nregForm = $("form[name='nwriteForm'] .chk").length;
	
	for($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
		alert($(".chk").eq(i).attr("title"));
		return true
	};
});
</script>
<body>
<form name="nwriteForm" method="post" action="/sae_boardn/nwrite_view">
	<tr>
		<td>
		<label for="title">제목</label>
		<input class="chk" type="text" id="title" name="title" title="제목을 입력하세요" />
		</td>
	</tr>
	<tr>
		<td>
		<div align="center">
		<label for="content">내용</label>
		<textarea class="chk" id="content" name="content" title="내용을 입력하세요" ></textarea>
		</div>
		</td>
	</tr>
	<tr>
		<td style="font-family: 돋움; font-size: 12pt" height="16">
		<div align="center">이미지</div>
		</td>
		<td>
		<input class="chk" name="n_file" type="file" accept="image/*" value="파일첨부" />
		</td>
	</tr>
	
	<button class="nwrite_btn" type="submit" >등록</button>
	<!-- 아이디가 admin인 관리자만 글 작성이 가능하고 관리자가 아니면 버튼이 보이지 않음 -->
	
	<div>
	<input type="submit" value="등록"> <a href="<c:url value="/sae_boardn/nlist" />">목록</a>
	<!-- 등록을 누르면 sae_boardn nlist로 감 -->
	</div>
</form>


</body>
</html>