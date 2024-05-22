<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>홈 게시판</title>
<link rel="stylesheet" href="/css/common.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="icon" href="/img/CaTchWorkFavicon.png">
<style>
	.main{text-align:center;}
	 h2{ text-align:center; }
	 .content{
	 	 width:65%;
	 	 height:300px;
	 	 text-align:left;
	 	 margin: 0 auto;
 		 background-color : #EEE;
		 border-radius: 30px;
		 padding : 5%;
	 }
  
   textarea  {
      height: 300px;
      width : 100%;
   }
   
.comment-section {
  margin-top: 30px;
  padding: 20px;
  background-color: #f5f5f5;
  border-radius: 5px;
}

.comment-form {
  display: flex;
  flex-direction: column;
  margin-bottom: 20px;
}

.comment-form textarea {
  margin-bottom: 10px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  height:100px;
}

.comment-form button {
  align-self: flex-end;
  padding: 8px 16px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.comment-list {
  list-style-type: none;
  padding: 0;
}

.comment-list li {
  margin-bottom: 10px;
  padding: 10px;
  background-color: #fff;
  border: 1px solid #ccc;
  border-radius: 5px;
}
	table{
				 width: 100%;
				 tr{
				 		height: 50px;
				 		}
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>

	<%@include file="/WEB-INF/include/nav.jsp"%>	    <div class="main" >        
            <a href="/">
                 <img alt="Logo" src="/img/logo.png" style="width:250px;">
             </a><br><br><br>          
      </div>
			<form class="content">
			<div><h3>${vo.title}</h3></div>
			<div style="text-align:right;"><h4>${vo.id}</h4></div>
			<div>${ vo.content }</div>
			</form>	
			<div>&nbsp;</div>
			<div style="text-align:center;">
				<c:choose>
					<c:when test="${ usertype.type eq 0 }">
						<button type="button" class="btn btn-outline-primary" onclick="location.href='/Board/UpdateHForm?hboard_idx=${vo.hboard_idx}'">수정</button>
						<button type="button" class="btn btn-outline-primary" onclick="location.href='/Board/DeleteHBoard?hboard_idx=${vo.hboard_idx}'">삭제</button>
					</c:when>
					<c:when test="${ vo.user_idx == usertype.user_idx }">
						<button type="button" class="btn btn-outline-primary" onclick="location.href='/Board/UpdateHForm?hboard_idx=${vo.hboard_idx}'">수정</button>
						<button type="button" class="btn btn-outline-primary" onclick="location.href='/Board/DeleteHBoard?hboard_idx=${vo.hboard_idx}'">삭제</button>
					</c:when>
				</c:choose>
				
					
<%-- 				<button type="button" class="btn btn-outline-primary" onclick="location.href='/Board/UpdateHForm?hboard_idx=${vo.hboard_idx}'">수정</button> --%>
<%-- 				<button type="button" class="btn btn-outline-primary" onclick="location.href='/Board/DeleteHBoard?hboard_idx=${vo.hboard_idx}'">삭제</button> --%>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='/Board/HomeBoard?nowpage=1'">목록</button>
			</div>
			
			<div class="comment-section">
			  <h3>댓글</h3>
				<!-- 댓글 추가 -->
			  <form action="/Board/AddHComment" method="post">
				  <div class="comment-form">
				  	<input type="hidden" name="hboard_idx" value="${ vo.hboard_idx }">
				  	<input type="hidden" name="id" value="${ sessionScope.login.id }">
				  	<input type="hidden" name="user_idx" value="${ vo.user_idx }">
				    <textarea id="comment-input" name="content" placeholder="댓글을 입력하세요."></textarea>
				    <button type="submit"  id="comment-submit" class="btn btn-outline-primary" >댓글 작성</button>
				  </div>
			  </form>
			  <!-- 댓글 목록 -->
			  <div class="comment-list">
			   		<table style="border:none;">
			   			<tr>
			   				<td colspan="3"><h3>댓글</h3></td>
			   			</tr>
			 			  	<c:forEach var="co" items="${commentList}">
					   			<tr style="background-color:white;  width:80%; border-top:solid 1px black;">
					   				<td>${co.id}</td>
					   				<td>${co.content }</td>
					   				<td style="text-align:right">${co.created}</td>
					   			</tr>
			   					<tr>
			   						<td colspan="3" style="text-align:right;">
   										<c:choose>
												<c:when test="${ usertype.type eq 0 }">			   									   						
					   							<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" name="goCommentUpdate">
					   								<input type="hidden" id="hcomment_idx" name="hcomment_idx" value="${co.hcomment_idx}">
					   								<input type="hidden" id="hcontent" name="content" value="${co.content}">
					   								수정
					   							</button>
					   							<a class="btn btn-outline-danger" href="/Board/DeleteHComment?hcomment_idx=${co.hcomment_idx}&hboard_idx=${vo.hboard_idx}">삭제</a>
					   						</c:when>
			   								<c:when test="${ co.user_idx == usertype.user_idx }">
					   							<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" name="goCommentUpdate">
					   								<input type="hidden" id="hcomment_idx" name="hcomment_idx" value="${co.hcomment_idx}">
					   								<input type="hidden" id="hcontent" name="content" value="${co.content}">
					   								수정
					   							</button>
					   							<a class="btn btn-outline-danger" href="/Board/DeleteHComment?hcomment_idx=${co.hcomment_idx}&hboard_idx=${vo.hboard_idx}">삭제</a>
			   								</c:when>
			   							</c:choose>
			   							
			   						</td>
			   					</tr>		   				
			  				</c:forEach>
			   		</table>
			  </div>
			</div>	
			<!-- modal 내용 -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">댓글 수정</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						        <form action="/Board/UpdateHComment" method="post">
						      <div class="modal-body">
						          <div class="mb-3">
						          <input type="hidden" id="thisidx" name="hcomment_idx">
						          <input type="hidden" id="commentboard_idx" name="hboard_idx" value="${ vo.hboard_idx }">
						            <textarea class="form-control" id="message-text" name="content"></textarea>
						          </div>	        
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						        <button type="submit" class="btn btn-primary">수정하기</button>
						      </div>
						      </form>
						    </div>
						  </div>
						</div>
						
			<%@include file="/WEB-INF/include/footer.jsp"%>
<script>
		const goCommentUpdateEls = document.getElementsByName('goCommentUpdate');
		let messagetextEl = document.getElementById('message-text');
		let thisidxEl = document.getElementById('thisidx')
		
		goCommentUpdateEls.forEach((button) => {
		    button.addEventListener('click', (event) => {
	    			const hcomment_idx = button.querySelector('#hcomment_idx').value;
		    	//alert('asfwes')
		    		const hcontent = button.querySelector('#hcontent').value;
		    		messagetextEl.value = ''
		    		messagetextEl.value += hcontent
		    		thisidxEl.value = ''
		    		thisidxEl.value += hcomment_idx
		    });
		});
</script>																		
</body>
</html>