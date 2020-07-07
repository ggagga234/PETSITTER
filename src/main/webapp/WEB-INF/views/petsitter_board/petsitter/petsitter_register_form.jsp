<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html lang="en">
  <head>
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <style>
  	#div_ps_myself {
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
		text-align:center;
	}
		.filebox input[type="file"], .filebox input[type="button"] {
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
		color: #999;
		font-size: inherit;
		line-height: normal;
		vertical-align: middle;
		background-color: #fdfdfd;
		cursor: pointer;
		border: 1px solid #ebebeb;
		border-bottom-color: #e2e2e2;
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
	.btn{
		margin:auto;
		text-align:center;
	}
	#submit_btn, #reset_btn{
		width:300px;
		border-radius:10px;
		text-align:center;
	}
	</style>
	<script>
		function sample4_execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		     
		            var roadAddr = data.roadAddress; // 도로명 주소 변수
		            var extraRoadAddr = ''; // 참고 항목 변수
		
		            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                extraRoadAddr += data.bname;
		            }
		            if(data.buildingName !== '' && data.apartment === 'Y'){
		               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		            }
		            if(extraRoadAddr !== ''){
		                extraRoadAddr = ' (' + extraRoadAddr + ')';
		            }
		
		            document.getElementById('sample4_postcode').value = data.zonecode;
		            document.getElementById("sample4_roadAddress").value = roadAddr;
		                     }
		    }).open();
		};
	
	
		$(function(){
			 var fileTarget = $('.filebox .upload-hidden'); 
			  fileTarget.on('change', function(){ 
			  if(window.FileReader){
				  var filename = $(this)[0].files[0].name; 
				  } else { 
					var filename = $(this).val().split('/').pop().split('\\').pop(); 
				  } $(this).siblings('.upload-name').val(filename); 
				 }); 
			  	
			  $("#ps_img").on('change', function(){
		          readURL(this);
		      });
			  $("#ps_img").on('change', function(){
		          readURL(this);
		      });
			  
			$("#register_frm").bind('submit',function(){
				
				if($("input[name='ps_gender']:checked").val()==null){
					alert("성별을 선택해주세요.");
					$('input[name="ps_gender"]').focus();
					return false;
				}
				if($("input[name='ps_resident_type']:checked").val()==null){
					alert("거주지 유형 할목을 선택해주세요.");
					$('input[name="ps_resident_type"]').focus();
					return false;
				}
				if($("input[name='ps_service']:checked").val()==null){
					alert("서비스 항목을 선택해주세요.");
					$('input[name="ps_service"]').focus();
					return false;
				}
				if($("input[name='ps_drive']:checked").val()==null){
					alert("운전면허 유무를 선택해주세요.");
					$('input[name="ps_drive"]').focus();
					return false;
				}
				if($("input[name='ps_license']:checked").val()==null){
					alert("자격증 유무를 선택해주세요.");
					$('input[name="ps_license"]').focus();
					return false;
				} 
				if($("input[name='ps_license']:checked").val()=='Y' && $("#license_img").val() == "파일선택"){
						alert("자격증 이미지 파일을 첨부해주세요.");
						return false;
				}
			});
		})
	</script>
  </head>
  <body>
	<jsp:include page="/WEB-INF/views/petsitter_board/header.jsp"/>

	    <div class="site-section">
	      <div class="container">
				<form action="/petsitter/insertProc" enctype="multipart/form-data" method="post" id="register_frm">
					<div class="row">
						<div class="col-lg-11">
							<div class="d-block d-md-flex listing-horizontal">
								<div class="lh-content">
								<h2 class="mb-3"> 펫시터 지원서 </h2>
								<div class="mb-3">
									<label for="ps_id">아이디</label>
									<input type="text" class="form-control" id="ps_id" name="ps_id" placeholder="아이디를 입력해주세요" value=${sessionScope.loginInfo.mem_id } readonly required>
									<span id="idcheck"></span>
								</div>
								<div class="mb-3">
									<label for="ps_img">프로필 사진</label>
									<div class="filebox">
										<input class="upload-name" value="파일선택" disabled="disabled" required>
										<label for="ps_img">찾아보기</label>
										<input type="file" id="ps_img" class="upload-hidden form-control"
											name="files" value="" required>
									</div>
								</div>
								<div class="mb-3">
									<label for="ps_age">나 이</label>
									<input type="text" class="form-control" id="ps_age" name="ps_age" placeholder="만 나이" required>
								</div>
								<div class="mb-3">
									<label for="ps_gender_F">성 별</label>
									<div>
										<ul>
											<li><input type="radio" name=ps_gender id="ps_gender_F" value="F">
											<label for="ps_gender_F">&nbsp;남자</label></li>
											<li><input type="radio" name=ps_gender id="ps_gender_M" value="M">
											<label for="ps_gender_M">&nbsp;여자</label></li>
										</ul>
									</div>
								</div>
								<div class="mb-3">
									<label for="sample4_postcode">우편번호</label>
									<div class="filebox">
									<input type="text" id="sample4_postcode" class="upload-name" required readonly>
									<label for="ps_zipcode">찾기</label>
									<input type="button" id="ps_zipcode" onclick="sample4_execDaumPostcode()">
								</div>
								<div class="mb-3">
									<label for="sample4_roadAddress">주 소</label>
									<input type="text" class="form-control" id="sample4_roadAddress" name="ps_address1" readonly>
								</div>
								<div class="mb-3">
									<label for="ps_address2">상세주소</label>
									<input type="text" class="form-control" id="ps_address2" name="ps_address2" required>
								</div>
								<div class="mb-3">
									<label for="">거주 유형</label>
									<div class="resident_type_list">
										<ul>
											<li><input type="radio" id="resident_type1" name="ps_resident_type" value=단독주택 />
											<label for="resident_type1"><span></span>단독주택</label></li>
											<li><input type="radio" id="resident_type2" name="ps_resident_type" value=아파트 />
											<label for="resident_type2"><span></span>아파트</label></li>
											<li><input type="radio" id="resident_type3" name="ps_resident_type" value=빌라 />
											<label for="resident_type3"><span></span>빌라</label></li>
											<li><input type="radio" id="resident_type4" name="ps_resident_type" value=원룸 />
											<label for="resident_type4">원룸</label></li>
											<li><input type="radio" id="resident_type5" name="ps_resident_type" value=오피스텔 />
											<label for="resident_type5">오피스텔</label></li>
										</ul>
									</div>
								</div>
								<div class="mb-3">
									<label for="">서비스</label>
									<div class="service_list">
										<div>
											<span class="services" >
												<input type="checkbox" name="ps_service" id="service1" value=service1 />
												<label for="service1" style="display:block">
												<i class="icofont-tasks-alt"></i>장기예약 </label>
											</span>
											<span class="services">
												<input type="checkbox" name="ps_service" id="service2" value=service2 />
												<label for="service2" style="display:block"> 
												<i class="icofont-pills"></i>약물 복용</label>
											</span>
											<span class="services">
												<input type="checkbox" name="ps_service" id="service3" value=service3 />
												<label for="service3" style="display:block">
												<i class='bx bx-bone'></i>실내 놀이</label>
											</span>
										</div>

										<div>
											<span class="services">
												<input type="checkbox" name="ps_service" id="service4" value=service4 />
												<label for="service4" style="display:block">
												<i class="icofont-bathtub"></i>목욕 가능</label>
											</span> 
											<span class="services"> 
												<input type="checkbox" name="ps_service" id="service5" value=service5 /> 
												<label for="service5" style="display:block">
												<i class="icofont-first-aid"></i>응급 처치</label>
											</span> 
											<span class="services"> 
												<input type="checkbox" name="ps_service" id="service6" value=service6 /> 
												<label for="service6" style="display:block">
												<i class='bx bx-walk'></i>야외 산책</label>
											</span>
										</div>
										<div>
											<span class="services">
												<input type="checkbox" name="ps_service" id="service7" value=service7 />
												<label for="service7" style="display:block">
												<i class="icofont-tasks-alt"></i>발톱 관리</label>
											</span>
											<span class="services">
												<input type="checkbox" name="ps_service" id="service8" value=service8 />
												<label for="service8" style="display:block">
												<i class="icofont-ui-cut"></i>모발 관리</label>
											</span>
											<span class="services">
												<input type="checkbox" name="ps_service" id="service9" value=service9 />
												<label for="service9" style="display:block">
												<i class="icofont-car-alt-3"></i>집앞 픽업</label>
											</span>
										</div>
									</div>
								</div>
			
								<div class="mb-3">
									<label for="ps_drive_Y">운전 유무</label>
										<div>
											<ul>
												<li><input type="radio" name="ps_drive" id="ps_drive_Y" value="Y">
												<label for="ps_drive_Y">&nbsp;YES</label></li>
												<li><input type="radio" name="ps_drive" id="ps_drive_N" value="N">
												<label for="ps_drive_N">&nbsp;NO</label></li>
											</ul>
										</div>
								</div>
								
								<div class="mb-3">
									<label for="ps_license_Y">자격증 유무</label>
										<div>
											<ul>
												<li><input type="radio" name="ps_license" id="ps_license_Y" value="Y">
												<label for="ps_license_Y">&nbsp;YES</label></li>
												<li><input type="radio" name="ps_license" id="ps_license_N" value="N">
												<label for="ps_license_N">&nbsp;NO</label></li>
											</ul>
										</div>
								</div>
								<div class="mb-3">
									<label for="ps_img">자격증 이미지 첨부</label>
									<div class="filebox">
										<input id="license_img" class="upload-name" value="파일선택" disabled="disabled" required>
										<label for="ps_license_img">찾아보기</label>
										<input type="file" id="ps_license_img" class="upload-hidden form-control"
											name="files" value="">
									</div>
								</div>
								<div class="mb-3">
									<label for="div_ps_myself">내 소개글</label>
									<div id="div_ps_myself" style='border: solid; width: 800px; min-height:100px; margin:10px 10px;' contentEditable="true" > </div>
									<input id="ps_myself" type="hidden" name="ps_myself" required>
										 <script>
											$(function() {
												$("#div_ps_myself").on("keyup", function() {
													$("#ps_myself").val($(this).html());
												});
											})
										</script>
								</div>

								<div class="btn">
									<input type="submit" id="submit_btn" class="btn text-white btn-primary" value="지원하기">
									<input type="reset" id="reset_btn" class="btn text-white btn-primary" value="다시 작성하기">
								</div>
							</div>
					</div>
					</div>
					</div>
					</div>
				</form>
				</div>
			</div>


	<jsp:include page="/WEB-INF/views/petsitter_board/footer.jsp"/>
	</body>
</html>