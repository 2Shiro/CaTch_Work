package com.catwork.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.domain.PersonApplyVo;
import com.catwork.domain.PersonVo;
import com.catwork.domain.ResumeVo;
import com.catwork.domain.Resume_SkillVo;
import com.catwork.domain.UserVo;
import com.catwork.mapper.PersonMapper;
import com.catwork.mapper.ResumeMapper;
import com.catwork.mapper.UserMapper;

@Controller
public class PersonController {
	
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private PersonMapper personMapper;
	
	@Autowired
	private ResumeMapper resumeMapper;
	
	@GetMapping("/MyPage")
	public ModelAndView personMypage(UserVo userVo, PersonVo personVo, ResumeVo resumeVo, PersonApplyVo personApplyVo) {
		
		PersonVo pvo = personMapper.getPersonInfo(personVo,userVo);
		
		List<ResumeVo> resumeList = personMapper.getResumeList(resumeVo);
		
		List<PersonApplyVo> applyList = personMapper.getApplyList(personApplyVo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("pvo",pvo);
		mv.addObject("resumeList",resumeList);
		mv.addObject("applyList",applyList);
		mv.setViewName("/person/myPage");
		
		return mv;
	}
	
	@GetMapping("/MyPage/UpdateForm")
	public ModelAndView myPageUpdateForm(UserVo userVo, PersonVo personVo) {
		PersonVo pvo = personMapper.getPersonInfo(personVo,userVo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/person/myPageUpdate");
		mv.addObject("pvo",pvo);
		
		return mv;
		
		
	}
	
	@PostMapping("/MyPageUpdate")
	public ModelAndView myPageUpdate(UserVo userVo, PersonVo personVo) {
		
		
		
		
		
		personMapper.updateMyInfo(personVo);
		
		personMapper.updateMyInfo2(personVo);
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/MyPage");
		return mv;
		
	}
	
	@GetMapping("/PersonDelete")
	public ModelAndView personDelete(UserVo userVo) {
		personMapper.personDelete(userVo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/MyPage");
		return mv;
		
	}
	
	@GetMapping("/MyPage/Resume/WriteForm")
	public ModelAndView resumeWriteForm() {
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/person/resume_WriteForm");
		return mv;
		
	}
	@PostMapping("/MyPage/Resume/Write")
	public ModelAndView resumeWrite(ResumeVo resumeVo) {
		
		
		System.out.println("===-----------------------======"+resumeVo);
			
		
		resumeMapper.insertResume(resumeVo);
		
//		System.out.println("이력서 스킬 넣는 중3333"+resumeSkillList);
		List<Resume_SkillVo> resumeSkillList = new ArrayList<>();
		String [] skillList = resumeVo.getSkill_idx().split(",");
//		System.out.println("이력서 스킬 넣는 중12"+Arrays.toString(skillList));
		for(String s_skill_idx : skillList ) {
			
			resumeSkillList.add(new Resume_SkillVo( Integer.parseInt(s_skill_idx)));			
		}
		System.out.println("이력서 스킬 넣는 중"+resumeSkillList);
		resumeMapper.insertResumeSkill(resumeSkillList);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/MyPage");
		return mv;
		
	}
	
	@GetMapping("/Resume/View")
	public ModelAndView resumeView(ResumeVo resumeVo) {
		
		ResumeVo vo = resumeMapper.getView(resumeVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("/person/resume_View");
		return mv;
	}
	
	@GetMapping("/Resume/UpdateForm")
	public ModelAndView resumeUpdateForm(ResumeVo resumeVo) {
		
		ResumeVo vo = resumeMapper.getResumeDetailView(resumeVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo);
		mv.setViewName("/person/resume_Update");
		return mv;
		
	}
	@GetMapping("/Resume/Update")
	public ModelAndView resumeUpdate(ResumeVo resumeVo) {
		
		resumeMapper.updateResume(resumeVo);
		
//		System.out.println("이력서 스킬 넣는 중3333"+resumeSkillList);
		List<Resume_SkillVo> resumeSkillList = new ArrayList<>();
		String [] skillList = resumeVo.getSkill_idx().split(",");
//		System.out.println("이력서 스킬 넣는 중12"+Arrays.toString(skillList));
		for(String s_skill_idx : skillList ) {
			
			resumeSkillList.add(new Resume_SkillVo( Integer.parseInt(s_skill_idx)));			
		}
		System.out.println("이력서 스킬 넣는 중"+resumeSkillList);
		resumeMapper.insertResumeSkill(resumeSkillList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/MyPage");
		return mv;
		
	}
	
	@GetMapping("/Resume/Delete")
	public ModelAndView resumeDelete(ResumeVo resumeVo) {
		
		resumeMapper.resumeDelete(resumeVo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/MyPage");
		return mv;
		
	}
	


	
	
}
