<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구직자 이력서 상세 보기</title>
<link rel="stylesheet" href="/css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
   
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
   <%@include file="/WEB-INF/include/header.jsp" %>

   <%@include file="/WEB-INF/include/nav.jsp" %>
   
   <%@include file="/WEB-INF/views/company/resume/resumeForm.jsp" %>
   
   <hr>
   <c:set var="applyState" value="${applydetail.state}" />

   <c:choose>
   <c:when test="${applyState eq 0}">
   <div id="state" class="container mt-5">
	   <form>
	   		<div>
	   			<div class="input-group">
	   				<input type="hidden" id="apply_idx" name="apply_idx" value="${applydetail.apply_idx}">
					  <div class="input-group-text">
					    <input class="form-check-input" type="radio" name="state" id="state" value="1" aria-label="Radio button for following text input">
					  </div>
					  <input type="text" class="form-control" aria-label="Text input with radio button" value="합격">
					   <div class="input-group-text">
					    <input checked class="form-check-input" type="radio" name="state" id="state" value="2" aria-label="Radio button for following text input">
					  </div>
					  <input type="text" class="form-control" aria-label="Text input with radio button" value="불합격">
					</div>
					<div class="input-group mb-3 mt-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">점수(0 ~ 100)</span>
					  <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
					    min="0" max="100" id="score" name="score" value="0">
					</div>
				  <span class="input-group-text mt-2 justify-content-center">코멘트</span>
				  <textarea class="form-control h-50" rows="8" aria-label="With textarea" id="comments" name="comments" ></textarea>
				</div>
				<div class="mt-3">
					<button type="button" id="state-submit" class="btn btn-primary">확인</button>
	        <a type="button" class="btn btn-secondary" href="javascript:window.history.back();">뒤로</a>
				</div>
	   </form>
	 </div>
	 </c:when>
	 
	 <c:when test="${applyState eq 1 or applyState eq 2}">
	 <div id="state" class="container mt-5">
	 		<div>
	   			<div class="input-group">
	   				<input type="hidden" id="apply_idx" name="apply_idx" value="${apply.apply_idx}">
					  <div class="input-group-text">
					    <input <c:if test="${applydetail.state == 1}">checked</c:if> class="form-check-input" type="radio" name="state" id="state" value="1" aria-label="Radio button for following text input">
					  </div>
					  <input type="text" class="form-control" aria-label="Text input with radio button" value="합격">
					   <div class="input-group-text">
					    <input <c:if test="${applydetail.state == 2}">checked</c:if> class="form-check-input" type="radio" name="state" id="state" value="2" aria-label="Radio button for following text input">
					  </div>
					  <input type="text" class="form-control" aria-label="Text input with radio button" value="불합격">
					</div>
					<div class="input-group mb-3 mt-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">점수(0 ~ 100)</span>
					  <input type="number" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
					    min="0" max="100" id="score" name="score" value="${state.score}">
					</div>
				  <span class="input-group-text mt-2 justify-content-center">코멘트</span>
				  <textarea class="form-control h-50" rows="8" aria-label="With textarea" id="comments" name="comments" >${state.comments}</textarea>
				</div>
				<div class="mt-3">
	        <a type="button" class="btn btn-secondary" href="javascript:window.history.back();">뒤로</a>
				</div>
				</div>
	 </c:when>
	 </c:choose>
	 
   <%@include file="/WEB-INF/include/footer.jsp" %>
   
	<script>
		const stateBtnEl = document.getElementById("state-submit")
	
		stateBtnEl.addEventListener('click', (e) => {
		    let url = '/Company/State'
		    const stateJSON = {
		        //합격 불합격
		        apply_idx: document.querySelector("#apply_idx").value, 
		        resume_idx: document.querySelector("#resume_idx").value,
		        user_idx: document.querySelector("#user_idx").value,
		        comments: document.querySelector("#comments").value,
		        state: document.querySelector('input[name="state"]:checked').value,
		        score: document.querySelector("#score").value
		    }
		    //console.dir(JSON.stringify(state))
		    //console.dir(state)
		    
		    const stateString = JSON.stringify(stateJSON)
	
		    const state = JSON.parse(stateString, (key, value) => {
		    	if (key === 'apply_idx' || key === 'resume_idx' || key === 'user_idx' || key === 'state' || key === 'score') {
		    	    return Number(value);
		    	  }
		    	  return value;
		    })
		    
		    //alert(JSON.stringify(state))
		    
		    const param = {
            method  : 'POST',
            headers : {"Content-Type": "application/json" },
            body    : JSON.stringify(state)
        }
	
		    
		    fetch(url, param)
		    .then(response => {
		    		alert(state)
		    		//alert(url)
		        const msg = (response.ok) ? "평가가 등록되었습니다." : "평가 등록에 실패하였습니다."
		        alert(msg)
		        //window.location.href("http://localhost:9086/Company/Mypage")
		        window.location.reload();
		    })
		})
	</script>
</body>
</html>