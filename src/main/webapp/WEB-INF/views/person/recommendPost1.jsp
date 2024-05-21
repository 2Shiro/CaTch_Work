<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 상세보기</title>
<link rel="stylesheet" href="/css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="icon" href="/img/CaTchWorkFavicon.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<div class="recommendPost">
	<div>&nbsp;</div>
		 <div class="container">
		<div>
			<h2>${vo.title}</h2>
		</div>
     <h2>추천 공고 목록</h2>
	<div>&nbsp;</div>
	<div>&nbsp;</div>
	<div>&nbsp;</div>
     
        <div id="recommend">
         <table class="table">
           <thead>
             <tr>
               <th scope="col">번호</th>
               <th scope="col">공고제목</th>
               <th scope="col">마감기한</th>
               <th scope="col">기술 스택</th>
             </tr>
           </thead>
           <tbody class="table-group-divider">
              <c:forEach var="po" items="${response.list}" varStatus="status">
                <tr>
                  <th scope="row">${status.count}</th>
                  <td><a href="/Company/1/PersonResume">${po.title}</a></td>
                  <td>${po.created}</td>
                  <td>${po.skill_names}</td>
                </tr>
             </c:forEach>
           </tbody>
         </table>
			
	</div>

	</div>
            <div class="d-flex justify-content-center paging-bottom-container">
                <%@include file="/WEB-INF/pagination/personPaging.jsp" %>
            </div>
	</div>


	
	<script>
	alert('ddsfdsdf')</script>

<script>

		alert('dddddd');
 		const pagingEls = document.querySelectorAll('#resumeList')
 		
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
				alert('dd');
		    	e.preventDefault()
	    	
				$("#personinfo-tab").removeClass("active");
				$("#apply-tab").removeClass("active");
				$("#bookmark-tab").removeClass("active");
				$("#resume-tab").addClass("active");
				
				$("#personinfo").removeClass("show active");
				$("#apply").removeClass("show active");
				$("#bookmark").removeClass("show active");
				$("#resume").addClass("show active");
	    	
	    	const href = e.target.href
	    	alert(href)
	    	//document.load(href)
	    	$('#resumeList').load(href)
	    })
	})
 $('#resume').load()
 </script>

</body>

</html>