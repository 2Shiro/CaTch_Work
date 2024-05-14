<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 마이페이지</title>
<style>
/* 모달 스타일 */
.modal {
  display: none; /* 초기에는 숨겨진 상태 */
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0,0,0,0.4);
}

/* 모달 컨텐츠 스타일 */
.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* 모달 닫기 버튼 스타일 */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
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
  <%@include file="/WEB-INF/include/person_mypage_nav.jsp" %>
<body>
	<div class="person">
		<section>
			${pvo.id} 
			${pvo.pwd} 
			${pvo.type} 
			${pvo.per_idx} 
			${pvo.user_idx} 
			${pvo.name} 
			${pvo.phone} 
			${pvo.zip_code} 
			${pvo.address} 
			${pvo.social_num} 
			
			<button type="button" id="goUpdate" class="btn btn-primary">수정하기</button>
		</section>
	</div>
	
<div>=====================================================================================================================</div>

	<div class="resume">
		<section>
			<c:forEach  var="ro" items="${resumeList}">
				<div class="content1">
					<div class="td1">${ro.num}</div>
					<div class="td2"><a href="/Resume/View?resume_idx=${ro.resume_idx}"> ${ro.title}</a></div>
					<div class="td3">${ro.created}</div>
					<div class="td4"><button name="recommend" class="btn btn-primary">추천 공고</button></div>
					<div class="output"></div>
				</div>
			</c:forEach>		
		</section>
			<button type="button" id="goWrite" class="btn btn-primary">이력서 작성하기</button>
		
	</div>
<div>=====================================================================================================================</div>

	<div class="apply">
		<c:forEach  var="po" items="${applyList}">
			<div class="content2">
				
				<div class="td1">${po.row_num}</div>
				<div class="td2"><a href="/Post?post_idx=${po.post_idx}"> ${po.title}</a></div>
				<div class="td3">${po.salary}</div>
				<div class="td4">${po.career}</div>
				<div class="td5">${po.manager}</div>
				<div class="td6">${po.mphone}</div>
				<div class="td7">${po.created}</div>
				<div class="td8"><button name="apply" class="btn btn-primary">지원 현황</button></div>
				<div class="output"></div>
				
			</div>
		</c:forEach>
	</div>
	
	<!-- 기존 JSP 파일 내의 모달 창 HTML -->
<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <div id="modalData"></div>
  </div>
</div>
	<%@include file="/WEB-INF/include/footer.jsp" %>
<script>
	const goUpdateEl = document.querySelector('#goUpdate')
	goUpdateEl.addEventListener('click', ()=>{
		location.href='/MyPage/UpdateForm';
		
	})
	
	const goWriteEl = document.querySelector('#goWrite')
	goWriteEl.addEventListener('click',()=>{
		location.href='/MyPage/Resume/WriteForm';	
	})
	

	document.addEventListener('DOMContentLoaded', () => {
	    const recommendBtns = document.querySelectorAll('.resume .content1 .td4 button[name="recommend"]');
	    
	    recommendBtns.forEach(btn => {
	        btn.addEventListener('click', () => {
	            const resume_idx = btn.closest('.content1').querySelector('.td2 a').getAttribute('href').split('=')[1];
	            //alert(resume_idx);
	            const url = '/Resume/GetRecommendList?resume_idx='+resume_idx;
	            const outputEl = btn.closest('.content1').querySelector('.output');
	            
	            // 상태 변수 선언
	            let isOpen = outputEl.classList.contains('open');
	            
	            if (isOpen) {
	                outputEl.innerHTML = ''; // 해당 리스트의 출력 요소 초기화
	                outputEl.classList.remove('open');
	            } else {
	                fetch(url)
	                .then(response => response.json())
	                .then(postList => {
	                    outputEl.innerHTML = ''; // 해당 리스트의 출력 요소 초기화
	                    postList.forEach(post => {
	                        let html =  '<p>'+post.row_num+'</p>'
	                            html +=  '<p>title:'+post.title+'</p>'
	                            html +=  '<p>career:'+post.career+'</p>'
	                            html +=  '<p>salary:'+post.salary+'</p>'
	                            html +=  '<p>mphone:'+post.mphone+'</p>'
	                            html +=  '<p>created:'+post.created+'</p>'
	                        ;
	                       outputEl.innerHTML += html; // 해당 리스트의 출력 요소에 HTML 추가
	                    });
	                    outputEl.classList.add('open');
	                })
	                .catch(error => {
	                    console.dir(error);
	                    console.log(error);
	                    alert(error)
	                });
	            }
	        });
	    });
	});
	
	
	
	
	
	
// 	document.addEventListener('DOMContentLoaded', () => {
// 	    const applyBtns = document.querySelectorAll('.apply .content2 .td8 button[name="apply"]');
	    
// 	    applyBtns.forEach(btn => {
// 	        btn.addEventListener('click', () => {
// 	            const post_idx = btn.closest('.content2').querySelector('.td2 a').getAttribute('href').split('=')[1];
// 	            //alert(post_idx);
// 	            const url = '/Resume/GetApplyList?post_idx='+post_idx;
// 	            const outputEl = btn.closest('.content2').querySelector('.output');
	            
// 	            // 상태 변수 선언
// 	            let isOpen = outputEl.classList.contains('open');
	            
// 	            if (isOpen) {
// 	                outputEl.innerHTML = ''; // 해당 리스트의 출력 요소 초기화
// 	                outputEl.classList.remove('open');
// 	            } else {
// 	                fetch(url)
// 	                .then(response => response.json())
// 	                .then(resumeList => {
// 	                    outputEl.innerHTML = ''; // 해당 리스트의 출력 요소 초기화
// 	                    resumeList.forEach(resume => {
// 	                        let html =  '<p>'+resume.row_num+'</p>'
// 	                            html +=  '<p>이름:'+resume.name+'</p>'
// 	                            html +=  '<p>제목:'+resume.rtitle+'</p>'
// 	                            html +=  '<p>전화:'+resume.phone+'</p>'
// 	                            html +=  '<p>합격:'+resume.state+'</p>'
// 	                            html +=  '<p>지원날짜:'+resume.created+'</p>'
// 	                            html +=  '<button class="btn btn-primary" name="result">결과보기</button>'; // 클래스 추가
// 	                            html +=  '<input type="hidden" value="${resume.apply_idx}" name="apply_idx"'; // 클래스 추가
// 	                        ;
// 	                       outputEl.innerHTML += html; // 해당 리스트의 출력 요소에 HTML 추가
// 	                    });

// 	                    // 결과보기 버튼에 이벤트 리스너 추가
// 						const resultButtons = outputEl.querySelectorAll('button[name="result"]'); // 클래스로 선택
// 	                    resultButtons.forEach(button => {
// 	                        button.addEventListener('click', () => {
	                         	
// 	                            //alert('결과보기 버튼 클릭됨');
// 	                            const apply_idx = document.getElementsByName('apply_idx');
// 	                            const url = '/GetState?apply_idx='+apply_idx;
	                            
	                            
// 	                            fetch(url)
	                            
	                            
// 	                        });
// 	                    });

// 	                    outputEl.classList.add('open');
// 	                })
// 	                .catch(error => {
// 	                    console.dir(error);
// 	                    console.log(error);
// 	                    alert(error)
// 	                });
// 	            }
// 	        });
// 	    });
// 	});

document.addEventListener('DOMContentLoaded', () => {
    const applyBtns = document.querySelectorAll('.apply .content2 .td8 button[name="apply"]');
    
    applyBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            const post_idx = btn.closest('.content2').querySelector('.td2 a').getAttribute('href').split('=')[1];
            const url = '/Resume/GetApplyList?post_idx='+post_idx;
            const outputEl = btn.closest('.content2').querySelector('.output');
            
            // 상태 변수 선언
            let isOpen = outputEl.classList.contains('open');
            
            if (isOpen) {
                outputEl.innerHTML = ''; // 해당 리스트의 출력 요소 초기화
                outputEl.classList.remove('open');
            } else {
                fetch(url)
                .then(response => response.json())
                .then(resumeList => {
                    outputEl.innerHTML = ''; // 해당 리스트의 출력 요소 초기화
                    resumeList.forEach(resume => {
                        let html =  '<p>'+resume.row_num+'</p>'
                            html +=  '<p>이름:'+resume.name+'</p>'
                            html +=  '<p>제목:'+resume.rtitle+'</p>'
                            html +=  '<p>전화:'+resume.phone+'</p>'
                            html +=  '<p>합격:'+resume.state+'</p>'
                            html +=  '<p>지원날짜:'+resume.created+'</p>'
                            html +=  '<button class="btn btn-primary result-btn">결과보기</button>'; // 클래스 추가
                            html +=  '<input type="hidden" value="'+resume.apply_idx+'" name="apply_idx">'; // 클래스 추가
                        ;
                          
                       outputEl.innerHTML += html; // 해당 리스트의 출력 요소에 HTML 추가
                    });

                    // 결과보기 버튼에 이벤트 리스너 추가
                    const resultButtons = outputEl.querySelectorAll('.result-btn'); // 클래스로 선택
                    resultButtons.forEach((button,i) => {
                        button.addEventListener('click', () => {
                            // 결과보기 버튼을 클릭했을 때 실행될 내용 작성
							const apply_idx = btn.closest('.content2').querySelector('[type=hidden]');
                            console.dir(apply_idx.value);
                            alert(apply_idx.value);
                            const modal = document.getElementById('myModal');
                            //console.log(modal);
                            const modalData = document.getElementById('modalData');
                            //alert('33');
                            // 모달 창 열기
                            //modal.style.display = "block";
                            
                            // fetch로 데이터 가져오기
                            const modalUrl = '/GetState?apply_idx='+apply_idx;
                            fetch(modalUrl)
                                .then(response => response.json())
                                .then(data => {
                                    // 데이터를 모달 창에 출력
                                    modalData.innerHTML = ''; // 초기화
                                    data.forEach(item => {
                                        let modalHtml = '<p>'+item+'</p>';
                                        modalData.innerHTML += modalHtml;
                                    });
                                })
                                .catch(error => console.error('Error:', error));
                        });
                    });

                    outputEl.classList.add('open');
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert(error);
                });
            }
        });
    });
});
</script>
</body>

</html>