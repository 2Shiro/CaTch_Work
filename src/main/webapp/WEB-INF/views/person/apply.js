 console.dir(document)
 alert('asdfa');
 document.addEventListener('DOMContentLoaded', (e) => {
		
		alert("두번쨰")
		console.log(e)
	    const applyBtns = document.querySelectorAll('.myapply .td8 button[name="apply"]');
	    const modalResult = document.getElementById('myModal');
	    const modalState = document.getElementById('modalState1');
	    const modalCloseBtns = document.querySelectorAll('[data-bs-dismiss="modal"]');
	    //let   selectedRating = 0;
	    applyBtns.forEach(btn => {
	        btn.addEventListener('click', () => {
				alert('sdfsadf');
	            const tr = btn.closest('tr');
	            
	            // tr 안에서 post_idx 값을 가져옵니다.
	            const postLink = tr.querySelector('.td2 a');
	            const post_idx = postLink.getAttribute('href').split('=')[1];
	            const url = '/Resume/GetApplyList?post_idx=' + post_idx;
	            const outputEl = tr.nextElementSibling.querySelector('.output');
	            
	            // 상태 변수 선언
	            let isOpen = false;
	            if (outputEl) {
	                isOpen = outputEl.getAttribute('data-open') === 'true';
	            }
	            
	            if (isOpen) {
	                outputEl.innerHTML = ''; // 해당 리스트의 출력 요소 초기화
	                outputEl.removeAttribute('data-open'); // 속성 제거
	            } else {
	                fetch(url)
	                .then(response => response.json())
	                .then(resumeList => {
	                    outputEl.innerHTML = ''; // 해당 리스트의 출력 요소 초기화
	                    resumeList.forEach(resume => {
	                        let html = '';
	                        html += '<table class="table">';
	                        html += '<tr>';
	                        html += '<td>'+resume.row_num+'</td>';
	                        html += '<td>'+resume.name+'</td>';
	                        html += '<td>'+resume.rtitle+'</td>';
	                        html += '<td>'+resume.phone+'</td>';
	                        html += '<td>'+resume.created+'</td>';
	                        html += '<td><button class="btn btn-primary result-btn">결과보기</button></td>'; // 클래스 추가
	                        html += '<td><button class="btn btn-danger rate-btn">기업평가</button></td>'; // 클래스 추가
	                        html += '<input type="hidden" value="'+resume.apply_idx+'" name="apply_idx">'; // 클래스 추가
	                        html += '<input type="hidden" value="'+resume.per_idx+'" name="per_idx">'; // 클래스 추가
	                        html += '</tr>'; // 클래스 추가
	                        html += '</table>';
	                          
	                        outputEl.innerHTML += html; // 해당 리스트의 출력 요소에 HTML 추가
	                    });

	                    // 결과보기 버튼에 이벤트 리스너 추가
	                    const resultButtons = outputEl.querySelectorAll('.result-btn'); // 클래스로 선택
	                    resultButtons.forEach((button, i) => {
	                        button.addEventListener('click', () => {
	                            // 클릭된 버튼을 기준으로 가장 가까운 tr 요소 찾기
	                            const tr = button.closest('tr');
	                            
	                            // tr 안에서 input[type=hidden] 요소를 찾아서 apply_idx 값을 가져오기
	                            const apply_idx = tr.querySelector('input[type=hidden]').value;
	                            
	                            const modalData = document.getElementById('modalData');

	                            // 모달 창 열기
	                            modalResult.style.display = "block";

	                            // fetch로 데이터 가져오기
	                            const modalUrl = '/MyPage/Resume/GetState?apply_idx=' + apply_idx;
	                            fetch(modalUrl)
	                                .then(response => response.json())
	                                .then(vo => {
	                                    modalData.innerHTML = ''; // 초기화
	                            
	                                    let modalHtml = '<p>점수:'+vo.score+'</p>';
	                                    modalHtml += '<p>코멘트:'+vo.comments+'</p>';
	                                    modalData.innerHTML += modalHtml;
	                                    
	                                })
	                                .catch(error => console.error('Error:', error));
	                        });
	                    });
	                    
	                    // 기업평가 버튼에 이벤트 리스너 추가
	                    const rateButtons = outputEl.querySelectorAll('.rate-btn'); // 클래스로 선택
	                    rateButtons.forEach((button, i) => {
	                        button.addEventListener('click', (event) => {
	                        	event.preventDefault(); // 폼 제출 기본 동작 중단
	                        		                        	
	                            // 클릭된 버튼을 기준으로 가장 가까운 tr 요소 찾기
	                            const tr = button.closest('tr');
	                            
	                            // tr 안에서 input[type=hidden] 요소를 찾아서 apply_idx 값을 가져오기
	                            const apply_idx = tr.querySelector('input[type=hidden]').value;
	                            const modalData = document.getElementById('modalState');
	                            // 모달 창 열기
	                            modalState.style.display = "block";
	                            
	                            let comidx = 0;
	                            let peridx = 0;
	                            
	                            const modalUrl = '/MyPage/Company/GetRateForm?apply_idx=' + apply_idx;
	                            fetch(modalUrl)
	                                .then(response => response.json())
	                                .then(vo => {
                                     comidx = vo.com_idx;
                                     peridx = vo.per_idx;
	                                    modalData.innerHTML = ''; // 초기화
	                            
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
	                                    modalData.innerHTML += modalHtml;
	                                    initializeRating();
	                                    
	                                  
	                                    // 평가하기 버튼
	                                    const submitButton = modalData.querySelector('#rateSubmitBtn');
	                                    submitButton.addEventListener('click', (e) => {
	                                        e.preventDefault();
											let   ratingValue = modalData.querySelector('input[name="rating"]:checked').value;
											//let ratingValue = selectedRating;
											//alert(ratingValue);
											
	                                        // 여기에서 fetch를 사용하여 데이터를 전송하고 처리하는 코드를 작성합니다.
											    // 선택된 값을 저장할 변수를 선언합니다.

	                                        let   rate_url = 'Company/Rate'; 
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
	                                            // 데이터 전송이 성공하면 모달을 닫습니다.
	                                            modalState.style.display = "none";
	                                        })
	                                        .catch(error => {
	                                            console.error('Error:', error);
	                                            // 에러 처리
	                                        });
	                                   
	                                        
	                                    });
	                                   	                                   
	                                    const rateSubmitButton = modalData.querySelector('.btn-primary');
	                                    rateSubmitButton.addEventListener('click', () => {
	                                        // 모달 창 닫기
	                                        modalState.style.display = "none";
	                                    });
	                                    
	                                })
	                                .catch(error => console.error('Error:', error));
	                            
	                            // 여기에 기업평가 버튼을 눌렀을 때 수행할 동작을 추가하세요.
	                            // 예를 들어, 모달을 띄우거나 다른 처리를 수행할 수 있습니다.
	                        });
	                    });

	                    outputEl.setAttribute('data-open', 'true'); // 속성 추가
	                })
	                .catch(error => {
	                    console.error('Error:', error);
	                    alert(error);
	                });
	            }
	        });
	    });
	    
	    // 모달 닫기 버튼에 이벤트 리스너 추가
	    modalCloseBtns.forEach(btn => {
	        btn.addEventListener('click', () => {
	            modalResult.style.display = "none"; // 모달 닫기
	            modalState.style.display = "none"; // 모달 닫기
	        });
	    });
	    
	    // 모달 외부 클릭 시 닫기
	    window.addEventListener('click', (event) => {
	        if (event.target == modalResult || event.target == modalState) {
	            modalResult.style.display = "none"; // 모달 닫기
	            modalState.style.display = "none"; // 모달 닫기
	        }
	    });
	});

	function initializeRating() {
	    const rateWrap = document.querySelectorAll('.rating');
	    const opacityHover = '0.5';

	    rateWrap.forEach(wrap => {
	        const stars = wrap.querySelectorAll('.star-icon');
	        wrap.addEventListener('click', () => {
	            stars.forEach((starIcon, idx) => {
	                starIcon.addEventListener('mouseenter', () => {
	                    initStars(stars); 
	                    filledRate(idx, stars.length, stars); 

	                    for (let i = 0; i < stars.length; i++) {
	                        if (stars[i].classList.contains('filled')) {
	                            stars[i].style.opacity = opacityHover;
	                        }
	                    }
	                });

	                starIcon.addEventListener('mouseout', () => {
	                    starIcon.style.opacity = '1';
	                });

	                wrap.addEventListener('mouseleave', () => {
	                    starIcon.style.opacity = '1';
	                });
	                
	                starIcon.addEventListener('click', () => {
	                    selectedRating = idx + 1; // 선택한 별의 값은 별의 순서에 1을 더한 값
	                    console.log('Selected Rating:', selectedRating);
	                    const ratingEl = document.querySelector('[name=rating]');
	                    ratingEl.value = selectedRating;
	                    
	                    // 여기에서 선택한 별점 값을 활용하여 원하는 작업을 수행할 수 있습니다.
	                    // 예를 들어, 선택한 별점 값을 서버로 전송하거나 다른 동작을 수행할 수 있습니다.
	                });
	                
	            });
	        });
	    });
	}

	function filledRate(index, length, stars) {
	    if (index <= length) {
	        for (let i = 0; i <= index; i++) {
	            stars[i].classList.add('filled');
	        }
	    }
	}

	function checkedRate(stars) {
	    const checkedRadio = document.querySelectorAll('input[type="radio"]:checked');

	    initStars(stars);
	    checkedRadio.forEach(radio => {
	        const previousSiblings = prevAll(radio);

	        for (let i = 0; i < previousSiblings.length; i++) {
	            previousSiblings[i].querySelector('.star-icon').classList.add('filled');
	        }

	        radio.nextElementSibling.classList.add('filled');

	        function prevAll() {
	            const radioSiblings = [];
	            let prevSibling = radio.parentElement.previousElementSibling;

	            while (prevSibling) {
	                radioSiblings.push(prevSibling);
	                prevSibling = prevSibling.previousElementSibling;
	            }
	            return radioSiblings;
	        }
	    });
	}

	function initStars(stars) {
	    for (let i = 0; i < stars.length; i++) {
	        stars[i].classList.remove('filled');
	    }
	}

	
	
 
