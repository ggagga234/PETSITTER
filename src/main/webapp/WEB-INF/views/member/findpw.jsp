<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h3>ID와 email을 입력하세요.</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<input type="text" id="id"><br> <input type="text"
					id="email" placeholder="***@***.com 형식으로 입력해주세요">
				<button type="button" id="findpw">비밀번호 재설정</button>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<button type="button" id="login">로그인</button>
				<button type="button" id="findid">ID 찾기</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
    	$("#findpw").on("click", function(){
    			var email = $("#email").val()
				var id = $("#id").val()
				
				if((id != null && id !="") && (email != null && email !="") ){
											
						$.ajax({
							url : "/member//findPwProc",
							type : "post",
							dataType : "json",
							data : {
								"id" : id,
								"email" : email
							},
							success : function(data) {
								if (data == 1) {
									
									alert("등록 된 이메일로 임시비밀번호가 발송되었습니다.\n임시비밀번호로 로그인 후, 마이페이지에서 비밀번호를 수정해주세요.")
									
								} else if (data == 0) {
									
									alert("확인되는 정보가 없습니다. ID 또는 Email을 확인해주세요.")
								
								}
							}
						})
					
					
				}
		
			    		
	}); //비번찾기
	
	$("#login").on("click", function(){
		location.href="login";
	})
	$("#findid").on("click", function(){
		location.href="findid";
	})
    	
    
    
    </script>



</body>
</html>