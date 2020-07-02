
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
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js"></script>
<script src="/resources/admin/admin_js/navi.js"></script>
<link rel="stylesheet" href="/resources/admin/admin_css/case.css"
	type="text/css">
</head>
<body>
	<div class="wrap row bg-light">
		<div class="col-12 ">
			<div class="row " style="margin: 5px;">
				<div class="col-5 d-none d-sm-block" style="height: 40px;">
					<img src="/resources/images/dogss.png" alt="" style="height: 100%">
				</div>
				<div class="col-5" id="nav">
					<input class="btn btn-outline-primary" type="button" value="Menu"
						id="navmenuon"> <input type="button"
						class="btn btn-outline-primary" value="닫기" id="navmenuoff"
						style="display: none">
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
				<div class="col-12 smenu member">회원 관리</div>
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
				<div class="col-12 smenu member">회원 관리</div>
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
		<div class="rside col">
			<!--본문 용-->
			<div class="row">
				<div class="maintitle col-12">게시판 관리</div>
				<div class="maincontent col-12">
					<div class="row">
						<div class="col-12 table">
							<div class="row">
								<div class="col-12" style="text-align: left">
									<nav class="navbar navbar-light ">
										<form action="/admin/boardselect">
											<select name="boardtype" class="btn btn-info dropdown-toggle">
												<option value="free">자유게시판</option>
												<option value="mb_board">반려인게시판</option>
												<option value="aaa">구직</option>
											</select>
											<button class="btn btn-outline-primary my-2 my-sm-0">검색</button>
										</form>
										<form class="form-inline d-none d-lg-block">
											<input class="form-control mr-sm-2" type="search"
												placeholder="Search" aria-label="Search">
											<button class="btn btn-outline-primary my-2 my-sm-0"
												type="submit">Search</button>
										</form>
									</nav>
								</div>
								<div class="col-12" style="text-align: center;">
									<div class="row head">
										<div class="col-4 col-lg">글 번호</div>
										<div class="col-4 col-lg">제목</div>
										<div class="col-4 col-lg">작성자</div>
										<div class="col-4 col-lg">작성일</div>
										<div class="col-4 col-lg">상태</div>
										<div class="col-4 col-lg">상태 변경</div>
									</div>
									<c:forEach var="i" items="${list}">
									<hr class="hr2">
									<div class="row"> 
										<div class="col-4 col-lg">${i.mb_seq}</div>
										<div class="col-4 col-lg"><a href="/mb/redlist">${i.mb_title}</a></div>
										<div class="col-4 col-lg">${i.mb_writer}</div>
										<div class="col-4 col-lg">${i.mb_date}</div>
										<div class="col-4 col-lg">
											<c:choose>
												<c:when test="${i.mb_restatus eq 'no'}">통상</c:when>
												<c:otherwise>정지</c:otherwise>
											</c:choose>
										</div>
										<div class="col-4 col-lg">
											<form action="/admin/boardblack">
											<input type="text" value="${i.mb_seq}" name=seq style="display: none">
												<select name="state"
													class="btn btn-info dropdown-toggle btn-sm">	
													<option value="no">통상</option>
													<option value="stop">정지</option>
													<option value="delete">삭제</option>
												</select>
												<button class="btn btn-outline-primary my-2 my-sm-0 btn-sm">변경</button>
											</form>
										</div>
									</div>
									</c:forEach>
									<hr class="hr2">
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