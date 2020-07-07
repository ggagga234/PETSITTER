<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js"></script>
		<script src="/resources/admin/admin_js/navi.js"></script>
		<link rel="stylesheet" href="/resources/admin/admin_css/case.css" type="text/css">
    </head>
    <body>
        <div class="wrap row bg-light">
            <div class="col-12 ">
                <div class="row " style="margin: 5px;">
                	<div class="col-5 d-none d-sm-block" style="height: 40px;">
						<img src="/resources/images/dogss.png" alt="" style="height: 100%">
					</div>
                    <div class="col-5" id="nav">
                        <input class="btn btn-outline-primary" type="button" value="Menu" id="navmenuon">
                        <input class="btn btn-outline-primary" type="button" value="닫기" id="navmenuoff" style="display: none">
                    </div>
                    <div class="col" style="text-align: right;">
                        <button class="btn btn-outline-primary">홈으로</button>
                        <button class="btn btn-outline-primary">로그 아웃</button>
                    </div>
                </div>
            </div>
           <div class="lside col-12 bg-primary" id="navmenu">
			<div class="row">
				<!--사이드 메뉴바-->
				<div class="col-12 smenu main">관리자 페이지</div>
				<hr>
				<div class="col-12 smenu member" >회원 관리</div>
				<hr>
				<div class="col-12 smenu  reservation">예약 관리</div>
				<hr>
				<div class="col-12 smenu petsiter">펫 시터 신청서</div>
				<hr>
				<div class="col-12 smenu black">블랙리스트</div>
				<hr>
				<div class="col-12 smenu baord">게시판 관리</div>
				<hr>
				<div class="col-12 smenu declaration">신고 내역 관리</div>
				<hr>
				<div class="col-12 smenu cash">현금 전환 관리</div>
				<hr>
				<div class="col-12 smenu pass">비밀번호 관리</div>
				<hr>
				<div class="col-12 smenu mess">메세지 관리</div>
				<hr>
				<div class="col-12 smenu chat">QnA 채팅 관리</div>
			</div>
		</div>
		<div class="lside col-sm-3 col-lg-2 d-none d-sm-block bg-primary "
			id="lside">
			<div class="row">
				<!--사이드 메뉴바-->
				<div class="col-12 smenu main">관리자 페이지</div>
				<hr>
				<div class="col-12 smenu member" >회원 관리</div>
				<hr>
				<div class="col-12 smenu  reservation">예약 관리</div>
				<hr>
				<div class="col-12 smenu petsiter">펫 시터 신청서</div>
				<hr>
				<div class="col-12 smenu black">블랙리스트</div>
				<hr>
				<div class="col-12 smenu baord">게시판 관리</div>
				<hr>
				<div class="col-12 smenu declaration">신고 내역 관리</div>
				<hr>
				<div class="col-12 smenu cash">현금 전환 관리</div>
				<hr>
				<div class="col-12 smenu pass">비밀번호 관리</div>
				<hr>
				<div class="col-12 smenu mess">메세지 관리</div>
				<hr>
				<div class="col-12 smenu chat">QnA 채팅 관리</div>
				<hr>
				<div class="col-12 smenu hide" id="hide">◀</div>
				<hr>
			</div>
		</div>
		<div class="lside_hide d-none bg-primary hide" id="view">▶</div>
            <div class="rside col"><!--본문 용-->
                <div class="row">
                    <div class="maintitle col-12">
                        펫 시터 신청서
                    </div>
                    <div class="maincontent col-12">
                        <div class="row">
                            <div class="col-12 table">
                                <div class="row">
                                    <div class="col-12">
                                        <nav class="navbar navbar-light ">
                                            <a class="navbar-brand">신청 내역</a>
                                            <form class="form-inline d-none d-sm-block">
                                                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                                                <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
                                            </form>
                                        </nav>
                                    </div>
                                    <div class="col-12">
	                                    <div class="row">
	                                    	<div class= col-3>회원아이디</div>
	                                    	<div class= col-3>회원나이</div>
	                                    	<div class= col-3>신청서내용</div>
	                                    	<div class= col-3>수락/거절</div>      	    
	                                    </div>
	                                    <hr style="width: 100%;">
	                                    <div class="row">
	                                    <c:forEach var="i" items="${petsitter}">        
	                                    	<div class= col-3>${i.ps_id}</div>
	                                    	<div class= col-3>${i.ps_age}</div>
	                                    	<div class= col-3><a href="#">내용 보기</a></div>
	                                    	<div class= col-3>
	                                    		<input type="button" value="수락" class="accept" id="${i.ps_id}">
	                                    		<input type="button" value="거절" class="cencel" >
	                                    	</div> 
	                                    </c:forEach>
	                                    </div>
	          							<script>
	          								$(".accept").on("click",function(){
	          									var id = $(this).attr("id");
	          									location.href="/admin/petaccept?id="+id;
	          								})
	          							</script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>