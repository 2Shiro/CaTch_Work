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
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>

	<%@include file="/WEB-INF/include/nav.jsp"%>
	<section>
		<div id="PostCard">
			<div class="grand_banner_wrap mx-5">
				<h2 class="header ms-3">채용 공고</h2>
				<div class="row my-3 ms-3">
        			<div class="col-3">
            			<div class="input-group">
                			<input type="text" name="keyword" class="form-control" id="search_kw">
                			<button type="submit" class="btn btn-outline-secondary" id="btn_search">찾기</button>
			            </div>
			        </div>
			    </div>
				<div class="d-flex flex-wrap ms-3">
					<c:forEach var="mainPageList" items="${mainPageList}">
						<div class="cardinterval me-5 my-3">
							<a href="/Company/Viewpost?post_idx=${mainPageList.post_idx}&id=${mainPageList.user_idx}"> <!-- 각 공고 페이지로 이동하도록 수정 -->
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