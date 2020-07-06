<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html lang="en">
  <head>

  </head>
  <body>
	<jsp:include page="/WEB-INF/views/petsitter_board/header.jsp"/>
	 <script>
		$(function(){
		  		$("input[name='ps_gender']").each(function(index,item){
		  			if('${petsitterInfo.ps_gender}' == $(item).val()){
		  				$(this).prop("checked",true);
					}
		  		});
		  		
		  		$("input[name='ps_resident_type']").each(function(index,item){
		  			if('${petsitterInfo.ps_resident_type}' == $(item).val()){
		  				$(this).prop("checked",true);
		  				}
		  		});
		  		
		  		$("input[name='ps_drive']").each(function(index,item){
		  			if('${petsitterInfo.ps_drive}' == $(item).val()){
		  				$(this).prop("checked",true);
		  				}
		  		});
		  		
		  		$("input[name='ps_license']").each(function(index,item){
		  			if('${petsitterInfo.ps_license}' == $(item).val()){
		  				$(this).prop("checked",true);
		  				}
		  		});
		  		
		  		var list = "${petsitterInfo.ps_service}";
	  			var listarr = list.split(",");
	  			console.log(listarr[0]);
		  		console.log(listarr[1]);
		  		$("input[name='ps_service']").each(function(index,item){
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
				<div class="row align-items-center">
					<table border=1 style="margin:auto">
						<tr>
							<td>아이디</td>
							<td>${petsitterInfo.ps_id}</td>
						</tr>
						<tr>
							<td>프로필 이미지</td>
							<td><img src="/upload/${petsitterInfo.ps_img}" style="width:300px; height:300px;"></td>
						</tr>
						
						<tr>
							<td>나 이</td>
							<td>${petsitterInfo.ps_age}</td>
						</tr>
						<tr>
							<td>성 별</td>
							<td>
								<input type="radio" id="ps_gender_M" name="ps_gender" value="M"> 남자
								<input type="radio" id="ps_gender_F" name="ps_gender" value="F"> 여자
								</td>
						</tr>
						<tr>
							<td>주 소</td>
							<td>
								<div><input type="text" name="ps_address1" value="${petsitterInfo.ps_address1 }"readonly></div> 
								<div><input type="text" name="ps_address2" value="${petsitterInfo.ps_address2 }"readonly></div>
							</td>
						</tr>
						<tr>
							<td>거주유형</td>
							<td>
								<div class="resident_type_list">
									<input type="radio" name="ps_resident_type" id="resident_type1"
										value=단독주택 /> <label for="resident_type1">단독주택</label>
									<input type="radio" name="ps_resident_type" id="resident_type2"
										value=아파트 /> <label for="resident_type2">아파트</label>
									<input type="radio" name="ps_resident_type" id="resident_type3"
										value=빌라 /> <label for="resident_type3">빌라</label>
									<input type="radio" name="ps_resident_type" id="resident_type4"
										value=원룸 /> <label for="resident_type4">원룸</label>
									<input type="radio" name="ps_resident_type" id="resident_type5"
										value=오피스텔 /> <label for="resident_type5">오피스텔</label>
								</div>
							</td>
						</tr>
						<tr>
							<td>운전 유무</td>
							<td><input type="radio" id="ps_drive_Y" name="ps_drive"
								value="Y"> <label for="ps_drive_Y"><span></span>YES</label>
								<input type="radio" id="ps_drive_N" name="ps_drive" value="N">
								<label for="ps_drive_N"><span></span>NO</label></td>
						</tr>
						<tr>
							<td>자격증 유무</td>
							<td><input type="radio" id="ps_license_Y" name="ps_license"
								value="Y"> <label for="ps_license_Y"><span></span>YES</label>
								<input type="radio" id="ps_license_N" name="ps_license"
								value="N"> <label for="ps_license_N"><span></span>NO</label>
							</td>
						</tr>

						<tr>
							<td> 자격증 이미지</td>
							<td><img src="/upload/${petsitterInfo.ps_license_img}" style="width:300px; height:300px;"></td>
						</tr>

						<tr>
							<td>내 소개글</td>
							<td>
								${petsitterInfo.ps_myself}
							</td>
						</tr>

						<tr>
							<td>가능한 서비스</td>
							<td>
								<input type="checkbox" id="service1" class="service" name="ps_service" value=service1 />
								<label for="service1"><span></span>장기예약</label> 
								<input type="checkbox" id="service2" class="service" name="ps_service" value=service2 />
								<label for="service2"><span></span>약물복용</label>
								<input type="checkbox" id="service3" class="service" name="ps_service" value=service3 />
								<label for="service3"><span></span>실내놀이</label>
								<input type="checkbox" id="service4" class="service" name="ps_service" value=service4 />
								<label for="service4"><span></span>목욕가능</label>
								<input type="checkbox" id="service5" class="service" name="ps_service" value=service5 />
								<label for="service5"><span></span>응급처치</label>
								<input type="checkbox" id="service6" class="service" name="ps_service" value=service6 />
								<label for="service6"><span></span>야외산책</label>
								<input type="checkbox" id="service7" class="service" name="ps_service" value=service7 />
								<label for="service7"><span></span>발톱관리</label>
								<input type="checkbox" id="service8" class="service" name="ps_service" value=service8 />
								<label for="service8"><span></span>모발 관리</label>
								<input type="checkbox" id="service9" class="service" name="ps_service" value=service9 />
								<label for="service9"><span></span>집앞픽업</label>
							</td>
						</tr>
					</table>
					
				
				</div>
			</div>
		</div>
  
	<jsp:include page="/WEB-INF/views/petsitter_board/footer.jsp"/>
	</body>
</html>