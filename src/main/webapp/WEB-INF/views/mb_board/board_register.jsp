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
<link rel="stylesheet" href="/resources/main/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/main/css/bootstrap-datepicker.css">
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

.services input[type="checkbox"] {
	display: none;
	font-weight: bold;
}

.services input[type="checkbox"]+label {
	cursor: pointer;
}

.services input[type="checkbox"]:checked+label {
	color: #ff4301;
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
				<form action="index" method="post">
					<div class="row">
						<div class="col-lg-7">
							<div class="d-block d-md-flex listing-horizontal">
								<div class="lh-content">
									<div class="title">
										<h3>제목</h3>
										<div contenteditable="true" id="title"></div>
										<input type="hidden" name="mb_title" id="mb_title">
									</div>
								</div>
							</div>

							<div class="d-block d-md-flex listing-horizontal">
								<div class="petselec">
									<img src="/resources/mb/images/mypet.jpg">
								</div>
								<div class="lh-content">
									<div class="pet">
										<c:if test="${!empty list}">
											<c:forEach items="${list}" var="i">
												<input type="hidden" name="mb_petphoto" id="petphoto">
												<input type="checkbox" data-imgsrc="${i.pet_photo}"
													class="petname" name="mb_pet_name" id="${i.pet_name}"
													value="${i.pet_name}" />
												<label for="${i.pet_name}"><span></span>${i.pet_name}</label>
											</c:forEach>
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
												<span class="services"> <input type="checkbox"
													name="mb_service" id="service1" value=service1 /> <label
													for="service1"> <i class="icofont-tasks-alt"></i>장기
														예약
												</label>
												</span> <span class="services"> <input type="checkbox"
													name="mb_service" id="service2" value=service2 /> <label
													for="service2"> <i class="icofont-pills"></i> 약물 복용
												</label>
												</span> <span class="services"> <input type="checkbox"
													style="" name="mb_service" id="service3" value=service3 />
													<label for="service3"><i class='bx bx-bone'></i>실내
														놀이</label>
												</span>
											</div>

											<div>
												<span class="services"> <input type="checkbox"
													name="mb_service" id="service4" value=service4 /> <label
													for="service4"><i class="icofont-bathtub"></i>목욕 가능</label>
												</span> <span class="services"> <input type="checkbox"
													name="mb_service" id="service5" value=service5 /> <label
													for="service5"><i class="icofont-first-aid"></i>응급
														처치</label>
												</span> <span class="services"> <input type="checkbox"
													name="mb_service" id="service6" value=service6 /> <label
													for="service6"><i class='bx bx-walk'></i>야외 산책</label>
												</span>
											</div>
											<div>
												<span class="services"> <input type="checkbox"
													name="mb_service" id="service7" value=service7 /> <label
													for="service7"><i class="icofont-tasks-alt"></i>발톱
														관리</label>
												</span> <span class="services"> <input type="checkbox"
													name="mb_service" id="service8" value=service8 /> <label
													for="service8"><i class="icofont-ui-cut"></i>모발 관리</label>
												</span> <span class="services"> <input type="checkbox"
													name="mb_service" id="service9" value=service9 /> <label
													for="service9"><i class="icofont-car-alt-3"></i>집앞
														픽업</label>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="d-block d-md-flex listing-horizontal">
								<div class="lh-content">
									<h3>특이사항</h3>
									<div contenteditable="true" id="uniqueness"></div>
									<input type="hidden" name="mb_unique" id="mb_unique">
								</div>
							</div>
							<div class="col-12 mt-5 text-center"></div>
						</div>
						<div class="col-lg-4 ml-5">
							<div data-brackets-id='1'>
								<div data-brackets-id='2'
									style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding-left: 32px; padding-right: 32px; padding-bottom: 32px">
									<p data-brackets-id='3'
										style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-top: 38px">언제
										펫시터가 필요한가요?</p>
									<div data-brackets-id='4'
										style="display: flex; flex-grow: 1; margin-top: 24px">
										<div class="reserve_calendar">
											<div id="my-calendar"></div>
											<input type="hidden" name="mb_startday" id="mb_startday">
											<input type="hidden" name="mb_endday" id="mb_endday">
										</div>
									</div>
									<p data-brackets-id='18'
										style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-top: 38px">시간선택</p>
									<div data-brackets-id='16'
										style="display: flex; flex-direction: row; justify-content: space-between;">

										<div id="timelist">
											<div>
												<input type="checkbox" class="selectime" value="first"
													name="mb_time" id="first"><label for="first"><span></span>1부
													09:00 ~ 11:00</label>
											</div>
											<div>
												<input type="checkbox" class="selectime" value="second"
													name="mb_time" id="second"><label for="second"><span></span>2부
													11:00 ~ 13:00</label>
											</div>
											<div>
												<input type="checkbox" class="selectime" value="third"
													name="mb_time" id="third"><label for="third"><span></span>3부
													13:00 ~ 15:00</label>
											</div>
											<div>
												<input type="checkbox" class="selectime" value="fourth"
													name="mb_time" id="fourth"><label for="fourth"><span></span>4부
													15:00 ~ 17:00</label>
											</div>
											<div>
												<input type="checkbox" class="selectime" value="fifth"
													name="mb_time" id="fifth"><label for="fifth"><span></span>5부
													17:00 ~ 19:00</label>
											</div>
											<div>
												<input type="checkbox" class="selectime" value="sixth"
													name="mb_time" id="sixth"><label for="sixth"><span></span>6부
													19:00 ~ 21:00</label>
											</div>
											<div>
												<input type="checkbox" class="selectime" value="am"
													name="mb_time" id="am"><label for="am"><span></span>오전
													09:00 ~ 14:00</label>
											</div>
											<div>
												<input type="checkbox" class="selectime" value="pm"
													name="mb_time" id="pm"><label for="pm"><span></span>오후
													14:00 ~ 21:00</label>
											</div>
											<div>
												<input type="checkbox" class="selectime" value="full"
													name="mb_time" id="full"><label for="full"><span></span>풀타임
													09:00 ~ 20:00</label>
											</div>
										</div>
									</div>
									<div class="mb-5">
										<div class="custom-pagination">
											<button class="btn btn-primary text-white save">등록하기</button>
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

		<script>
			$("#uniqueness").on("keyup", function() {
				var uniquetext = $("#uniqueness").html();
				$("#mb_unique").val(uniquetext);
			})
			
			$("#title").on("keyup", function() {
				var title = $("#title").html();
				$("#mb_title").val(title);
			})
		</script>


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
	<script src="/resources/mb/js/calendar.js"></script>
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
		$(function(){
			$(".petname").on("click",function(){	
				var src = [];
				$(".petname:checked").each(function(index,item){
					src.push($(this).data("imgsrc"));
				})					
				$("#petphoto").val(src);
			})
		})
	</script>
</body>

</html>
