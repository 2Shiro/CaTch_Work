<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link href="/css/start.css" rel="stylesheet" />
<link href="/css/test.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />

</head>
	<%@include file="/WEB-INF/include/header.jsp" %>
	<%@include file="/WEB-INF/include/nav.jsp" %>

<body>
	
	<section>
	<h2>개인정보 수정</h2>
	<form action="/MyPageUpdate" method="POST">
	아이디:<input type="text" value="${ pvo.id }" readonly>
	비밀번호 :<input type="text" value="${ pvo.pwd }" name="pwd">
	<input type="text" value="${ pvo.name }" name="name">
	<input type="text" value="${ pvo.phone }" name="phone">
	<input type="text" value="${ pvo.zip_code }" name="zip_code">
	<input type="text" value="${ pvo.address }" name="address">
	<input type="text" value="${ pvo.social_num }" readonly>
	<input type="submit" value="수정하기" id="goUpdate" class="btn btn-primary">
	</form>
<button type="button" id="goDelete" class="btn btn-danger">회원탈퇴</button>
	</section>
	<%@include file="/WEB-INF/include/footer.jsp" %>
<script>
	const goUpdateEl = document.querySelector('#goUpdate')
	goUpdateEl.addEventListener('click', ()=>{
		alert('수정되었습니다');
	})
	const goDeleteEl = document.querySelector('#goDelete')
	goDeleteEl.addEventListener('click', ()=>{
		
		location.href='/PersonDelete';
		alert('탈퇴처리 되었습니다');
		
	})
</script>
</body>

</html>