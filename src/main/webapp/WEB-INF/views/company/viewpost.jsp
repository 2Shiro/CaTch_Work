<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CaTch Work</title>
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/rating.css" />
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
   crossorigin="anonymous">
<link rel="icon" href="/img/CaTchWorkFavicon.png">
</head>
<body>
   <%@include file="/WEB-INF/include/header.jsp"%>

   <%@include file="/WEB-INF/include/nav.jsp"%>
   <section>
      <div id="container">
         <div class="" id="postdetail">
            <div class="">
               <form class="needs-validation container" method="post">
                  <div class="">
                     <div class="">
                        <div class="my-1 mx-auto row position-relative">
                           <div class="d-flex justify-content-start align-items-center">
                              <!-- Title -->
                              <h2 id="title" name="title" style="flex-grow: 1;">${postvo.title}</h2>
                              <!-- Bookmark Icon -->
                              <c:if test="${usertype.type == 2}">
                                 <div class="bookmark-icon ms-3"
                                    onclick="toggleBookmark(event, ${postvo.post_idx})">
                                    <c:choose>
                                       <c:when test="${isBookmarked}">
                                          <img src="/img/moew_on.png"
                                             id="bookmark_${postvo.post_idx}" alt="북마크"
                                             style="width: 50px; height: 50px;">
                                       </c:when>
                                       <c:otherwise>
                                          <img src="/img/moew_off.png"
                                             id="bookmark_${postvo.post_idx}" alt="북마크"
                                             style="width: 50px; height: 50px;">
                                       </c:otherwise>
                                    </c:choose>
                                 </div>
                              </c:if>
                           </div>
                        </div>
                        <hr>
                     </div>
                     <div class="my-1 mx-auto row">
                        <img src="${companyvo.logo}" class="card-img-top" alt="회사로고"
                           style="width: 50%; margin: 0 auto;">
                        <div class="row mt-4">
                           <div class="col-6 row d-flex align-items-center">
                              <div class="col-md-4">
                                 <!-- col-md-auto를 col-md-4로 변경 -->
                                 <h5>회사명</h5>
                              </div>
                              <div class="col-md-8">
                                 <input type="text" class="form-control" style="width: 400px;"
                                    id="jobtype" name="jobtype" readonly="readonly"
                                    value="${companyvo.name}">
                              </div>
                           </div>
                           <div class="col-6 row d-flex align-items-center">
                              <div class="col-md-4">
                                 <h5>부서</h5>
                              </div>
                              <div class="col-md-8">
                                 <input class="form-control" style="width: 400px;" type="text"
                                    name="go" id="gohome" readonly="readonly"
                                    value="${postvo.department}">
                              </div>
                           </div>
                        </div>
                        <div class="row mt-4">
                           <div class="col-6 row d-flex align-items-center">
                              <div class="col-md-4">
                                 <!-- col-md-auto를 col-md-4로 변경 -->
                                 <h5>지원 자격</h5>
                              </div>
                              <div class="col-md-8">
                                 <input type="text" class="form-control" style="width: 400px;"
                                    id="career" name="career" readonly="readonly"
                                    value="${postvo.career}">
                              </div>
                           </div>
                           <div class="col-6 row d-flex align-items-center">
                              <div class="col-md-4">
                                 <h5>연봉</h5>
                              </div>
                              <div class="col-md-8">
                                 <input type="text" class="form-control" style="width: 400px;"
                                    id="salary" name="salary" readonly="readonly"
                                    value="${postvo.salary}">
                              </div>
                           </div>
                        </div>
                        <div class="row mt-4">
                           <div class="col-6 row d-flex align-items-center">
                              <div class="col-md-4">
                                 <!-- col-md-auto를 col-md-4로 변경 -->
                                 <h5>근무 조건</h5>
                              </div>
                              <div class="col-md-8">
                                 <input type="text" class="form-control" style="width: 400px;"
                                    id="jobtype" name="jobtype" readonly="readonly"
                                    value="${postvo.jobtype}">
                              </div>
                           </div>
                           <div class="col-6 row d-flex align-items-center">
                              <div class="col-md-4">
                                 <h5>근무 시간</h5>
                              </div>
                              <div class="col-md-8">
                                 <input class="form-control" style="width: 400px;" type="text"
                                    name="go" id="gohome" readonly="readonly"
                                    value="${postvo.go}">
                              </div>
                           </div>
                        </div>
                        <div class="row mt-4">
                           <div class="col-6 row d-flex align-items-center">
                              <div class="col-md-4">
                                 <!-- col-md-auto를 col-md-4로 변경 -->
                                 <h5>담당자</h5>
                              </div>
                              <div class="col-md-8">
                                 <input type="text" class="form-control" style="width: 400px;"
                                    id="manager" name="manager" readonly="readonly"
                                    value="${postvo.manager}">
                              </div>
                           </div>
                           <div class="col-6 row d-flex align-items-center">
                              <div class="col-md-4">
                                 <h5>담당자 번호</h5>
                              </div>
                              <div class="col-md-8">
                                 <input type="text" class="form-control" style="width: 400px;"
                                    id="mphone" name="mphone" readonly="readonly"
                                    value="${postvo.mphone}">
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="my-1 mx-auto row">
                        <label for="deadline" class="form-label">마감 일자</label> <input
                           type="text" class="form-control" id="deadline" name="deadline"
                           readonly="readonly" value="${postvo.deadline}">
                     </div>
                     <div class="my-1 mx-auto row">
                        <label for="c_intro" class="form-label">기업 소개</label>
                        <textarea rows="10" class="form-control" id="intro" name="intro"
                           readonly="readonly">${postvo.intro}</textarea>

                     </div>
                     <div class="my-1 mx-auto row">
                        <label for="job_intro" class="form-label">업무 소개</label>
                        <textarea rows="10" class="form-control" id="explain"
                           name="explain" readonly="readonly">${postvo.explain}</textarea>
                     </div>
                     <div class="mt-3 mx-auto row">
                        <c:forEach var="skill" items="${skill}">
                           <div class="col-auto">
                              <button type="button" class="btn btn-primary">${skill.name}</button>
                           </div>
                        </c:forEach>
                        <input type="hidden" id="defaultSkillIdx" name="skillIdx"
                           value="0">
                     </div>
                  </div>
                  <br>
                  <div class="">
                     <hr>
                     <div class="my-1 mx-auto row position-relative">
                        <div class="d-flex justify-content-start align-items-center">
                           <!-- Title -->
                           <h2 id="name" name="name" style="flex-grow: 1;">${companyvo.name} 기업소개</h2>
                        </div>
                     </div>
                  </div>
                  <div class="my-1 mx-auto row">
                     <div class="row mt-4">
                        <div class="col-6 row d-flex align-items-center">
                           <div class="col-md-4">
                              <!-- col-md-auto를 col-md-4로 변경 -->
                              <h5>대표자</h5>
                           </div>
                           <div class="col-md-8">
                              <input type="text" class="form-control" style="width: 400px;"
                                 id="representative" name="representative" readonly="readonly"
                                 value="${companyvo.representative}">
                           </div>
                        </div>
                        <div class="col-6 row d-flex align-items-center">
                           <div class="col-md-4">
                              <h5>주소</h5>
                           </div>
                           <div class="col-md-8">
                              <input class="form-control" style="width: 400px;" type="text"
                                 name="address" id="address" readonly="readonly"
                                 value="${companyvo.address}">
                           </div>
                        </div>
                     </div>
                     <div class="row mt-4">
                        <div class="col-6 row d-flex align-items-center">
                           <div class="col-md-4">
                              <!-- col-md-auto를 col-md-4로 변경 -->
                              <h5>회사분류</h5>
                           </div>
                           <div class="col-md-8">
                              <input type="text" class="form-control" style="width: 400px;"
                                 id="ctype" name="ctype" readonly="readonly"
                                 value="${companyvo.ctype}">
                           </div>
                        </div>
                        <div class="col-6 row d-flex align-items-center">
                           <div class="col-md-4">
                              <h5>설립일자</h5>
                           </div>
                           <div class="col-md-8">
                              <input type="text" class="form-control" style="width: 400px;"
                                 id="bdate" name="bdate" readonly="readonly"
                                 value="${companyvo.bdate}">
                           </div>
                        </div>
                     </div>
                     <input type="hidden" id="star" name="star" value="${rate}">
                     <div class="row mt-4">
                        <div class="col-6 row d-flex align-items-center">
                           <div class="col-md-4">
                              <!-- col-md-auto를 col-md-4로 변경 -->
                              <h5>기업 평점</h5>
                           </div>
                           <div class="col-md-8">
                              <div class="rating" style="margin-left: 50px;">
                                  <label class="rating__label rating__label--half" for="starhalf">
                                      <input type="radio" id="starhalf" class="rating__input" name="rating" value="">
                                      <span class="star-icon"></span>
                                  </label>
                                  <label class="rating__label rating__label--full" for="star1">
                                      <input type="radio" id="star1" class="rating__input" name="rating" value="">
                                      <span class="star-icon"></span>
                                  </label>
                                  <label class="rating__label rating__label--half" for="starhalf">
                                      <input type="radio" id="starhalf" class="rating__input" name="rating" value="">
                                      <span class="star-icon"></span>
                                  </label>
                                  <label class="rating__label rating__label--full" for="star1">
                                      <input type="radio" id="star1" class="rating__input" name="rating" value="">
                                      <span class="star-icon"></span>
                                  </label>
                                  <label class="rating__label rating__label--half" for="starhalf">
                                      <input type="radio" id="starhalf" class="rating__input" name="rating" value="">
                                      <span class="star-icon"></span>
                                  </label>
                                  <label class="rating__label rating__label--full" for="star1">
                                      <input type="radio" id="star1" class="rating__input" name="rating" value="">
                                      <span class="star-icon"></span>
                                  </label>
                                  <label class="rating__label rating__label--half" for="starhalf">
                                      <input type="radio" id="starhalf" class="rating__input" name="rating" value="">
                                      <span class="star-icon"></span>
                                  </label>
                                  <label class="rating__label rating__label--full" for="star1">
                                      <input type="radio" id="star1" class="rating__input" name="rating" value="">
                                      <span class="star-icon"></span>
                                  </label>
                                  <label class="rating__label rating__label--half" for="starhalf">
                                      <input type="radio" id="starhalf" class="rating__input" name="rating" value="">
                                      <span class="star-icon"></span>
                                  </label>
                                  <label class="rating__label rating__label--full" for="star1">
                                      <input type="radio" id="star1" class="rating__input" name="rating" value="">
                                      <span class="star-icon"></span>
                                  </label>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <br>
                  <input type="hidden" id="comaddress" value="${companyvo.address}">
                  <div id="map" style="width: 100%; height: 400px; margin: 0 auto;"></div>
               </form>
            </div>
         </div>
      </div>
      <div class="my-3 d-flex justify-content-center">
         <!-- 개인회원일때 -->
         <c:if test="${usertype.type == 2}">
            <c:if test="${!alreadyApplied}">
               <form action="/Person/JoinPost" method="POST">
                  <input type="hidden" name="user_idx" value="${user_idx}" /> <input
                     type="hidden" name="post_idx" value="${postvo.post_idx}" /> <input
                     type="hidden" name="com_idx" value="${companyvo.com_idx}" />
                  <div class="input-group mb-3 resume">
                     <label class="input-group-text" for="inputGroupSelect01">이력서</label>
                     <select name="resume_idx" class="form-select" id="presumeSelect">
                        <option selected>==선택==</option>
                        <c:forEach var="resumevo" items="${resumevo}">
                           <option value="${resumevo.resume_idx}">${resumevo.title}</option>
                        </c:forEach>
                     </select>
                  </div>
                  <div class="my-3 d-flex justify-content-center">
                     <button type="submit" class="btn btn-primary mx-3">지원하기</button>
                     <div>
                        <a href="/" id="btn-list" class="btn btn-outline-secondary mx-3">메인으로</a>
                     </div>
                  </div>
               </form>
            </c:if>
            <c:if test="${alreadyApplied}">
               <p>이미 이 공고에 지원하셨습니다.</p>
            </c:if>
         </c:if>
         <!-- 기업회원일때 -->
         <c:if test="${usertype.type == 1}">
            <div class="my-3 d-flex justify-content-center">
               <a href="/Company/MyPage?nowpage=1" class="btn btn-primary mx-3">등록
                  공고 관리</a> <a href="/" id="btn-list"
                  class="btn btn-outline-secondary mx-3">메인으로</a>
            </div>
         </c:if>
         <c:if test="${usertype.type == 0}">
            <a href="/DeletePost?post_idx=${postvo.post_idx}" id="btn-list" class="btn btn-outline-danger mx-3">삭제</a>
            <a href="/" id="btn-list" class="btn btn-outline-secondary mx-3">메인으로</a>
         </c:if>
         <c:if test="${usertype.type eq null}">
            <a href="/" id="btn-list" class="btn btn-outline-secondary mx-3">메인으로</a>
         </c:if>
         <!-- history back 사용? -->
         <!-- 세션별로 다르게 -->
      </div>
   </section>
   <%@include file="/WEB-INF/include/footer.jsp"%>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92d4589340537a5f8d4dbc6cb7e73577&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//JSP에서 전달된 회사 주소를 사용합니다
var companyAddress = document.getElementById("comaddress").value;

// 주소로 좌표를 검색합니다
geocoder.addressSearch(companyAddress, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">회사 위치</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});

function toggleBookmark(event, post_idx) {
    event.preventDefault(); // 링크 기본 동작 방지
    event.stopPropagation(); // 이벤트 버블링 방지

    var bookmarkIcon = event.target;
    var isBookmarked = bookmarkIcon.src.includes('moew_on.png'); // 북마크 상태 확인

    // AJAX 요청을 통해 서버에 북마크 상태 업데이트
    $.ajax({
        url: isBookmarked ? '/Person/RemoveBookmark' : '/Person/AddBookmark', // 조건에 따라 URL 결정
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ post_idx: post_idx }),
        success: function(response) {
            // 성공적으로 처리된 경우, 북마크 아이콘 업데이트
            bookmarkIcon.src = isBookmarked ? '/img/moew_off.png' : '/img/moew_on.png';
            // 사용자에게 북마크 상태 변경 알림 (옵션)
            alert(isBookmarked ? '북마크가 해제되었습니다.' : '북마크가 추가되었습니다.');
        },
        error: function(xhr, status, error) {
            alert('북마크 업데이트 실패: ' + error);
        }
    });
}

</script>
<script>
	//평점
	const icons = document.querySelectorAll('.star-icon')
	const check = document.querySelector('#star').value
	
	window.addEventListener('load', () => {
		for (let i = 0; i < check; i++) {
	    	icons[i].classList.add('filled')
	    }
	})
</script>
</html>