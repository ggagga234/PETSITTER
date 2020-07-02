<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Browse &mdash; Free Website Template by Free-Template.co</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Free-Template.co" />

<link rel="shortcut icon" href="ftco-32x32.png">
<link href="https://fonts.googleapis.com/css?family=Rubik:400,700"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/main/fonts/icomoon/style.css">
<link rel="stylesheet" href="/resources/main/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/main/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/main/css/jquery-ui.css">
<link rel="stylesheet" href="/resources/main/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/resources/main/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="/resources/main/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="/resources/main/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="/resources/main/css/aos.css">
<link rel="stylesheet" href="/resources/main/css/rangeslider.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/mb/dist/tavo-calendar.css">
<link rel="stylesheet" href="/resources/main/css/style.css">
<link rel="stylesheet" href="/resources/mb/css/checkbox.css">
<link rel="stylesheet" href="/resources/mb/css/calendar.css">

<!-- icon -->
<link href="/resources/mb/icofont/icofont.min.css" rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.0.5/css/boxicons.min.css'
	rel='stylesheet'>
<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- Without locals-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="/resources/mb/dist/tavo-calendar.js"></script>
<style>
.petselec {
	display: inline-block;
}

.petselec img {
	width: 250px;
	height: 200px;
}

.services {
	display: inline-block;
	border: 1px solid grey;
	width: 150px;
	height: 60px;
	line-height: 60px;
	border-radius: 5px;
	margin: 10px 10px;
}

.save {
	margin-top: 30px;
	margin-bottom: 30px;
}
</style>
</head>

<body>
	<div class="site-wrap">

		<div class="site-mobile-menu">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>

		<header class="site-navbar" role="banner">

			<div class="container">
				<div class="row align-items-center">

					<div class="col-11 col-xl-2">
						<h1 class="mb-0 site-logo">
							<a href="index.jsp" class="text-white h2 mb-0">Browse</a>
						</h1>
					</div>
					<div class="col-12 col-md-10 d-none d-xl-block">
						<nav class="site-navigation position-relative text-right"
							role="navigation">

							<ul class="site-menu js-clone-nav mr-auto d-none d-lg-block">
								<li><a href="index.html"><span>Home</span></a></li>
								<li class="has-children"><a href="about.html"><span>Dropdown</span></a>
									<ul class="dropdown arrow-top">
										<li><a href="#">Menu One</a></li>
										<li><a href="#">Menu Two</a></li>
										<li><a href="#">Menu Three</a></li>
										<li class="has-children"><a href="#">Dropdown</a>
											<ul class="dropdown">
												<li><a href="#">Menu One</a></li>
												<li><a href="#">Menu Two</a></li>
												<li><a href="#">Menu Three</a></li>
												<li><a href="#">Menu Four</a></li>
											</ul></li>
									</ul></li>
								<li class="active"><a href="listings.html"><span>Listings</span></a></li>
								<li><a href="about.html"><span>About</span></a></li>
								<li><a href="blog.html"><span>Blog</span></a></li>
								<li><a href="contact.html"><span>Contact</span></a></li>
							</ul>
						</nav>
					</div>
					<div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3"
						style="position: relative; top: 3px;">
						<a href="#" class="site-menu-toggle js-menu-toggle text-white"><span
							class="icon-menu h3"></span></a>
					</div>
				</div>
			</div>
		</header>



		<div class="site-blocks-cover inner-page-cover overlay"
			style="background-image: url(/resources/mb/images/man.jpg);"
			data-aos="fade" data-stellar-background-ratio="0.5">
			<div class="container">
				<div
					class="row align-items-center justify-content-center text-center">
					<div class="col-md-10" data-aos="fade-up" data-aos-delay="400">
						<div class="row justify-content-center">
							<div class="col-md-8 text-center">
								<h1>Listings</h1>
								<p data-aos="fade-up" data-aos-delay="100">
									Handcrafted free templates by <a
										href="https://free-template.co/" target="_blank">Free-Template.co</a>
								</p>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>


		<div class="site-section bg-light">
			<div class="container">
					<div class="row">
						<div class="col-lg-7">
							<div class="d-block d-md-flex listing-horizontal">
								<div class="lh-content">
									<h3>제목</h3>
									<c:if test="${!empty mlist}">
										<span>${mlist.mb_title}</span>
									</c:if>
								</div>
							</div>

							<div class="d-block d-md-flex listing-horizontal">
								<c:if test="${!empty mlist}">
									<div class="petselec">
										<img src="/resources/mb/images/mypet.jpg">
									</div>
								</c:if>

								<div class="lh-content">
									<h3>나의 펫</h3>
									<div class="pet">
										<c:if test="${!empty mlist}">
											<span>${mlist.mb_pet_name}</span>
										</c:if>
									</div>
								</div>

							</div>

							<div class="d-block d-md-flex listing-horizontal">
								<div class="lh-content">
									<h5 class="mb-3">서비스</h5>
									<div class="d-block my-3">
										<div class="service_list" style="text-align: center">
											<div>
												<span class="services" id="service1"> <i
													class="icofont-tasks-alt"></i>장기예약
												</span> <span class="services" id="service2"> <i
													class="icofont-pills"></i>약물 복용
												</span> <span class="services" id="service3"> <i
													class='bx bx-bone'></i>실내 놀이
												</span>
											</div>
											<div>
												<span class="services" id="service4"> <i
													class="icofont-bathtub"></i>목욕 가능
												</span> <span class="services" id="service5"> <i
													class="icofont-first-aid"></i>응급처치
												</span> <span class="services" id="service6"> <i
													class='bx bx-walk'></i>야외 산책
												</span>
											</div>
											<div>
												<span class="services" id="service7"> <i
													class="icofont-tasks-alt"></i>발톱관리
												</span> <span class="services" id="service8"> <i
													class="icofont-ui-cut"></i>모발 관리
												</span> <span class="services" id="service9"> <i
													class="icofont-car-alt-3"></i>집앞픽업
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="d-block d-md-flex listing-horizontal">
								<div class="lh-content">
									<h3>특이사항</h3>
									<c:if test="${!empty mlist}">
										<span>${mlist.mb_unique}</span>
									</c:if>
								</div>
							</div>
							<c:if test="${mlist.mb_writer} == ${sessid}">
								<div>
									<a href="/mb/modified?mb_seq=${mlist.mb_seq}" class="btn btn-primary text-white" id="modified">수정</a>
									<a href="/mb/deleteboard?mb_seq=${mlist.mb_seq}" class="btn btn-primary text-white" id="delete">삭제</a>
								</div>
							</c:if>		
							<div>
								<a href="/mb/mb_board" class="btn btn-primary text-white" id="modified">목록</a>
							</div>	
							<div class="col-12 mt-5 text-center"></div>

						</div>
						<div class="col-lg-4 ml-5">

							<div data-brackets-id='1'>
								<div data-brackets-id='2'
									style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding-left: 32px; padding-right: 32px; padding-bottom: 32px">
									<p data-brackets-id='3'
										style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-top: 38px">펫시터가
										필요해요</p>
									<div data-brackets-id='4'
										style="display: flex; flex-grow: 1; margin-top: 24px">
										<div class="reserve_calendar">
											<div id="my-calendar"></div>
											<input type="hidden" name="mb_startday" id="mb_startday">
											<input type="hidden" name="mb_endday" id="mb_endday">
										</div>
									</div>

									<p data-brackets-id='18'
										style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-top: 38px">선택시간</p>
									<div data-brackets-id='16'
										style="display: flex; flex-direction: row; justify-content: space-between;">
										<div id="timelist">
											<c:if test="${!empty mlist}">
												<c:forEach items="${times}" var="i">
													<div>
														<span>&nbsp;&nbsp;${i}</span>
													</div>
												</c:forEach>
											</c:if>
										</div>
									</div>
									<div>
										<div class="price">
											<span></span> 포인트
										</div>
									</div>
									<div class="custom-pagination">
										<button class="btn btn-primary text-white save">신청하기</button>
									</div>

									<div data-brackets-id='33'
										style="width: 100%; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding: 15px 15px; margin-top: 38px; margin-bottom: 38px">
										<div data-brackets-id='34'
											style="display: flex; flex-direction: row; align-items: center; justify-content: space-between">
											<p data-brackets-id='35'
												style="font-size: 17px; font-weight: 600; letter-spacing: -0.2px; line-height: 25px; color: #81DAD6">이용
												요금</p>
											<div data-brackets-id='36'
												style="display: flex; align-items: center; flex-direction: row">
												<div data-brackets-id='37'
													style="display: flex; flex-direction: row; align-items: center; margin-right: 8px">

													<p data-brackets-id='38'
														style="font-size: 13px; line-height: 18px; color: #81DAD6">2시간당</p>

													<div data-brackets-id='39'
														style="width: 1px; height: 15px; background-color: #ECEDF0; margin-left: 5px; margin-right: 5px">
													</div>

													<p data-brackets-id='40'
														style="font-size: 13px; line-height: 18px; color: #81DAD6">AM,PM</p>
												</div>
											</div>
										</div>
										<div data-brackets-id='43'
											style="display: flex; flex-direction: row; justify-content: space-between; margin-top: 31px; margin-bottom: 31px">
											<div data-brackets-id='44'
												style="display: flex; flex-direction: row; align-items: center; height: 24px">
												아이콘자리
												<p data-brackets-id='46'
													style="font-size: 15px; line-height: 19px; color: #81DAD6; margin-left: 10px">소형견</p>
												<p data-brackets-id='47'
													style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 12px">7키로
													미만</p>
											</div>
											<div data-brackets-id='48'
												style="display: flex; flex-direction: row">
												<div data-brackets-id='49'
													style="display: flex; align-items: center; width: 62px; flex-direction: column; margin-right: 12px">
													<p data-brackets-id='50'
														style="font-size: 14px; letter-spacing: 0.5px; line-height: 20px; color: #81DAD6">50포인트</p>
												</div>
												<div data-brackets-id='51'
													style="display: flex; flex-direction: column; align-items: center; width: 62px">
													<p data-brackets-id='52'
														style="font-size: 12px; letter-spacing: 0.5px; line-height: 20px; color: #81DAD6">150포인트</p>
												</div>
											</div>
										</div>
										<div data-brackets-id='53'
											style="display: flex; flex-direction: row; justify-content: space-between; margin-top: 14px; margin-bottom: 31px">
											<div data-brackets-id='54'
												style="display: flex; flex-direction: row; align-items: center; height: 24px">
												아이콘자리
												<p data-brackets-id='56'
													style="font-size: 15px; line-height: 19px; color: #81DAD6; margin-left: 10px">중형견</p>
												<p data-brackets-id='57'
													style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 12px">7~14.9키로</p>
											</div>
											<div data-brackets-id='58'
												style="display: flex; flex-direction: row">
												<div data-brackets-id='59'
													style="display: flex; align-items: center; width: 62px; flex-direction: column; margin-right: 12px">
													<p data-brackets-id='60'
														style="font-size: 14px; letter-spacing: 0.5px; line-height: 20px; color: #81DAD6">60포인트</p>
												</div>
												<div data-brackets-id='61'
													style="display: flex; flex-direction: column; align-items: center; width: 62px">
													<p data-brackets-id='62'
														style="font-size: 12px; letter-spacing: 0.5px; line-height: 20px; color: #81DAD6">200포인트</p>
												</div>
											</div>
										</div>
										<div data-brackets-id='63'
											style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; margin-top: 14px">
											<div data-brackets-id='64'
												style="display: flex; flex-direction: row; align-items: center; height: 24px">
												아이콘자리
												<p data-brackets-id='66'
													style="font-size: 15px; line-height: 19px; color: #81DAD6; margin-left: 10px">대형견</p>
												<p data-brackets-id='67'
													style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 12px">15키로
													이상</p>
											</div>
											<div data-brackets-id='68'
												style="display: flex; flex-direction: row">
												<div data-brackets-id='69'
													style="display: flex; align-items: center; width: 62px; flex-direction: column; margin-right: 12px">
													<p data-brackets-id='70'
														style="font-size: 14px; letter-spacing: 0.5px; line-height: 20px; color: #81DAD6">65포인트</p>
												</div>
												<div data-brackets-id='71'
													style="display: flex; flex-direction: column; align-items: center; width: 62px">
													<p data-brackets-id='72'
														style="font-size: 12px; letter-spacing: 0.5px; line-height: 20px; color: #81DAD6">250포인트</p>
												</div>
											</div>
										</div>
										<div data-brackets-id='73'
											style="width: 310px; height: 1px; background-color: #EBEBEB; margin: 32px 0"></div>
										<div data-brackets-id='74'
											style="display: flex; flex-direction: row; justify-content: space-between">
											<p data-brackets-id='75'
												style="font-family: Noto Sans KR, sans-serif; font-size: 14px; color: #81DAD6">풀타임
												09:00~20:00</p>
											<div data-brackets-id='76'
												style="display: flex; flex-direction: column; justify-content: space-between">
												<p data-brackets-id='77'
													style="font-size: 13px; color: #81DAD6">400포인트</p>
											</div>
										</div>
									</div>

									<div class="mb-5">
										<div id="map" style="width: 100%; height: 350px;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="py-5 bg-primary">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 mr-auto mb-4 mb-lg-0">
					<h2 class="mb-3 mt-0 text-white">Let's get started. Create
						your account</h2>
					<p class="mb-0 text-white">Far far away, behind the word
						mountains, far from the countries Vokalia and Consonantia, there
						live the blind texts.</p>
				</div>
				<div class="col-lg-4">
					<p class="mb-0">
						<a href="signup.html"
							class="btn btn-outline-white text-white btn-md px-5 font-weight-bold btn-md-block">Sign
							Up</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<footer class="site-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div class="row">
						<div class="col-md-6 mb-5 mb-lg-0 col-lg-3">
							<h2 class="footer-heading mb-4">Quick Links</h2>
							<ul class="list-unstyled">
								<li><a href="#">About Us</a></li>
								<li><a href="#">Services</a></li>
								<li><a href="#">Testimonials</a></li>
								<li><a href="#">Contact Us</a></li>
							</ul>
						</div>
						<div class="col-md-6 mb-5 mb-lg-0 col-lg-3">
							<h2 class="footer-heading mb-4">Products</h2>
							<ul class="list-unstyled">
								<li><a href="#">About Us</a></li>
								<li><a href="#">Services</a></li>
								<li><a href="#">Testimonials</a></li>
								<li><a href="#">Contact Us</a></li>
							</ul>
						</div>
						<div class="col-md-6 mb-5 mb-lg-0 col-lg-3">
							<h2 class="footer-heading mb-4">Features</h2>
							<ul class="list-unstyled">
								<li><a href="#">About Us</a></li>
								<li><a href="#">Services</a></li>
								<li><a href="#">Testimonials</a></li>
								<li><a href="#">Contact Us</a></li>
							</ul>
						</div>
						<div class="col-md-6 mb-5 mb-lg-0 col-lg-3">
							<h2 class="footer-heading mb-4">Follow Us</h2>
							<a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
							<a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
							<a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
							<a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<h2 class="footer-heading mb-4">Subscribe Newsletter</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia, there live the blind texts.</p>
					<form action="#" method="post">
						<div class="input-group mb-3">
							<input type="text" class="form-control bg-transparent"
								placeholder="Enter Email" aria-label="Enter Email"
								aria-describedby="button-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary text-white" type="button"
									id="button-addon2">Send</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row pt-5 mt-5">
				<div class="col-12 text-md-center text-left">
					<p>
						<!-- Link back to Free-Template.co can't be removed. Template is licensed under CC BY 3.0. -->
						&copy; 2019 <strong class="text-black">Browse</strong> Free
						Template. All Rights Reserved. <br> Design by <a
							href="https://free-template.co/" target="_blank"
							class="text-black">Free-Template.co</a>
					</p>
				</div>
			</div>
		</div>

	</footer>
	<script src="/resources/main/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/resources/main/js/jquery-ui.js"></script>
	<script src="/resources/main/js/popper.min.js"></script>
	<script src="/resources/main/js/bootstrap.min.js"></script>
	<script src="/resources/main/js/owl.carousel.min.js"></script>
	<script src="/resources/main/js/jquery.stellar.min.js"></script>
	<script src="/resources/main/js/jquery.countdown.min.js"></script>
	<script src="/resources/main/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/main/js/bootstrap-datepicker.min.js"></script>
	<script src="/resources/main/js/aos.js"></script>
	<script src="/resources/main/js/rangeslider.min.js"></script>
	<script src="/resources/main/js/main.js"></script>
	<script src="/resources/mb/js/checkbox.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=673fb72de94724a273da597b59cd588d&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch("${add}", function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				// 지도에 표시할 원을 생성합니다
				var circle = new kakao.maps.Circle({
					center : new kakao.maps.LatLng(result[0].y, result[0].x), // 원의 중심좌표 입니다 
					radius : 50, // 미터 단위의 원의 반지름입니다 
					strokeWeight : 1, // 선의 두께입니다 
					strokeColor : '#75B8FA', // 선의 색깔입니다
					strokeOpacity : 0.5, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					fillColor : '#CFE7FF', // 채우기 색깔입니다
					fillOpacity : 0.5
				// 채우기 불투명도 입니다   
				});

				// 지도에 원을 표시합니다 
				circle.setMap(map);
				map.setCenter(coords);
			}
		});
	</script>
	<script>
		$(function() {
			var my_calendar = new TavoCalendar('#my-calendar', {
				date : moment().format("YYYY-MM-DD"),
				date_start : "${mlist.mb_startday}",
				date_end : "${mlist.mb_endday}",
				format : "YYYY-MM-DD",
				locale : "de",
				range_select : false
			})
			
			var range = my_calendar.getRange();
			var start = "${mlist.mb_startday}";
           	var end = "${mlist.mb_endday}";			 
           	var startcon = moment(range.start)
           	var endcon = moment(range.end);
            var duration = moment.duration(endcon.diff(startcon)).asDays();
			           
			var point = 0;
			
			<c:forEach var = "j" items="${services}">
				$("#"+"${j}").css("color","red");
			</c:forEach>	
			<c:forEach var="i" items="${pettype}">
				<c:forEach var = "l" items="${timetype}">
				console.log("${l}");
				console.log("${i}");
				if ("${i}" == "소" && ("${l}" != "am") && ("${l}" != "pm") && ("${l}" != "full")) {
					point += 50;
				} else if ("${i}" == "중" && ("${l}" != "am") && ("${l}" != "pm") && ("${l}" != "full")) {
					point += 60;
				} else if ("${i}" == "대" && ("${l}" != "am") && ("${l}" != "pm") && ("${l}" != "full")) {
					point += 65;
				} else if ("${i}" == "소" && (("${l}" == "am") || ("${l}" == "pm")) && ("${l}" != "full")) {
					point += 150;
				} else if ("${i}" == "중" && (("${l}" == "am") || ("${l}" == "pm")) && ("${l}" != "full")) {
					point += 200;
				} else if ("${i}" == "대" && (("${l}" == "am") || ("${l}" == "pm")) && ("${l}" != "full")) {
					point += 250;
				} else if ("${l}" == "full") {
					point += 400;
				}
				</c:forEach>
			</c:forEach>
			$(".price span").html(point*duration);
		})
	</script>
</body>

</html>
