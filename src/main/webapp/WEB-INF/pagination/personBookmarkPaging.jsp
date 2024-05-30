<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="startnum" value="${pagingVo2.pagination.startPage}" />
<c:set var="endnum" value="${pagingVo2.pagination.endPage}" />
<c:set var="totalpagecount" value="${pagingVo2.pagination.totalPageCount}" />

<div id="pagination">
<nav aria-label="Page navigation" id="paging">
	<ul class="pagination">
		<c:if test="${bookmarkNowpage > 1}">
			<li class="page-item"><a class="page-link" href="/Person/Mypage/Bookmark?bookmarkNowpage=1" data-page="1" aria-label="Previous"  name="personbookmark"  aria-hidden="true">
				&laquo;
			</a></li>
			<li class="page-item"><a class="page-link" href="/Person/Mypage/Bookmark?bookmarkNowpage=${bookmarkNowpage - 1}" data-page="${bookmarkNowpage - 1}" aria-label="Previous" name="personbookmark"  aria-hidden="true">
				&lt;
			</a></li>
		</c:if>
		<c:forEach var="pagenum" begin="${startnum}" end="${endnum}" step="1" >
			<li class="page-item"><a class="page-link" href="/Person/Mypage/Bookmark?bookmarkNowpage=${pagenum}" name="personbookmark" data-page="${pagenum}"  aria-hidden="true">${pagenum}</a></li>
		</c:forEach>
		<c:if test="${pagingVo2.pagination.existNextPage}">
			<li class="page-item"><a class="page-link" href="/Person/Mypage/Bookmark?bookmarkNowpage=${bookmarkNowpage + 1}"  data-page="${bookmarkNowpage + 1}" aria-label="Next" name="personbookmark"  aria-hidden="true">
				&gt;
			</a></li>
			<li class="page-item"><a class="page-link" href="/Person/Mypage/Bookmark?bookmarkNowpage=${totalpagecount}" data-page="${totalpagecount}" aria-label="Next" name="personbookmark"  aria-hidden="true">
				&raquo;
			</a></li>
		</c:if>
	</ul>
</nav>
</div>

<script>
	//alert("페이징")
 		//const pagingEls = document.getElementsByName('pageresume')
 		
 		
 $(document).ready(function() {
  const pagingEls = document.getElementsByName('personbookmark');
 		const personinfotab = document.getElementById('personinfo-tab')
 		const resumetab = document.getElementById('resume-tab')
 		const applytab = document.getElementById('apply-tab')
 		const bookmarktab = document.getElementById('bookmark-tab')
 		
 		const personinfo = document.getElementById('personinfo')
 		const resume = document.getElementById('resume')
 		const apply = document.getElementById('apply')
 		const bookmark = document.getElementById('bookmark')
   pagingEls.forEach(pagingEl => {
	    pagingEl.addEventListener('click', (e) => {
	    	console.dir(e.target.href)
	    	e.preventDefault()
	    	
				$("#personinfo-tab").removeClass("active");
				$("#resume-tab").removeClass("active");
				$("#apply-tab").removeClass("active");
				$("#bookmark-tab").addClass("active");
				
				$("#personinfo").removeClass("show active");
				$("#resume").removeClass("show active");
				$("#apply").removeClass("show active");
				$("#bookmark").addClass("show active");
	    	
	    	let href = e.target.href
	    	//alert(href)
	    	//document.load(href)
	    	$('#personbookmark').load(href)
	    })
	})
	 $('#mybookmark').load()
 })
 </script>