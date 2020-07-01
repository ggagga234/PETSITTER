<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
<c:choose>
<c:when test="${id eq null}">
<form action="login2">
	<input type="text" name="id">
	<button>로그인</button>
</form>
</c:when>
<c:otherwise>
	${id}님 환영합니다.
	<input type="button" value="메세지 함 가기" id="go">
	<input type="button" value="관리자 페이지 가기" id="go2">
</c:otherwise>
</c:choose>
<script>
	$("#go").on("click",function(){
		location.href="message/recievelist";
	})
	$("#go2").on("click",function(){
		location.href="adminindex";
	})
</script>
</body>
</html>