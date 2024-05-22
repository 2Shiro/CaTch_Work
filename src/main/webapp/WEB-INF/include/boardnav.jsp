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
          <a style="background-color: #6694F8; margin-right: 5px; border: none;" id="personnav" class="btn btn-primary" href="/Board/PersonBoard?nowpage=1"><img id="boardnavimg" src="/img/PersonBoard.png"></a>
        </li>
        <li class="nav-item">
          <a style="background-color: #6694F8; margin-right: 5px; border: none;" id="comnav" class="btn btn-secondary" href="/Board/CompanyBoard?nowpage=1"><img id="boardnavimg" src="/img/CompanyBoard.png"></a>
        </li>
        <li class="nav-item">
          <a style="background-color: #6694F8; margin-right: 5px; border: none;" id="homenav" class="btn btn-secondary" href="/Board/HomeBoard?nowpage=1"><img id="boardnavimg" src="/img/HomeBoard.png"></a>
        </li>
        <li class="nav-item">
          <a style="background-color: #6694F8; border: none;" id="faqnav" class="btn btn-secondary" href="/Board/Faq"><img id="boardnavimg" src="/img/faq.png"></a>
        </li>
      </ul>
    </div>
  </div>
</nav>
