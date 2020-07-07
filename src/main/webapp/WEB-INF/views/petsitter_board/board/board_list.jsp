<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html lang="en">
  <head>
  	<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
	<link href='https://unpkg.com/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
  </head>
  <body>
	<jsp:include page="/WEB-INF/views/petsitter_board/header.jsp"/>
	
	    
    <div class="site-section bg-light">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
         
         <c:choose>
         	<c:when test="${empty list}">
         		<p>등록된 펫시터의 글이 없습니다.</p>
         	</c:when>
         	
         	<c:otherwise>
         		<c:forEach var="i" items="${list}">
         			<div class="d-block d-md-flex listing-horizontal">
		              <a href="/board/outputSingle?psb_writer=${i.psb_writer }&psb_seq=${i.psb_seq}" class="img d-block" style="background-image: url(/upload/${i.psb_thumb})">
		                <c:if test="">
		                <span class="category">우수펫시터벳지</span>
		                </c:if>
		              </a>
		              <div class="lh-content">
		                <h3><a href="/board/outputSingle?psb_writer=${i.psb_writer }&psb_seq=${i.psb_seq}">${i.psb_title }</a></h3>
		                <p>${i.psb_writer }</p>
		                <p>
		                  <span class="icon-star text-warning"></span>
		                  <span class="icon-star text-warning"></span>
		                  <span class="icon-star text-warning"></span>
		                  <span class="icon-star text-warning"></span>
		                  <span class="icon-star text-secondary"></span>
		                  <span>(492 Reviews)</span>
		                </p>
		              </div>
		            </div>
         		</c:forEach>
         	</c:otherwise>
         </c:choose>
         
            <div class="col-12 mt-5 text-center">
              <div class="custom-pagination">
				${pageNavi }
              </div>
            </div>

          </div>
          <div class="col-lg-3 ml-auto">
          <c:if test="${sessionScope.loginInfo.mem_type == '2'}">
			<div class="mb-5">
	            <button id="register_btn" class="btn btn-primary text-#878786 btn-md px-5 font-weight-bold btn-md-block"> 
					글등록하기  <i class='bx bx-message-square-edit'></i></button>
				<script>
					$(function(){
						$("#register_btn").on("click",function(){
							console.log('${sessionScope.loginInfo.mem_id}');
							$.ajax({
								url : "/board/selectCnt?psb_writer=${sessionScope.loginInfo.mem_id}",
								type:"POST",
								success : function(result){
									if(result>=1){
										alert("등록된 글이 존재합니다.");
									} else {
										location.href="/board/output";
									}
								},
								error:function(){
									alert("selectCnt err");
								}
								
							});
						});
					})
				</script>
             </div>
          </c:if>
			
            <div class="mb-5">
              <h3 class="h5 text-black mb-3">FIND</h3>
              <form action="#" method="post">
                <div class="form-group">
                  <input type="text" placeholder="What are you looking for?" class="form-control">
                </div>
                <div class="form-group">
                  <div class="select-wrap">
                      <span class="icon"><span class="icon-keyboard_arrow_down"></span></span>
                      <select class="form-control" name="" id="">
                        <option value="">All Categories</option>
                        <option value="">Appartment</option>
                        <option value="">Restaurant</option>
                        <option value="">Eat &amp; Drink</option>
                        <option value="">Events</option>
                        <option value="">Fitness</option>
                        <option value="">Others</option>
                      </select>
                    </div>
                </div>
                <div class="form-group">
                  <!-- select-wrap, .wrap-icon -->
                  <div class="wrap-icon">
                    <span class="icon icon-room"></span>
                    <input type="text" placeholder="Location" class="form-control">
                  </div>
                </div>
              </form>
            </div>
          </div>

        </div>
      </div>
    </div>

	<jsp:include page="/WEB-INF/views/petsitter_board/footer.jsp"/>
	</body>
</html>