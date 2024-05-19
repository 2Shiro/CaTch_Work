<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 작성하기</title>
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
        #total {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        #profile {
            width: 40%; /* 넓이 비율을 6:4로 설정 */
            margin-right: 20px;
        }
        #info {
            width: 60%; /* 넓이 비율을 6:4로 설정 */
        }
        .input-group-text div {
            display: flex; /* 라디오 버튼을 가로로 정렬 */
            align-items: center;
        }
        .input-group-text div input[type="radio"],
        .input-group-text div label {
            margin-right: 10px; /* 라디오 버튼과 라벨 사이의 간격 조정 */
        }
        img {
            width: 100%; /* 이미지 넓이를 100%로 설정하여 부모 요소에 맞게 조정 */
            height: auto; /* 이미지 높이를 자동으로 조정하여 비율 유지 */
        }
        .input-group-text input {
            width: 100%; /* 입력 필드 넓이를 100%로 설정하여 부모 요소에 맞게 조정 */
        }
      


</style>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link href="/css/start.css" rel="stylesheet" />
<link href="/css/test.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />

</head>
	<%@include file="/WEB-INF/include/header.jsp" %>
	<%@include file="/WEB-INF/include/nav.jsp" %>

<body>

<div class="container mt-5">
    <form action="/Resume/Update" method="POST" enctype="multipart/form-data">
    <input type="hidden" value="${vo.resume_idx}" name="resume_idx">
    

    
        <section class="container">
            <h2>회원 정보</h2>
            <div id="total">
                <div id="profile">
                    <img src="${vo.image}" id="img-thumbnail" name="image" class="img-thumbnail" alt="프로필없음">
                    <div class="input-group mb-3 mt-3">
                        <input type="file" class="form-control" id="file" name="file"
                               aria-describedby="logo">
                        <label class="input-group-text" for="inputGroupFile02">Upload</label>
                    </div>
                </div>
                <div id="info">
                    <div class="input-group mb-3">
                        <input type="hidden" id="user_idx" name="user_idx" value="${vo.user_idx}">
                        <span class="input-group-text" id="inputGroup-sizing-default">이름</span>
                        <input readonly type="text"  name="id" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${vo.name}">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="inputGroup-sizing-default">이메일</span>
                        <input type="text" name="email" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${vo.email}">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="inputGroup-sizing-default">이력서 제목</span>
                        <input type="text" name="title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${vo.title}">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="inputGroup-sizing-default">포트폴리오 주소</span>
                        <input type="text" name="link" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${vo.link}">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="inputGroup-sizing-default">자기소개</span></br>
                        <textarea rows="10" class="form-control" id="job-intro"name="intro"></textarea>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="inputGroup-sizing-default">공개여부</span>
                        <div class="input-group-text">
                            <input type="radio" id="option1" name="type" value="1">
                            <label for="option1">공개</label>
                        </div>
                        <div class="input-group-text">
                            <input type="radio" id="option2" name="type" value="0">
                            <label for="option2">비공개</label>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="inputGroup-sizing-default">기술스택</span>
                        <c:forEach var="skill" items="${ skillList }">
                            <div class="col-auto">
                                <button type="button" class="btn btn-outline-primary skill-btn" name="skill_idx" value="${ skill.skill_idx }">${skill.name }</button>
                            </div>
                        </c:forEach>
                        <input type="hidden" id="selectedSkills" name="skill_idx">
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
<script> 
// 	const goUpdateEl = document.querySelector('#goUpdate')
// 	goUpdateEl.addEventListener('click',()=>{
// 		alert('수정되었습니다');
// 		location.href='/Resume/Update?resume_idx=${vo.resume_idx}';
	
// 	})
	const goDeleteEl = document.querySelector('#goDelete')
	goDeleteEl.addEventListener('click',()=>{
		alert('삭제되었습니다');
		location.href='/Resume/Delete?resume_idx=${vo.resume_idx}';
	
	})
	
	
</script>	
<script>
//선택된 버튼들의 값을 저장할 배열을 선언합니다.
let selectedSkills = [];

// 버튼 요소들을 선택합니다.
const skillBtns = document.querySelectorAll('.skill-btn');

// 각 버튼에 클릭 이벤트를 추가합니다.
skillBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        // 현재 버튼의 선택 상태를 토글합니다.
        btn.classList.toggle('active');
        
        // 버튼의 값이 선택된 상태라면 배열에 추가하고, 그렇지 않다면 배열에서 제거합니다.
        const skillValue = btn.value;
        if (btn.classList.contains('active')) {
            selectedSkills.push(skillValue);
        } else {
            selectedSkills = selectedSkills.filter(skill => skill !== skillValue);
        }

        // 선택된 기술들을 확인하기 위해 콘솔에 출력합니다.
        console.log(selectedSkills);

        // 선택된 기술들의 값을 hidden input에 설정하여 폼으로 전송합니다.
        const skillInput = document.getElementById('selectedSkills');
        skillInput.value = selectedSkills.join(',');
    });
});

// 페이지가 로드될 때 선택된 기술들의 값을 hidden input에 설정합니다.
window.addEventListener('DOMContentLoaded', () => {
    const skillInput = document.getElementById('selectedSkills');
    skillInput.value = selectedSkills.join(',');
});
</script>


<!-- 이미지 업로드 -->
<script>
	document.addEventListener('DOMContentLoaded', () => {
	    //파일 필드 imgfile
	    var fileInput = document.getElementById('file')
	
	    //사진 올라갈 img 태그 img-thumbnail
	    var previewArea = document.getElementById('img-thumbnail')
	
	    //기본 이미지 URL 설정
	    var defaultImage = '/img/cblank_profile.jpg'
	
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