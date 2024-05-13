package com.catwork.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.domain.ApplyVo;
import com.catwork.domain.CompanyVo;
import com.catwork.domain.ParticipateVo;
import com.catwork.domain.PersonVo;
import com.catwork.domain.PostSkillVo;
import com.catwork.domain.PostVo;
import com.catwork.domain.ResumeInfoVo;
import com.catwork.domain.ResumeVo;
import com.catwork.domain.Resume_SkillVo;
import com.catwork.domain.SkillVo;
import com.catwork.domain.UserVo;
import com.catwork.mapper.CompanyMapper;
import com.catwork.mapper.PersonMapper;
import com.catwork.mapper.UserMapper;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/Company")
@Slf4j
@Controller
public class CompanyController {
	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
	private PersonMapper personMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	//기업에서 개인의 이력서 중 공개된 이력서 리스트
	@RequestMapping("/ResumeList")
	public ModelAndView resumeList() {
		//정보를 담을 리스트
		List<ResumeInfoVo> resumeListInfo = new ArrayList<ResumeInfoVo>();
		
		//이력서 목록 가져오기
		List<ResumeVo> resumeList = companyMapper.getResumeList();
		//log.info("[==resumeList==] : ", resumeList);
		//System.out.println("resumeList: " + resumeList);
		
		for(int i = 0; i < resumeList.size(); i++) {		
			//개인 회원 정보 가져오기
			PersonVo person = personMapper.getPersonDetail(resumeList.get(i).getUser_idx());
			//System.out.println("person: " + person);
			
			//기술 스택 가져오기
			//System.out.println("resumeList.get(i).skill_idx: " + resumeList.get(i).getSkill_idx());
			//이력서의 기술 idx 가져오기
			List<Resume_SkillVo> vo = personMapper.getResumeSkill(resumeList.get(i).getResume_idx());
			//System.out.println("resumeskill: " + resumeskill);
			
			List<SkillVo> skillnameList = new ArrayList<SkillVo>();
			for(int j = 0; j < vo.size(); j++) {
				SkillVo skillname = companyMapper.getSkillName(vo.get(j).getSkill_idx());
				System.out.println("skillname: " + skillname);
				skillnameList.add(skillname);
			}
			//System.out.println("skillnameList: " + skillnameList);
			
			//view에 보여질 내용 담기
			resumeListInfo.add(new ResumeInfoVo((i + 1), 
												resumeList.get(i).getResume_idx(),
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
	
	//이력서 목록에서 이력서 상세 보기
	@RequestMapping("/ResumeDetail")
	public ModelAndView writeMyPost(ResumeVo resume) {
		//이력서 내용 가져오기
		ResumeVo vo = personMapper.getResume(resume.getResume_idx());
		
		//이력서 스킬 가져오기
		List<Resume_SkillVo> skills = personMapper.getResumeSkill(vo.getResume_idx());
		//System.out.println("resumeskill: " + resumeskill);
		
		List<SkillVo> skill = new ArrayList<SkillVo>();
		for(int j = 0; j < skills.size(); j++) {
			SkillVo skillname = companyMapper.getSkillName(skills.get(j).getSkill_idx());
			//System.out.println("skillname: " + skillname);
			skill.add(skillname);
		}
		
		//회원 정보 가져오기
		PersonVo info = personMapper.getPersonDetail(vo.getUser_idx());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.addObject("info", info);
		mv.addObject("skill", skill);
		mv.setViewName("/company/resume_detail");
		
		return mv;
	}
	
	//기업의 마이페이지
	@RequestMapping("/MyPage")
	public ModelAndView myPage() {
		//회원 정보
		//회원 정보 가져오기(현재는 특정 회원 고정)
		CompanyVo cvo = companyMapper.getCompanyById(9);
		UserVo vo = userMapper.getUserInfoById(9);
		
		//특정 기업 공고 리스트 가져오기
		List<PostVo> postList = companyMapper.getMyPost(9);
		
		//새공고 쓰기에서 스킬 테이블 가져오기
		List<SkillVo> skill = companyMapper.getSkills();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.addObject("cvo", cvo);
		mv.addObject("postList", postList);
		mv.addObject("skill", skill);
		mv.setViewName("company/com_mypage");
		
		return mv;
	}
	
	//공고 등록하기
	@RequestMapping("/MyPostWrite")
	public ModelAndView writeMyPost(@RequestParam("skillIdx") List<Integer> skillIdxList, PostVo postVo) {
		//@SessionAttribute("login") CompanyVo comVo
		
		ModelAndView mv = new ModelAndView();
		//String id = comVo.getId();
		String id = "com1";
		
		// 기술자격 데이터를 넣기 위해 미리 post_idx를 확정함
		int post_idx = companyMapper.selectpostidxmax();
		postVo.setPost_idx(post_idx);

		// 공고 등록 모달에서 입력한 데이터를 데이터베이스 insert
		companyMapper.insertpost(postVo);

		// 공고 등록 모달에서 선택된 기술자격 정보를 for문을 이용해서 하나씩 데이터베이스 저장
		for (Integer skillIdx : skillIdxList) {
			PostSkillVo skillVo = new PostSkillVo();
			skillVo.setPost_idx(post_idx);
			skillVo.setSkill_idx(skillIdx);
			companyMapper.insertskills(skillVo);
		}
		
		mv.setViewName("redirect:/Company/MyPage");
		//mv.setViewName("redirect:/Company/MyPost?id=" + id + "&nowpage=1");
		return mv;
	}
	
	//기업의 나의 공고
	@RequestMapping("/MyPost")
	public ModelAndView myPost() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("company/mypost");
		
		return mv;
	}
	
	//구직자 이력서 상세 보기
	@RequestMapping("/PersonResume")
	public ModelAndView personResume() {
		//
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("company/resume_detail");
		
		return mv;
	}
	
	//공고 상세 보기
	//지원 현황 및 추천
	@RequestMapping("/PostDetail")
	public ModelAndView postDetail(PostVo postidx) {
		//특정 공고 정보 담기
		PostVo post = companyMapper.getPostDetail(postidx.getPost_idx());
		
		//특정 공고의 스킬 가져오기
		List<PostSkillVo> postSkills = companyMapper.getPostSkills(postidx.getPost_idx());
		
		//스킬 이름 가져오기
		List<SkillVo> skill = new ArrayList<SkillVo>();
		for(int i = 0; i < postSkills.size(); i++) {
			SkillVo skillname = companyMapper.getSkillName(postSkills.get(i).getSkill_idx());
			skill.add(skillname);
		}
		
		
		//지원 현황 가져오기
		//화면에 담을 정보를 가진 도메인
		List<ParticipateVo> participateList = new ArrayList<ParticipateVo>();
		//특정 공고의 지원 현황 가져오기
		List<ApplyVo> applyList = companyMapper.getParticipateList(postidx.getPost_idx());
		//필요한 정보 담기
		for(int i = 0; i < applyList.size(); i++) {
			//이력서 정보 가져오기
			ResumeVo resume = personMapper.getResume(applyList.get(i).getResume_idx()); 
			
			//개인 회원 정보 가져오기
			PersonVo person = personMapper.getPersonDetail(resume.getUser_idx());
			
			//상태를 한글로 가져오기
			String state = "";
			if(applyList.get(i).getState() == 0) {
				state = "미처리";
			} else if(applyList.get(i).getState() == 1) {
				state = "합격";
			} else if(applyList.get(i).getState() == 2) {
				state = "불합격";
			}
			
			//정보 담기
			participateList.add(new ParticipateVo(applyList.get(i).getApply_idx(),
												  resume.getResume_idx(),
												  person.getUser_idx(),
												  resume.getTitle(), 
												  person.getName(),
												  state));
		}
		
		
		//추천 이력서 리스트 가져오기
		//이력서 스킬 리스트 가져오기
		List<Resume_SkillVo> resumeskill = personMapper.getResumeSkillAll();
		//System.out.println("resumeskill: " + resumeskill);
		
		//현재 공고의 skill List : postSkills
		//이 리스트에 1, 1이 들어감
		List<Integer> resume_idxList = new ArrayList<Integer>();
		for(int i = 0; i < postSkills.size(); i++) {
			int resume_idx = 0;
			
			//공고 스킬과 겹치는 이력서 얻기
			if(postSkills.get(0).getSkill_idx() != 9) {
				for(int j = 0; j < resumeskill.size(); j++) {
					if(postSkills.get(i).getSkill_idx() == resumeskill.get(j).getSkill_idx()) {
						resume_idx = resumeskill.get(j).getResume_idx();
						//이미 이력서 정보를 담은 리스트에 없으면 add
						System.out.println("resume_idx : " + resume_idx + ", tf: " + !resume_idxList.contains(resume_idx));
						if(!resume_idxList.contains(resume_idx)) {
							resume_idxList.add(resume_idx);
						}
					}
				}
			} else if(postSkills.get(0).getSkill_idx() == 9) { //스킬이 무관이면 사용
				List<Integer> allResume_idxList = personMapper.getResumeIdxList();
				resume_idxList.addAll(allResume_idxList);
				break;
			}
		}
		//System.out.println("====resume_idxList: " + resume_idxList);
		
		//이력서 정보를 담을 빈 리스트
		List<ResumeVo> resumeList = new ArrayList<ResumeVo>();
		//이력서 목록
		for(int i = 0; i < resume_idxList.size(); i++) {
			ResumeVo resume = personMapper.getResume(resume_idxList.get(i));
			resumeList.add(resume);
		}
		//System.out.println("resumeList: " + resumeList);
		
		//이력서 목록 정보를 담을 리스트
		List<ResumeInfoVo> resumeListInfo = new ArrayList<ResumeInfoVo>();
		
		for(int i = 0; i < resumeList.size(); i++) {		
			//개인 회원 정보 가져오기
			PersonVo person = personMapper.getPersonDetail(resumeList.get(i).getUser_idx());
			//System.out.println("person: " + person);
			
			//기술 스택 가져오기
			//System.out.println("resumeList.get(i).skill_idx: " + resumeList.get(i).getSkill_idx());
			//이력서의 기술 idx 가져오기
			List<Resume_SkillVo> vo = personMapper.getResumeSkill(resumeList.get(i).getResume_idx());
			//System.out.println("resumeskill: " + resumeskill);
			
			List<SkillVo> skillnameList = new ArrayList<SkillVo>();
			for(int j = 0; j < vo.size(); j++) {
				SkillVo skillname = companyMapper.getSkillName(vo.get(j).getSkill_idx());
				//System.out.println("skillname: " + skillname);
				skillnameList.add(skillname);
			}
			
			//view에 보여질 내용 담기
			resumeListInfo.add(new ResumeInfoVo((i + 1), 
												resumeList.get(i).getResume_idx(),
												resumeList.get(i).getTitle(),
												person.getName(),
												skillnameList));
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("post", post);
		mv.addObject("skill", skill);
		mv.addObject("participateList", participateList);
		mv.addObject("resumeListInfo", resumeListInfo);
		mv.setViewName("company/post_detail");
		
		return mv;
	}
	
	@RequestMapping("/ParticipateDetail")
	public ModelAndView participateDetail(ApplyVo apply) {
		//apply_idx로 지원현황 가져오기
		ApplyVo applydetail = companyMapper.getApply(apply.getApply_idx());
		
		//System.out.println("getResume_idx" + applydetail.getResume_idx());
		
		//이력서 내용 가져오기
		ResumeVo vo = personMapper.getResume(applydetail.getResume_idx());
		
		//이력서 스킬 가져오기
		List<Resume_SkillVo> skills = personMapper.getResumeSkill(vo.getResume_idx());
		//System.out.println("resumeskill: " + resumeskill);
		
		List<SkillVo> skill = new ArrayList<SkillVo>();
		for(int j = 0; j < skills.size(); j++) {
			SkillVo skillname = companyMapper.getSkillName(skills.get(j).getSkill_idx());
			//System.out.println("skillname: " + skillname);
			skill.add(skillname);
		}
		
		//회원 정보 가져오기
		PersonVo info = personMapper.getPersonDetail(vo.getUser_idx());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.addObject("info", info);
		mv.addObject("skill", skill);
		mv.setViewName("/company/apply_detail");
		
		return mv;
	}
}
