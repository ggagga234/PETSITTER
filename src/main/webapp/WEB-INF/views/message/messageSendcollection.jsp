<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
</head>
<style>
* {
	box-sizing: border-box
}

hr {
	border: 1px solid gray;
	width: 100%;
	margin: 5px;
}
</style>
<body>
	<div class="wrap row">
		<div class="col-12">
			<legend style="font-size: 30px">보낸 메세지함</legend>
		</div>
		<hr>
		<div class="col-12">
			<button id=recive>받은 메세지</button>
			<button id=send>보낸 메세지</button>
			<button id=write>새 메세지 보내기</button>
		</div>
		<hr>
		<div class="col-12 table">

			<div class="row title">
				<div class="col-4">제목</div>
				<div class="col-2">받는이</div>
				<div class="col-2">날짜</div>
				<div class="col-2">상태</div>
				<div class="col-2">삭제</div>
			</div>
			<hr>

			<c:choose>
				<c:when test="${sendlist eq null}">
					보낸 메세지가 없습니다.
				</c:when>
				<c:otherwise>
					<div class="row ">
						<c:forEach var="i" items="${sendlist}">
							<div class="col-4"><a href="/message/sendViewmessage?seq=${i.msg_seq}">${i.msg_title}</a></div>
							<div class="col-2">${i.msg_reciever}</div>
							<div class="col-2">${i.msg_date}</div>
							<div class="col-2">${i.msg_status}</div>
							<div class="col-2">
								<button>삭제</button>
							</div>
							<hr>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<script>
		$("#write").on("click", function() {
			location.href = "/message/writepage";
		})
		$("#recive").on("click", function() {
			location.href = "/message/recievelist";
		})
		$("#send").on("click", function() {
			location.href = "/message/sendlist";
		})
	</script>
</body>
</html>