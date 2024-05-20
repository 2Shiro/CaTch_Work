<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<!-- <c:set var="id" value="${ id }" /> -->
<c:set var="startnum" value="${pagingVo.pagination.startPage}" />
<c:set var="endnum" value="${pagingVo.pagination.endPage}" />
<c:set var="totalpagecount" value="${pagingVo.pagination.totalPageCount}" />

<div id="pagination">
<nav aria-label="Page navigation" id="paging">
	<ul class="pagination">
		<c:if test="${nowpage > 1}">
			<li class="page-item"><a class="page-link"
				href="/MyPage?nowpage=1" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item"><a class="page-link"
				href="/MyPage?nowpage=${nowpage - 1}" aria-label="Previous">
					<span aria-hidden="true">&lt;</span>
			</a></li>
		</c:if>
		<c:forEach var="pagenum" begin="${startnum}" end="${endnum}" step="1">
			<li class="page-item"><a class="page-link"
				href="/MyPage?nowpage=${ pagenum }"> ${ pagenum }
			</a></li>
		</c:forEach>
		<c:if test="${pagingVo.pagination.existNextPage}">
			<li class="page-item"><a class="page-link"
				href="/MyPage?nowpage=${ nowpage + 1 }"
					aria-label="Next"> <span aria-hidden="true">&gt;</span>
			</a></li>
			<li class="page-item"><a class="page-link"
				href="/MyPage?nowpage=${ totalpagecount }"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</c:if>
	</ul>
</nav>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const urlParams = new URLSearchParams(window.location.search);
    const tab = urlParams.get('tab') || 'person'; // 기본 탭을 person으로 설정

    document.querySelectorAll('.tab-content').forEach(function(tabContent) {
        tabContent.style.display = 'none';
    });

    document.getElementById(tab).style.display = 'block';

    document.querySelectorAll('.nav-link').forEach(function(tabLink) {
        tabLink.addEventListener('click', function(event) {
            const targetTab = this.getAttribute('href').substring(1);
            document.querySelectorAll('.tab-content').forEach(function(tabContent) {
                tabContent.style.display = 'none';
            });
            document.getElementById(targetTab).style.display = 'block';
            history.pushState(null, '', `/MyPage?tab=${targetTab}&${targetTab}Nowpage=1`);
            event.preventDefault();
        });
    });
});
</script>