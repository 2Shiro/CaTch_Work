<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="startnum" value="${pagingVo.pagination.startPage}" />
<c:set var="endnum" value="${pagingVo.pagination.endPage}" />
<c:set var="totalpagecount" value="${pagingVo.pagination.totalPageCount}" />

<div id="pagination">
<nav aria-label="Page navigation" id="paging">
	<ul class="pagination">
		<c:if test="${resumeNowpage > 1}">
			<li class="page-item"><a class="page-link" id="resumeList" name="pageresume" href="/Person/Mypage/Resume?resumeNowpage=1" aria-label="Previous" aria-hidden="true">
				&laquo;
			</a></li>
			<li class="page-item"><a class="page-link" id="resumeList" name="pageresume" href="/Person/Mypage/Resume?resumeNowpage=${resumeNowpage - 1}" aria-label="Previous" aria-hidden="true">
				&lt;
			</a></li>
		</c:if>
		<c:forEach var="pagenum" begin="${startnum}" end="${endnum}" step="1">
			<li class="page-item"><a class="page-link" id="resumeList" name="pageresume" href="/Person/Mypage/Resume?resumeNowpage=${pagenum}">${pagenum}</a></li>
		</c:forEach>
		<c:if test="${pagingVo.pagination.existNextPage}">
			<li class="page-item"><a class="page-link" id="resumeList" name="pageresume" href="/Person/Mypage/Resume?resumeNowpage=${resumeNowpage + 1}" aria-label="Next" aria-hidden="true">
				&gt;
			</a></li>
			<li class="page-item"><a class="page-link"  id="resumeList" name="pageresume" href="/Person/Mypage/Resume?resumeNowpage=${totalpagecount}" aria-label="Next" aria-hidden="true">
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
  const pagingEls = document.getElementsByName('pageresume');
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
	    	console.dir(e.target)
	    	e.preventDefault()
	    	
				$("#personinfo-tab").removeClass("active");
				$("#apply-tab").removeClass("active");
				$("#bookmark-tab").removeClass("active");
				$("#resume-tab").addClass("active");
				
				$("#personinfo").removeClass("show active");
				$("#apply").removeClass("show active");
				$("#bookmark").removeClass("show active");
				$("#resume").addClass("show active");
	    	
	    	let href = e.target.href
	    	//alert(href)
	    	//document.load(href)
	    	$('#personresume').load(href)
	    })
	})
	 $('#myresume').load()
 })
 </script>

