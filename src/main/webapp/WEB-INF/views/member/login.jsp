<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
div {
	box-sizing: border-box;
}

.container {
	width: 500px;
	text-align: center;
	margin-top: 30px;
}

#login {
	width: 100px;
	height: 60px;
}

#id, #pw {
	float: right;
}
</style>


</head>
<body>
	<c:if test="${!empty noemail}">
		<script type='text/javascript'>alert("${noemail}");</script>
	</c:if>
	<c:if test="${!empty loginfail}">
		<script type='text/javascript'>alert("${loginfail}");</script>		
	</c:if>
	
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h3>Login</h3>
			</div>
		</div>
		<form action="loginProc" method="post">
		<div class="row">
			<div class="col-7">
				<div class="row">
					<div class="col-12">
						<input type="text" name="mem_id" id="id">
					</div>
					<div class="col-12">
						<input type="password" name="mem_pw" id="pw">
					</div>
				</div>
			</div>
			<div class="col-5">
				<button type="submit" id="login">Login</button>
			</div>

		</div>
		</form>
		<div class="row">
			<div class="col-12 ">
				<a href="signup">회원가입</a>/ <a href="findid">ID찾기</a>/ <a href="findPw">비밀번호찾기</a>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<hr />
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<h3>SNS Login</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<a href="">카카오</a>/ <a href="">네이버</a>
			</div>
		</div>
	</div>



</body>
</html>