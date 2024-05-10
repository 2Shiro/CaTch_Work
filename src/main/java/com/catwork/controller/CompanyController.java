package com.catwork.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.domain.ResumeInfoVo;
import com.catwork.domain.ResumeVo;
import com.catwork.mapper.CompanyMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CompanyController {
	@Autowired
	private CompanyMapper companyMapper;
	
	//기업에서 개인의 이력서 중 공개된 이력서 리스트
	@RequestMapping("/Company/ResumeList")
	public ModelAndView resumeList() {
		//정보를 담을 리스트
		List<ResumeInfoVo> ResumeListInfo = new ArrayList<ResumeInfoVo>();
		
		//이력서 목록 가져오기
		List<ResumeVo> resumeList = companyMapper.getResumeList();
		log.info("[==resumeList==]", resumeList);
		
		//유저 정보 가져오기
		
		//기술 스택 가져오기
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("resumeList", resumeList);
		mv.setViewName("company/resumeList");
		
		return mv;
	}
	
	//기업의 마이페이지
	@RequestMapping("/Company/MyPage")
	public ModelAndView myPage() {
		//
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("company/com_mypage");
		
		return mv;
	}
	
	//기업의 나의 공고
	@RequestMapping("/Company/MyPost")
	public ModelAndView myPost() {
		//
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("company/mypost");
		
		return mv;
	}
	
	//구직자 이력서 상세 보기
	@RequestMapping("/Company/1/PersonResume")
	public ModelAndView personResume() {
		//
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("company/resume_detail");
		
		return mv;
	}
}
