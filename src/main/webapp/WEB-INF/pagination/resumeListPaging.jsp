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
				href="/Company/ResumeList?nowpage=1" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item"><a class="page-link"
				href="/Company/ResumeList?nowpage=${nowpage - 1}" aria-label="Previous">
					<span aria-hidden="true">&lt;</span>
			</a></li>
		</c:if>
		<c:forEach var="pagenum" begin="${startnum}" end="${endnum}" step="1">
			<li class="page-item"><a class="page-link"
				href="/Company/ResumeList?nowpage=${ pagenum }"> ${ pagenum }
			</a></li>
		</c:forEach>
		<c:if test="${pagingVo.pagination.existNextPage}">
			<li class="page-item"><a class="page-link"
				href="/Company/ResumeList?nowpage=${ nowpage + 1 }"
					aria-label="Next"> <span aria-hidden="true">&gt;</span>
			</a></li>
			<li class="page-item"><a class="page-link"
				href="/Company/ResumeList?nowpage=${ totalpagecount }"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</c:if>
	</ul>
</nav>
</div>