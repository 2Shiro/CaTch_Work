<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
   <div class="container">				
				<section>
				<div class="mt-5 ms-3">
					<div class="row">
						<div class="my-1 mx-auto row">
							<div class="col-10">
								<h2 class="fw-semibold">
									<input type="text" class="border-0 w-100" id="title"
										value="${ vo.title }" readonly="readonly">
								</h2>
							</div>
							<div class="col-2">
								<input type="text" class="form-control border-0" id="publish"
									readonly="readonly"
									value="공개여부 : <c:choose><c:when test='${vo.type == 1}'>공개</c:when><c:when test='${vo.type == 2}'>비공개</c:when><c:otherwise>상태 미정</c:otherwise>
				              </c:choose>">
							</div>
						</div>

					</div>
					<hr>
					<div class="my-1 mx-auto row">

						<div class="row mt-2">
							<div class="col-6 row d-flex align-items-center">
								<div class="col-md-auto">
									<img alt="profile" src="${vo.link}" style="height: 180px;">
								</div>
							</div>
							<div class="col-6 row ms-4">
								<div class="input-group mb-3 ">
									<span class="input-group-text text-center" id="pname">이름</span>
									<input type="text" class="form-control" id="pname" name="pname"
										readonly="readonly" value="${ info.name }">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="birth">생년월일</span> <input
										type="text" class="form-control" id="birth" name="birth"
										readonly="readonly" value="${ info.social_num }">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="phone">연락처</span> <input
										type="text" class="form-control" id="phone" name="phone"
										readonly="readonly" value="${ info.phone }">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="address">주소</span> <input
										type="text" class="form-control" id="address" name="address"
										readonly="readonly" value="${ info.address }">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="user_email">이메일</span> <input
										type="email" class="form-control" id="user_email"
										readonly="readonly" value="email 넣기"
										name="user_email">
								</div>
							</div>
						</div>

						<div class="my-1 mx-auto row">
							<label for="portfolio" class="form-label">포트폴리오 주소</label> <a
								class="form-control text-decoration-none text-dark"
								id="portfolio" href="${vo.link}">${vo.link}</a>
						</div>
						<div class="my-1 mx-auto row">
							<label for="skills" class="form-label">기술스택</label>
							<div class="mt-3 mx-auto row" id="skills">
								<c:forEach var="skill" items="${ skill }">
									<div class="col-auto">
										<input type="checkbox" class="btn-check"
											id="skill_${skill.skill_idx }" value="${skill.skill_idx}"
											name="skillIdx" autocomplete="off" readonly="readonly">
										<label class="btn btn-outline-primary"
											for="skill_${skill.skill_idx }">${skill.name }</label>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="my-1 mx-auto row">
							<label for="self-intro" class="form-label">업무 소개</label>
							<textarea rows="10" class="form-control" id="job-intro"
								readonly="readonly" name="self-intro">${ vo.intro }</textarea>
						</div>

					</div>
				</div>
			</section>
      </div>
   </div>
