<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="/resources/main/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="/resources/petsiter/css/tavo-calendar.css">
<link href="/resources/main/icofont/icofont.min.css" rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.0.5/css/boxicons.min.css'
	rel='stylesheet'>
<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="/resources/petsiter/js/tavo-calendar.js"></script>
</head>
<style>
#div_psb_contents {
	border: 1px solid grey;
	width: 100%;
	overflow-y: auto;
	float: left;
	word-wrap: break-word;
	word-break: break-all;
	padding: 5px;
}
.services input[type="checkbox"] {
	display: none;
	font-weight: bold;
}
.services input[type="checkbox"]:checked+label ,.resident_type_list input[type="radio"]:checked+label, .psb_petType input[type="checkbox"]:checked+label{
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

ul {
	padding-inline-start: 5px;
}

ul>li, input {
	style: none;
	display: inline-block;
	padding-right: 20px;
}

.comment-form-wrap {
	clear: both;
}

.comment_title {
	margin: 10px;
}

.star, .star1 {
	display: inline-block;
	width: 15px;
	height: 30px;
	cursor: pointer;
}

.star_left {
	background: url(/resources/images/star_off.png) no-repeat 0 0;
	background-size: 30px;
	margin-right: -2px;
}

.star1_left
{
	background: url(/resources/images/star_off.png) no-repeat 0 0;
	background-size: 30px;
}

.star_right {
	background: url(/resources/images/star_off.png) no-repeat -15px 0;
	background-size: 30px;
	margin-left: -2px;
}
.star1_right {
	background: url(/resources/images/star_off.png) no-repeat -15px 0;
	background-size: 30px;
}

.star.on , .star1.on {
	background-image: url(/resources/images/star_on.png);
}
</style>

<body>
	<jsp:include page="/WEB-INF/views/petsitter_board/header.jsp" />

	<script>
		$(function(){
			
			displayReview();
			
				var petType_list = "${tot_Info.psb_petType}";
	  			var petType_listarr = petType_list.split(",");
		  		$("input[name='psb_petType']").each(function(index,item){
		  			for(var i=0; i<petType_listarr.length;i++){
		  				if(petType_listarr[i] == $(item).val()){
			  				$(this).prop("checked",true);
			  				$("input[name='psb_petType']").prop('disabled',true);
		  				}
	  				}
	  			});
				
		  		$("input[name='ps_resident_type']").each(function(index,item){
		  			if('${tot_Info.ps_resident_type}' == $(item).val()){
		  				$(this).prop("checked",true);
		  				$("input[name='ps_resident_type']").prop('disabled',true);
		  			}
		  		});
		  		
		  		var service_list = "${tot_Info.psb_service}";
	  			var service_listarr = service_list.split(",");
		  		$("input[name='psb_service']").each(function(index,item){
		  			for(var i=0; i<service_listarr.length;i++){
		  				if(service_listarr[i] == $(item).val()){
			  				$(this).prop("checked",true);
			  				$("input[name='psb_service']").prop('disabled',true);
			  				}
		  				}
		  			});
		  		
		  		var time_list = "${tot_Info.psb_time}";
	  			var time_listarr = time_list.split(",");
		  		$("input[name='psb_time']").each(function(index,item){
		  			$(item).prop('checked',true);
		  			$("input[name='psb_time']").prop('disabled',true);
		  			for(var i=0;i<time_listarr.length;i++){
		  				if(time_listarr[i]!=$(item).val()){
		  					$(this).prop('checked',false);
		  				}
		  			}
		  		});
		  		
		  		 $(".star").on('click',function(){
		             var idx = $(this).index();
		             $(".star").removeClass("on");
		             var count = 0;
		             for(var i=0; i<=idx; i++){
		             	$(".star").eq(i).addClass("on");
		                	count+=0.5;
		             }
	                  console.log(count);
	                  $("#rw_star").val(count);
		             });
		  		 
		  		$("#tolist").on("click",function(){
					location.href="/board/outputList";
				});
				$("#delete").on("click",function(){
					location.href="/board/delete";
				});
				$("#update").on("click",function(){
					location.href="/board/update";
				});
				
			    $(".selectime").on("click",function(){
		            if($(this).prop("checked") == true && $("#am").prop("checked") == true){
		               $(".ba").prop("checked",false);
		               $("#full").prop("checked",false);
		            }
		            if($(this).prop("checked") == true && $("#pm").prop("checked") == true){
		               $(".ba").prop("checked",false);
		               $("#full").prop("checked",false);
		            }
		            if($(this).prop("checked") == true && $("#full").prop("checked") == true){
		               $(".ba").prop("checked",false);
		               $("#am").prop("checked",false);
		               $("#pm").prop("checked",false);
		            }   
		         })
			});
		
		//review 뿌려주는 함수
		function displayReview(){
			$.ajax({
				url:"/review/selectReviewList?psb_seq=${tot_Info.psb_seq}",
				type:"POST",
				success:function(data){

					$(".comment-list").on("click","#delete_review",function(){
						var result = confirm("리뷰를 삭제하시겠습니까?");
						if(result){
							//삭제로직
							$(this).parent().parent().remove();

							$.ajax({
								url:"/review/deleteProc?rw_seq=17&rw_parent_seq=${tot_Info.psb_seq}",
								type:"POST",
								success:function(data){
									
								}
							});
							displayReview();
						}
					});
					
					
					var str = "";
					$.each(data, function(key, val) {
						
					   	str += '<li class="comment">';
					   	str += '<div class="vcard bio">';
					   	str += '<i class="icofont-comment"></i>';
					   	str += '</div>';
					   	str += '<div class="comment-body">';
					   	str +='<h7>'+val.rw_writer+'</h7>';
					   	str +='<div class="meta"></div>';
					   	str +='<div>';
					   	str += '<span class="'+val.rw_seq+'_star star1 star1_left on"></span>';
					   	str += '<span class="'+val.rw_seq+'_star star1 star1_right on"></span>';
					   	str += '<span class="'+val.rw_seq+'_star star1 star1_left on"></span>';
					   	str += '<span class="'+val.rw_seq+'_star star1 star1_right on"></span>';
					   	str += '<span class="'+val.rw_seq+'_star star1 star1_left on"></span>';
					   	str += '<span class="'+val.rw_seq+'_star star1 star1_right on"></span>';
					   	str += '<span class="'+val.rw_seq+'_star star1 star1_left"></span>';
					   	str += '<span class="'+val.rw_seq+'_star star1 star1_right"></span>';
					   	str += '<span class="'+val.rw_seq+'_star star1 star1_left"></span>';
					   	str += '<span class="'+val.rw_seq+'_star star1 star1_right"></span>';
					   	str += '</div>';
					   	str += '<script>';
					   	str += '$(function(){';
						str +='var idx='+val.rw_star+';';
						str +='for(var i=0; i<idx*2; i++){';
						str +='$(".'+val.rw_seq+'_star").eq(i).addClass("on");';
						str += '}';
						str += '})';
					    str += '<\/script>';
	                    str += '<p>'+val.rw_contents+'</p>';
	                    str += '<button id="delete_review" >삭제</button>';
	                    str += '<button id="modify_review" >수정</button>';
	                  	str += '</div>';
	                	str += '</li>';
	                	$(".comment-list").html(str);
					  });
                	$("#reviewCounts").html(data.length+" Comments");
				},
				error:function(){
					alert("insertProc err");
				}
			});
		}
    </script>
		


	<div class="site-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-11">
					<p class="mb-4">
						<img src="/upload/${tot_Info.psb_thumb}" style="height: 300px; border-radius: 50%; class="img-fluid rounded">
					</p>
				</div>

				<div class="col-lg-7">
					<div class="mb-3">
						<h2>${tot_Info.psb_title}</h2>
					</div>
				
					<div class="d-block d-md-flex listing-horizontal">
				<div class="lh-content">
					<div class="mb-3">
						<h4 class="mb-3">PETSITTER INFORMATION</h4>
								<div class="mb-3">
									<ul>
										<li>아이디</li>
										<li>${tot_Info.psb_writer}</li>
									</ul>
									<ul>
										<li>나이</li>
										<li>${tot_Info.ps_age}</li>
									</ul>
									<ul>
										<li>성별</li>
										<c:if test="${tot_Info.ps_gender eq 'M'}"><li>남자<i class="icofont-male icofont-1x"></i></li></c:if>
										<c:if test="${tot_Info.ps_gender eq 'F'}"><li>여자<i class="icofont-female icofont-1x"></i></li></c:if>
									</ul>
									<ul>
										<li>주소</li>
										<li>${tot_Info.ps_address1}</li>
									</ul>
									<ul>
										<li><div id="map" style="width: 550px; height: 300px;"></div></li>
									</ul>
									<ul>
										<li>펫시터가 전하는 말</li>
										<li>${tot_Info.psb_contents}</li>
									</ul>
									
								</div>
								
								<hr class="mb-4">
								
								<h5 class="mb-3">가능한 강아지 타입</h5>
								<div class="psb_petType">
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
							</div>
						</div>
					</div>
				
			<div class="pt-5">
              <h3 class="mb-5" id ="reviewCounts"></h3>
              <ul class="comment-list">
                 <!-- 리뷰 동적으로 생성되는 공간 -->   
              </ul>
              
              <div class="comment-form-wrap pt-5">
                <h7 class="mb-5">리뷰남기기</h7>
                  <div class="form-group">
	                    <label for="rw_star">Score</label>
	                    <div>
					      <span class="star star_left"></span>
					      <span class="star star_right"></span>
					      <span class="star star_left"></span>
					      <span class="star star_right"></span>
					      <span class="star star_left"></span>
					      <span class="star star_right"></span>
					     <span class="star star_left"></span>
					     <span class="star star_right"></span>
					     <span class="star star_left"></span>
					     <span class="star star_right"></span>
	                  </div>
	                  <input type="hidden" id="rw_star" name="rw_star" value="">
                 </div>
                 
                  <div class="form-group">
                    <label for="rw_contents">Review</label>
                    <textarea id="rw_contents" cols="30" rows="5" class="form-control"></textarea>
                  </div>
                  
                  <div class="form-group">
                    <input type="button" id="submit" value="Post Comment" class="btn btn-primary text-white btn-md">
                    <script>
                    	$(function(){
                    		$("#submit").on("click",function(){
                    			var form ={
                    					rw_contents:$("#rw_contents").val(),
                    					rw_writer: "${ sessionScope.loginInfo.mem_id}",
                    					rw_star:$("#rw_star").val(),
                    					rw_petsitter_id:"${tot_Info.psb_writer}",
                    					rw_parent_seq: "${tot_Info.psb_seq}"
                    			}
                    			$.ajax({
                    				url:"/review/insertProc",
                    				type:"POST",
                    				data:form,
                    				success:function(data){
                    					$(".star").removeClass("on");
                            			$("#rw_contents").val("");
                            			$("#contents").val("");
                            			alert("댓글이 등록되었습니다.");
                            			displayReview();
                    				},
                    				error:function(){
                    					alert("insertProc err");
                    				}
                    			});
                    			
                    		});
                    		
                    		
                    		
                    		
                    		
                    	})
                    </script>
                  </div>
              </div>
            </div>
				
				</div>
				
				<div class="col-lg-4 ml-4">
					<h3 class="h5 text-black mb-3 " style="text-align: center">
						날짜 선택<i class="icofont-calendar"></i>
					</h3>
					<div class="reserve_calendar">
						<div id="my-calendar"></div>
						<div class="select_date">
							<ul class="head_date" style="text-align: center">
								<li style="width: 150px;"><b>시작일</b></li>
								<li style="width: 150px;"><b>종료일</b></li>
							</ul>
							<ul class="head_date" style="text-align: center">
								<li><input type="text" id="start_day" name="psb_start_day" value=""
									style="width: 150px; text-align: center;" placeholder="시작일"></li>
								<li><input type="text" id="end_day" name="psb_end_day"
									value="" style="width: 150px; text-align: center;" placeholder="종료일"></li>
							</ul>
						</div>
					</div>

					<hr class="mb-4">

					<h3 class="h5 text-black mb-3 " style="text-align: center">
						시간 선택<i class="icofont-clock-time"></i>
					</h3>
					<div id="timelist" style="text-align: center">
						<div>
							<input type="checkbox" name="psb_time" value="first" id="first">
							<label for="first">&nbsp;&nbsp;1부 09:00 ~ 11:00</label>
						</div>
						<div>
							<input type="checkbox" name="psb_time" value="second"
								id="second"> <label for="second">&nbsp;&nbsp;2부
								11:00 ~ 13:00</label>
						</div>
						<div>
							<input type="checkbox" name="psb_time" value="third" id="third">
							<label for="third">&nbsp;&nbsp;3부 13:00 ~ 15:00</label>
						</div>
						<div>
							<input type="checkbox" name="psb_time" value="fourth"
								id="fourth"> <label for="fourth">&nbsp;&nbsp;4부
								15:00 ~ 17:00</label>
						</div>
						<div>
							<input type="checkbox" name="psb_time" value="fifth" id="fifth">
							<label for="fifth">&nbsp;&nbsp;5부 17:00 ~ 19:00</label>
						</div>
						<div>
							<input type="checkbox" name="psb_time" value="sixth" id="sixth">
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

					
					<div class="mb-5">
						<c:choose>
							<c:when test="${sessionScope.loginInfo.mem_id == tot_Info.psb_writer}">
								<button id="update" class="btn btn-primary text-#878786 btn-md px-5 font-weight-bold btn-md-block">수정하기</button>
								<button id="delete" class="btn btn-primary text-#878786 btn-md px-5 font-weight-bold btn-md-block">삭제하기</button>
								<button id="tolist" class="btn btn-primary text-#878786 btn-md px-5 font-weight-bold btn-md-block">목록으로</button>
							</c:when>
							<c:otherwise>
								<button id="tolist" class="btn btn-primary text-#878786 btn-md px-5 font-weight-bold btn-md-block">목록으로</button>
								<button class="btn btn-primary text-#878786 btn-md px-5 font-weight-bold btn-md-block" type="submit">등록하기</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	
			<jsp:include page="/WEB-INF/views/petsitter_board/footer.jsp" />
			<script>
			 $(function() {
        	var days = [];
        	var ps_start_day = ${tot_Info.psb_start_day};
            var ps_end_day = ${tot_Info.psb_end_day};
            var ps_start = moment(ps_start_day);
            var ps_end = moment(ps_end_day);
            var duration = moment.duration(ps_end.diff(ps_start)).asDays();
			
            console.log(duration);
            days.push(ps_start_day);
            for(var i=0; i<duration;i++){
            	ps_start_day=ps_start.add(1,'day').toDate();
            	ps_start_day=moment(ps_start_day).format("YYYY-MM-DD");
                days.push(ps_start_day);
            }
				console.log(days);
				
				//휴무일 선택된 예약달력
				var today = new Date();
				var my_calendar = new TavoCalendar('#my-calendar', {
			            date: moment().format("YYYY-MM-DD"),
			            date_start: "",
			            date_end: "",
			            format: "YYYY-MM-DD",
			            range_select:true,
			            blacklist:days
			        });
				
	            $("#my-calendar").on("calendar-range", function() {
	            	var range = my_calendar.getRange();
	                start_day = range.start;
	                end_day = range.end;
	                $("#start_day").val(start_day);
	                $("#end_day").val(end_day);
	            });
	        })
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
		geocoder.addressSearch('${tot_Info.ps_address1}', function(result, status) {

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