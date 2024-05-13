<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원자 이력서 상세 보기</title>
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
   
   <div id="state" class="container">
   		<div>
   			<div class="input-group">
				  <div class="input-group-text">
				    <input class="form-check-input" type="radio" value="합격" aria-label="Radio button for following text input">
				  </div>
				  <input type="text" class="form-control" aria-label="Text input with radio button" value="합격">
				   <div class="input-group-text">
				    <input class="form-check-input" type="radio" value="불합격" aria-label="Radio button for following text input" >
				  </div>
				  <input type="text" class="form-control" aria-label="Text input with radio button" value="불합격">
				</div>
			  <span class="input-group-text">코멘트</span>
			  <textarea class="form-control" aria-label="With textarea" id="comments" name="comments"></textarea>
			</div>
   </div>
   
   <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>