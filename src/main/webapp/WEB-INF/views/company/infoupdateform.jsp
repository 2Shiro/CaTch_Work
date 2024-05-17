<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
<link rel="stylesheet" href="/css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
	#total {
		display: flex;
	}
	#bottom {
		display: flex;
	}
	#profile {
		width: 500px;
		margin-right: 20px;
	}
	#info {
		margin-left: 20px;
	}
	input {
		width: 400px;
	}
	img {
		width: 500px;
		height: 500px;
	}
</style>
<link rel="icon" href="/img/CaTchWorkFavicon.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp" %>

   <%@include file="/WEB-INF/include/nav.jsp" %>

	<div class="container mt-5" >
	<form action="/Company/InfoUpdate" method="POST" enctype="multipart/form-data">
		<section class="container">
			<h2>회원 정보</h2>
			<div id="total">
				<div id="profile">
					<img src="${company.logo}" id="img-thumbnail" name="logo" class="img-thumbnail" alt="프로필없음">
					<div class="input-group mb-3 mt-3">
					  <input type="file" class="form-control" id="file" name="file"
									aria-describedby="logo">
					  <label class="input-group-text" for="inputGroupFile02">Upload</label>
					</div>
				</div>
				<div id="info">
					<div class="input-group mb-3">
						<input type="hidden" id="user_idx" name="user_idx" value="${user.user_idx}">
					  <span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
					  <input readonly type="text"  name="id" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${user.id}">
					</div>
						
						<!-- 원래 비밀번호 저장 -->
						<!-- 비밀번호 가져올 방법 찾기 -->
					  <input type="hidden" id="tbpwd" name="tbpwd" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${user.pwd}">
					
					<div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">비밀번호</span>
            <input type="password" class="form-control" id="pw1" name="pwd" placeholder="비밀번호를 입력해주세요">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">비밀번호 확인</span>
            <input type="password" class="form-control" id="pw2" name="passwordck pwd" placeholder="비밀번호를 다시 입력해주세요">
          </div>
          <label id="pwck"></label>
					
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">이메일</span>
					  <input type="text" name="email" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${user.email}">
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">기업 이름</span>
					  <input type="text" name="name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${company.name}">
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">사업자 번호</span>
					  <input type="text" name="cnum" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${company.cnum}">
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">대표자 이름</span>
					  <input type="text" name="representative" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${company.representative}">
					</div>
					
					
<!--              <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" -->
<!--                                id="zip_code" name="zip_code" placeholder=""  class="btn btn-primary"><br> -->
					<div class="input-group mb-3 mt-3">
<!--              <input type="text" name="zip_code" id="sample6_postcode" class="form-control" placeholder="우편번호"> -->
<!--              <span class="input-group-text" name="zip_code">우편번호</span> -->
					  <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
                               id="zip_code" name="zip_code" placeholder=""  class="btn btn-primary input-group-text" style="width: 200px;">
					  <input type="text" id="sample6_postcode" class="form-control" name="zip_code" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${company.zip_code}">
            <div class="invalid-feedback">
            </div>
          </div>

          <div class="input-group mb-3">
          	<span class="input-group-text" id="sample6_postcode" for="address">주소</span>
            <input type="text" class="form-control"  id="sample6_address" name="address" placeholder="" value="${company.address}">
                  
<!--             <div class="invalid-feedback"> -->
<!--               주소를 입력해주세요. -->
<!--             </div> -->
          </div>
          <div class="input-group mb-3">
          	<span class="input-group-text" id="sample6_postcode" for="address">상세주소</span>
            <input type="text" class="form-control"  id="sample6_detailAddress" name="address2" placeholder="상세주소">
            <input type="hidden" class="form-control"  id="sample6_extraAddress" name="address3" placeholder="참고항목">
<!--             <div class="invalid-feedback"> -->
<!--               주소를 입력해주세요. -->
<!--             </div> -->
          </div>
					
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">기업 구분</span>
					  <input type="text" name="ctype" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${company.ctype}">
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">설립연도</span>
					  <input type="date" name="bdate" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${company.bdate}">
					</div>
				</div>
			</div>
			<div class="">
        <button type="submit" id="info-update" name="info-update" class="btn btn-primary">확인</button>
      	<button type="button" id="info-delete" class="btn btn-danger">삭제</button>
        <a type="button" class="btn btn-secondary" href="javascript:window.history.back();">뒤로</a>
      </div>
		</section>
		</form>
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
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
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

<!-- 이미지 업로드 -->
<script>
	document.addEventListener('DOMContentLoaded', () => {
	    //파일 필드 imgfile
	    var fileInput = document.getElementById('file')
	
	    //사진 올라갈 img 태그 img-thumbnail
	    var previewArea = document.getElementById('img-thumbnail')
	
	    //기본 이미지 URL 설정
	    var defaultImage = '/img/logo_default.jpg'
	
	    //파일 인풋 필드에 변화가 생기면 실행
	    fileInput.addEventListener('change', function (e) {
	        // 파일이 선택되지 않았다면, 미리보기를 기본 이미지로 설정
	        if (fileInput.files.length === 0) {
	            previewArea.src = defaultImage;
	            return; // 함수 실행을 여기서 중단
	        }
	
	        // 선택된 파일을 가져옴
	        var file = e.target.files[0];
	        // FileReader 객체 생성
	        var reader = new FileReader();
	
	        // 파일이 읽히면 실행될 함수 정의
	        reader.onload = function (e) {
	            // 미리보기 이미지의 src 속성을 읽은 파일의 내용으로 설정
	            previewArea.src = e.target.result;
	        }
	
	        // FileReader로 파일 읽기를 시작함
	        reader.readAsDataURL(file);
	    });
	});
</script>
	
</body>
</html>