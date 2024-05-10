<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구직자 이력서 보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp" %>

	<%@include file="/WEB-INF/include/nav.jsp" %>
	<section>
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
				  <tbody>
				  	<c:forEach var="i" begin="1" end="30">
					    <tr>
					      <th scope="row">1</th>
					      <td><a href="#">이력서 이름</a></td>
					      <td>이름</td>
					      <td>기술들</td>
					    </tr>
				    </c:forEach>
				  </tbody>
				</table>
			</div>
		<div>
			페이징
		</div>
	</section>
	<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>