<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 회원가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<style>
   .main{
      margin : 0 auto; 
      text-align : center;
   }
</style>
<link rel="icon" href="/img/CaTchWorkFavicon.png">
</head>
<body>
         <div class="main" >        
            <a href="/">
                 <img alt="Logo" src="/img/CaTchWork_logo.png" style="width:250px;">
             </a><br><br><br>
       </div>
        <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">개인회원 가입</h4>
        
        <form class="validation-form" novalidate action="/Person/Join" method="post">
          <div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
					  <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요"  requiredaria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					  <label id="idck"></label>					
					</div>
          <div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">비밀번호</span>
					  <input type="password" class="form-control" id="pw1" name="pwd" placeholder="비밀번호를 입력해주세요" required requiredaria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">					
					</div>
          <div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">비밀번호 확인</span>
					  <input type="password" class="form-control" id="pw2" name="passwordck" placeholder="비밀번호를 다시 입력해주세요" required requiredaria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">					
					</div>
					<label id="pwck"></label>
          <div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">이름</span>
					  <input type="text" class="form-control" id="name" name="name" required aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">					
					</div>         
          <div class="input-group">
					  <span class="input-group-text">전화번호</span>
					  <input type="text" name="phone1" aria-label="First name" class="form-control" placeholder="010"><span> - </span>
					  <input type="text" name="phone2" aria-label="Middle name" class="form-control" placeholder="0000"><span> - </span>
					  <input type="text" name="phone3" aria-label="Last name" class="form-control" placeholder="0000">
					</div>
          <div>&nbsp;</div>

          <!-- 우편번호 & 주소 -->
          <div class="input-group mb-3">
					  <button class="btn btn-outline-secondary" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
                               id="zip_code" name="zip_code" placeholder="">우편번호 찾기</button>
					  <input type="text" class="form-control" id="sample6_postcode" name="zip_code" placeholder="우편번호" aria-label="Example text with button addon" aria-describedby="button-addon1">
					</div>

          <div class="mb-3">
            <label for="address">주소</label>
            <input type="text" class="form-control"  id="sample6_address" name="address1" placeholder="주소">
                  <input type="text" class="form-control"  id="sample6_detailAddress" name="address2" placeholder="상세주소">
                  <input type="text" class="form-control"  id="sample6_extraAddress" name="address3" placeholder="참고항목">
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>
          
          <div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">이메일</span>
					  <input type="text" class="form-control" name="email" id="email" placeholder="you@example.com"  required aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">					
					</div>  
          <div class="input-group">
					  <span class="input-group-text">주민등록번호</span>
					  <input type="text" aria-label="First name" name="social_num1" class="form-control" maxlength="6" placeholder="주민등록번호 앞 6자리" required><span> - </span>
					  <input type="text" aria-label="Last name" name="social_num2"  class="form-control" maxlength="7" placeholder="주민등록번호 뒷 7자리" required>
					</div>
          <div>&nbsp;</div>
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <hr class="mb-4">
          
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
    </footer>
  </div>
  
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

$('#id').keyup(
		function() {
			let id = $('#id').val();

			$.ajax({
				url : "/CheckId",
				type : "post",
				data : {
					id : id
				},
				dataType : 'json',
				error : function() {
					$("#idck").html('오류').css('color',
							'red');
				},
				success : function(result) {
					if (result == 1) {
						$("#idck").html('이미 사용중인 아이디입니다.')
								.css('color', 'red');
						isIdDuplicated = true; // 아이디가 중복된 상태로 설정
					} else {
						$("#idck").html('사용가능한 아이디입니다.')
								.css('color', 'blue');
						isIdDuplicated = false; // 아이디가 중복되지 않은 상태로 설정
					}
				}
			})
		})

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
</body>
</html>