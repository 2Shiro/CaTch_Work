<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
	    <div class="main" >        
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
				<button type="button" class="btn btn-outline-primary" onclick="location.href='/Board/WriteForm'">글 작성</button>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='/Board/UpdateForm?board_idx=${vo.board_idx}'">수정</button>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='/Board/Delete?board_idx=${vo.board_idx}">삭제</button>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='/Board?nowpage=1'">목록</button>
			</div>
			
			<div class="comment-section">
			  <h3>댓글</h3>
				<!-- 댓글 추가 -->
			  <form action="/Board/Add" method="post">
			  <div class="comment-form">
			  	<input type="hidden" name="board_idx" value="${ vo.board_idx }">
			  	<input type="hidden" name="id" value="${ sessionScope.login.id }">
			    <textarea id="comment-input" name="content" placeholder="댓글을 입력하세요."></textarea>
			    <button id="comment-submit" class="btn btn-outline-primary" type="submit" >댓글 작성</button>
			  </div>
			  </form>
			  <!-- 댓글 목록 -->
			  <div class="comment-list">
			   		<table>
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
			   							<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" name="goCommentUpdate">
			   								<input type="hidden" id="bcomment_idx" name="bcomment_idx" value="${co.bcomment_idx}">
			   								<input type="hidden" id="bcontent" name="content" value="${co.content}">
			   								수정
			   							</button>
			   							<a class="btn btn-outline-danger" href="/Board/DeleteComment?bcomment_idx=${co.bcomment_idx}&board_idx=${vo.board_idx}">삭제</a>
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
						        <form action="/Board/UpdateComment?bcomment_idx={bvo.bcomment_idx}">
						      <div class="modal-body">
						          <div class="mb-3">
						          <input type="hidden" id="thisidx" name="bcomment_idx">
						          <input type="hidden" id="commentboard_idx" name="board_idx" value="${ vo.board_idx }">
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
<script>
		const goCommentUpdateEls = document.getElementsByName('goCommentUpdate');
		let messagetextEl = document.getElementById('message-text');
		let thisidxEl = document.getElementById('thisidx')
		
		goCommentUpdateEls.forEach((button) => {
		    button.addEventListener('click', (event) => {
		    	//alert('asfwes')
		    		const bcomment_idx = button.querySelector('#bcomment_idx').value;
		    		//alert(bcomment_idx);
		    		const bcontent = button.querySelector('#bcontent').value;
		    		//alert(bcontent)
		    		//messagetextEl += bcontent;
		    		messagetextEl.value = ''
		    		messagetextEl.value += bcontent
		    		//alert(messagetextEl)
		    		thisidxEl.value = ''
		    		thisidxEl.value += bcomment_idx
		    });
		});
</script>																		
</body>
</html>