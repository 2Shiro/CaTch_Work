<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고 상세 보기</title>
<link rel="stylesheet" href="/css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp" %>

   <%@include file="/WEB-INF/include/nav.jsp" %>

	<div class="" id="postdetail">
  <div class="">
    <div class="">
    <form class="needs-validation container"
				action="/Company/MyPostWrite" novalidate id="postForm"
				method="post">
      <div class="">
					<div class="my-1 mx-auto row">
						<h2 class="form-control" id="title" name="title">${post.title}</h2>
					</div>
					<hr>
					<div class="my-1 mx-auto row">
						<div class="row">
							<div class="col-6 row d-flex align-items-center">
								<div class="col-md-auto">
									<h5>지원 자격</h5>
								</div>
								<div class="col-md-8">
									<input type="text" class="form-control" id="career"
										name="career" readonly="readonly" value="${post.career}">
								</div>
							</div>
							<div class="col-6 row d-flex align-items-center ms-4">
								<div class="col-md-4">
									<h5>연봉</h5>
								</div>
								<div class="col-md-8">
									<input type="text" class="form-control" id="salary" name="salary" readonly="readonly" value="${post.salary}">
								</div>
							</div>
						</div>
						<div class="row mt-4">
							<div class="col-6 row d-flex align-items-center">
								<div class="col-md-auto">
									<h5>근무 조건</h5>
								</div>
								<div class="col-md-8">
									<select class="form-select" aria-label="job_type" id="job_type" name="job_type" required>
										<option value="" selected disabled>선택</option>
										<option value="정규직">정규직</option>
										<option value="계약직">계약직</option>
									</select>
								</div>
							</div>
							<div class="col-6 row d-flex align-items-center ms-4">
								<div class="col-md-4">
									<h5>근무 시간</h5>
								</div>
								<div class="col-md-8 d-flex">
									<input class="form-control" type="time" name="gowork" 
										id="gowork" readonly="readonly" value="${post.gowork}"> <input
										class="form-control ms-3" type="time" name="gohome"
										id="gohome" readonly="readonly" value="${post.gohome}">
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-4"">
							<div class="col-6 row d-flex align-items-center">
								<div class="col-md-auto">
									<h5>담당자</h5>
								</div>
								<div class="col-md-8">
									<input type="text" class="form-control" id="manager"
										name="manager" readonly="readonly" value="${post.manager}">
								</div>
							</div>
							<div class="col-6 row d-flex align-items-center ms-4">
								<div class="col-md-4">
									<h5>담당자 번호</h5>
								</div>
								<div class="col-md-8">
									<input type="text" class="form-control" id="mphone" name="mphone" readonly="readonly" value="${post.mphone}">
								</div>
							</div>
						</div>
					<div class="my-1 mx-auto row">
						<label for="deadline" class="form-label">마감 일자</label> <input
							type="text" class="form-control" id="deadline" name="deadline" readonly="readonly" value="${post.deadline}">
					</div>
					<div class="my-1 mx-auto row">
						<label for="c_intro" class="form-label">기업 소개</label>
						<textarea rows="10" class="form-control" id="intro"
							name="intro" readonly="readonly">${post.intro}</textarea>

					</div>
					<div class="my-1 mx-auto row">
						<label for="job_intro" class="form-label">업무 소개</label>
						<textarea rows="10" class="form-control" id="explain"
							name="explain" readonly="readonly">${post.explain}</textarea>
					</div>
					<div class="mt-3 mx-auto row">
						<c:forEach var="skill" items="${skill}">
							<div class="col-auto">
								<button type="button" class="btn btn-primary">${skill.name}</button>
							</div>
						</c:forEach>
						<input type="hidden" id="defaultSkillIdx" name="skillIdx" value="0">
					</div>
      </div>
      <div class="">
        <button type="submit" id="post-submit" class="btn btn-primary">수정</button>
        <button type="button" class="btn btn-secondary">뒤로</button>
      </div>
      </form>
    </div>
  </div>
</div>
	
	<hr>
	<%@include file="/WEB-INF/views/company/post/post_participateList.jsp" %>
	<hr>
	<%@include file="/WEB-INF/views/company/post/post_recommendList.jsp" %>
	<%@include file="/WEB-INF/include/footer.jsp" %>

</body>
</html>