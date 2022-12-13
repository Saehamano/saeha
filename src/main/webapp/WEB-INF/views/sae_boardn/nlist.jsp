<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지게시판</title>
</head>
<body>
<h1> 공지게시판 </h1>

<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성일</th>
		<th>이미지</th>
	</tr>
	<c:forEach var="boardn" items="${nlist}">
		<tr>
			<td>${nlist.bno}</td>
			<td><a href="<c:url value="/sae_boardn/nread/${nlist.bno}" />"> ${nlist.title}</a></td>
			<td>${nlist.content}</td>
			<td>${nlist.regdate}</td>
			<td>${nlist.file}</td>
		</tr>
	</c:forEach>
</table>

<button type="button"><a href="/sae_boardn/nwrite_view">글 등록</a></button>

</body>
</html>