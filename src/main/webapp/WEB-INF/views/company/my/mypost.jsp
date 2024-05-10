<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
   <div class="container">
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
                <c:forEach var="i" begin="1" end="30">
                  <tr>
                    <th scope="row">1</th>
                    <td><a href="#">공고 이름</a></td>
                    <td>담당자</td>
                    <td>마감기한</td>
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
