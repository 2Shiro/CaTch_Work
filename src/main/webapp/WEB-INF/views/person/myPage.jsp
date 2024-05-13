<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 마이페이지</title>
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
			<div class="content1">
				
				<div class="td1">${po.row_num}</div>
				<div class="td2"><a href="/Post?post_idx=${po.post_idx}"> ${po.title}</a></div>
				<div class="td3">${po.salary}</div>
				<div class="td4">${po.career}</div>
				<div class="td5">${po.manager}</div>
				<div class="td6">${po.mphone}</div>
				<div class="td7">${po.created}</div>
				<div class="td8"><button name="apply" class="btn btn-primary">지원 현황</button></div>
				<div class="td9"><input type="hidden" value="${ po.resume_idx }" name="resume_idx"></div>
				<div class="output"></div>
				
			</div>
		</c:forEach>
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
	
	
	
	
	
	
	
	document.addEventListener('DOMContentLoaded', () => {
	    const applyBtns = document.querySelectorAll('.apply .content1 .td8 button[name="apply"]');
	    
	    let i= 0;
	    applyBtns.forEach(btn => {
	        btn.addEventListener('click', () => {
	        	const resume_idx = document.getElementsByName('resume_idx')[i].value;
	        		i++;
	            alert(resume_idx)
	            const url = '/Resume/GetApplyList?resume_idx='+resume_idx;
	            const outputEl = btn.closest('.content1').querySelector('.output');
	            
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
	                            html +=  '<p>제목:'+resume.title+'</p>'
	                            html +=  '<p>전화:'+resume.phone+'</p>'
	                            html +=  '<p>합격:'+resume.state+'</p>'
	                            html +=  '<p>지원날짜:'+resume.created+'</p>'
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
</script>
</body>

</html>