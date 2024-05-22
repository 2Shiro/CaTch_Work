<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CaTchWork</title>
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

/*.main{text-align:center;}
	.tab-content{
				width:100%;
				text-align:center;
				display: flex;
        justify-content: center;
		}
		

h2,h3{
   text-align:center;
   margin-top : 5%;
}
p{
  margin : 5%;
  }
 textarea{
       width:100%;
       height :100%;
       border: none;
 }*/
.container {
	margin: 0 auto;
	text-align: center;
}

.collapsible {
	background-color: #f1f1f1;
	color: black;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: solid 1px #E7E7E7;
	text-align: left;
	outline: none;
	font-size: 15px;
}

.collapsible:hover {
	background-color: #D1E2FF;
}

.content {
	padding: 0 18px;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	background-color: white;
	border: solid 1px #E7E7E7;
}

.collapsible:after {
	content: '\002B';
	color: white;
	font-weight: bold;
	float: right;
	margin-left: 5px;
}

.faq > .active:after {
	content: "\2212";
}

/*.container {width: 100%;height: 300px;border: 1px solid #000;}    
div.left { width: 50%;float: left; box-sizing: border-box; background: #ff0; }    
div.right { width: 50%; float: right; box-sizing: border-box;  background: #0ff; }*/
</style>
<link rel="icon" href="/img/CaTchWorkFavicon.png">
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

	<div class="main">
		<a href="/"> <img alt="Logo" src="/img/logo.png"
			style="width: 250px;">
		</a><br>
		<br>
		<br>
	</div>
	<!-- 탭 메뉴 -->
	<ul class="nav nav-tabs d-flex justify-content-center" id="myTab"
		role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
				data-bs-target="#home-tab-pane" type="button" role="tab"
				aria-controls="home-tab-pane" aria-selected="true">자유게시판</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="contact-tab" data-bs-toggle="tab"
				data-bs-target="#contact-tab-pane" type="button" role="tab"
				aria-controls="contact-tab-pane" aria-selected="false">기업
				Q&A</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
				data-bs-target="#profile-tab-pane" type="button" role="tab"
				aria-controls="profile-tab-pane" aria-selected="false">홈페이지
				Q&A</button>
		</li>
		<li>
			<button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
				data-bs-target="#nav-contact" type="button" role="tab"
				aria-controls="nav-contact" aria-selected="false">FAQ</button>
		</li>
	</ul>

	<!-- 내용 -->
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="home-tab-pane"
			role="tabpanel" aria-labelledby="home-tab" tabindex="0">
			<div class="container">
				<!-- 자유게시판 -->
				<div class="mt-5">
					<h2>자유게시판</h2>
					<form class="d-flex justify-content-end mt-3" role="search">
						<input class="form-control me-2" style="width: 300px;" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-primary" style="width: 110px; margin-right: 9px;" type="submit">Search</button>
					</form>
				</div>
				<table class="table">
					<tr>
						<td colspan="5" style="text-align: right">
							<button type="button" class="btn btn-outline-primary"
								onclick="location.href='/Board/WriteForm'">글 작성하기</button>
						</td>
					</tr>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>

					<c:forEach var="board" items="${response.list}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td style="text-align: left;"><a
								href="/Board/View?board_idx=${board.board_idx}">${board.title}</a></td>
							<td>${board.id}</td>
							<td>${board.created}</td>
							<td>${board.hit }</td>
						</tr>
					</c:forEach>
				</table>
				
				<div class="d-flex justify-content-center paging-bottom-container">
					<%@include file="/WEB-INF/pagination/boardPaging.jsp"%>
				</div>
			</div>
		</div>

		<!-- 기업 Q&A -->
		<div class="tab-pane fade" id="contact-tab-pane" role="tabpanel"
			aria-labelledby="contact-tab" tabindex="0">
			<div class="container">
				<div class="mt-5">
				<h3>기업 Q&A</h3>
				<form class="d-flex justify-content-end mt-3" role="search">
					<input class="form-control me-2" style="width: 300px;" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-primary" style="width: 110px; margin-right: 9px;" type="submit">Search</button>
				</form>
				<table class="table">
					<tr>
						<td colspan="5" style="text-align: right">
							<button type="button" class="btn btn-outline-primary"
								onclick="location.href='/Board/CWriteForm'">글 작성하기</button>
						</td>
					</tr>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>

					<c:forEach var="c" items="${response2.list}" varStatus="status">
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
				</div>
			</div>
		</div>

		<!-- 홈페이지 Q&A -->

		<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel"
			aria-labelledby="profile-tab" tabindex="0">
			<div class="container">
			<div class="mt-5">
				<h3>홈페이지 Q&A</h3>
				<form class="d-flex justify-content-end mt-3" role="search">
					<input class="form-control me-2" style="width: 300px;" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-primary" style="width: 110px; margin-right: 9px;" type="submit">Search</button>
				</form>
				<table class="table">
					<tr>
						<td colspan="5" style="text-align: right">
							<button type="button" class="btn btn-outline-primary"
								onclick="location.href='/Board/HWriteForm'">글 작성하기</button>
						</td>
					</tr>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>

					<c:forEach var="h" items="${response3.list}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td style="text-align: left;"><a
								href="/Board/HView?hboard_idx=${h.hboard_idx}">${h.title}</a></td>
							<td>${h.id}</td>
							<td>${h.created}</td>
							<td>${h.hit }</td>
						</tr>
					</c:forEach>
				</table>
				<div class="d-flex justify-content-center paging-bottom-container">
					<%@include file="/WEB-INF/pagination/hboardPaging.jsp"%>
				</div>
				</div>
			</div>
		</div>
	</div>


	<!-- FAQ -->
	<div class="tab-pane fade" id="nav-contact" role="tabpanel"
		aria-labelledby="nav-contact-tab">
		<div class="container faq">
			<div  class="mt-5">
			<div class="container-fluid">
				<h2 style="height: 50px;">자주 묻는 질문</h2>
				<div class="container mt-3">
					<div class="left">
						<h3>개인회원 FAQ</h3>
						<c:forEach var="faq" items="${faqList2}">
							<button type="button" class="collapsible"
								onclick="collapse(this);">${faq.question}</button>
							<div class="content">
								<p>${faq.answer}</p>
							</div>
						</c:forEach>
						<td>
					</div>
					<div class="right">
						<h3>기업회원 FAQ</h3>
						<c:forEach var="faq" items="${faqList}">
							<button type="button" class="collapsible"
								onclick="collapse(this);">${faq.question}</button>
							<div class="content">
								<p>${faq.answer}</p>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
	</div>
	
	   <script>
        function collapse(element) {
            var before = document.getElementsByClassName("active")[1]               // 기존에 활성화된 버튼
            if (before && document.getElementsByClassName("active")[1] != element) {  // 자신 이외에 이미 활성화된 버튼이 있으면
                before.nextElementSibling.style.maxHeight = null;   // 기존에 펼쳐진 내용 접고
                before.classList.remove("active");                  // 버튼 비활성화
            }
            element.classList.toggle("active");         // 활성화 여부 toggle

            var content = element.nextElementSibling;
            if (content.style.maxHeight != 0) {         // 버튼 다음 요소가 펼쳐져 있으면
                content.style.maxHeight = null;         // 접기
            } else {
                content.style.maxHeight = content.scrollHeight + "px";  // 접혀있는 경우 펼치기
            }
        }
    </script>

	<script>
		   //alert("페이징")
		       //const pagingEls = document.getElementsByName('pageresume')	       
				 $(document).ready(function() {
				  const pagingEls = document.getElementsByName('pageresume');
				       const personinfotab = document.getElementById('personinfo-tab')
				       const resumetab = document.getElementById('resume-tab')
				       const applytab = document.getElementById('apply-tab')
				       const bookmarktab = document.getElementById('bookmark-tab')
				       
				       const personinfo = document.getElementById('personinfo')
				       const resume = document.getElementById('resume')
				       const apply = document.getElementById('apply')
				       const bookmark = document.getElementById('bookmark')
				   pagingEls.forEach(pagingEl => {
				       pagingEl.addEventListener('click', (e) => {
				          console.dir(e.target)
				          e.preventDefault()
				          
				            $("#personinfo-tab").removeClass("active");
				            $("#apply-tab").removeClass("active");
				            $("#bookmark-tab").removeClass("active");
				            $("#resume-tab").addClass("active");
				            
				            $("#personinfo").removeClass("show active");
				            $("#apply").removeClass("show active");
				            $("#bookmark").removeClass("show active");
				            $("#resume").addClass("show active");
				          
				          let href = e.target.href
				          //alert(href)
				          //document.load(href)
				          $('#personresume').load(href)
				       })
				   })
				    $('#myresume').load()
				 })
 	</script>
</body>
</html>