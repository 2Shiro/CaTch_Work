<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 마이페이지</title>
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
			${pvo.id} 
			${pvo.pwd} 
			${pvo.type} 
			${pvo.per_idx} 
			${pvo.user_idx} 
			${pvo.name} 
			${pvo.phone} 
			${pvo.zip_code} 
			${pvo.address} 
			${pvo.social_num} 
			
			<button type="button" id="goUpdate" class="btn btn-primary">수정하기</button>
		</section>
	</div>
	
<div>=====================================================================================================================</div>

	<div class="resume">
		<section>
			<c:forEach  var="ro" items="${resumeList}">
				<div class="content1">
					<div class="td1">${ro.num}</div>
					<div class="td2"><a href="/Resume/View"> ${ro.title}</a></div>
					<div class="td3">${ro.created}</div>
				</div>
			</c:forEach>		
		</section>
			<button type="button" id="goWrite" class="btn btn-primary">이력서 작성하기</button>
		
	</div>
	
	
	<%@include file="/WEB-INF/include/footer.jsp" %>
<script>
	const goUpdateEl = document.querySelector('#goUpdate')
	goUpdateEl.addEventListener('click', ()=>{
		location.href='/MyPage/UpdateForm';
		
	})
	
	const goWriteEl = document.querySelector('#goWrite')
	goWriteEl.addEventListener('click',()=>{
		location.href='/MyPage/Resume/WriteForm';	
	})
</script>
</body>

</html>