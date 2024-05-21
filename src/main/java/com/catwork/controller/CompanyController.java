package com.catwork.controller;

import java.io.IOException;
import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.domain.CompanyVo;
import com.catwork.domain.UserVo;
import com.catwork.mapper.CompanyMapper;
import com.catwork.mapper.UserMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//import com.catwork.mapper.CompanyMapper;

@Controller
@RequestMapping("/Company")
public class CompanyController {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private CompanyMapper companyMapper;
	
	// 기업회원 로그인
	@PostMapping("/Login")
	public String companyLogin(HttpServletRequest request, UserVo userVo,
	                           HttpServletResponse response) throws IOException, ServletException {
		
	      
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
    userVo = userMapper.login1(id,pwd);
    
    
	 if(userVo != null) {//아이디와 암호 일치시 수행
		 HttpSession session = request.getSession();
		 session.setMaxInactiveInterval(60*60); //60분동안 로그인 유지
		 session.setAttribute("login", userVo); //사용자 정보 세션에 저장
		 session.setAttribute("isLoggedIn", true);
		 return "redirect:/";           
	 }
	 else {//로그인 실패시
		  PrintWriter out = response.getWriter();
		  response.setCharacterEncoding("UTF-8");
		  response.setContentType("text/html; charset=UTF-8;");
	      out.println("<script> alert('Please Check Your ID and Password');");
	      out.println("history.go(-1); </script>"); 
	      out.close();             
	      return "redirect:/LoginForm";
	      }
	   }
	
	// 기업회원가입 폼
	@RequestMapping("/JoinForm")
	public String ComJoin() {
		return "comjoin";
	}
	
	// 기업회원가입
	@RequestMapping("/Join")
	public ModelAndView ComJoin(CompanyVo comVo,HttpServletRequest request) {
		
		StringBuilder add = new StringBuilder();
		
		String add1 = request.getParameter("address1");
		String add2 = request.getParameter("address2");
		
		String address = add.append(add1).append(",").append(add2).toString();
		
		comVo.setAddress(address);
		
		// System.out.println("comVo" + companyVo);
		
		ModelAndView mv = new ModelAndView();
		companyMapper.insert(comVo);
		
		mv.setViewName("login");
		return mv;
	}
	



}
