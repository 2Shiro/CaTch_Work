<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<body>

    <div class="tab-pane fade active show" id="apply" role="tabpanel" aria-labelledby="apply-tab">
        <div class="container">
        	<div id="personapply">
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <h2>내가 지원한 공고</h2>
            <div>&nbsp;</div> 
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div class="myapply">
                <table class="table" class="linkDiv">
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">공고 제목</th>
                            <th scope="col">연봉</th>
                            <th scope="col">요구 경력</th>
                            <th scope="col">담당자연락처</th>
                            <th scope="col">더보기</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        <c:forEach var="po" items="${response1.list}" varStatus="status">
                            <tr>
                                <th scope="row">${status.count}</th>
                                <td class="td2"><a href="/Post?post_idx=${po.post_idx}">${po.title}</a></td>
                                <td>${po.salary}</td>
                                <td>${po.career}</td>
                                <td>${po.mphone}</td>
                                <td class="td8">
                                    <button name="apply" class="btn btn-primary">지원 현황</button>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div class="output"></div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="d-flex justify-content-center paging-bottom-container">
                <%@include file="/WEB-INF/pagination/personApplyPaging.jsp" %>
            </div>
            </div>
        </div>
    </div>
 <script>
 $(document).ready(function() {
	    console.dir(document);
	    //alert('asdfa');

	    $(function(e) {
	        //alert("두번째");
	        console.log(e);
	        const applyBtns = $('.myapply .td8 button[name="apply"]');
	        const modalResult = $('#myModal');
	        const modalState = $('#modalState1');
	        const modalCloseBtns = $('[data-bs-dismiss="modal"]');
	        
	        applyBtns.each(function() {
	            $(this).on('click', function() {
	                //alert('sdfsadf');
	                const tr = $(this).closest('tr');
	                const postLink = tr.find('.td2 a');
	                const post_idx = postLink.attr('href').split('=')[1];
	                const url = '/Resume/GetApplyList?post_idx=' + post_idx;
	                const outputEl = tr.next().find('.output');
	                let isOpen = false;
	                
	                if (outputEl) {
	                    isOpen = outputEl.attr('data-open') === 'true';
	                }
	                
	                if (isOpen) {
	                    outputEl.html('');
	                    outputEl.removeAttr('data-open');
	                } else {
	                    fetch(url)
	                    .then(response => response.json())
	                    .then(resumeList => {
	                        outputEl.html('');
	                        $.each(resumeList, function(index, resume) {
	                            let html = '<table class="table">';
		                        html += '<tr>';
			                       // html += '<td>'+resume.row_num+'</td>';
			                       	html += ''
			                       	html += '<td colspan="6">'+resume.name+'  님은 ' +resume.rtitle+'  이력서로  '+resume.created+'  에 지원하셨습니다'+'</td>'
			                        
			                       	if(resume.state != 0) {
			                       		html += '<td><button class="btn btn-primary result-btn">결과보기</button></td>'; // 클래스 추가
									}	                        
			                       	
			                       	html += '<td><button class="btn btn-danger rate-btn">기업평가</button></td>'; // 클래스 추가
			                        html += '<input type="hidden" value="'+resume.apply_idx+'" name="apply_idx">'; // 클래스 추가
			                        html += '<input type="hidden" value="'+resume.per_idx+'" name="per_idx">'; // 클래스 추가
			                        html += '</tr>'; // 클래스 추가
			                        html += '</table>';
	                            
	                            outputEl.append(html);
	                        });

	                        const resultButtons = outputEl.find('.result-btn');
	                        resultButtons.each(function() {
	                            $(this).on('click', function() {
	                                //alert("dd")
	                                const tr = $(this).closest('tr');
	                                const apply_idx = tr.find('input[type=hidden]').val();
	                                alert(apply_idx)
	                                const modalData = $('#modalData');
	                                modalResult.css('display', 'block');

	                                const modalUrl = '/MyPage/Resume/GetState?apply_idx=' + apply_idx;
	                                fetch(modalUrl)
	                                    .then(response => response.json())
	                                    .then(vo => {
	                                        modalData.html('');
	                                        let modalHtml = '<p>점수:'+vo.score+'</p>';
	                                        modalHtml += '<p>코멘트:'+vo.comments+'</p>';
	                                        modalData.append(modalHtml);
	                                    })
	                                    .catch(error => console.error('Error:', error));
	                            });
	                        });
	                        
	                        const rateButtons = outputEl.find('.rate-btn');
	                        rateButtons.each(function() {
	                            $(this).on('click', function(event) {
	                                event.preventDefault();
	                                const tr = $(this).closest('tr');
	                                const apply_idx = tr.find('input[type=hidden]').val();
	                                const modalData = $('#modalState');
	                                modalState.css('display', 'block');
	                                let comidx = 0;
	                                let peridx = 0;

	                                const modalUrl = '/MyPage/Company/GetRateForm?apply_idx=' + apply_idx;
	                                fetch(modalUrl)
	                                    .then(response => response.json())
	                                    .then(vo => {
	                                        comidx = vo.com_idx;
	                                        peridx = vo.per_idx;
	                                        modalData.html('');
	                                        let modalHtml = '<p>per_idx:'+vo.per_idx+'</p>';
		                                    
		                                    modalHtml += vo.com_idx;
		                                    modalHtml += '<form>';
		                                    //modalHtml += '<form action="/Company/Rate?com_idx='+vo.com_idx+'&per_idx='+vo.per_idx+'" method="POST">';
		                                    modalHtml += '<input type="hidden" id="rate_per_idx" name="per_idx" value="'+vo.per_idx+'">';
		                                    modalHtml += '<input type="hidden" id="rate_com_idx" name="com_idx" value="'+vo.com_idx+'">';
		                                    modalHtml += '<div class="rating">';
		                                    modalHtml += '<label class="rating__label rating__label--half" for="starhalf">';
		                                    modalHtml += '<input type="radio" id="starhalf" class="rating__input" name="rating" value="1">';
		                                    modalHtml += '<span class="star-icon">';
		                                    modalHtml += '</span>';
		                                    modalHtml += '</label>';
		                                    modalHtml += '<label class="rating__label rating__label--full" for="starhalf">';
		                                    modalHtml += '<input type="radio" id="starhalf1" class="rating__input" name="rating" value="2">';
		                                    modalHtml += '<span class="star-icon">';
		                                    modalHtml += '</span>';
		                                    modalHtml += '</label>';
		                                    modalHtml += '<label class="rating__label rating__label--half" for="starhalf">';
		                                    modalHtml += '<input type="radio" id="starhalf2" class="rating__input" name="rating" value="3">';
		                                    modalHtml += '<span class="star-icon">';
		                                    modalHtml += '</span>';
		                                    modalHtml += '</label>';
		                                    modalHtml += '<label class="rating__label rating__label--full" for="starhalf">';
		                                    modalHtml += '<input type="radio" id="starhalf3" class="rating__input" name="rating" value="4">';
		                                    modalHtml += '<span class="star-icon">';
		                                    modalHtml += '</span>';
		                                    modalHtml += '</label>';
		                                    modalHtml += '<label class="rating__label rating__label--half" for="starhalf">';
		                                    modalHtml += '<input type="radio" id="starhalf4" class="rating__input" name="rating" value="5">';
		                                    modalHtml += '<span class="star-icon">';
		                                    modalHtml += '</span>';
		                                    modalHtml += '</label>';
		                                    modalHtml += '<label class="rating__label rating__label--full" for="starhalf">';
		                                    modalHtml += '<input type="radio" id="starhalf5" class="rating__input" name="rating" value="6">';
		                                    modalHtml += '<span class="star-icon">';
		                                    modalHtml += '</span>';
		                                    modalHtml += '</label>';
		                                    modalHtml += '<label class="rating__label rating__label--half" for="starhalf">';
		                                    modalHtml += '<input type="radio" id="starhalf6" class="rating__input" name="rating" value="7">';
		                                    modalHtml += '<span class="star-icon">';
		                                    modalHtml += '</span>';
		                                    modalHtml += '</label>';
		                                    modalHtml += '<label class="rating__label rating__label--full" for="starhalf">';
		                                    modalHtml += '<input type="radio" id="starhalf7" class="rating__input" name="rating" value="8">';
		                                    modalHtml += '<span class="star-icon">';
		                                    modalHtml += '</span>';
		                                    modalHtml += '</label>';
		                                    modalHtml += '<label class="rating__label rating__label--half" for="starhalf">';
		                                    modalHtml += '<input type="radio" id="starhalf8" class="rating__input" name="rating" value="9">';
		                                    modalHtml += '<span class="star-icon">';
		                                    modalHtml += '</span>';
		                                    modalHtml += '</label>';
		                                    modalHtml += '<label class="rating__label rating__label--full" for="starhalf">';
		                                    modalHtml += '<input type="radio" id="starhalf9" class="rating__input" name="rating" value="10">';
		                                    modalHtml += '<span class="star-icon">';
		                                    modalHtml += '</span>';
		                                    modalHtml += '</label>';
		                                    modalHtml += '</div>';
		                                    modalHtml += '<button type="submit" id="rateSubmitBtn" class="btn btn-primary">평가하기</button>';
		                                    
		                                    modalHtml += '</form>';
	                                        modalData.append(modalHtml);
	                                        initializeRating();

	                                        // 기업평가 버튼에 이벤트 리스너 추가
	                                        const submitButton = modalData.find('#rateSubmitBtn');
	                                        submitButton.on('click', function(e) {
	                                            e.preventDefault();
	                                            let ratingValue = modalData.find('input[name="rating"]:checked').val();
	                                            let rate_url = 'Company/Rate';
	                                            const formData = new FormData();
	                                            formData.append('rating', ratingValue);
	                                            formData.append('per_idx', peridx);
	                                            formData.append('com_idx', comidx);

	                                            fetch('Company/Rate', {
	                                                method: 'POST',
	                                                body: formData
	                                            })
	                                            .then(response => {
	                                                if (!response.ok) {
	                                                    throw new Error('Network response was not ok');
	                                                }
	                                                return response.json();
	                                            })
	                                            .then(data => {
	                                                modalState.css('display', 'none');
	                                            })
	                                            .catch(error => {
	                                                console.error('Error:', error);
	                                            });
	                                        });

	                                        // Close modal button
	                                        const rateSubmitButton = modalData.find('.btn-primary');
	                                        rateSubmitButton.on('click', function() {
	                                            modalState.css('display', 'none');
	                                        });
	                                    })
	                                    .catch(error => console.error('Error:', error));
	                            });
	                        });

	                        outputEl.attr('data-open', 'true');
	                    })
	                    .catch(error => {
	                        console.error('Error:', error);
	                        alert(error);
	                    });
	                }
	            });
	        });

	        // Modal close buttons
	        modalCloseBtns.each(function() {
	            $(this).on('click', function() {
	                modalResult.css('display', 'none');
	                modalState.css('display', 'none');
	            });
	        });

	        // Close modal when clicking outside of it
	        $(window).on('click', function(event) {
	            if ($(event.target).is(modalResult) || $(event.target).is(modalState)) {
	                modalResult.css('display', 'none');
	                modalState.css('display', 'none');
	            }
	        });
	    });
	});

 function initializeRating() {
	    $('.rating').each(function() {
	        const stars = $(this).find('.star-icon');
	        
	        $(this).on('click', function() {
	            stars.each(function(idx) {
	                $(this).on('mouseenter', function() {
	                    initStars(stars); 
	                    filledRate(idx, stars.length, stars); 

	                    stars.filter('.filled').css('opacity', '0.5');
	                });

	                $(this).on('mouseout', function() {
	                    $(this).css('opacity', '1');
	                });

	                $(this).on('click', function() {
	                    selectedRating = idx + 1;
	                    console.log('Selected Rating:', selectedRating);
	                    const ratingEl = $('[name=rating]');
	                    ratingEl.val(selectedRating);
	                });
	            });
	        });

	        $(this).on('mouseleave', function() {
	            stars.css('opacity', '1');
	        });
	    });
	}

	function filledRate(index, length, stars) {
	    if (index <= length) {
	        stars.each(function(i) {
	            if (i <= index) {
	                $(this).addClass('filled');
	            }
	        });
	    }
	}

	function checkedRate(stars) {
	    const checkedRadio = $('input[type="radio"]:checked');

	    initStars(stars);
	    checkedRadio.each(function() {
	        const previousSiblings = $(this).parent().prevAll();

	        previousSiblings.each(function() {
	            $(this).find('.star-icon').addClass('filled');
	        });

	        $(this).next().addClass('filled');
	    });
	}

	function initStars(stars) {
	    stars.removeClass('filled');
	}
	
	
 
 </script>
 </body>
