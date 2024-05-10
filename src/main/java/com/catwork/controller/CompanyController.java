package com.catwork.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.mapper.CompanyMapper;

@Controller
public class CompanyController {
	@Autowired
	private CompanyMapper companyMapper;
	
	//기업에서 개인의 이력서 중 공개된 이력서 리스트
	@RequestMapping("/company/resumeList")
	public ModelAndView resumeList() {
		//
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("company/resumeList");
		
		return mv;
	}
}
