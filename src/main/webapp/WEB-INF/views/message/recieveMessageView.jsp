<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link rel="stylesheet" href="/resources/message/message_css/case.css" type="text/css">    
	<script src="/resources/message/message_js/message.js"></script>
</head> 
<body>
    <div class="wrap row">
        <div class="col-12 log2 top">
            <img src="/resources/images/dogss.png" alt="" style="height: 100%">
        </div>
        <hr>
        <div class="col-12">
            <div class="row">
             	<div class="col-2 col-md-2 col-xl-1 title2">제목</div>
        		<div class="col-10 col-md-10 col-xl-11 verticalLine">${viewmessage.msg_title}</div>
            </div>
        </div>
        <hr>
       <div class="col-12">
            <div class="row">
              <div class="col-2 col-md-2 col-xl-1 title2">보낸이</div>
              <div class="col-3 col-md-4 col-xl-5 verticalLine">${viewmessage.msg_sender}</div>
              <div class="col-3 col-md-2 col-xl-1 title2">받은 일</div>
              <div class="col-4 col-md-4 col-xl-5 verticalLine ">${viewmessage.msg_date}</div>
              <hr>
            </div>
        </div>
        <div class="col-12">${viewmessage.msg_contents}</div>
        <hr>
        <div class="col-12" style="text-align: right">
         	<button id=reWrite class="btn btn-outline-info btn-sm">답장</button>
         	<button id=write class="btn btn-outline-info btn-sm">새 메세지 작성</button>
            <button id=delete class="btn btn-outline-info btn-sm">삭제</button>
        </div>
        <div class="col-12" style="text-align:center">
        <button id="recive" class="btn btn-outline-info btn-sm">돌아 가기</button>
        </div>
    </div>
    <script>
	$("#delete").on("click", function() {
		location.href = "/message/recievedelete?seq=${viewmessage.msg_seq}&send=${viewmessage.msg_sender}";
	})
    </script>
    
</body>
</html>