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
<link rel="stylesheet" href="/resources/message/message_css/case.css" type="text/css">
<script src="/resources/message/message_js/message.js"></script>
<body>
	<div class="wrap row">
		<div class="col-12 col-sm-6 top">
                <h1>받은 메세지함</h1>
            </div>
            <div class="col-sm-6 d-none d-sm-block log top">
                <img src="/resources/images/dogss.png" alt="" style="height: 100%">
            </div>
		<hr>
		<div class="col-12">
                <button id="recive" class="btn btn-outline-info btn-sm">받은 메세지</button>
                <button id="send" class="btn btn-outline-info btn-sm">보낸 메세지</button>
         </div>
		<hr>
		<div class="col-12 contents">
                <div class="row title">
                    <div class="col-12 col-md-4">제목</div>
                    <div class="col-5 col-md-2">날짜</div>
                    <div class="col-3 col-md-2">보낸 사람</div>
                    <div class="col-4 col-md-3">상태</div>
                    <hr>
                </div>

			<c:choose>
				<c:when test="${recievelist eq null}">
					받은 메세지가 없습니다.
			</c:when>
				<c:otherwise>
					<div class="row con">
						<c:forEach var="i" items="${recievelist}">
							<div class="col-12 col-md-4">
								<a href="/message/recieveMessageView?seq=${i.msg_seq}">${i.msg_title}</a>
							</div>
							<div class="col-5 col-md-2">${i.msg_date}</div>
							<div class="col-3 col-md-2 send">${i.msg_sender}</div>
							<c:choose>
								<c:when test="${i.msg_status eq 'NEW'}">
									<div class="col-2 col-md-2"><h5><span class="badge badge-info">new</span></h5></div>
								</c:when>
								<c:otherwise>
									<div class="col-2 col-md-2 stats">${i.msg_status}</div>
								</c:otherwise>
							</c:choose> 
							<div class="col-2 col-md-2">
								<button id="${i.msg_seq}" class="btn btn-outline-primary btn-sm redelete">삭제</button>
							</div>
							<hr>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div class="col-12">
            <div class="row">
                <div class="col-4"></div>
                <div class="col-4 navi">
                  	${recievenavi}
                </div>
                <div class="col-4" style="text-align: center">
                    <button id="write" class="btn btn-outline-info btn-sm">새 메세지 작성</button>
                </div>
            </div>
        </div>
        </div>
</body>
</html>