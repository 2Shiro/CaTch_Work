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
<link rel="icon" href="/img/CaTchWorkFavicon.png">
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
									<select class="form-select" id="department">
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
									<select class="form-select" id="jobtype">
										<option selected>고용 형태 선택</option>
										<option value="정규직">정규직</option>
										<option value="계약직">계약직</option>
									</select>
								</div>
								<!-- 검색창 -->
								<div class="search ms-5">
									<input type="text" name="keyword" class="form-control"
										id="keyword">
									<button type="submit" class="btn btn-outline-secondary"
										id="btn_search">찾기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="d-flex flex-wrap ms-3">
					<c:forEach var="mainPageList" items="${mainPageList}">
						<div class="cardinterval me-5 my-3">
							<a href="/Company/Viewpost?post_idx=${mainPageList.post_idx}&com_idx=${mainPageList.com_idx}">
								<div class="card" style="width: 20rem; height: 300px;">
									<c:if test="${usertype.type == 2}">
										<div class="bookmark-icon"
											style="position: absolute; right: 10px; top: 10px; z-index: 10;"
											onclick="toggleBookmark(event, ${mainPageList.post_idx})">
											<c:choose>
												<c:when test="${mainPageList.bookmarked}">
													<img src="/img/moew_on.png"
														id="bookmark_${mainPageList.post_idx}" alt="북마크"
														style="width: 24px; height: 24px;">
												</c:when>
												<c:otherwise>
													<img src="/img/moew_off.png"
														id="bookmark_${mainPageList.post_idx}" alt="북마크"
														style="width: 24px; height: 24px;">
												</c:otherwise>
											</c:choose>
										</div>
									</c:if>
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
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('btn_search').addEventListener('click', function(e) {
        e.preventDefault();

        var department = document.getElementById('department');
        var region = document.getElementById('region');
        var career = document.getElementById('career');
        var jobtype = document.getElementById('jobtype');

        var searchData = {
            keyword: document.getElementById('keyword').value
        };

        // 기본 선택값일 경우 빈 문자열을 넘겨주도록 수정
        searchData.department = department.value !== '직무 선택' ? department.value : "";
        searchData.region = region.value !== '지역 선택' ? region.value : "";
        searchData.career = career.value !== '경력 선택' ? career.value : "";
        searchData.jobtype = jobtype.value !== '고용 형태 선택' ? jobtype.value : "";

        console.log(searchData);

        var xhr = new XMLHttpRequest();
        xhr.open('GET', '/Search?' + new URLSearchParams(searchData).toString(), true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.onload = function() {
            if(this.status >= 200 && this.status < 300) {
                var response = JSON.parse(this.responseText);
                var resultHTML = '';
                var usertype = response.usertype; // 서버에서 받은 유저 타입
                var searchResults = response.searchResults;

                if(searchResults.length > 0) {
                    searchResults.forEach(function(item) {
                        resultHTML += '<div class="cardinterval me-5 my-3">' +
                        '<a href="/Company/Viewpost?post_idx=' + item.post_idx + '&com_idx=' + item.com_idx + '">' +
                            '<div class="card" style="width: 20rem; height: 300px;">';
                        
                        // 유저 타입이 2일 때만 북마크 아이콘을 추가
                        if (usertype == 2) {
                            resultHTML += '<div class="bookmark-icon" style="position: absolute; right: 10px; top: 10px; z-index: 10;" onclick="toggleBookmark(event, ' + item.post_idx + ')">' + 
                                (item.bookmarked ? 
                                    '<img src="/img/moew_on.png" id="bookmark_' + item.post_idx + '" alt="북마크" style="width: 24px; height: 24px;">' :
                                    '<img src="/img/moew_off.png" id="bookmark_' + item.post_idx + '" alt="북마크" style="width: 24px; height: 24px;">') + 
                            '</div>';
                        }

                        resultHTML += '<img src="' + item.logo + '" class="card-img-top" alt="회사로고" style="height: 150px;">' +
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
                document.querySelector('.d-flex.flex-wrap.ms-3').innerHTML = resultHTML;
            } else {
                alert('검색 오류: ' + this.statusText);
            }
        };
        xhr.onerror = function() {
            alert('요청 오류');
        };
        xhr.send();
    });
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
</html>
