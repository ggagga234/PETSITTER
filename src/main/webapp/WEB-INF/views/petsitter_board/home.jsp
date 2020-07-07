<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html lang="en">
  <head>
  		
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Rubik:400,700" rel="stylesheet">
    <link rel="stylesheet" href="/resources/main/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/resources/main/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/main/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/main/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/main/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/main/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/main/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/main/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="/resources/main/css/aos.css">
    <link rel="stylesheet" href="/resources/main/css/rangeslider.css">
    <link rel="stylesheet" href="/resources/main/css/style.css">
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
       <header id="header" class="site-navbar" role="banner">

			<div class="container">
				<div class="row align-items-center">

					<div class="col-11 col-xl-2">
						<h1 class="mb-0 site-logo">
							<a href="index.html" class="text-white h2 mb-0">Browse</a>
						</h1>
					</div>
					<div class="col-12 col-md-10 d-none d-xl-block">
						<nav class="site-navigation position-relative text-right"
							role="navigation">
							<ul class="site-menu js-clone-nav mr-auto d-none d-lg-block">
								<li><a href="/"><span>Home</span></a></li>
								<li class="has-children"><a href="/point/charge"><span>Info</span></a>
									<ul class="dropdown arrow-top">
										<li><a href="/point/charge#services">service</a></li>
										<li><a href="/point/charge#pricing">price</a></li>
										
									</ul></li>
								<li><a href="/board/outputList"><span>Reserve</span></a></li>
								<li><a href="/petsitter/petsitter_register_form"><span>Register</span></a></li>
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
     
    <div class="site-blocks-cover overlay" style="background-image: url(/resources/images/pet4.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">

          <div class="col-md-10">
            
            
            <div class="row justify-content-center mb-4">
              <div class="col-md-10 text-center">
                <h1 data-aos="fade-up">Find Nearby <span class="typed-words"></span></h1>
                <p data-aos="fade-up" data-aos-delay="100">Happy moment with pet  <a href="https://localhost/" target="_blank"> DOG&CAT</a></p>
              </div>
              <button id="register_btn" class="btn btn-primary text-#878786 btn-md px-5 font-weight-bold btn-md-block">펫시터 지원하기</button>
              
            </div>

          </div>
        </div>
      </div>
    </div>  
	    <div class="site-section">
	      <div class="container">	  
	      </div>
	    </div>	    
		<script src="/resources/main/js/typed.js"></script>
	 <script>
	 $(function(){
		 $("#register_btn").on("click",function(){
			 if(${sessionScope.loginInfo.mem_type == '2'}){
				 alert("이미 펫시터로 활동 중입니다. 마이페이지로 이동합니다.");
				 location.href="/petsitter/outputSingle";
			 } else if(${sessionScope.loginInfo.mem_type == '1'}){
				 location.href="/petsitter/petsitter_register_form";
			 } else if(${empty sessionScope.loginInfo.mem_type}){
				 alert("로그인 / 회원가입 후 지원해주세요.");
				 location.href="/member/login";
			 }
			 });
		 })
	 
      var typed = new Typed('.typed-words', {
      strings: ["Attractions"," Events"," Hotels", " Restaurants"],
      typeSpeed: 80,
      backSpeed: 80,
      backDelay: 4000,
      startDelay: 1000,
      loop: true,
      showCursor: true
      });
      </script>

	<jsp:include page="/WEB-INF/views/petsitter_board/footer.jsp"/>
	
	  </body>
</html>