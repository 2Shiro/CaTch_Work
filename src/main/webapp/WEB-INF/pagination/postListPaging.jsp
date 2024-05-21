<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<!-- <c:set var="id" value="${ id }" /> -->
<c:set var="startnum" value="${pagingVo.pagination.startPage}" />
<c:set var="endnum" value="${pagingVo.pagination.endPage}" />
<c:set var="totalpagecount" value="${pagingVo.pagination.totalPageCount}" />

<div id="postlistpagination">
<nav aria-label="Page navigation" id="paging">
	<ul class="pagination">
		<c:if test="${nowpage > 1}">

			<li class="page-item"><a class="page-link" id="postListPage"
				href="/Company/MyPostList?nowpage=1" aria-label="Previous" aria-hidden="true" >
					&laquo;
			</a></li>
			<li class="page-item"><a class="page-link" id="postListPage"
				href="/Company/MyPostList?nowpage=${nowpage - 1}" aria-label="Previous" aria-hidden="true" >
					&lt;
			</a></li>
		</c:if>
		<c:forEach var="pagenum" begin="${startnum}" end="${endnum}" step="1">
			<li class="page-item"><a class="page-link" id="postListPage"
				href="/Company/MyPostList?nowpage=${ pagenum }"> ${ pagenum }
			</a></li>
		</c:forEach>
		<c:if test="${pagingVo.pagination.existNextPage}">
			<li class="page-item"><a class="page-link" id="postListPage"
				href="/Company/MyPostList?nowpage=${ nowpage + 1 }"
					aria-label="Next" aria-hidden="true" >&gt;
			</a></li>
			<li class="page-item"><a class="page-link" id="postListPage"
				href="/Company/MyPostList?nowpage=${ totalpagecount }"
				aria-label="Next" aria-hidden="true" > &raquo;
			</a></li>
		</c:if>
	</ul>
</nav>
</div>

<script>       
 $(document).ready(function() {
		 const pagingEls = document.querySelectorAll('#postListPage')
			
			const userinfotab = document.getElementById('userinfo-tab')
			const myreviewtab = document.getElementById('myreview-tab')
			
			const userinfo = document.getElementById('userinfo')
			const myreview = document.getElementById('myreview')
	
			   pagingEls.forEach(pagingEl => {
				    pagingEl.addEventListener('click', (e) => {
				    	e.preventDefault()
				    	
							$("#userinfo-tab").removeClass("active");
							$("#myreview-tab").addClass("active");
							
							$("#userinfo").removeClass("show active");
							$("#myreview").addClass("show active");
							
				    	const href = e.target.href
				    	//alert(href)
				    	//document.load(href)
				    	$('#mypostList').load(href)
				})
	 })
		$('#mypost').load()
 })
 </script>