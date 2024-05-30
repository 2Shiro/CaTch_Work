<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>로그인</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
.sticky-footer {
	position: fixed;
	bottom: 0;
	width: 100%;
}
*{ text-align: center;
   margin: 0 auto;}

  input{ margin-top : 8%;
         text-align : center;
         border : 2px solid grey;
         border-radius :10px;
         }
  table
  
  a {text-decoration-line:none;
     color : grey;}
  

}  
#btn{ 
	input{
				width:120px;
        color:white;
        background-color:#5215a6;
        }
}
  .log {
  	margin: 0 auto;
  }
  
table tr{
					td { text-align:center;} }
          }     
ul >li{ margin:0; }    
#loginlogo {
	height: 90px;
} 
hr {
	margin: 0 auto;
	margin-top: 10px;
	width: 300px;
}
#loginimg, #logoutimg, #joinimg {
  	height: 30px;
  }
</style>
<link rel="icon" href="/img/CaTchWorkFavicon.png">
</head>
<body>
		<div class="main">        
            <a href="/">
                 <img alt="Logo" src="/img/CaTchWork_logo.png" style="width:250px;">
             </a><br><br><br>
       </div>

	<!-- 탭 메뉴 -->
	<ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist" >
		<li class="nav-item  role="presentation" style="text-align:right;">
			<button class="nav-link active" id="userinfo-tab" data-bs-toggle="tab"
				data-bs-target="#userinfo" type="button" role="tab" aria-controls="userinfo"
				aria-selected="true">개인회원</button>
		</li>
		<li class="nav-item  " role="presentation" style="text-align:left;">
			<button class="nav-link " id="myreview-tab" data-bs-toggle="tab"
				data-bs-target="#myreview" type="button" role="tab"
				aria-controls="myreview" aria-selected="false">기업회원</button>
		</li>
	</ul>
	
	<!-- 내용 -->
	<div class="tab-content" id="myTabContent">
		<!-- 개인회원 -->
		<div class="tab-pane fade show active mt-5" id="userinfo" role="tabpanel"
			aria-labelledby="userinfo-tab">
		<form  action="/Person/Login" method="post" id="login">
  		 <div class="log">
  		 		<img id="loginlogo" src="/img/personlogin.png" alt="이미지 오류">
	  		 		<hr>
    		 <table>
    		  <input type="hidden" name="type" value=2>
       		<tr>
         		<td colspan="2"><div class="form-floating mb-3">
				 				<input type="text" id="pid" name="id" class="form-control" >
				 				<label for="floatingInput">아이디를 입력하세요</label>
				 		</div></td>
			 		</tr>
       		<tr>
       	 		<td colspan="2">
        		 <div class="form-floating mb-3">
  							<input type="password" class="form-control" name="pwd"  id="ppassword" style="width:300px">
				 				<label for="floatingInput">비밀번호를 입력하세요</label>
				 		</div></td>
       		</tr>
       		<tr id="btn">
        		 <td><br><button type="submit" class="btn btn-primary" style="background-color:#6694f8; color : white; border:white; width : 120px;"><img id="loginimg" src="/img/login.png" alt="그림 오류"></button></td>
        		 <td><br><button type="button" class="btn btn-primary"  onClick="location.href='/Person/JoinForm'" style="background-color:#6694f8; color : white; border:white; width: 120px;">
             		 <img id="loginimg" src="/img/join.png" alt="그림 오류"></button></td>
       		 </tr>     
    		 </table> 
    		 </div>  
   		</form>
</div>
		
		<!-- 기업회원 -->
		<div class="tab-pane fade mt-5" id="myreview" role="tabpanel"
			aria-labelledby="myreview-tab">
		<form  action="/Company/Login" method="post" id="clogin">
  		 <div class="log">
  		 	<img id="loginlogo" src="/img/companylogin.png" alt="이미지 오류">
  		 	<hr>
    		 <table>
    		 <input type="hidden" name="type" value=1>
       		<tr>
         		<td colspan="2"><div class="form-floating mb-3">
				 				<input type="text" id="cid" name="id" class="form-control" >
				 				<label for="floatingInput">아이디를 입력하세요</label>
				 		</div></td>
			 		</tr>
       		<tr>
       	 		<td colspan="2">
        		 <div class="form-floating mb-3">
  							<input type="password" class="form-control" name="pwd"  id="cpassword" style="width:300px">
				 				<label for="floatingInput">비밀번호를 입력하세요</label>
				 		</div></td>
       		</tr>
       		<tr id="btn">
        		 <td><br><button type="submit" class="btn btn-primary" style="background-color:#6694f8; color : white; border:white; width : 120px;"><img id="loginimg" src="/img/login.png" alt="그림 오류"></button></td>
        		 <td><br><button type="button" class="btn btn-primary"  onClick="location.href='/Company/JoinForm'" style="background-color:#6694f8; color : white; border:white; width: 120px;">
             		 <img id="loginimg" src="/img/join.png" alt="그림 오류"></button></td>
       		 </tr>     
    		 </table> 
    		 </div>  
   		</form>
		</div>
	</div>
	<script>
	let key = "${param.key}";
	console.log(key);
	if(key === "userinfo"){
		
		$("#myreview-tab").removeClass("active");
		$("#wishlist-tab").removeClass("active");
		$("#userinfo-tab").addClass("active");
		
		$("#myreview").removeClass("show active");
		$("#wishlist").removeClass("show active");
		$("#userinfo").addClass("show active");
		
	}else if(key === "myreview"){
		
		$("#wishlist-tab").removeClass("active");
		$("#userinfo-tab").removeClass("active");
		$("#myreview-tab").addClass("active");
		
		$("#userinfo").removeClass("show active");
		$("#wishlist").removeClass("show active");
		$("#myreview").addClass("show active");
		
	}
	</script>
</body>
</html>