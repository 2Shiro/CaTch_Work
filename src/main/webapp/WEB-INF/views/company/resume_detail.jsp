<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구직자 이력서 상세 보기</title>
<link rel="stylesheet" href="/css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
   
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
   <%@include file="/WEB-INF/include/header.jsp" %>

   <%@include file="/WEB-INF/include/nav.jsp" %>
   
   <div class="container">
      <h2>구직자 이력서 제목 어쩌구</h2>
      <div>
      	<table class="table border-0">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">First</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">이름</th>
				      <td>이름</td>
				    </tr>
				    <tr>
				      <th scope="row">전화번호</th>
				      <td>전화번호</td>
				    </tr>
				    <tr>
				      <th scope="row">이메일</th>
				      <td>이메일</td>
				    </tr>
				    <tr>
				      <th scope="row">생년월일</th>
				      <td>생년월일</td>
				    </tr>
				    <tr>
				      <th scope="row">주소</th>
				      <td>주소</td>
				    </tr>
				    <tr>
				      <th scope="row">이메일</th>
				      <td>이메일</td>
				    </tr>
				    <tr>
				      <th scope="row">포트폴리오 링크</th>
				      <td><a href="#">포트폴리오 링크</a></td>
				    </tr>
				    <tr>
				      <th scope="row">자기소개</th>
				      <td>자기소개</td>
				    </tr>
				    <tr>
				      <th scope="row">기술</th>
				      <td>기술</td>
				    </tr>
				    
				  </tbody>
				</table>
      </div>
   </div>
   
   <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>