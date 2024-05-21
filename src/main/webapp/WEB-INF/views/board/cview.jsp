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
			<div><h3>${cBoardVo.title}</h3></div>
			<div style="text-align:right;"><h4>${cBoardVo.id}</h4></div>
			<div>${ cBoardVo.content }</div>
			</form>	
			<div>&nbsp;</div>
			<div style="text-align:center;">
				<button type="button" class="btn btn-outline-primary" onclick="location.href='/Board/WriteForm'">글 작성</button>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='/Board/UpdateForm?board_idx=${cboard_idx}'">수정</button>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='/Board/Delete?board_idx=${board_idx}'">삭제</button>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='/Board'">목록</button>
			</div>
			
			<div class="comment-section">
			  <h3>댓글</h3>
				<!-- 댓글 추가 -->
			  <form action="/Board/Add" method="post">
			  <div class="comment-form">
			  	<input type="hidden" name="board_idx" value="${ cBoardVo.cboard_idx }">
			  	<input type="hidden" name="id" value="${ sessionScope.login.id }">
<%-- 			  	<input type="hidden" name="user_idx" value="${user_idx}"> --%>
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
			   							<button type="button" class="btn btn-outline-primary" onclick="location.href='/Board/UpdateComment'">수정</button>
			   							<button type="button" class="btn btn-outline-danger" onclick="location.href='/Board/DeleteComment'">삭제</button>
			   						</td>
			   					</tr>		   				
			  				</c:forEach>
			   		</table>
			  </div>
			</div>	
</body>
</html>