<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Modal -->
<div class="modal modal-xl fade" id="newpost" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <form class="needs-validation container"
				action="/Company/MyPostWrite" novalidate id="postForm"
				method="post">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">새로운 공고</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <h2 class="modal-title" id="staticBackdropLabel">공고 등록하기</h2>
					<hr>
					<div class="my-1 mx-auto row">
						<label for="post_name" class="form-label">공고명</label> <input
							type="text" class="form-control" id="title" name="title" required="required"
							placeholder="제목을 입력해주세요.">
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
										name="career" required="required">
								</div>
							</div>
							<div class="col-6 row d-flex align-items-center ms-4">
								<div class="col-md-4">
									<h5>연봉</h5>
								</div>
								<div class="col-md-8">
									<input type="text" class="form-control" id="salary" name="salary" required>
								</div>
							</div>
						</div>
						<div class="row mt-4">
							<div class="col-6 row d-flex align-items-center">
								<div class="col-md-auto">
									<h5>근무 조건</h5>
								</div>
								<div class="col-md-8">
									<select class="form-select" aria-label="job_type" id="jobtype" name="jobtype" required>
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
										id="gowork" value="09:00" required> <input
										class="form-control ms-3" type="time" name="gohome"
										id="gohome" value="18:00" required>
								</div>
							</div>
						</div>
					
					<div class="row mt-4"">
							<div class="col-6 row d-flex align-items-center">
								<div class="col-md-auto">
									<h5 style="margin-right:25px;">담당자</h5>
								</div>
								<div class="col-md-8">
									<input type="text" class="form-control" id="manager"
										name="manager" required="required">
								</div>
							</div>
							<div class="col-6 row d-flex align-items-center ms-4">
								<div class="col-md-4">
									<h5>담당자 번호</h5>
								</div>
								<div class="col-md-8">
									<input type="text" class="form-control" id="mphone" name="mphone" required>
								</div>
							</div>
						</div>
						<div class="row mt-4">
							<div class="col-6 row d-flex align-items-center">
								<div class="col-md-auto">
									<h5 style="margin-right:45px;">부서</h5>
								</div>
								<div class="col-md-8">
<!-- 									<input type="text" class="form-control" id="department" -->
<!-- 										name="department"> -->
										<select class="form-select" aria-label="department" id="department" name="department" required>
											<option value="" selected disabled>선택</option>
											<option value="기획">기획</option>
											<option value="사무">사무</option>
											<option value="인사">인사</option>
											<option value="회계">회계</option>
											<option value="마케팅">마케팅</option>
											<option value="개발">개발</option>
											<option value="디자인">디자인</option>
											<option value="물류">물류</option>
											<option value="영업">영업</option>
											<option value="고객상담">고객상담</option>
											<option value="금융">금융</option>
											<option value="요식업">요식업</option>
											<option value="엔지니어링">엔지니어링</option>
											<option value="생산">생산</option>
											<option value="교육">교육</option>
											<option value="건축">건축</option>
											<option value="의료">의료</option>
											<option value="미디어">미디어</option>
											<option value="복지">복지</option>
										</select>
								</div>
							</div>
						</div>
					<div class="my-1 mx-auto row">
						<label for="deadline" class="form-label">마감 일자</label> <input
							type="date" class="form-control" id="deadline" name="deadline" required>
					</div>
					<div class="my-1 mx-auto row">
						<label for="c_intro" class="form-label">기업 소개</label>
						<textarea rows="10" class="form-control" id="intro"
							name="intro" placeholder="기업소개를 입력해주세요." required></textarea>

					</div>
					<div class="my-1 mx-auto row">
						<label for="job_intro" class="form-label">업무 소개</label>
						<textarea rows="10" class="form-control" id="explain"
							name="explain" placeholder="업무소개를 입력해주세요." required></textarea>
					</div>
					</div>
					<div class="mt-3 mx-auto row">
						<c:forEach var="skill" items="${skill}">
							<div class="col-auto">
								<input type="checkbox" class="btn-check" id="skill_${skill.skill_idx }" value="${skill.skill_idx}" name="skillIdx"
									autocomplete="off" required> <label
									class="btn btn-outline-primary" for="skill_${skill.skill_idx }">${skill.name }</label>
							</div>
						</c:forEach>
						<input type="hidden" id="defaultSkillIdx" name="skillIdx" value="0">
					</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="submit" id="post-submit" class="btn btn-primary">등록</button>
      </div>
      </form>
    </div>
  </div>
</div>