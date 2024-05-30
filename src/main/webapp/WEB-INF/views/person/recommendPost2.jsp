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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
	<%@include file="/WEB-INF/include/header.jsp" %>
	<%@include file="/WEB-INF/include/nav.jsp" %>

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
             <!-- Search Form -->
        <form action="search" method="get" class="mb-4">
            <div class="input-group">
                <input type="text" name="query" class="form-control" placeholder="검색어를 입력하세요" value="${param.query}">
                <button class="btn btn-primary" type="submit">검색</button>
            </div>
        </form>
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
                  <td><a href="/Company/Viewpost?post_idx=${po.post_idx}">${po.title}</a></td>
                  <td>${po.created}</td>
                  <td>${po.skill_names}</td>
                </tr>
             </c:forEach>
           </tbody>
         </table>
			
	</div>
		   <div class="d-flex justify-content-center paging-bottom-container">
	         <%@include file="/WEB-INF/pagination/personRecommendPaging.jsp" %>
	         </div>
	</div>
	</div>


	
	
	<%@include file="/WEB-INF/include/footer.jsp" %>



</body>

</html>