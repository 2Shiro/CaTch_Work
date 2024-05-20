<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="startnum" value="${pagingVo1.pagination.startPage}" />
<c:set var="endnum" value="${pagingVo1.pagination.endPage}" />
<c:set var="totalpagecount" value="${pagingVo1.pagination.totalPageCount}" />

<div id="pagination">
<nav aria-label="Page navigation" id="paging">
	<ul class="pagination">
		<c:if test="${applyNowpage > 1}">
			<li class="page-item"><a class="page-link" href="/Person/Mypage/Apply?applyNowpage=1" aria-label="Previous" name="personapply"  aria-hidden="true">
				 &laquo; 
			</a></li>
			<li class="page-item"><a class="page-link" href="/Person/Mypage/Apply?applyNowpage=${applyNowpage - 1}" aria-label="Previous" name="personapply"  aria-hidden="true">
				 &lt; 
			</a></li>
		</c:if>
		<c:forEach var="pagenum" begin="${startnum}" end="${endnum}" step="1">
			<li class="page-item"><a class="page-link" href="/Person/Mypage/Apply?applyNowpage=${pagenum}" name="personapply"  >${pagenum}</a></li>
		</c:forEach>
		<c:if test="${pagingVo1.pagination.existNextPage}">
			<li class="page-item"><a class="page-link" href="/Person/Mypage/Apply?applyNowpage=${applyNowpage + 1}" aria-label="Next" name="personapply"  aria-hidden="true">
				 &gt; 
			</a></li>
			<li class="page-item"><a class="page-link" href="/Person/Mypage/Apply?applyNowpage=${totalpagecount}" aria-label="Next" name="personapply"  aria-hidden="true">
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
  const pagingEls = document.getElementsByName('personapply');
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
				$("#bookmark-tab").removeClass("active");
				$("#apply-tab").addClass("active");
				
				$("#personinfo").removeClass("show active");
				$("#resume").removeClass("show active");
				$("#bookmark").removeClass("show active");
				$("#apply").addClass("show active");
	    	
	    	let href = e.target.href
	    	//alert(href)
	    	//document.load(href)
	    	$('#personapply').load(href)
	    })
	})
	 $('#myapply').load()
 })
 </script>