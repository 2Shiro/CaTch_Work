<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link href="/css/start.css" rel="stylesheet" />
<link href="/css/test.css" rel="stylesheet" />

<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
	.title{
		text-align: center;
	}
	#goDelete{
		float : right;
	}
	#goUpdate{
		float : right;
		
	}

</style>
</head>
	<%@include file="/WEB-INF/include/header.jsp" %>
	<%@include file="/WEB-INF/include/nav.jsp" %>

<body>
	<div class="person">
	<div class="container">
		<section>

	<form action="/MyPageUpdate" method="POST">
	
	<h2 class="title">개인정보 수정</h2>
					<section>
				<div class="mt-5 ms-3">
					<hr>
					<div class="my-1 mx-auto row">

								<div class="input-group mb-3 ">
									<span class="input-group-text text-center" id="pname">이름</span>
									<input type="text" class="form-control" id="name" name="name" value="${pvo.name}" >
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="pid">아이디</span>
									 <input	type="text" class="form-control" id="id"  value="${pvo.id}" readonly>
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="ppwd">비밀번호</span>
									 <input	type="password" class="form-control" id="pw1" name="pwd" value="${ vo.pwd }">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="ppwd">비밀번호확인</span>
									 <input	type="password" class="form-control" id="pw2"  placeholder="비밀번호를 다시 입력해주세요">
								</div>

								<div>
								<label id="pwck"></label>
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="pphone">연락처</span>
									 <input	type="text" class="form-control" id="phone" name="phone" value="${pvo.phone}" >
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="user_email">이메일</span> 
									<input	type="email" class="form-control" id="user_email" name="email" value="${ vo.email }">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="zip_code">우편번호</span> 
									<input	type="text" class="form-control zipe_code" id="sample6_postcode" name="zip_code"  placeholder="우편번호">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="zip_code" class="btn btn-primary input-group-text" style="border-radius: 0 0.25rem 0.25rem 0;" ><br>
								</div>
<!-- 								<div class="input-group mb-3"> -->
<!-- 								    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="zip_code" class="btn btn-primary" ><br> -->
<!-- 								</div> -->
								<div class="input-group mb-3">
						        	<span class="input-group-text" id="address1">주소</span>
						            <input type="text" class="form-control"  id="sample6_address" name="address" placeholder="주소">
						        </div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="address2">상세주소</span> 
						            <input type="text" class="form-control"  id="sample6_detailAddress" name="address2" placeholder="상세주소">
								</div>


					</div>
					<input type="submit" value="수정하기" id="goUpdate" class="btn btn-primary">
				</div>
			</section>
	

	</form>
					<button type="button" class="btn btn-danger" id="goDelete">회원탈퇴</button>
	</section>
			</div>
	</div>
	

	<%@include file="/WEB-INF/include/footer.jsp" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    //if(extraAddr !== ''){
                       // extraAddr = ' (' + extraAddr + ')';
                    //}
                    // 조합된 참고항목을 해당 필드에 넣는다.
                   // document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                   // document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                //document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script> 
<script>
	$('#pw2').on('keyup', function pwCheck() {
	    var pw1 = $('#pw1').val();
	    var pw2 = $('#pw2').val();
	
	    if (pw1 == pw2) {
	       $('#pwck').html('비밀번호 일치').css('color', 'blue')
	    } else {
	       $('#pwck').html('비밀번호 불일치').css('color', 'red')
	    }
	 })
</script>


	
	
<script>
	const goUpdateEl = document.querySelector('#goUpdate')
	goUpdateEl.addEventListener('click', ()=>{
		alert('수정되었습니다');
	})
	const goDeleteEl = document.querySelector('#goDelete')
	goDeleteEl.addEventListener('click', ()=>{
		// user_idx 선언 후 삽입해야함
		location.href='/PersonDelete';
		alert('탈퇴처리 되었습니다');
		
	})

</script>
</body>

</html>