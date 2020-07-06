<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

<link rel="stylesheet"
	href="/resources/main/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="/resources/petsiter/css/tavo-calendar.css">
<link href="/resources/mb/icofont/icofont.min.css" rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.0.5/css/boxicons.min.css'rel='stylesheet'>
<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="/resources/petsiter/js/tavo-calendar.js"></script>
</head>
<style>
#div_psb_contents {
	border: 1px solid grey;
	width: 100%;
	overflow-y: auto;
	word-wrap: break-word;
	word-break: break-all;
	padding: 5px;
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
	font-weight: bold;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #01a9b4;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #01a9b4;
	border-bottom-color: #01a9b4;
	border-radius: .25em;
} /* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em; /* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}
ul{
    padding-inline-start: 5px;
}
ul>li,input{
	style:none;
	display:inline-block;
	padding-right:20px;
}
</style>
<script>
  $(document).ready(function(){ 
	  var fileTarget = $('.filebox .upload-hidden'); 
	  fileTarget.on('change', function(){ 
	  if(window.FileReader){
		  var filename = $(this)[0].files[0].name; 
		  } else { 
			var filename = $(this).val().split('/').pop().split('\\').pop(); 
		  } $(this).siblings('.upload-name').val(filename); 
		 }); 
	  	
	  $("#psb_thumb").on('change', function(){
          readURL(this);
      });
	  
	  $("input[name='psb_time']").on("click",function(){
          if($(this).prop("checked") == true && $("#am").prop("checked") == true){
             $(".basic").prop("checked",false);
             $("#full").prop("checked",false);
          }
          if($(this).prop("checked") == true && $("#pm").prop("checked") == true){
             $(".basic").prop("checked",false);
             $("#full").prop("checked",false);
          }
          if($(this).prop("checked") == true && $("#full").prop("checked") == true){
             $(".basic").prop("checked",false);
             $("#am").prop("checked",false);
             $("#pm").prop("checked",false);
          }   
       })
  });
	  function readURL(input) {
	      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	
	      reader.onload = function (e) {
	              $('#blah').attr('src', e.target.result);
	          }
	        reader.readAsDataURL(input.files);
	      }
	  }
  </script>
<body>
	<jsp:include page="/WEB-INF/views/petsitter_board/header.jsp" />
	
	 <script>
		$(function(){
		  		$("input[name='ps_gender']").each(function(index,item){
		  			if('${petsitter_Info.ps_gender}' == $(item).val()){
		  				$(this).prop('checked',true);
		  				$("input[name='ps_gender']").prop('disabled',true);
					}
		  		});
		  		
		  		$("input[name='ps_resident_type']").each(function(index,item){
		  			if('${petsitter_Info.ps_resident_type}' == $(item).val()){
		  				$(this).prop("checked",true);
		  				$("input[name='ps_resident_type']").prop('disabled',true);
		  				}
		  		});
  		
		  		var list = "${petsitter_Info.ps_service}";
	  			var listarr = list.split(",");
	  			console.log(listarr[0]);
		  		console.log(listarr[1]);
		  		$("input[name='psb_service']").each(function(index,item){
		  			for(var i=0; i<listarr.length;i++){
		  				if(listarr[i] == $(item).val()){
			  				$(this).prop("checked",true);
			  				}
		  				}
		  			});
		  		
		});
  		</script>	
	
	<div class="site-section">
		<div class="container">
			<form action="/board/insertProc" enctype="multipart/form-data" method="post">
				<div class="row">
					<div class="col-lg-7">
						<div class="d-block d-md-flex listing-horizontal">
							<div class="lh-content">
								<h5 class="mb-3">글 등록</h5>
								<div class="mb-3">
									<label for="psb_title">제목</label>
									<input type="text" class="form-control" id="psb_title" name="psb_title" placeholder="제목을 입력해주세요." required>
								</div>
								<div class="mb-3">
									<label for="psb_thumb">썸네일</label>
									<div class="filebox">
										<input class="upload-name" value="파일선택" disabled="disabled" required>
										<label for="psb_thumb">찾아보기</label>
										<input type="file" id="psb_thumb" class="upload-hidden form-control"
											name="file" value="" required>
									</div>
								</div>

								<hr class="mb-4">

								<h5 class="mb-3">내 정보</h5>
								<div class="mb-3">
									<label for="psb_writer">아이디</label>
									<input type="text" class="form-control" id="psb_writer" name="psb_writer" value="${petsitter_Info.ps_id}" readonly>
								</div>
								<div class="mb-3">
									<label for="ps_age">나이</label>
									<input type="text" class="form-control" id="ps_age" name="ps_age" id="ps_age" value="${petsitter_Info.ps_age}" readonly>
								</div>
								<div class="mb-3">
									<label for="ps_gender_F">성별</label>
									<div>
										<ul>
											<li><input type="radio" name=ps_gender id="ps_gender_F" value="F">&nbsp;남자</li>
											<li><input type="radio" name=ps_gender id="ps_gender_M" value="M">&nbsp;여자</li>
										</ul>
									</div>
								</div>
								<div class="mb-3">
									<label for="ps_address1">주소</label> <input type="text"
										class="form-control" id="ps_address1" name="ps_address1"
										value="${petsitter_Info.ps_address1}" readonly>
								</div>
								<div class="mb-3">
									<label for="psb_petType">가능한 강아지 타입</label>
									<div>
										<ul>
										 	<li><input type="checkbox" name="psb_petType" value="소" id="소형견">
										 	<label for="소형견">&nbsp;&nbsp;소형견</label></li>
										 	<li><input type="checkbox" name="psb_petType" value="중" id="중형견">
										 	<label for="중형견">&nbsp;&nbsp;중형견</label></li>
										 	<li><input type="checkbox" name="psb_petType" value="대" id="대형견">
										 	<label for="대형견">&nbsp;&nbsp;대형견</label></li>
										</ul>
									</div>
								</div>

								<hr class="mb-4">

								<h5 class="mb-3">거주 유형</h5>
								<div class="resident_type_list">
										<ul>
											<li><input type="radio" id="resident_type1" name="ps_resident_type" value=단독주택 required/>
											<label for="resident_type1"><span></span>단독주택</label></li>
											<li><input type="radio" id="resident_type2" name="ps_resident_type" value=아파트 required/>
											<label for="resident_type2"><span></span>아파트</label></li>
											<li><input type="radio" id="resident_type3" name="ps_resident_type" value=빌라 required/>
											<label for="resident_type3"><span></span>빌라</label></li>
											<li><input type="radio" id="resident_type4" name="ps_resident_type" value=원룸 required/>
											<label for="resident_type4">원룸</label></li>
											<li><input type="radio" id="resident_type5" name="ps_resident_type" value=오피스텔 required/>
											<label for="resident_type5">오피스텔</label></li>
										</ul>
								</div>

								<hr class="mb-4">

								<h5 class="mb-3">서비스</h5>
								<div class="d-block my-3">
									<div class="service_list" style="text-align:center">
										<div>
											<span class="services">
												<input type="checkbox" name="psb_service" id="service1" value=service1 />
												<label for="service1" style="display:block">
												<i class="icofont-tasks-alt"></i>장기예약 </label>
											</span>
											<span class="services">
												<input type="checkbox" name="psb_service" id="service2" value=service2 />
												<label for="service2" style="display:block"> 
												<i class="icofont-pills"></i>약물 복용</label>
											</span>
											<span class="services">
												<input type="checkbox" name="psb_service" id="service3" value=service3 />
												<label for="service3" style="display:block">
												<i class='bx bx-bone'></i>실내 놀이</label>
											</span>
										</div>

										<div>
											<span class="services">
												<input type="checkbox" name="psb_service" id="service4" value=service4 />
												<label for="service4" style="display:block">
												<i class="icofont-bathtub"></i>목욕 가능</label>
											</span> 
											<span class="services"> 
												<input type="checkbox" name="psb_service" id="service5" value=service5 /> 
												<label for="service5" style="display:block">
												<i class="icofont-first-aid"></i>응급 처치</label>
											</span> 
											<span class="services"> 
												<input type="checkbox" name="psb_service" id="service6" value=service6 /> 
												<label for="service6" style="display:block">
												<i class='bx bx-walk'></i>야외 산책</label>
											</span>
										</div>
										<div>
											<span class="services">
												<input type="checkbox" name="psb_service" id="service7" value=service7 />
												<label for="service7" style="display:block">
												<i class="icofont-tasks-alt"></i>발톱 관리</label>
											</span>
											<span class="services">
												<input type="checkbox" name="psb_service" id="service8" value=service8 />
												<label for="service8" style="display:block">
												<i class="icofont-ui-cut"></i>모발 관리</label>
											</span>
											<span class="services">
												<input type="checkbox" name="psb_service" id="service9" value=service9 />
												<label for="service9" style="display:block">
												<i class="icofont-car-alt-3"></i>집앞 픽업</label>
											</span>
										</div>
									</div>
								</div>

								<hr class="mb-4">
								<h5 class="mb-3">전하고 싶은 말</h5>
								<div class="d-block my-3">
									<div id="div_psb_contents" contentEditable="true"></div>
									<input id="psb_contents" type="hidden" name="psb_contents">
									<script>
										$(function() {
											$("#div_psb_contents").on("keyup", function() {
												$("#psb_contents").val($(this).html());
											});
										})
									</script>
								</div>
							</div>
						</div>
					</div>



					<div class="col-lg-4 ml-4">
					<div class='mb-5' style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; 
						box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding: 38px 10px; margin-top: 10px;">
						<h3 class="h5 text-black mb-3 " style="text-align: center">
								휴무일 선택<i class="icofont-calendar"></i>
							</h3>
							<div class="reserve_calendar">
								<div id="my-calendar"></div>
								<div class="select_date">
								<ul class="head_date" style="text-align:center">
									<li style="width:150px;"><b>시작일</b></li>
									<li style="width:150px;"><b>종료일</b></li>
								</ul>
								<ul class="head_date" style="text-align:center">
									<li><input type="text" id="start_day" name="psb_start_day" placeholder="시작일" style="width:150px; text-align:center;"></li>
									<li><input type="text" id="end_day" name="psb_end_day" placeholder="종료일" style="width:150px; text-align:center;"></li>
								</ul>
								
								</div>
							</div>

							<hr class="mb-4">

							<h3 class="h5 text-black mb-3 " style="text-align: center">
								돌봄 가능한시간 선택<i class="icofont-clock-time"></i>
							</h3>
							<div id="timelist" style="text-align: center">
								<div>
									<input type="checkbox" name="psb_time" value="first" id="first" class="basic">
										<label for="first">&nbsp;&nbsp;1부 09:00 ~ 11:00</label>
								</div>
								<div>
									<input type="checkbox" name="psb_time" value="second" id="second" class="basic">
										<label for="second">&nbsp;&nbsp;2부 11:00 ~ 13:00</label>
								</div>
								<div>
									<input type="checkbox" name="psb_time" value="third" id="third" class="basic">
										<label for="third">&nbsp;&nbsp;3부 13:00 ~ 15:00</label>
								</div>
								<div>
									<input type="checkbox" name="psb_time" value="fourth"id="fourth" class="basic">
									<label for="fourth">&nbsp;&nbsp;4부 15:00 ~ 17:00</label>
								</div>
								<div>
									<input type="checkbox" name="psb_time" value="fifth" id="fifth" class="basic">
										<label for="fifth">&nbsp;&nbsp;5부 17:00 ~ 19:00</label>
								</div>
								<div>
									<input type="checkbox" name="psb_time" value="sixth" id="sixth" class="basic">
										<label for="sixth">&nbsp;&nbsp;6부 19:00 ~ 21:00</label>
								</div>
								<div>
									<input type="checkbox" name="psb_time" value="am" id="am">
									<label for="am">&nbsp;&nbsp;오전 09:00 ~ 14:00</label>
								</div>
								<div>
									<input type="checkbox" name="psb_time" value="pm" id="pm">
									<label for="pm">&nbsp;&nbsp;오후 14:00 ~ 21:00</label>
								</div>
								<div>
									<input type="checkbox" name="psb_time" value="full" id="full">
									<label for="full">&nbsp;&nbsp;풀타임 09:00 ~ 20:00</label>
								</div>
							</div>
							
							<hr class="mb-4">

							<h3 class="h5 text-black mb-3 " style="text-align: center">
								가격 안내<i class="icofont-money"></i>
							</h3>
							<div id="pricing" style="text-align: center">
							
							<div data-brackets-id='33'
                              style="width: 100%; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding: 15px 15px; margin-top: 38px; margin-bottom: 38px">
                              <div data-brackets-id='34'
                                 style="display: flex; flex-direction: row; align-items: center; justify-content: space-between">
                                 <p data-brackets-id='35'
                                    style="font-size: 17px; font-weight: 600; letter-spacing: -0.2px; line-height: 25px; color: #81DAD6">이용 요금</p>
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
                                    <i class="icofont-dog-alt icofont-2x"></i>
                                    <p data-brackets-id='46'
                                       style="font-size: 15px; line-height: 19px; color: #81DAD6; margin-left: 10px">소</p>
                                    <p data-brackets-id='47'
                                       style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 12px">7키로 미만</p>
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
                                    <i class="icofont-dog-alt icofont-3x"></i>
                                    <p data-brackets-id='56'
                                       style="font-size: 15px; line-height: 19px; color: #81DAD6; margin-left: 10px">중</p>
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
                                    <i class="icofont-dog-alt icofont-4x"></i>
                                    <p data-brackets-id='66'
                                       style="font-size: 15px; line-height: 19px; color: #81DAD6; margin-left: 10px">대</p>
                                    <p data-brackets-id='67'
                                       style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 12px">15키로  이상</p>
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
							
							<hr class="mb-4">
							<h3 class="h5 text-black mb-3" style="text-align: center">
								나의 위치<i class="icofont-location-pin"></i>
							</h3>
							<div id="map" style="width: 350px; height: 350px;"></div>
						</div>

						
						<div class="mb-5" >
							<button
								class="btn btn-primary text-#878786 btn-md px-5 font-weight-bold btn-md-block"
								type="submit">등록하기</button>
						</div>
					</div>
				</div>
				</row>
			</form>
		</div>
	</div>


	<jsp:include page="/WEB-INF/views/petsitter_board/footer.jsp" />
	<script>
	var today = new Date();
	var my_calendar = new TavoCalendar('#my-calendar', {
	            date: moment().format("YYYY-MM-DD"),
	            date_start: "",
	            date_end: "",
	            format: "YYYY-MM-DD",
	            range_select: true
	        });
	
	 $("#my-calendar").on("calendar-range", function() {
     	var range = my_calendar.getRange();
         start_day = range.start;
         end_day = range.end;
         $("#start_day").val(start_day);
         $("#end_day").val(end_day);
        
     });

	       

	</script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=673fb72de94724a273da597b59cd588d&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		};// 지도의 확대 레벨

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('경기도 성남시 분당구 판교로430', function(result, status) {

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
</body>
</html>