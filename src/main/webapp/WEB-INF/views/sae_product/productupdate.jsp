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
<title>update updateView.jsp</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='updateForm']");
		
	$(".cancel_btn").on("click", function() {
		event.preventDefault();
		location.href = "/board/readView?bno=${update.bno}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}";
			});
		
	&(".update_btn").on("click", function() {
		if(fn_valiChk()){
			return false;
		}
		formObj.attr("action", "/board/update");
		formObj.attr("method", "post");
		formObj.submit();
		});
	});
	
	function fn_valiChk() {
		var updateForm = $("form[name='updateForm'].chk").length;
		for (var i = 0; i < updateForm; i++) {
			if ($(".chk").eq(i).val == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}	
	}
</script>
<body>
	<div id="root">
		<header>
			<h1> 게시판 </h1>
		</header>
		<hr/>
		<hr/>
		
		<section id="container">
			<form name="updateForm" role="form" method="post" action="/board/update">
				<input type="hidden" name="bno" value="${update.bno }" readonly="readonly"/>
				<input type="hidden" id="page" name="page" value="${scri.page }">
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }">
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }">
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }">
				<table>
					<tbody>
						<tr>
							<td>
								<label for="title">제목</label><input type="text" id="title" name="title"
													value="${update.title }" class="chk" title="제목을 입력하세요."/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="content">내용</label><textarea  id="content" name="content"
													 class="chk" title="내용을 입력하세요."><c:out value="${update.content }"></c:out></textarea>
							</td>
						</tr>
							<tr>
							<td>
								<label for="writer">작성자</label><input type="text" id="writer" name="writer"
													value="${update.writer }"  readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="addr">주소</label><input type="text" id="addr" name="addr"
													value="${update.addr }" class="chk" title="주소를 입력하세요."/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="regdate">작성날짜</label>
								<fmt:formatDate value="${update.regdate }" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
					</tbody>
				</table>
				<div>
					<button type="submit" class="update_btn">저장</button>
					<button type="button" class="cancel_btn">뒤로</button>
				</div>
			</form>
		</section>
		<hr/>
	</div>
</body>
</html>