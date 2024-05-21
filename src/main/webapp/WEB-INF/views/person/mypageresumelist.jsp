<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 페이징 갈아끼우기</title>
<link rel="stylesheet" href="/css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link rel="icon" href="/img/CaTchWorkFavicon.png">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div class="tab-pane fade active show" id="resume" role="tabpanel" aria-labelledby="resume-tab"> 
	<div class="container mt-5">
            <div id="personresume">
                <div>&nbsp;</div>
                <h2>구직자 이력서입니다</h2>
                <div id="myresume" name="resume" class="linkDiv">
                <div>&nbsp;</div>
                <div>&nbsp;</div>
                <div>&nbsp;</div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">이력서 제목</th>
                                <th scope="col">작성일</th>
                                <th scope="col">추천공고 보러가기</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            <c:forEach var="ro" items="${response.list}" varStatus="status">
                                <tr>
                                    <th scope="row">${status.count}</th>
                                    <td class="td2"><a href="/Resume/View?resume_idx=${ro.resume_idx}">${ro.title}</a></td>
                                    <td>${ro.created}</td>
                                    <td>
                                        <button name="recommendList" class="btn btn-primary">추천 공고 보러가기</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                <div>&nbsp;</div>
                <button type="button" id="goWrite" class="btn btn-primary">이력서 작성하기</button>
                <div>&nbsp;</div>
                <div>&nbsp;</div>
            <div class="d-flex justify-content-center paging-bottom-container">
                <%@include file="/WEB-INF/pagination/personPaging.jsp" %>
            </div>
                </div>
                </div>
        </div>
        </div>
        

 
 <script>
 
 $(document).ready(function() {
	    $('#goWrite').on('click', function() {
			alert('dd')
	        location.href = '/MyPage/Resume/WriteForm';
	    });
	});
//해당 이력서의 추천공고 보러가기
// 	const recommendListEls = document.getElementsByName('recommendList');
	
// 	for (let i = 0; i < recommendListEls.length; i++) {
// 	    const btn = recommendListEls[i];
	    
// 	    btn.addEventListener('click', () => {
// 	        //alert('dd');
//      const parentRow = btn.closest('tr');
//      // 부모 요소 내에서 <a> 태그를 선택합니다.
//      const aTag = parentRow.querySelector('td.td2 a');
//      // <a> 태그의 href 속성 값을 가져옵니다.
//      const href = aTag.getAttribute('href');
//      // href 속성 값에서 ${ro.resume_idx} 값을 추출합니다.
//      const resume_idx = href.split('=')[1];
     
// 	        let url = '/Resume/GetrecommendList?resume_idx='+resume_idx+'&nowpage=1';
// 	        location.href=url;	
// 	    });
// 	}

$(document).ready(function() {
    const recommendListEls = document.getElementsByName('recommendList');

    if (recommendListEls.length === 0) {
        console.log('No elements with name recommendList found.');
        return;
    }

    for (let i = 0; i < recommendListEls.length; i++) {
        const btn = recommendListEls[i];

        btn.addEventListener('click', () => {
            const parentRow = btn.closest('tr');
            if (!parentRow) {
                console.error('No parent <tr> found for the button.');
                return;
            }

            const aTag = parentRow.querySelector('td.td2 a');
            if (!aTag) {
                console.error('No <a> tag found within the specified <td> element.');
                return;
            }

            const href = aTag.getAttribute('href');
            if (!href) {
                console.error('No href attribute found on the <a> tag.');
                return;
            }

            const resume_idx = href.split('=')[1];
            if (!resume_idx) {
                console.error('No resume_idx found in the href attribute.');
                return;
            }

            const url = '/Resume/GetrecommendList?resume_idx=' + resume_idx + '&nowpage=1';
            location.href = url;  
        });
    }
});
	

 </script>
</body>
</html>