<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 목록</title>
<style>
   #serarchform {
   	float: right;
   }
</style>
<link rel="stylesheet" href="/css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="icon" href="/img/CaTchWorkFavicon.png">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@include file="/WEB-INF/include/header.jsp" %>

   <%@include file="/WEB-INF/include/nav.jsp" %>
   
   <div class="container">
      <h2 class="mb-3">사용자 목록</h2>
      
      <form action="/UserList" method="POST">
      <div class="d-flex mb-3" id="serarchform">
      	
      	<c:choose>
      		<c:when test="${searchword eq 'none'}">      		
        		<input class="form-control" type="search" placeholder="아이디 검색" aria-label="Search" name="searchword">
      		</c:when>
      		<c:otherwise>
        		<input class="form-control" type="search" placeholder="아이디 검색" aria-label="Search" id="searchword" name="searchword" value="${searchword}">      		
      		</c:otherwise>
      	</c:choose>
        <button class="btn btn-outline-success" type="submit">Search</button>
      </div>
      
      <div id="resume" class="linkDiv">
         <table class="table">
           <thead>
             <tr>
               <th scope="col">번호</th>
               <th scope="col">타입</th>
               <th scope="col">아이디</th>
               <th scope="col">이름</th>
               <th scope="col">가입일</th>
               <th scope="col"></th>
             </tr>
           </thead>
           <tbody class="table-group-divider">
              <c:forEach var="userList" items="${userList}" varStatus="status">
                <tr>
                  <th scope="row">${status.count}</th>
                  <td>
                  	${userList.id}
                  </td>
                  <td>
                  	<c:if test="${userList.type eq 1}">기업</c:if>
                  	<c:if test="${userList.type eq 2}">개인</c:if>
                  </td>
                  <td>
                  	${userList.name}
                  </td>
                  <td>
											${userList.created}
                  </td>
                  <td>
											<button id="deletebtn" class="btn btn-sm btn-danger" type="button" name="${userList.user_idx}">삭제</button>
                  </td>
                </tr>
             </c:forEach>
             <c:if test="${empty userList}">
								<td colspan="5" class="justify-content-center">결과가 없습니다.</td>
             </c:if>
           </tbody>
         </table>
      </div>
      </form>
   </div>
   
   <%@include file="/WEB-INF/include/footer.jsp" %> 

<script>
	const deleteEl = document.querySelectorAll("#deletebtn")
	
	deleteEl.forEach(btn => {
	    btn.addEventListener('click', (e) => {
	        const isConfirmed = confirm('정말로 삭제하시겠습니까?')
	        const user_idx = e.target.name
	        
	        if (isConfirmed) {
	            alert('삭제처리 되었습니다.')
	            location.href = '/Delete?user_idx=' + user_idx
	        } else {
	            
	        }
	    })
	});
</script>

</body>
</html>