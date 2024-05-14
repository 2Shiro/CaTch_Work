<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구직자 이력서 보기</title>
<link rel="stylesheet" href="/css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
   #resume {
      margin: 0 auto;
   }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
   <%@include file="/WEB-INF/include/header.jsp" %>

   <%@include file="/WEB-INF/include/nav.jsp" %>
   
   <div class="container">
      <h2>구직자 이력서</h2>
      
      <div id="resume">
         <table class="table">
           <thead>
             <tr>
               <th scope="col">번호</th>
               <th scope="col">이력서</th>
               <th scope="col">이름</th>
               <th scope="col">기술 스택</th>
             </tr>
           </thead>
           <tbody class="table-group-divider">
              <c:forEach var="resumeListInfo" items="${resumeListInfo}">
                <tr>
                  <th scope="row">${resumeListInfo.resumeno}</th>
                  <td><a href="/Company/ResumeDetail?resume_idx=${resumeListInfo.resume_idx}">${resumeListInfo.title}</a></td>
                  <td>${resumeListInfo.username}</td>
                  <td>
                  	<c:forEach var="skillList" items="${resumeListInfo.skillList}">
                  		<button type="button" class="btn btn-sm btn-primary">${skillList.name}</button>
                  	</c:forEach>
                  </td>
                </tr>
             </c:forEach>
           </tbody>
         </table>
      </div>
         
      <div id="pagination">
         <nav aria-label="Page navigation example">
           <ul class="pagination">
             <li class="page-item">
               <a class="page-link" href="#" aria-label="Previous">
                 <span aria-hidden="true">&laquo;</span>
               </a>
             </li>
             <li class="page-item"><a class="page-link" href="#">1</a></li>
             <li class="page-item"><a class="page-link" href="#">2</a></li>
             <li class="page-item"><a class="page-link" href="#">3</a></li>
             <li class="page-item">
               <a class="page-link" href="#" aria-label="Next">
                 <span aria-hidden="true">&raquo;</span>
               </a>
             </li>
           </ul>
         </nav>
      </div>
   </div>
   
   <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>