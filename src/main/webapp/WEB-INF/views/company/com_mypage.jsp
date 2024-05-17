<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="/css/common.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
	#total {
		display: flex;
	}
	#bottom {
		display: flex;d
	}
	#profile {
		width: 500px;
		margin-right: 20px;
	}
	#info {
		margin-left: 20px;
	}
	.img-thumbnail {
		width: 500px;
		height: 500px;
	}
	#info > div > input {
		width: 350px;
	}
</style>
<link rel="icon" href="/img/CaTchWorkFavicon.png">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript">
	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						document.getElementById('postForm').addEventListener('submit', function(event) {
		                      const requiredFields = document.querySelectorAll('#postForm [required]');
		                      let allFieldsFilled = true;
		                      requiredFields.forEach(function(field) {
		                          if (!field.value.trim()) {
		                              allFieldsFilled = false;
		                              field.classList.add('is-invalid');
		                          } else {
		                              field.classList.remove('is-invalid');
		                          }
		                      });

		                      if (!allFieldsFilled) {
		                          alert('모든 필수 항목을 입력해주세요.');
		                          event.preventDefault();
		                          return; 
		                      }

		                      var hiddenField = document.querySelector('input[type="hidden"][name="skillIdx"]');
		                      var checkboxes = document.querySelectorAll('input[type="checkbox"][name="skillIdx"]');
		                      var isChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);
		                      if (!isChecked) {
		                          document.getElementById('defaultSkillIdx').type = 'text';
		                          hiddenField.value = '0';
		                          hiddenField.disabled = false;
		                      } else {
		                          hiddenField.disabled = true;
		                      }

		                      alert('등록 되었습니다');
		                      var myModal = bootstrap.Modal.getInstance(document.getElementById('jobPost'));
		                      myModal.hide();
		                  });
					    document.querySelectorAll('.linkDiv').forEach(function(linkDiv) {
					        linkDiv.addEventListener('click', function(event) {
					            if (event.target && event.target.id.startsWith('btn-delete')) {
					                event.preventDefault();
					                alert('삭제 처리됨');
					                const postIdx = event.target.id.replace('btn-delete', ''); 
					                window.location.href = `/Company/MyPostDelete?post_idx=`+postIdx;
					            } else if (event.target) {
					                const postIdx = event.target.closest('[id^="jobDetailDiv"]').id.replace('jobDetailDiv', '');
					                window.location.href = `/company/MyPage`;
					                //window.location.href = `/Company/Mypage/post_idx=`+postIdx;
					            }
					        });
					    });
					});
</script>
</head>
<body>
   <%@include file="/WEB-INF/include/header.jsp" %>

   <%@include file="/WEB-INF/include/nav.jsp" %>
   
   <%@include file="/WEB-INF/include/com_mypage_nav.jsp" %>
<!--    <div class="tab-content" id="ex1-content"> -->
   
   
   
   <div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="userinfo" role="tabpanel"
			aria-labelledby="userinfo-tab">
			<%@include file="/WEB-INF/views/company/my/mypage.jsp" %>
		</div>
		<div class="tab-pane fade" id="myreview" role="tabpanel"
			aria-labelledby="myreview-tab">
				<%@include file="/WEB-INF/views/company/my/mypost.jsp" %>
			</div>
		<div class="tab-pane fade" id="wishlist" role="tabpanel"
			aria-labelledby="wishlist-tab">위시리스트 탭</div>
	</div>
<!--    </div> -->
   
   <%@include file="/WEB-INF/include/footer.jsp" %>
   
   <script>
			const infoUpdateBtnEl = document.getElementById("info-update")
		
			infoUpdateBtnEl.addEventListener('click', (e) => {
			    let url = '/Company/InfoUpdateForm'
			    const user = {
			        user_idx: document.querySelector("#user_idx").value
			    }
			    
			    const param = {
	            method  : 'POST',
	            headers : {"Content-Type": "application/json" },
	            body    : JSON.stringify(user)
	        }
		
			    
			    fetch(url, param)
			    .then(response => {
			        window.location.href("http://localhost:9086/Company/InfoUpdateForm")
			    })
			})
		</script>
   
</body>
</html>