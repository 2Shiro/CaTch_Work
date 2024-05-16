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
	
					<section>
				<div class="mt-5 ms-3">
					<div class="row">
						<div class="my-1 mx-auto row">
							<div class="col-10">
								<h2 class="fw-semibold">
									<input type="text" class="border-0 w-100" id="title">
								</h2>
							</div>

						</div>

					</div>
					<hr>
					<div class="my-1 mx-auto row">

								<div class="input-group mb-3 ">
									<span class="input-group-text text-center" id="pname">이름</span>
									<input type="text" class="form-control" id="name" name="name" value="${vo.name}" readonly>
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="phone">연락처</span>
									 <input	type="text" class="form-control" id="phone" name="phone" value="${vo.phone}" readonly>
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="user_email">이메일</span> 
									<input	type="email" class="form-control" id="user_email">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="title">제목</span> 
									<input	type="text" class="form-control" id="title" name="title" value="${vo.title}">
								</div>

						<div class="my-1 mx-auto row">
							<label for="portfolio" class="form-label">이미지</label> 
							<input	type="text" class="form-control" id="image"name="image" value="${vo.image}">
						</div>
						<div class="my-1 mx-auto row">
							<label for="portfolio" class="form-label">포트폴리오 주소</label> 
							<input	type="text" class="form-control" id="link"name="link" value="${vo.link}">
						</div>
						<div class="my-1 mx-auto row">
						<label for="skills" class="form-label">기술스택</label>
						<input type="hidden" id="selectedSkills" name="skill_idx">

							<button type="button" class="btn btn-secondary skill-btn" name="skill_idx" value="1">Java</button>
							<button type="button" class="btn btn-secondary skill-btn" name="skill_idx" value="8">JavaScript</button>
							<button type="button" class="btn btn-secondary skill-btn" name="skill_idx" value="2">SpringBoot</button>
							<button type="button" class="btn btn-secondary skill-btn" name="skill_idx" value="6">SpringLegacy</button>
							<button type="button" class="btn btn-secondary skill-btn" name="skill_idx" value="7">JPA</button>
							<button type="button" class="btn btn-secondary skill-btn" name="skill_idx" value="5">DB</button>
							<button type="button" class="btn btn-secondary skill-btn" name="skill_idx" value="3">HTML</button>
							<button type="button" class="btn btn-secondary skill-btn" name="skill_idx" value="4">CSS</button>
							<button type="button" class="btn btn-secondary skill-btn" name="skill_idx" value="9">없음</button>

						</div>
						<div class="my-1 mx-auto row">
							<label for="self-intro" class="form-label">자기 소개</label>
							<textarea rows="10" class="form-control" id="job-intro"name="intro">${ vo.intro }</textarea>
						</div>
						<div class="my-1 mx-auto row">
							<label for="self-intro" class="form-label">공개 여부</label>
								<input type="radio" id="option1" name="type" value="1" >
							    <label for="option1">공개</label><br>
							    <input type="radio" id="option2" name="type" value="0" >
							    <label for="option2">비공개</label><br>
						</div>
	
					</div>
					<input type="submit" value="수정하기" id="goUpdate" class="btn btn-primary">
				</div>
			</section>
	

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