<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 상세보기</title>
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
	<div class="resume">
		<section>
			<div>
				${ vo.title }
			</div>
			<div>
				${ vo.image }
			</div>
			<div>
				<div>${ vo.link }</div>
				<div>${ vo.intro }</div>
				<div>${ vo.skill_names }</div>
			</div>

		</section>
			
	</div>
	
	
	<button class="btn btn-primary" id="goUpdate">수정하기</button>


	
	
	<%@include file="/WEB-INF/include/footer.jsp" %>

<script> 
	const goUpdateEl = document.querySelector('#goUpdate')
	goUpdateEl.addEventListener('click',()=>{
		location.href='/Resume/UpdateForm?resume_idx=${vo.resume_idx}';
	
	})
	
	
</script>

</body>

</html>