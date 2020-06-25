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
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
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
            border-left: 1px solid gray;
            height: 100%;
            margin: 0px;
        }
    </style>
    <body>        
        <form action="/message/write">
            <div class="wrap row">
                <div class="col-12">
                    <legend  style="font-size: 30px">메세지 작성</legend>
                </div>
                <hr>
                <div class="col-2">
                    제목
                </div>
                <div class="col-10 verticalLine">
                    <input type="text" name="msg_title" style="width: 98%;">
                </div>
                <hr>
                <div class="col-2">
                    받는 이
                </div>
                <div class="col-10 verticalLine">
                    <input type="text" name="msg_reciever" value="${viewmessage.msg_reciever}" style="width: 98%;">
                </div>
                <hr>
                <div class="col-12">
                    <textarea id="summernote" name="msg_contents">
                    </textarea>
                </div>
                <hr>
                <div class="col-12" style="text-align:center">
                    <button>보내기</button>
                    <input type="button" value="돌아가기" id=back>  
                </div>

            </div>
        </form>
        <script>
            $(document).ready(function() {
                $('#summernote').summernote();
            });
            $('#summernote').summernote({
                height: 360,  
                disableResizeEditor: true,
                toolbar: [
                    ['style', ['bold', 'italic', 'underline', 'clear']],
                    ['font', ['strikethrough']],
                    ['fontsize', ['fontsize']],
                    ['color', ['color']],
                    ['para', ['ul','ol', 'paragraph']],
                    ['height', ['height']],
                    ['insert', ['picture']]
                ]
            });
            $("#back").on("click",function(){
            	location.href="/message/recievelist";
            })
        </script>
    </body>
</html>