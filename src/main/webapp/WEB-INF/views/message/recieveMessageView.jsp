<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>
<style>
    *{
        box-sizing: border-box
    }

    hr{
        border: 1px solid gray;
        width: 100%;
        margin: 5px;
    }
    .verticalLine {
            border-right: 1px solid gray;
            height: 100%;
            margin: 0px;
     }
</style>
<body>
    <div class="wrap row">
        <div class="col-12">
            <legend  style="font-size: 30px">${viewmessage.msg_title}</legend>
        </div>
        <hr>
        <div class="col-12">
         	<button id=reWrite>답장</button>
         	<button id=newWrite>새 메세지 작성</button>
            <button id=delete>삭제</button>
        </div>
        <hr>
        <div class="col-12">
            <div class="row title">
              <div class="col-2 verticalLine">작성자</div>
              <div class="col-4 verticalLine">${viewmessage.msg_reciever}</div>
              <div class="col-2 verticalLine">보낸 날짜</div>
              <div class="col-4 ">${viewmessage.msg_date}</div>
            </div>
            <hr>
        </div>
        <div class="col-12">${viewmessage.msg_contents}</div>
        <hr>
        <div class="col-12" style="text-align:center">
        <button id="back">돌아 가기</button>
        </div>
    </div>
    <script>
    $("#back").on("click",function(){
    	location.href="/message/recievelist";
    })
    $("#newWrite").on("click", function() {
		location.href ="/message/writepage";
	})
	$("#delete").on("click", function() {
		location.href = "/message/recievedelete?seq=${viewmessage.msg_seq}";
	})
	$("#reWrite").on("click",function(){
    	location.href="/message/rewritepage";
    })
    </script>
    
</body>
</html>