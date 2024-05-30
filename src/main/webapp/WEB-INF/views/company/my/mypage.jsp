<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<div class="container mt-5" >
		<section class="container">
			<h2 class="mb-3">회원 정보</h2>
			<div id="total">
				<div id="profile">
					<img src="${cvo.logo}" class="img-thumbnail" alt="프로필없음">
				</div>
				<div id="info" class="ml-3">
					<div class="input-group mb-3">
						<input type="hidden" id="user_idx" name="user_idx" value="${vo.user_idx}">
					  <span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
					  <input readonly type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${vo.id}">
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">이메일</span>
					  <input readonly type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${vo.email}">
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">기업 이름</span>
					  <input readonly type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${cvo.name}">
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">사업자 번호</span>
					  <input readonly type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${cvo.cnum}">
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">대표자 이름</span>
					  <input readonly type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${cvo.representative}">
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">우편번호</span>
					  <input readonly type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${cvo.zip_code}">
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">주소</span>
					  <input readonly type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${cvo.address}">
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">기업 구분</span>
					  <input readonly type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${cvo.ctype}">
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">설립연도</span>
					  <input readonly type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${cvo.bdate}">
					</div>
					
					<!-- 평점 -->
					<input type="hidden" id="star" name="star" value="${rate}">
					<div class="d-flex">
						<div class="">
							<button class="btn btn-outline-secondary"
											style="--bs-btn-hover-color: #6c757d; --bs-btn-hover-bg: #fff;">
											기업 평점
							</button>
						</div>
						<div class="rating" style="margin-left: 50px;">
						    <label class="rating__label rating__label--half" for="starhalf">
						        <input type="radio" id="starhalf" class="rating__input" name="rating" value="">
						        <span class="star-icon"></span>
						    </label>
						    <label class="rating__label rating__label--full" for="star1">
						        <input type="radio" id="star1" class="rating__input" name="rating" value="">
						        <span class="star-icon"></span>
						    </label>
						    <label class="rating__label rating__label--half" for="starhalf">
						        <input type="radio" id="starhalf" class="rating__input" name="rating" value="">
						        <span class="star-icon"></span>
						    </label>
						    <label class="rating__label rating__label--full" for="star1">
						        <input type="radio" id="star1" class="rating__input" name="rating" value="">
						        <span class="star-icon"></span>
						    </label>
						    <label class="rating__label rating__label--half" for="starhalf">
						        <input type="radio" id="starhalf" class="rating__input" name="rating" value="">
						        <span class="star-icon"></span>
						    </label>
						    <label class="rating__label rating__label--full" for="star1">
						        <input type="radio" id="star1" class="rating__input" name="rating" value="">
						        <span class="star-icon"></span>
						    </label>
						    <label class="rating__label rating__label--half" for="starhalf">
						        <input type="radio" id="starhalf" class="rating__input" name="rating" value="">
						        <span class="star-icon"></span>
						    </label>
						    <label class="rating__label rating__label--full" for="star1">
						        <input type="radio" id="star1" class="rating__input" name="rating" value="">
						        <span class="star-icon"></span>
						    </label>
						    <label class="rating__label rating__label--half" for="starhalf">
						        <input type="radio" id="starhalf" class="rating__input" name="rating" value="">
						        <span class="star-icon"></span>
						    </label>
						    <label class="rating__label rating__label--full" for="star1">
						        <input type="radio" id="star1" class="rating__input" name="rating" value="">
						        <span class="star-icon"></span>
						    </label>
						</div>
					</div>
				</div>
			</div>
			<div class="mt-3">
        <a id="info-update" name="info-update" class="btn btn-primary" href="/Company/InfoUpdateForm?user_idx=${vo.user_idx}">수정</a>
      </div>
		</section>
	</div>
