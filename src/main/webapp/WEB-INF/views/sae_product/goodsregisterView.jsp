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
<title>굿즈 등록</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		
		$(".write_btn").on("click", function() {
			if(fn_valiChk()){
			return false;
			}
		
		formObj.attr("action", "/sae_product/goodswrite");
		formObj.attr("method","post");
		formObj.submit();
		});
	})
	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for(var i = 0; i<regForm; i++){
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>
<body>
<div id = "root">
	<header>
		<h1>굿즈 등록</h1>
	</header>
		<hr />
	<hr />
	
	<section id = "container">
	<form action="/sae_product/goodswrite" enctype="multipart/form-data" name = "writeForm" method="post">
	<table>
	<tbody>
		<c:if test="${member.userId == 'admin' }">
		<input type="hidden" id="go_readcount" name=go_readcount value="0" />
		<tr><td>
			<label for= "go_name">굿즈 이름</label><input type="text" id="go_name" name="go_name" class="chk" title="굿즈 이름을 입력하세요" />
			</td>
		</tr>
		<tr>
			<td>
			<label for = "go_content">상세 설명</label><textarea id="go_content" name = "go_content" class="chk" title="상세셜명을 입력하세요." ></textarea>
			</td>
		</tr>
		<tr>
			<td>
			<label for = "go_stock">재고수량</label><input type="number" id="go_stock" name = "go_stock" class="chk" title="재고수량을 입력하세요." />
			</td>
		</tr>
		<tr>
			<td>
			<label for= "go_price">가격</label><input type="number" id="go_price" name="go_price" class="chk" title="가격을 입력하세요." />
			</td>
		</tr>
		<tr><td>
			<label for= "uploadFile">굿즈사진</label><input type="file" id="uploadFile" name="uploadFile" class="chk" title="굿즈 사진을 입력하세요" />
			</td>
		</tr>
		<tr>	
			<td>
			<button class="write_btn" type="submit">작성</button>
			</td>
		</tr>
		</c:if>
		<c:if test="${member.userId != 'admin' }"> <!-- userid가 관리자가 아니라면 출력 -->
			<p>관리자만 작성 가능합니다</p>
		</c:if>
	</tbody>
	</table>
	</form>
	</section>
	</div>
</body>
</html>