<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
   <div class="container" name="postrec">
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
              <c:forEach var="resumeListInfo" items="${resumeListInfo}" varStatus="status">
                <tr>
                  <th scope="row">${status.count}</th>
                  <td>
                  	<a href="/Company/PersonResume?resume_idx=${resumeListInfo.resume_idx}">${resumeListInfo.title}</a>
                  	<input type="hidden" id="resume_idx" name="resume_idx" value="${resumeListInfo.resume_idx}">
                  </td>
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
        
   </div>
