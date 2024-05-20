<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="/css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="icon" href="/img/CaTchWorkFavicon.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<!--    <div class="container tab-pane fade" id="ex1-tabs-2" role="tabpanel" aria-labelledby="ex1-tab-2"> -->
     <div class="container mt-5">
     <div id="mypostList">
     <h2>나의 공고</h2>
     
        <div id="mypost">
           <table class="table">
             <thead>
               <tr>
                 <th scope="col">번호</th>
                 <th scope="col">공고</th>
                 <th scope="col">담당자</th>
                 <th scope="col">마감기한</th>
               </tr>
             </thead>
             <tbody class="table-group-divider">
                <c:forEach var="postList" items="${response.list}" varStatus="status">
                  <tr>
                    <th scope="row">${status.count}</th>
                    <td>
                    	<a href="/Company/PostDetail?post_idx=${postList.post_idx}">${postList.title}</a>
                    	<input type="hidden" id="post_idx" name="post_idx" value="${postList.post_idx}">
                    </td>
                    <td>${postList.manager}</td>
                    <td>${postList.deadline}</td>
                  </tr>
               </c:forEach>
             </tbody>
           </table>
        <div class="d-flex justify-content-center paging-bottom-container">
			      <%@include file="/WEB-INF/pagination/postListPaging.jsp" %>
			    </div>
        </div>
        </div>
      </div>
       		<script> 
       		alert('dd')
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
 			    	alert(href)
 			    	//document.load(href)
 			    	$('#mypostList').load(href)
 			    })
 			})
    	$('#mypost').load()
    </script>
</body>
</html>