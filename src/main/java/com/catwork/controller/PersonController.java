package com.catwork.controller;

import java.io.IOException;
import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.domain.PersonVo;
import com.catwork.domain.UserVo;
import com.catwork.mapper.PersonMapper;
import com.catwork.mapper.UserMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Person")
public class PersonController {
	
	@Autowired
	UserMapper userMapper;
	@Autowired
	PersonMapper personMapper;
	
	// 개인회원 로그인
	@PostMapping("/Login")
	public String personLogin(HttpServletRequest request, UserVo userVo,
	                           HttpServletResponse response) throws IOException, ServletException {
		
	      
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
    userVo = userMapper.login2(id,pwd);
    
    
	 if(userVo != null) {//아이디와 암호 일치시 수행
		 System.out.println(id);
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
	
	// 개인회원 회원가입 폼
	@RequestMapping("/JoinForm")
	public String joinForm() {
		return "join";
	}
	
	// 개인회원 회원가입
	@RequestMapping("/Join")
	public ModelAndView perJoin(PersonVo perVo,HttpServletRequest request) {
		
		StringBuilder sb1 = new StringBuilder();
		StringBuilder sb2 = new StringBuilder();
		StringBuffer sb3 = new StringBuffer();
		
		String add1 = request.getParameter("address1");
		String add2 = request.getParameter("address2");
		
		String address = sb1 .append(add1).append(",").append(" ").append(add2).toString();
		perVo.setAddress(address);
		System.out.println(address);
		
		String so1 = request.getParameter("social_num1");
		String so2 = request.getParameter("social_num2");
		
		String social_num = sb2.append(so1).append("-").append(so2).toString();
		perVo.setSocial_num(social_num);
		System.out.println(social_num);
		
		String ph1 = request.getParameter("phone1");
		String ph2 = request.getParameter("phone2");
		String ph3 = request.getParameter("phone3");
		
		String phone = sb3.append(ph1).append("-").append(ph2).append("-").append(ph3).toString();
		perVo.setPhone(phone);
		System.out.println(phone);
		
		System.out.println("perVo" + perVo);
		
		ModelAndView mv = new ModelAndView();
		personMapper.insert(perVo);
		
		mv.setViewName("login");
		return mv;
	}

	

}
