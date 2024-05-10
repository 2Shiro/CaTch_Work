<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 작성하기</title>
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
	<div class="person">
		<section>

	<form action="/MyPage/Resume/Update" method="POST">
	
	
	<input type="text"  name="name" value="${vo.name}" readonly>
	<input type="text"  name="phone" value="${vo.phone}" readonly>
	<input type="text"  name="title" value="${vo.title}">
	
	
	<input type="text"  name="image" value="${vo.image}">
	<input type="text"  name="link" value="${vo.link}">
	<textarea rows="3" name="intro">${ vo.intro }</textarea>
	
	<input type="radio" id="option1" name="type" value="1" >
    <label for="option1">공개</label><br>
    <input type="radio" id="option2" name="type" value="0" >
    <label for="option2">비공개</label><br>
	
	
	
	
	<input type="checkbox" name="skill_idx"  value="1"/>Java 
	<input type="checkbox" name="skill_idx"  value="8"/>JavaScript 
	<input type="checkbox" name="skill_idx"  value="2"/>SpringBoot 
	<input type="checkbox" name="skill_idx"  value="6"/>SpringLegacy
	<input type="checkbox" name="skill_idx"  value="7"/>JPA
	<input type="checkbox" name="skill_idx"  value="5"/>DB 
	<input type="checkbox" name="skill_idx"  value="3"/>HTML
	<input type="checkbox" name="skill_idx"  value="4"/>CSS 
	<input type="checkbox" name="skill_idx"  value="9"/>없음  
                
	
	<input type="submit" value="수정하기" id="goUpdate" class="btn btn-primary">
	</form>
	<button class="btn btn-danger" id="goDelete">삭제</button>
	</section>
			
	</div>
	


	
	
	<%@include file="/WEB-INF/include/footer.jsp" %>
<script> 
	const goUpdateEl = document.querySelector('#goUpdate')
	goUpdateEl.addEventListener('click',()=>{
		alert('수정되었습니다');
		location.href='/Resume/Update?resume_idx=${vo.resume_idx}';
	
	})
	const goDeleteEl = document.querySelector('#goDelete')
	goDeleteEl.addEventListener('click',()=>{
		alert('삭제되었습니다');
		location.href='/Resume/Delete?resume_idx=${vo.resume_idx}';
	
	})
	
	
</script>	
	
	

</body>

</html>