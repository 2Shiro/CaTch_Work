<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg bg-body-tertiary mb-5">
  <div class="container-fluid">
    <span class="navbar-brand">Navbar</span>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/">Home</a>
        </li>
        <c:if test="${usertype.type == 1 || usertype.type == 0}">
        <li class="nav-item">
          <a class="nav-link" href="/Company/ResumeList?nowpage=1">구직자 이력서</a>
        </li>
        </c:if>
        <c:if test="${usertype.type == 0}">
        <li class="nav-item">
          <a class="nav-link" href="/UserList">사용자 목록</a>
        </li>
        </c:if>
        <c:if test="${usertype.type == 1}">
        <li class="nav-item">
          <a class="nav-link" href="/Company/MyPage?nowpage=1">마이페이지</a>
        </li>
        </c:if>
        <c:if test="${usertype.type == 2}">
        <li class="nav-item">
          <a class="nav-link" href="/MyPage?nowpage=1">개인페이지</a>
        </li>
        </c:if>
        <c:if test="${usertype.type == 0 || usertype.type == 1 || usertype.type == 2}">
        <li class="nav-item">
          <a class="nav-link" href="/Board/PersonBoard?nowpage=1">커뮤니티</a>
        </li>
        </c:if>
      </ul>
    </div>
  </div>
</nav>
