<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html lang="en">
  <head>
  	<link href="/resources/mb/icofont/icofont.min.css" rel="stylesheet">
	<link href="/resources/petsiter/css/animate.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<link href='https://unpkg.com/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
  <style type="text/css">
  	a {
	  color: #00c1c1;
	}
	
	a:hover {
	  color: #00f4f4;
	  text-decoration: none;
	}
	
	h1, h2, h3, h4, h5, h6 {
	  font-family: "Raleway", sans-serif;
	}

	.services .icon-box {
	  margin-bottom: 20px;
	  padding: 30px;
	  border-radius: 6px;
	  background: #f0f4f4;
	}
	
	.services .icon-box i {
	  float: left;
	  color: #00c1c1;
	  font-size: 40px;
	}
	
	.services .icon-box h4 {
	  margin-left: 70px;
	  font-weight: 700;
	  margin-bottom: 15px;
	  font-size: 18px;
	}
	
	.services .icon-box h4 a {
	  color: #334242;
	  transition: 0.3s;
	}
	
	.services .icon-box:hover h4 a {
	  color: #00c1c1;
	}
	
	.services .icon-box p {
	  margin-left: 70px;
	  line-height: 24px;
	  font-size: 14px;
	}
	
	.pricing .row {
	  padding-top: 30px;
	}
	
	.pricing .box {
	  padding: 20px 20px;
	  margin-bottom: 30px;
	  box-shadow: 0px 5px 90px 0px rgba(110, 123, 131, 0.1);
	  background: #fff;
	  text-align: center;
	}
	
	.pricing h3 {
	  font-weight: 300;
	  margin-bottom: 15px;
	  font-size: 28px;
	}
	
	.pricing h4 {
	  font-size: 46px;
	  color: #0b2341;
	  font-weight: 400;
	  font-family: "Open Sans", sans-serif;
	  margin-bottom: 25px;
	}
	
	.pricing h4 span {
	  color: #bababa;
	  font-size: 18px;
	  display: block;
	}
	
	.pricing ul {
	  padding: 0;
	  list-style: none;
	  color: #999;
	  text-align: left;
	  line-height: 20px;
	}
	
	.pricing ul li {
	  padding-bottom: 12px;
	}
	
	.pricing ul i {
	  color: #ed502e;
	  font-size: 18px;
	  padding-right: 4px;
	}
	
	.pricing ul .na {
	  color: #ccc;
	}
	
	.pricing ul .na i {
	  color: #ccc;
	}
	
	.pricing ul .na span {
	  text-decoration: line-through;
	}
	
	.pricing .get-started-btn {
	  display: inline-block;
	  padding: 10px 40px 11px 40px;
	  border-radius: 4px;
	  color: #0b2341;
	  transition: none;
	  font-size: 14px;
	  font-weight: 600;
	  transition: 0.3s;
	  border: 2px solid #334242;
	  background: #fff;
	}
	
	.pricing .get-started-btn:hover {
	  background: #334242;
	  color: #fff;
	}
	
	.pricing .featured {
	  z-index: 10;
	  padding: 100px 40px;

	}
	
	.pricing .featured:hover {
	  z-index: 10;
	  padding: 100px 40px;
	  border: 3px solid #334242;
	}
	
	.pricing .featured .get-started-btn {
	  background: #00c1c1;
	  color: #fff;
	  border-color: #00c1c1;
	}
	
	.pricing .featured .get-started-btn:hover {
	  background: #334242;
	  border: 2px solid #334242;
	}
	
	@media (max-width: 992px) {
	  .pricing .box {
	    max-width: 60%;
	    margin: 0 auto 30px auto;
	  }
	}
	
	@media (max-width: 767px) {
	  .pricing .box {
	    max-width: 80%;
	    margin: 0 auto 30px auto;
	  }
	}
	
	@media (max-width: 420px) {
	  .pricing .box {
	    max-width: 100%;
	    margin: 0 auto 30px auto;
	  }
	}
  
  </style>
  <script>
  	$(function(){
  		var page_url = window.location.href;
  		var page_id = page_url.substring(page_url.lastIndexOf("#") + 1); 
  		 if (page_id == 'services') {
  			 $('html, body').animate({ 
  				 scrollTop: $('#scroll-' + page_id).offset().top }, 500);
  			 } 
  	})
  </script>
  </head>
  <body>
	<jsp:include page="/WEB-INF/views/petsitter_board/header.jsp"/>
	
	<div class="site-section">
	
	    <!-- ======= Services Section ======= -->
	<section id="scroll-services" class="services ">
      <div class="container">
		
		<div class="row mb-5">
          <div class="col-md-4 text-left border-primary">
            <h2 class="font-weight-light text-primary">서비스 안내</h2>
            <p class="color-black-opacity-5"> 펫시터에 따라 제공 서비스가 다를 수 있습니다.</p>
          </div>
        </div>
		
        <div class="row">
          <div class="col-md-6">
            <div class="icon-box">
              <i class="icofont-first-aid"></i>
              <h4><a href="#">응급 처치</a></h4>
              <p>간단한 응급 치료 가능</p>
            </div>
          </div>
          <div class="col-md-6 mt-4 mt-md-0">
            <div class="icon-box">
              <i class="icofont-pills"></i>
              <h4><a href="#">약물 복용</a></h4>
              <p>정확한 시간에 맞춰 약 챙겨주기</p>
            </div>
          </div>
          <div class="col-md-6 mt-4 mt-md-0">
            <div class="icon-box">
              <i class="icofont-car-alt-3"></i>
              <h4><a href="#">집앞 픽업</a></h4>
              <p>친절하게 집 앞으로 픽업! 안전하게 집으로 귀가</p>
            </div>
          </div>
          <div class="col-md-6 mt-4 mt-md-0">
            <div class="icon-box">
              <i class="icofont-bathtub"></i>
              <h4><a href="#">목욕 시키기</a></h4>
              <p>유기농 바디워시로 뽀송뽀송하게 목욕시켜주기</p>
            </div>
          </div>
          <div class="col-md-6 mt-4 mt-md-0">
            <div class="icon-box">
              <i class="icofont-baby-food"></i>
              <h4><a href="#">간식 주기</a></h4>
              <p>맛난 간식 챙겨주기</p>
            </div>
          </div>
          <div class="col-md-6 mt-4 mt-md-0">
            <div class="icon-box">
              <i class="icofont-tasks-alt"></i>
              <h4><a href="#">발톱 깍기</a></h4>
              <p>아프지 않게 발톱 깍아주기</p>
            </div>
          </div>
           <div class="col-md-6 mt-4 mt-md-0">
            <div class="icon-box">
              <i class="icofont-tasks-alt"></i>
              <h4><a href="#">미용 관리</a></h4>
              <p>소중한 털들 케어해주기</p>
            </div>
          </div>
           <div class="col-md-6 mt-4 mt-md-0">
            <div class="icon-box">
              <i class="icofont-tasks-alt"></i>
              <h4><a href="#">장기 예약</a></h4>
              <p>장기 돌봄을 원하는 경우</p>
            </div>
          </div>
           <div class="col-md-6 mt-4 mt-md-0">
            <div class="icon-box">
              <i class="icofont-tasks-alt"></i>
              <h4><a href="#">야외 산책</a></h4>
              <p>덥지 않은 시간에 가벼운 산책하기</p>
            </div>
          </div>
           <div class="col-md-6 mt-4 mt-md-0">
            <div class="icon-box">
              <i class="icofont-tasks-alt"></i>
              <h4><a href="#">+</a></h4>
              <p>+알파</p>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Services Section -->
		<!-- ======= Pricing Section ======= -->
	<section id="scroll-pricing" class="pricing ">
      <div class="container" data-aos="fade-up">

 		<div class="row mb-5">
          <div class="col-md-4 text-left border-primary">
            <h2 class="font-weight-light text-primary">가격 안내</h2>
            <p class="color-black-opacity-5">포인트제로 운영</p>
          </div>
       
     	
     	<div class="row">

          <div class="col-md-11">

            <div class="row mb-3 align-items-stretch">
              <div class="col-md-6 col-lg-4 mb-4 mb-lg-4">
                <div class="h-entry">
                  <a href="blog-single.html"><img src="/resources/images/img_1.jpg" alt="" class="img-fluid"></a>
                  <div class="h-entry-inner">
                    <h2 class="font-size-regular"><a href="blog-single.html">소형견<i class="icofont-dog-alt icofont-2x"></i></a></h2>
                     <ul>
		                <li><i class="bx bx-check"></i> 기본 이용시간 - 2시간 (1부제) </li>
		                <li><i class="bx bx-check"></i> 서비스 이용 후 펫시터 일지 작성 </li>
		                <li><i class="bx bx-check"></i> 서비스 이용 후 리뷰 </li>
		                <li><i class="bx bx-check"></i> 라이브 방송으로 확인 가능 </li>
		                <li class="na"><i class="bx bx-x"></i> <span> 당일예약 가능</span></li>
		              </ul>	
                  </div>
                </div> 
              </div>
              <div class="col-md-6 col-lg-4 mb-4 mb-lg-4">
                <div class="h-entry">
                  <a href="blog-single.html"><img src="/resources/images/img_2.jpg" alt="" class="img-fluid"></a>
                  <div class="h-entry-inner">
                    <h2 class="font-size-regular"><a href="blog-single.html">중형견<i class="icofont-dog-alt icofont-3x"></i></a></h2>
                     <ul>
		                <li><i class="bx bx-check"></i> 기본 이용시간 - 2시간 (1부제) </li>
		                <li><i class="bx bx-check"></i> 서비스 이용 후 펫시터 일지 작성 </li>
		                <li><i class="bx bx-check"></i> 서비스 이용 후 리뷰 </li>
		                <li><i class="bx bx-check"></i> 라이브 방송으로 확인 가능 </li>
		                <li class="na"><i class="bx bx-x"></i> <span> 당일예약 가능</span></li>
		              </ul>	
                  </div>
                </div> 
              </div>
              <div class="col-md-6 col-lg-4 mb-4 mb-lg-4">
                <div class="h-entry">
                  <a href="blog-single.html"><img src="/resources/images/img_3.jpg" alt="" class="img-fluid"></a>
                  <div class="h-entry-inner">
                    <h2 class="font-size-regular"><a href="blog-single.html">대형견<i class="icofont-dog-alt icofont-4x"></i></a></h2>
                     <ul>
		                <li><i class="bx bx-check"></i> 기본 이용시간 - 2시간 (1부제) </li>
		                <li><i class="bx bx-check"></i> 서비스 이용 후 펫시터 일지 작성 </li>
		                <li><i class="bx bx-check"></i> 서비스 이용 후 리뷰 </li>
		                <li><i class="bx bx-check"></i> 라이브 방송으로 확인 가능 </li>
		                <li class="na"><i class="bx bx-x"></i> <span> 당일예약 가능</span></li>
		              </ul>	
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        
          <div class="col-lg-4">
            <div class="box featured" data-aos="zoom-in" data-aos-delay="100">
              <h4>300<i class="icofont-coins icofont-0x"></i><span>+10point</span></h4>
              <ul>
                <li><i class="bx bx-check"></i> 기본 이용시간 - 2시간 (1부제) </li>
                <li><i class="bx bx-check"></i> 서비스 이용 후 펫시터 일지 작성 </li>
                <li><i class="bx bx-check"></i> 서비스 이용 후 리뷰 </li>
                <li><i class="bx bx-check"></i> 라이브 방송으로 확인 가능 </li>
                <li class="na"><i class="bx bx-x"></i> <span> 당일예약 가능</span></li>
              </ul>
              <a href="/point/payment?mem_point=30000" class="get-started-btn">충전하기</a>
            </div>
          </div>

          <div class="col-lg-4">
            <div class="box featured" data-aos="zoom-in" data-aos-delay="100">
              <h4>500<i class="icofont-coins"></i><span>+15point</span></h4>
              <ul>
                <li><i class="bx bx-check"></i> 기본 서비스</li>
                <li><i class="bx bx-check"></i> Nec feugiat nisl pretium</li>
                <li><i class="bx bx-check"></i> Nulla at volutpat diam uteera</li>
                <li><i class="bx bx-check"></i> Pharetra massa massa ultricies</li>
                <li><i class="bx bx-check"></i> Massa ultricies mi quis hendrerit</li>
              </ul>
              <a href="/point/payment?mem_point=50000" class="get-started-btn">충전하기</a>
            </div>
          </div>

          <div class="col-lg-4">
            <div class="box featured" data-aos="zoom-in" data-aos-delay="100">
              <h4>1000<i class="icofont-coins"></i><span>+20point</span></h4>
              <ul>
                <li><i class="bx bx-check"></i> 기본 서비스</li>
                <li><i class="bx bx-check"></i> Nec feugiat nisl pretium</li>
                <li><i class="bx bx-check"></i> Nulla at volutpat diam uteera</li>
                <li><i class="bx bx-check"></i> Pharetra massa massa ultricies</li>
                <li><i class="bx bx-check"></i> Massa ultricies mi quis hendrerit</li>
              </ul>
              <a href="/point/payment?mem_point=100000" class="get-started-btn">충전하기</a>
            </div>
		</div>	
      </div>
   </section><!-- End Pricing Section -->
	</div>


	<jsp:include page="/WEB-INF/views/petsitter_board/footer.jsp"/>
	</body>
</html>