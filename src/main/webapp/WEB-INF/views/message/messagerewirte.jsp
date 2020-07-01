<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="/resources/message/message_css/case.css"
	type="text/css">
<script src="/resources/message/message_js/message.js"></script>
<script src="/resources/message/message_js/summer.js"></script>
</head>

<body>
	<form action="/message/write" id="case">
		<div class="wrap row">
			<div class="col-12 col-sm-6 top">
				<h1>메세지 작성</h1>
			</div>
			<div class="col-sm-6 d-none d-sm-block log top">
				<img src="/resources/images/dogss.png" alt="" style="height: 100%">
			</div>
			<hr>
			<div class="col-3 col-sm-2 col-lg-1 title">제목</div>
			<div class="col-9 col-sm-10 col-lg-11 verticalLine">
				<input type="text" name="msg_title" style="width: 98%;"
					id="msg_title">
			</div>
			<hr>
			<div class="col-3 col-sm-2 col-lg-1 title">받는 이</div>
			<div class="col-9 col-sm-10 col-lg-11 verticalLine">
				<input type="text" name="msg_reciever"
					value="${viewmessage.msg_reciever}" style="width: 98%;"
					id="msg_reciever">
					<div id="check" style="display: none"></div>		
			</div>
			<hr>
			<div class="col-12">
				<textarea id="summernote" name="msg_contents" class="msg_contents">
                    </textarea>
			</div>
			<hr>
			<div class="col-12" style="text-align: center">
				<button class="btn btn-outline-info btn-sm">보내기</button>
				<input type="button" value="돌아가기" id=recive
					class="btn btn-outline-info btn-sm">
			</div>
		</div>
	</form>
</body>
</html>