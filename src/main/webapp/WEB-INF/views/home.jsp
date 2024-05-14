<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CaTch Work</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<style>
    .mcontainer {
        display: flex;
        justify-content: space-between; /* 항목들을 컨테이너의 왼쪽과 오른쪽으로 분리 */
        align-items: center; /* 내부 요소들을 세로 중앙에 배치 */
    }

    .selects {
        display: flex; /* 선택 상자를 가로로 배열 */
        gap: 10px; /* 선택 상자 사이의 간격 */
    }

    .select-box {
        width: 100px; /* 선택 상자의 너비 조정 */
    }

	.search {
	    display: flex; /* 검색창과 버튼을 가로로 배열 */
	    align-items: center; /* 내부 요소들을 세로 중앙에 배치 */
	    gap: 0; /* 검색창과 버튼 사이의 간격 제거 */
	}
	
	.search input[type="text"] {
	    /* 검색 입력창 스타일 */
	    width: 300px; /* 검색 입력창의 너비를 자동으로 조정 */
	    flex-grow: 1; /* 입력창이 가능한 많은 공간을 차지하도록 함 */
	}
	
	.search button {
	    /* 버튼 스타일 조정 */
	    padding: 0.375rem 0.75rem; /* Bootstrap에서의 기본 버튼 패딩을 유지 */
	}
</style>

</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>

	<%@include file="/WEB-INF/include/nav.jsp"%>
	<section>
		<div id="PostCard">
			<div class="grand_banner_wrap mx-5">
				<h2 class="header ms-3">채용 공고</h2>
				<div class="row my-3 ms-3">
				    <div class="col">
				        <div class="input-group">
					        <div class="mcontainer">
					        	<div class="selects">
						            <!-- 직무 선택 -->
						            <select class="form-select" id="job_category">
						                <option selected>직무 선택</option>
						                <option value="기획">기획</option>
						                <option value="사무">사무</option>
						                <option value="인사">인사</option>
						                <option value="회계">회계</option>
						                <option value="마케팅">마케팅</option>
						                <option value="개발">개발</option>
						                <option value="디자인">디자인</option>
						                <option value="물류">물류</option>
						                <option value="영업">영업</option>
						                <option value="고객상담">고객상담</option>
						                <option value="금융">금융</option>
						                <option value="요식업">요식업</option>
						                <option value="엔지니어링">엔지니어링</option>
						                <option value="생산">생산</option>
						                <option value="교육">교육</option>
						                <option value="건축">건축</option>
						                <option value="의료">의료</option>
						                <option value="미디어">미디어</option>
						                <option value="복지">복지</option>
						            </select>
						            <!-- 지역 선택 -->
						            <select class="form-select" id="region">
						                <option selected>지역 선택</option>
						                <option value="서울">서울</option>
						                <option value="경기">경기</option>
						                <option value="인천">인천</option>
						                <option value="부산">부산</option>
						                <option value="대전">대전</option>
						                <option value="세종">세종</option>
						                <option value="충남">충남</option>
						                <option value="충북">충북</option>
						                <option value="대구">대구</option>
						                <option value="울산">울산</option>
						                <option value="경북">경북</option>
						                <option value="경남">경남</option>
						                <option value="제주">제주</option>
						                <option value="강원">강원</option>
						                <option value="광주">광주</option>
						                <option value="전남">전남</option>
						                <option value="전북">전북</option>
						            </select>
						            <!-- 경력 선택 -->
						            <select class="form-select" id="career">
						                <option selected>경력 선택</option>
						                <option value="무관">무관</option>
						                <option value="신입">신입</option>
						                <option value="경력">경력</option>
						            </select>
						            <!-- 근로 형태 선택 -->
						            <select class="form-select" id="worker">
						                <option selected>고용 형태 선택</option>
						                <option value="정규직">정규직</option>
						                <option value="계약직">계약직</option>
						            </select>
					            </div>
					            <!-- 검색창 -->
					            <div class="search ms-5">
						            <input type="text" name="keyword" class="form-control" id="search_kw">
						            <button type="submit" class="btn btn-outline-secondary" id="btn_search">찾기</button>
					            </div>
				            </div>
				        </div>
				    </div>
				</div>
				<div class="d-flex flex-wrap ms-3">
					<c:forEach var="mainPageList" items="${mainPageList}">
						<div class="cardinterval me-5 my-3">
							<a href="/Company/Viewpost?post_idx=${mainPageList.post_idx}&user_id=${mainPageList.user_idx}"> <!-- 각 공고 페이지로 이동하도록 수정 -->
								<div class="card" style="width: 20rem; height: 300px;">
									<img src="${mainPageList.logo}" class="card-img-top" alt="회사로고"
										style="height: 150px;">
									<div class="card-body">
										<p class="card-company">${mainPageList.name}</p>
										<h5 class="card-title">${mainPageList.title}</h5>
										<p class="card-deadline">${mainPageList.deadline}</p>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<hr>
		</div>
	</section>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    $('#btn_search').click(function(e) {
        e.preventDefault(); // 폼 제출을 방지하여 페이지 새로고침 방지
        var keyword = $('#search_kw').val(); // 검색창에서 키워드 가져오기

        $.ajax({
            url: '/Search', // 서버의 검색 엔드포인트
            type: 'GET', // 검색 요청 방식
            dataType: 'json', // 기대하는 응답 데이터 타입
            data: {
                keyword: keyword // 서버로 보낼 데이터
            },
            success: function(response) {
                // 검색 결과 처리
                var resultHTML = '';
                if(response.length > 0){
                    $.each(response, function(i, item) { // 받아온 데이터를 이용하여 반복
                        resultHTML += '<div class="cardinterval me-5 my-3">' +
                                          '<a href="/Company/Viewpost?post_idx=' + item.post_idx + '&id=' + item.user_idx + '">' +
                                              '<div class="card" style="width: 20rem; height: 300px;">' +
                                                  '<img src="' + item.logo + '" class="card-img-top" alt="회사로고" style="height: 150px;">' +
                                                  '<div class="card-body">' +
                                                      '<p class="card-company">' + item.name + '</p>' +
                                                      '<h5 class="card-title">' + item.title + '</h5>' +
                                                      '<p class="card-deadline">' + item.deadline + '</p>' +
                                                  '</div>' +
                                              '</div>' +
                                          '</a>' +
                                      '</div>';
                    });
                } else {
                    resultHTML = '<p>검색 결과가 없습니다.</p>';
                }
                $('.d-flex.flex-wrap.ms-3').html(resultHTML); // 결과를 페이지에 표시
            },
            error: function(xhr, status, error) {
                // 오류 처리
                alert('검색 오류: ' + error);
            }
        });
    });
});
</script>
</html>