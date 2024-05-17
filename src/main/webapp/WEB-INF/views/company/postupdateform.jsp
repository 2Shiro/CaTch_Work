<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고 수정하기</title>
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
				action="/Company/PostUpdate?post_idx=${post.post_idx}" method="post">
				<input type="hidden" id="post_idx" name="post_idx" value="${post.post_idx}">
      <div class="">
					<div class="my-1 mx-auto row">
						<input type="test" class="form-control text-center" id="title" required name="title" value="${post.title}">
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
										name="career" required value="${post.career}">
								</div>
							</div>
							<div class="col-6 row d-flex align-items-center ms-4">
								<div class="col-md-4">
									<h5>연봉</h5>
								</div>
								<div class="col-md-8">
									<input type="text" required class="form-control" id="salary" name="salary" value="${post.salary}">
								</div>
							</div>
						</div>
						<div class="row mt-4">
							<div class="col-6 row d-flex align-items-center">
								<div class="col-md-auto">
									<h5>근무 조건</h5>
								</div>
								<div class="col-3 my-3">
									<select class="form-select" aria-label="jobtype" id="jobtype"
										required name="jobtype">
										<option>선택</option>
										<option value="정규직"
											<c:if test="${post.jobtype == '정규직'}">selected</c:if>>정규직</option>
										<option value="계약직"
											<c:if test="${post.jobtype == '계약직'}">selected</c:if>>계약직</option>
									</select>
								</div>
							</div>
							<div class="col-6 row d-flex align-items-center ms-4">
								<div class="col-md-4">
									<h5>근무 시간</h5>
								</div>
								<div class="col-md-8 d-flex">
									<input class="form-control" type="time" name="gowork" required
										id="gowork" value="${post.gowork}"> <input
										class="form-control ms-3" type="time" name="gohome" required
										id="gohome" value="${post.gohome}">
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
									<input type="text" class="form-control" id="manager" required
										name="manager" value="${post.manager}">
								</div>
							</div>
							<div class="col-6 row d-flex align-items-center ms-4">
								<div class="col-md-4">
									<h5>담당자 번호</h5>
								</div>
								<div class="col-md-8">
									<input type="text" class="form-control" id="mphone" name="mphone" required value="${post.mphone}">
								</div>
							</div>
						</div>
						<div class="row mt-4"">
							<div class="col-6 row d-flex align-items-center">
								<div class="col-md-auto">
									<h5>부서</h5>
								</div>
								<div class="col-md-8">
									<input type="text" class="form-control" id="department"
										name="department" required value="${post.department}">
								</div>
							</div>
						</div>
					<div class="my-1 mx-auto row">
						<label for="deadline" class="form-label">마감 일자</label> <input
							type="date" class="form-control" id="deadline" name="deadline" required value="${post.deadline}">
					</div>
					<div class="my-1 mx-auto row">
						<label for="c_intro" class="form-label">기업 소개</label>
						<textarea rows="10" class="form-control" id="intro"
							name="intro" required>${post.intro}</textarea>

					</div>
					<div class="my-1 mx-auto row">
						<label for="job_intro" class="form-label">업무 소개</label>
						<textarea rows="10" class="form-control" id="explain"
							name="explain" required>${post.explain}</textarea>
					</div>
					<div class="mt-3 mx-auto row">
						<c:forEach var="skill" items="${skill}">
								<div class="col-auto">
									<input type="checkbox" class="btn-check"
										id="skill_${skill.skill_idx }" value="${skill.skill_idx}"
										name="skillIdx" autocomplete="off" 
										<c:forEach var="postSkills" items="${postSkills}">
							                <c:if test="${skill.skill_idx == postSkills.skill_idx}">
							                    checked="checked"
							                </c:if>
							            </c:forEach>>
									<label class="btn btn-outline-primary"
										for="skill_${skill.skill_idx }">${skill.name}</label>
								</div>
							</c:forEach>
					</div>
      </div>
      <div class="">
        <input type="submit" id="post-update" class="btn btn-primary" value="확인">
        <button type="button" class="btn btn-secondary">뒤로</button>
      </div>
      </form>
    </div>
  </div>
</div>
	
	<%@include file="/WEB-INF/include/footer.jsp" %>

</body>
</html>