<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
     <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <title>ID 찾기</title>
</head>
<style>
	#strong {
	font-weight: bold; 
	color: green;}
</style>

<body>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h3>가입시 입력 했던 email을 입력하세요.</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <input type="text" id="email" placeholder="***@***.com 형식으로 입력해주세요"> <button type="button" id="findid">ID찾기</button>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div id='yourid'></div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
               <button type="button" id="login">로그인</button> <button type="button" id="findpw">비밀번호 찾기</button>
            </div>
        </div>
    </div>
    
	<script>
  
    	$("#findid").on("click", function(){
    		var email = $("#email").val();

			$.ajax({
				url : "/member/findIdProc",
				type : "post",
				dataType: "json",
				data : {
					"email" : $("#email").val()
				},success : function(data) {
					var id = data.id
										
					if (id != null) {	
						
						$("#yourid").html("<p>당신의 아이디는 <span id=strong>"+id+"</span> 입니다.")
						$("#email").val("");
						
					} else if (id == null) {
						
						$("#yourid").html("<p>확인 되는 ID가 없습니다. Email 주소를 다시 확인하세요.")
					}
				},  error:function(request,status,error){
		             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		          }
	
			})    		
    	}); //아이디 찾기
    	
    	$("#login").on("click", function(){
    		location.href="/member/login";
    	})
    	$("#findpw").on("click", function(){
    		location.href="/member/findPw";
    	})
    	
    	
      
    </script>
    

</body>

</html>
