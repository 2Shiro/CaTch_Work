package com.catwork.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.domain.PersonVo;
import com.catwork.domain.ResumeInfoVo;
import com.catwork.domain.ResumeVo;
import com.catwork.domain.Resume_SkillVo;
import com.catwork.domain.SkillVo;
import com.catwork.mapper.CompanyMapper;
import com.catwork.mapper.PersonMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CompanyController {
	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
	private PersonMapper personMapper;
	
	//기업에서 개인의 이력서 중 공개된 이력서 리스트
	@RequestMapping("/Company/ResumeList")
	public ModelAndView resumeList() {
		//정보를 담을 리스트
		List<ResumeInfoVo> resumeListInfo = new ArrayList<ResumeInfoVo>();
		
		//이력서 목록 가져오기
		List<ResumeVo> resumeList = companyMapper.getResumeList();
		//log.info("[==resumeList==] : ", resumeList);
		System.out.println("resumeList: " + resumeList);
		
		for(int i = 0; i < resumeList.size(); i++) {		
			//개인 회원 정보 가져오기 //mapper.xml 작성중
			PersonVo person = personMapper.getPersonDetail(resumeList.get(i).getUser_idx());
			System.out.println("person: " + person);
			
			//기술 스택 가져오기
			List<Resume_SkillVo> resumeskill = new ArrayList<Resume_SkillVo>();
			for(int j = 0; j < resumeskill.size(); j++) {
				Resume_SkillVo vo = personMapper.getResumeSkill(resumeList.get(i).getSkill_idx());
				resumeskill.add(vo);
			}
			System.out.println("resumeskill: " + resumeskill);
			
			List<SkillVo> skillnameList = new ArrayList<SkillVo>();
			for(int j = 0; j < resumeskill.size(); j++) {
				SkillVo vo = companyMapper.getSkillName(resumeskill.get(j).getSkill_idx());
				skillnameList.add(vo);
			}
			System.out.println("skillnameList: " + skillnameList);
			
			//view에 보여질 내용 담기
			resumeListInfo.add(new ResumeInfoVo((i + 1), 
												resumeList.get(i).getTitle(),
												person.getName(),
												skillnameList));
		}		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("resumeList", resumeList);
		mv.addObject("resumeListInfo", resumeListInfo);
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
