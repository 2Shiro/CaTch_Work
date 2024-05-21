package com.catwork.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.domain.FaqVo;
import com.catwork.mapper.BoardMapper;
import com.catwork.mapper.UserMapper;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private BoardMapper boardMapper;
	
	@RequestMapping("/")
	public  String   home() {

		return "/home";
	}
	
	@RequestMapping("/LoginForm")
	public String plogin() {
		return "login";
	}
	
	// logout
	@RequestMapping("/Logout")
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:/";
	}
	
	// 아이디 중복체크(기업+개인)
	@RequestMapping("/CheckId")
	public @ResponseBody int checkId(@RequestParam(value = "id") String id) {
		int result = userMapper.checkId(id);
		return result;
	}
	
	
}















