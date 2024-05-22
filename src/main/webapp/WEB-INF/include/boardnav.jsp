<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	#boardnav {
		width: 550px;
		margin: 0 auto;
		text-align: center;
		background-color: white !important;
	}
	
	#boardnavcontent {
		margin: 0 auto;
		text-align: center;
	}
	
	#boardnavimg {
		height: 30px;
	}
	
	#boardnavcontent > li > button {
		margin-right: 5px;
	}
</style>

<nav id="boardnav" class="navbar navbar-expand-lg bg-body-tertiary mb-5">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul id="boardnavcontent" class="navbar-nav">
        <li class="nav-item">
          <button id="personnav" class="btn btn-primary" href="#"><img id="boardnavimg" src="/img/PersonBoard.png"></button>
        </li>
        <li class="nav-item">
          <button id="comnav" class="btn btn-secondary" href="#"><img id="boardnavimg" src="/img/CompanyBoard.png"></button>
        </li>
        <li class="nav-item">
          <button id="homenav" class="btn btn-secondary" href="#"><img id="boardnavimg" src="/img/HomeBoard.png"></button>
        </li>
        <li class="nav-item">
          <button id="faqnav" class="btn btn-secondary" href="#"><img id="boardnavimg" src="/img/faq.png"></button>
        </li>
      </ul>
    </div>
  </div>
</nav>

<script>
	const personnavEl = document.getElementById('personnav')
	const comnavEl = document.getElementById('comnav')
	const homenavEl = document.getElementById('homenav')
	const faqnavEl = document.getElementById('faqnav')
	
	personnavEl.addEventListener('click', () => {
	    personnavEl.classList.remove('btn-secondary')
	    comnavEl.classList.remove('btn-primary')
	    homenavEl.classList.remove('btn-primary')
	    faqnavEl.classList.remove('btn-primary')
	
	    personnavEl.classList.add('btn-primary')
	    comnavEl.classList.add('btn-secondary')
	    homenavEl.classList.add('btn-secondary')
	    faqnavEl.classList.add('btn-secondary')
	    
	    window.location.href('/Board/PersonBoard?nowpage=1')
	})
	
	comnavEl.addEventListener('click', () => {
	    comnavEl.classList.remove('btn-secondary')
	    personnavEl.classList.remove('btn-primary')
	    homenavEl.classList.remove('btn-primary')
	    faqnavEl.classList.remove('btn-primary')
	
	    comnavEl.classList.add('btn-primary')
	    personnavEl.classList.add('btn-secondary')
	    homenavEl.classList.add('btn-secondary')
	    faqnavEl.classList.add('btn-secondary')
	    
	    window.location.href('/Board/CompanyBoard?nowpage=1')
	})
	
	homenavEl.addEventListener('click', () => {
	    homenavEl.classList.remove('btn-secondary')
	    comnavEl.classList.remove('btn-primary')
	    personnavEl.classList.remove('btn-primary')
	    faqnavEl.classList.remove('btn-primary')
	
	    homenavEl.classList.add('btn-primary')
	    comnavEl.classList.add('btn-secondary')
	    personnavEl.classList.add('btn-secondary')
	    faqnavEl.classList.add('btn-secondary')
	    
	    window.location.href('/Board/HomeBoard?nowpage=1')
	})
	
	faqnavEl.addEventListener('click', () => {
	    faqnavEl.classList.remove('btn-secondary')
	    comnavEl.classList.remove('btn-primary')
	    homenavEl.classList.remove('btn-primary')
	    personnavEl.classList.remove('btn-primary')
	
	    faqnavEl.classList.add('btn-primary')
	    comnavEl.classList.add('btn-secondary')
	    homenavEl.classList.add('btn-secondary')
	    personnavEl.classList.add('btn-secondary')
	    
	    window.location.href('/Board/Faq')
	})

</script>