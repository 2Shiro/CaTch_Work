<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
   <div class="container">
     <h2>추천 이력서</h2>
     
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
                  <td><a href="/Company/1/PersonResume">${resumeListInfo.title}</a></td>
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
        <div id="bottom">
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
		      <div id="buttongroup">
		      	<button type="button" class="btn btn-primary d-flex flex-row-reverse" id="newpostbtn" data-bs-toggle="modal" data-bs-target="#newpost">새공고 등록</button>
		      	<%@include file="/WEB-INF/views/company/my/newpostmodal.jsp" %>
		      </div>
      </div>
   </div>
