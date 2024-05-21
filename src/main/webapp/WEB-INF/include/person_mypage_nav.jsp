<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <div id="mypagetab"> -->
<!-- 	<ul class="nav nav-tabs justify-content-center"> -->
<!-- 	  <li class="nav-item"> -->
<!-- 	    <a class="nav-link active" aria-current="page" href="/MyPage">회원 정보</a> -->
<!-- 	  </li> -->
<!-- 	  <li class="nav-item"> -->
<!-- 	    <a class="nav-link" href="/Resume">이력서</a> -->
<!-- 	  </li> -->
<!-- 	  <li class="nav-item"> -->
<!-- 	    <a class="nav-link" href="/Apply">지원 현황</a> -->
<!-- 	  </li> -->
<!-- 	  <li class="nav-item"> -->
<!-- 	    <a class="nav-link" href="/BookMark">북마크</a> -->
<!-- 	  </li> -->
<!-- 	</ul> -->
<!-- </div> -->


<div id="mypagetab">
    <ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="personinfo-tab" data-bs-toggle="tab"
                    data-bs-target="#personinfo" type="button" role="tab" aria-controls="personinfo"
                    aria-selected="true">회원 정보</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="resume-tab" data-bs-toggle="tab"
                    data-bs-target="#resume" type="button" role="tab" aria-controls="resume"
                    aria-selected="false">이력서</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="apply-tab" data-bs-toggle="tab"
                    data-bs-target="#apply" type="button" role="tab" aria-controls="apply"
                    aria-selected="false">지원현황</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="bookmark-tab" data-bs-toggle="tab"
                    data-bs-target="#bookmark" type="button" role="tab" aria-controls="bookmark"
                    aria-selected="false">북마크</button>
        </li>
    </ul>
</div>
