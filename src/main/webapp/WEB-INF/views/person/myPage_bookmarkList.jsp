<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 페이징 갈아끼우기</title>
<link rel="stylesheet" href="/css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link rel="icon" href="/img/CaTchWorkFavicon.png">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.bookmark-icons {
    width: 20px;
    height: 10px;
}
</style>
</head>
<body>

    <div class="tab-pane fade active show" id="bookmark" role="tabpanel" aria-labelledby="bookmark-tab">
	<div class="container">
	<div id="personbookmark">
	<div>&nbsp;</div>
	<div>&nbsp;</div>
		<h2>내가 북마크한 공고</h2>
		<div>&nbsp;</div>
		<div>&nbsp;</div>
		<div>&nbsp;</div>
	<div class="mybookmark">
		      <table class="table" class="linkDiv">
	           <thead>
	             <tr>
	               <th scope="col">번호</th>
	               <th scope="col">공고 제목</th>
	               <th scope="col">연봉</th>
	               <th scope="col">요구 경력</th>
	               <th scope="col">담당자연락처</th>
	               <th scope="col">비고</th>
	             </tr>
	           </thead>
	           <tbody class="table-group-divider">
					<c:forEach var="bo" items="${response2.list}" varStatus="status">
					   <tr data-row-num="${bo.row_num}" data-deleted="false">
					        <th scope="row">${status.count}</th>
					        <td class="td2"><a href="/Post?post_idx=${po.post_idx}">${bo.title}</a></td>
					        <td>${bo.salary}</td>
					        <td>${bo.career}</td>
					        <td>${bo.mphone}</td>
					        <td class="td8">
					        	<input type="hidden" value="${bo.book_idx}">
					           <img src="/img/fillmoew.png"
                                      class="bookmark-icons" alt="북마크"
                                       style="width: 24px; height: 24px;">
					        </td>
					    </tr>

					</c:forEach>
	           </tbody>
	         </table>
         	</div>
         	         	            <div class="d-flex justify-content-center paging-bottom-container">
                <%@include file="/WEB-INF/pagination/personBookmarkPaging.jsp" %>
            </div>
         </div>
         </div>
    </div>
 
 <script>
 $(document).ready(function() {
	    let deletedRows = []; // 삭제된 행을 기록하는 배열
	    let bookmarkNowpage = parseInt($('#pagination').data('current-page')) || 1; // 현재 페이지 변수 추가

	    function loadBookmarks(page) {
	        if (page !== undefined) {
	            bookmarkNowpage = page;
	        }

	        console.log('북마크 현재 페이지:', bookmarkNowpage);

	        $.getJSON('/Bookmark/List2', { bookmarkNowpage: bookmarkNowpage }, function(bookmarkList) {
	            const tableDivider = $('.mybookmark .table-group-divider');
	            tableDivider.empty();
	            $.each(bookmarkList, function(index, bo) {
	                // 삭제된 요소가 아닌 경우에만 추가
	                if (!deletedRows.includes(bo.row_num)) {
	                    let html = '<tr data-row-num="' + bo.row_num + '">';
	                    html += '<th scope="row">' + bo.row_num + '</th>';
	                    html += '<td class="td2"><a href="/Post?post_idx=' + bo.post_idx + '">' + bo.title + '</a></td>';
	                    html += '<td>' + bo.salary + '</td>';
	                    html += '<td>' + bo.career + '</td>';
	                    html += '<td>' + bo.mphone + '</td>';
	                    html += '<td class="td8">';
	                    html += '<input type="hidden" value="' + bo.book_idx + '">';
	                    html += '<img src="/img/fillmoew.png" class="bookmark-icons" alt="북마크" style="width: 24px; height: 24px;">';
	                    html += '</td>';
	                    html += '</tr>';

	                    tableDivider.append(html);
	                }
	            });
	        });
	    }

	    // 초기 로딩 - 첫 페이지 로드 시에만 실행
	    //loadBookmarks(bookmarkNowpage);

	    // 북마크 탭 클릭 이벤트 핸들러
	    $('#bookmark-tab').on('click', function(e) {
	        e.preventDefault();
	        loadBookmarks(bookmarkNowpage); // 현재 페이지로 북마크 목록 로드
	    });

	    // 페이지 이동 버튼 클릭 이벤트 핸들러
	    $('.pagination').on('click', '.page-link', function(e) {
	        e.preventDefault();
	        let page = $(this).data('page'); // 클릭된 페이지 번호로 업데이트
	        bookmarkNowpage = page; // 현재 페이지 번호를 업데이트
	        loadBookmarks(page); // 북마크 목록 다시 로드
	    });

	    // 북마크 아이콘 클릭 이벤트
	    $('.mybookmark .table-group-divider').on('click', '.bookmark-icons', function(event) {
	        const clickedElement = $(this);
	        const bookmarkValue = clickedElement.closest('.td8').find('[type=hidden]').val();
	        const url = '/Bookmark/Delete?book_idx=' + bookmarkValue;

	        $.ajax({
	            url: url,
	            method: 'DELETE',
	            success: function(deletedData) {
	                const deletedRowNum = deletedData.row_num;

	                // 삭제된 요소의 인덱스를 기록
	                deletedRows.push(deletedRowNum);

	                // DOM에서 해당 행을 제거
	                clickedElement.closest('tr').remove();

	                // 삭제 후 현재 페이지의 북마크 목록 다시 로드
	                loadBookmarks(bookmarkNowpage);
	            },
	            error: function(error) {
	                console.error('Error:', error);
	            }
	        });
	    });
	});
 </script>
 
 </body>
 
