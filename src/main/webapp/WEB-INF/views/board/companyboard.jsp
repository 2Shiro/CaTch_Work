<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 게시판</title>
<link rel="stylesheet" href="/css/common.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/board.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<style>
	.container {
		margin: 0 auto;
		text-align: center;
	}
</style>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
<link rel="icon" href="/img/CaTchWorkFavicon.png">
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>

	<%@include file="/WEB-INF/include/nav.jsp"%>

	<%@include file="/WEB-INF/include/boardnav.jsp" %>
	
	<div class="container">
				<div class="mt-5">
				<h3>기업 Q&A</h3>
				<form class="d-flex justify-content-end mt-3" role="search"
							action="/Board/CompanyBoard?nowpage=1" method="POST">
							<c:choose>
								<c:when test="${keyword eq 'none'}">
									<input class="form-control me-2" style="width: 300px;" type="search"
													placeholder="제목이나 내용을 입력해주세요." aria-label="Search" id="keyword" name="keyword">
								</c:when>
								<c:otherwise>
									<input class="form-control me-2" style="width: 300px;" type="search"
													placeholder="제목이나 내용을 입력해주세요." aria-label="Search" id="keyword" name="keyword" value="${keyword}">
								</c:otherwise>
							</c:choose>
						<button class="btn btn-outline-primary" style="width: 110px; margin-right: 9px;" type="submit">검색</button>
				</form>
				<table class="table">
					<tr><td colspan="5"><div>&nbsp;</div></td>
					</tr>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>

					<c:forEach var="c" items="${response.list}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td style="text-align: left;"><a
								href="/Board/CView?cboard_idx=${c.cboard_idx}">${c.title}</a></td>
							<td>${c.id}</td>
							<td>${c.created}</td>
							<td>${c.hit }</td>
						</tr>
					</c:forEach>
				</table>
				<div class="d-flex justify-content-center paging-bottom-container">
					<%@include file="/WEB-INF/pagination/cboardPaging.jsp"%>
				</div>
						<div colspan="5" style="text-align: right">
							<button type="button" class="btn btn-outline-primary"
								onclick="location.href='/Board/CWriteForm'">글 작성하기</button>
						</div>
				</div>
			</div>
			<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>