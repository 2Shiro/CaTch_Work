<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--    pageEncoding="UTF-8"%> --%>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>이력서 상세보기</title> -->
<!-- <link rel="stylesheet" href="/css/common.css" /> -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> -->
<!-- <link rel="icon" href="/img/CaTchWorkFavicon.png"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> -->
<!-- </head> -->
<!-- <body> -->
<!-- 	<div> -->
<!-- 	<div>&nbsp;</div> -->
<!-- 		 <div class="container"> -->
<!--             <section id="personresume"> -->
<!--                 <div>&nbsp;</div> -->
<!--                 <h2>구직자 이력서</h2> -->
<!--                 <div id="myresume" name="resume" class="linkDiv"> -->
<!--                 <div>&nbsp;</div> -->
<!--                 <div>&nbsp;</div> -->
<!--                 <div>&nbsp;</div> -->
<!--                     <table class="table"> -->
<!--                         <thead> -->
<!--                             <tr> -->
<!--                                 <th scope="col">번호</th> -->
<!--                                 <th scope="col">이력서 제목</th> -->
<!--                                 <th scope="col">이름</th> -->
<!--                                 <th scope="col">추천공고 보러가기</th> -->
<!--                             </tr> -->
<!--                         </thead> -->
<!--                         <tbody class="table-group-divider"> -->
<%--                             <c:forEach var="ro" items="${response.list}" varStatus="status"> --%>
<!--                                 <tr> -->
<%--                                     <th scope="row">${status.count}</th> --%>
<%--                                     <td class="td2"><a href="/Resume/View?resume_idx=${ro.resume_idx}">${ro.title}</a></td> --%>
<%--                                     <td>${ro.created}</td> --%>
<!--                                     <td> -->
<!--                                         <button name="recommendList" class="btn btn-primary">추천 공고 보러가기</button> -->
<!--                                     </td> -->
<!--                                 </tr> -->
<%--                             </c:forEach> --%>
<!--                         </tbody> -->
<!--                     </table> -->
<!--                 <div>&nbsp;</div> -->
<!--                 <button type="button" id="goWrite" class="btn btn-primary">이력서 작성하기</button> -->
<!--                 <div>&nbsp;</div> -->
<!--                 <div>&nbsp;</div> -->
<!--             <div class="d-flex justify-content-center paging-bottom-container"> -->
<%--                 <%@include file="/WEB-INF/pagination/personPaging.jsp" %> --%>
<!--             </div> -->
<!--                 </div> -->
<!--             </section> -->
<!--         </div> -->
<!-- 	</div> -->

<!-- <script> -->
// 		alert("sdf")
//  		const pagingEls = document.querySelectorAll('#resumeList')
 		
//  		const personinfotab = document.getElementById('personinfo-tab')
//  		const resumetab = document.getElementById('resume-tab')
//  		const applytab = document.getElementById('apply-tab')
//  		const bookmarktab = document.getElementById('bookmark-tab')
 		
//  		const personinfo = document.getElementById('personinfo')
//  		const resume = document.getElementById('resume')
//  		const apply = document.getElementById('apply')
//  		const bookmark = document.getElementById('bookmark')
 
// 	   pagingEls.forEach(pagingEl => {
// 		    pagingEl.addEventListener('click', (e) => {
// 				//alert('dd');
// 		    	e.preventDefault()
	    	
// 				$("#personinfo-tab").removeClass("active");
// 				$("#apply-tab").removeClass("active");
// 				$("#bookmark-tab").removeClass("active");
// 				$("#resume-tab").addClass("active");
				
// 				$("#personinfo").removeClass("show active");
// 				$("#apply").removeClass("show active");
// 				$("#bookmark").removeClass("show active");
// 				$("#resume").addClass("show active");
	    	
// 	    	const href = e.target.href
// 	    	alert(href)
// 	    	//document.load(href)
// 	    	$('#personresume').load(href)
// 	    })
// 	})
//  $('#myresume').load()
<!--  </script> -->

<!-- </body> -->

<!-- </html> -->