package com.catwork.controller;
//import com.catwork.mapper.CompanyMapper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.domain.ApplyVo;
import com.catwork.domain.CompanyVo;
import com.catwork.domain.Pagination;
import com.catwork.domain.PagingResponse;
import com.catwork.domain.PagingVo;
import com.catwork.domain.ParticipateVo;
import com.catwork.domain.PersonVo;
import com.catwork.domain.PostSkillVo;
import com.catwork.domain.PostVo;
import com.catwork.domain.ResumeInfoVo;
import com.catwork.domain.ResumeVo;
import com.catwork.domain.Resume_SkillVo;
import com.catwork.domain.SkillVo;
import com.catwork.domain.StateVo;
import com.catwork.domain.UserVo;
import com.catwork.mapper.CompanyMapper;
import com.catwork.mapper.PersonMapper;
import com.catwork.mapper.UserMapper;

import io.micrometer.common.util.StringUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
	public ModelAndView resumeList(@RequestParam(value = "nowpage") int nowpage
			, @RequestParam(value = "searchword", defaultValue = "none") String searchword,
			@SessionAttribute("login") UserVo userVo) {	
		//회원 정보 세션 가져오기
		int user_idx = userMapper.getUser_idx(userVo.getId());
		//int user_idx = (Integer)session.getAttribute("user_idx");
		//int user_idx = userVo.getUser_idx();
		
		//System.out.println("user_idx: " + user_idx);
		
		//회원 정보 가져오기(현재는 특정 회원 고정)
		//CompanyVo cvo = companyMapper.getCompanyById(user_idx);
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		// session에서 id를 가져옴
		//String id = comVo.getId();
		
		String originword = searchword;
		
		//검색어 공백 제거
		searchword = searchword.replaceAll(" ", "");
		
		//검색어 치환 한국어
		if(searchword.equals("자바")) {
			searchword = "JAVA";
		} else if (searchword.equals("스프링")) {
			searchword = "SPRING";
		} else if (searchword.equals("부트")) {
			searchword = "BOOT";
		} else if (searchword.equals("스프링부트")) {
			searchword = "SPRING";
		} else if (searchword.equals("레거시")) {
			searchword = "LEGACY";
		} else if (searchword.equals("디비") || searchword.equals("데이터베이스") || searchword.equals("데이터")) {
			searchword = "DB";
		} else if (searchword.equals("스크립트")) {
			searchword = "SCRIPT";
		} else if (searchword.equals("자바스크립트")) {
			searchword = "JAVASCRIPT";
		} 
		
		//정보를 담을 리스트
		List<ResumeInfoVo> resumeListInfo = new ArrayList<ResumeInfoVo>();
		
		//List<ResumeVo> resumeList = companyMapper.getResumeList();
		
		//이력서 목록 가져오기
		List<ResumeVo> resumeList = companyMapper.getResumeList();
		
		//System.out.println("searchword" + searchword);
		
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
		
		// 페이징
		int count = 0;
		
		//검색어 별 count
		if(searchword.equals("none")) {
			count = companyMapper.countResumeList(resumeList);
		} else {
			for(int i = 0; i < resumeListInfo.size(); i++) {
				for(int j = 0; j < resumeListInfo.get(i).getSkillList().size(); j++) {
					if(searchword.toUpperCase().equals(resumeListInfo.get(i).getSkillList().get(j).getName().toUpperCase())) {
						count++;
					}
				}
			}
		}
		
		
		//int count = resumeListInfo.size();
		PagingResponse<ResumeVo> response = null;
		if (count < 1) {
			response = new PagingResponse<>(Collections.emptyList(), null);
		}
		// 페이징을 위한 초기 설정값
		PagingVo pagingVo = new PagingVo();
		pagingVo.setPage(nowpage);
		pagingVo.setPageSize(3);
		pagingVo.setRecordSize(3);//

		// Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
		Pagination pagination = new Pagination(count, pagingVo);
		pagingVo.setPagination(pagination);

		int offset = pagingVo.getOffset();
		int pageSize = pagingVo.getPageSize();

		List<ResumeVo> pagingList = new ArrayList<>();
		
		if(searchword.equals("none")) {
			pagingList = companyMapper.getResumeListPaging(offset, pageSize);
		} else {
			pagingList = companyMapper.getResumeListPagingSearch(offset, pageSize, searchword);
		}
		
		response = new PagingResponse<>(pagingList, pagination);
		//response = new PagingResponse<>(pagingList, pagination, resumeListInfo, offset);
		
		System.out.println("list: " + response.getList());
		
		//검색어 원래 값으로 돌리기
		searchword = originword;
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("resumeList", resumeList);
		mv.addObject("response", response);
		mv.addObject("pagingVo", pagingVo);
		mv.addObject("searchword", searchword);
		mv.addObject("nowpage", nowpage);
		mv.addObject("usertype", usertype);
		mv.setViewName("company/resumeList");
		
		return mv;
	}
	
	//이력서 목록에서 이력서 상세 보기
	@RequestMapping("/ResumeDetail")
	public ModelAndView resumeDetail(ResumeVo resume, 
			@SessionAttribute("login") UserVo userVo) {	
		//회원 정보 세션 가져오기
		int user_idx = userMapper.getUser_idx(userVo.getId());
		//int user_idx = (Integer)session.getAttribute("user_idx");
		//int user_idx = userVo.getUser_idx();
		
		//System.out.println("user_idx: " + user_idx);
		
		//회원 정보 가져오기(현재는 특정 회원 고정)
		//CompanyVo cvo = companyMapper.getCompanyById(user_idx);
		UserVo usertype = userMapper.getUserInfoById(user_idx);
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
		mv.addObject("usertype", usertype);
		mv.setViewName("/company/resume_detail");
		
		return mv;
	}
	
	//기업의 마이페이지
	@RequestMapping("/MyPage")
	public ModelAndView myPage(@RequestParam(value = "nowpage") int nowpage, 
			@SessionAttribute("login") UserVo userVo) {	
		//회원 정보 세션 가져오기
		int user_idx = userMapper.getUser_idx(userVo.getId());
		//int user_idx = (Integer)session.getAttribute("user_idx");
		//int user_idx = userVo.getUser_idx();
		
		//System.out.println("user_idx: " + user_idx);
		
		//회원 정보 가져오기(현재는 특정 회원 고정)
		//CompanyVo cvo = companyMapper.getCompanyById(user_idx);
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		//회원 정보 세션 가져오기
		
		//System.out.println("user_idx: " + user_idx);
		
		//회원 정보 가져오기(현재는 특정 회원 고정)
		CompanyVo cvo = companyMapper.getCompanyById(user_idx);
		UserVo vo = userMapper.getUserInfoById(user_idx);
		
		//평점 가져오기
		int rate = companyMapper.getMyRate(user_idx);
		
		//특정 기업 공고 리스트 가져오기
		List<PostVo> postList = companyMapper.getMyPost(user_idx);
		
		//공고 리스트 페이징
		int count = postList.size();
		//int count = resumeListInfo.size();
		PagingResponse<PostVo> response = null;
		if (count < 1) {
			response = new PagingResponse<>(Collections.emptyList(), null);
		}
		// 페이징을 위한 초기 설정값
		PagingVo pagingVo = new PagingVo();
		pagingVo.setPage(nowpage);
		pagingVo.setPageSize(3);
		pagingVo.setRecordSize(3);

		// Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
		Pagination pagination = new Pagination(count, pagingVo);
		pagingVo.setPagination(pagination);

		int offset = pagingVo.getOffset();
		int pageSize = pagingVo.getPageSize();

		List<PostVo> pagingList = companyMapper.getPostListPaging(offset, pageSize, user_idx);
		response = new PagingResponse<>(pagingList, pagination);
		
		//새공고 쓰기에서 스킬 테이블 가져오기
		List<SkillVo> skill = companyMapper.getSkills();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.addObject("cvo", cvo);
		mv.addObject("rate", rate);
		//mv.addObject("postList", postList);
		mv.addObject("skill", skill);
		mv.addObject("response", response);
		mv.addObject("pagingVo", pagingVo);
		mv.addObject("nowpage", nowpage);
		mv.addObject("usertype", usertype);
		mv.setViewName("company/com_mypage");
		
		return mv;
	}
	
	//공고 리스트만
	@RequestMapping("/MyPostList")
	public ModelAndView myPostList(@RequestParam(value = "nowpage") int nowpage, 
			@SessionAttribute("login") UserVo userVo) {	
		/*
		//회원 정보 세션 가져오기
		int user_idx = userMapper.getUser_idx(userVo.getId());
		
		System.out.println("user_idx: " + user_idx);
		
		//회원 정보 가져오기(현재는 특정 회원 고정)
		UserVo usertype = userMapper.getUserInfoById(user_idx);
				
		//회원 정보 가져오기
		CompanyVo cvo = companyMapper.getCompanyById(user_idx);
		UserVo vo = userMapper.getUserInfoById(user_idx);
		
		//특정 기업 공고 리스트 가져오기
		List<PostVo> postList = companyMapper.getMyPost(user_idx);
		
		//System.out.println("postList: " + postList);
		
		//공고 리스트 페이징
		int count = postList.size();
		System.out.println("count: " + count);
		
		//int count = resumeListInfo.size();
		PagingResponse<PostVo> response = null;
		if (count < 1) {
			response = new PagingResponse<>(Collections.emptyList(), null);
		}
		// 페이징을 위한 초기 설정값
		PagingVo pagingVo = new PagingVo();
		pagingVo.setPage(nowpage);
		pagingVo.setPageSize(3);
		pagingVo.setRecordSize(3);

		// Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
		Pagination pagination = new Pagination(count, pagingVo);
		pagingVo.setPagination(pagination);

		int offset = pagingVo.getOffset();
		int pageSize = pagingVo.getPageSize();

		List<PostVo> pagingList = companyMapper.getPostListPaging(offset, pageSize, user_idx);
		response = new PagingResponse<>(pagingList, pagination);
		
		//새공고 쓰기에서 스킬 테이블 가져오기
		List<SkillVo> skill = companyMapper.getSkills();
		
		System.out.println("mtpostlist" + response.getList());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.addObject("cvo", cvo);
		//mv.addObject("postList", postList);
		//mv.addObject("skill", skill);
		mv.addObject("response", response);
		mv.addObject("pagingVo", pagingVo);
		mv.addObject("nowpage", nowpage);
		mv.addObject("usertype", usertype);
		*/
		//회원 정보 세션 가져오기
		int user_idx = userMapper.getUser_idx(userVo.getId());
		//int user_idx = (Integer)session.getAttribute("user_idx");
		//int user_idx = userVo.getUser_idx();
		
		//System.out.println("user_idx: " + user_idx);
		
		//회원 정보 가져오기(현재는 특정 회원 고정)
		//CompanyVo cvo = companyMapper.getCompanyById(user_idx);
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		//회원 정보 세션 가져오기
		
		//System.out.println("user_idx: " + user_idx);
		
		//회원 정보 가져오기(현재는 특정 회원 고정)
		CompanyVo cvo = companyMapper.getCompanyById(user_idx);
		UserVo vo = userMapper.getUserInfoById(user_idx);
		
		//평점 가져오기
		int rate = companyMapper.getMyRate(user_idx);
		
		//특정 기업 공고 리스트 가져오기
		List<PostVo> postList = companyMapper.getMyPost(user_idx);
		
		//공고 리스트 페이징
		int count = postList.size();
		//int count = resumeListInfo.size();
		PagingResponse<PostVo> response = null;
		if (count < 1) {
			response = new PagingResponse<>(Collections.emptyList(), null);
		}
		// 페이징을 위한 초기 설정값
		PagingVo pagingVo = new PagingVo();
		pagingVo.setPage(nowpage);
		pagingVo.setPageSize(3);
		pagingVo.setRecordSize(3);

		// Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
		Pagination pagination = new Pagination(count, pagingVo);
		pagingVo.setPagination(pagination);

		int offset = pagingVo.getOffset();
		int pageSize = pagingVo.getPageSize();

		List<PostVo> pagingList = companyMapper.getPostListPaging(offset, pageSize, user_idx);
		response = new PagingResponse<>(pagingList, pagination);
		
		//새공고 쓰기에서 스킬 테이블 가져오기
		//List<SkillVo> skill = companyMapper.getSkills();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.addObject("cvo", cvo);
		mv.addObject("rate", rate);
		//mv.addObject("postList", postList);
		//mv.addObject("skill", skill);
		mv.addObject("response", response);
		mv.addObject("pagingVo", pagingVo);
		mv.addObject("nowpage", nowpage);
		mv.addObject("usertype", usertype);
				
		
		mv.setViewName("/company/my/mypostlist");
		
		return mv;
	}
	
	//공고 등록하기
	@RequestMapping("/MyPostWrite")
	public ModelAndView writeMyPost(@RequestParam("skillIdx") List<Integer> skillIdxList, PostVo postVo, 
									@SessionAttribute("login") UserVo userVo) {
		//회원 정보 세션 가져오기
		int user_idx = userMapper.getUser_idx(userVo.getId());

		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		ModelAndView mv = new ModelAndView();
		//String id = comVo.getId();
		
		// 기술자격 데이터를 넣기 위해 미리 post_idx를 확정함
		int post_idx = companyMapper.selectpostidxmax();
		postVo.setPost_idx(post_idx);
		postVo.setUser_idx(user_idx);

		// 공고 등록 모달에서 입력한 데이터를 데이터베이스 insert
		companyMapper.insertpost(postVo);

		// 공고 등록 모달에서 선택된 기술자격 정보를 for문을 이용해서 하나씩 데이터베이스 저장
		for (Integer skillIdx : skillIdxList) {
			PostSkillVo skillVo = new PostSkillVo();
			skillVo.setPost_idx(post_idx);
			skillVo.setSkill_idx(skillIdx);
			companyMapper.insertskills(skillVo);
		}
		
		mv.addObject("usertype", usertype);
		mv.setViewName("redirect:/Company/MyPage?nowpage=1");
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
	
	//공고 상세 보기
	//지원 현황 및 추천
	@RequestMapping("/PostDetail")
	public ModelAndView postDetail(PostVo postidx, @SessionAttribute("login") UserVo userVo) {
		//회원 정보 세션 가져오기
		int user_idx = userMapper.getUser_idx(userVo.getId());

		UserVo usertype = userMapper.getUserInfoById(user_idx);
		//특정 공고 정보 담기
		PostVo post = companyMapper.getPostDetail(postidx.getPost_idx());
		
		//특정 공고의 스킬 가져오기
		//List<PostSkillVo> postSkills = companyMapper.getPostSkills(postidx);
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
		
		//지원 현황 페이징
		
		
		
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
		mv.addObject("post_idx", postidx);
		mv.addObject("participateList", participateList);
		mv.addObject("resumeListInfo", resumeListInfo);
		mv.addObject("usertype", usertype);
		mv.setViewName("company/post_detail");
		
		return mv;
	}
	
	@RequestMapping("/ParticipateDetail")
	public ModelAndView participateDetail(ApplyVo apply, @SessionAttribute("login") UserVo userVo) {
		//회원 정보 세션 가져오기
		int user_idx = userMapper.getUser_idx(userVo.getId());

		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		ModelAndView mv = new ModelAndView();
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
		
		if(applydetail.getState() != 0) {
			//state 정보 가져오기
			StateVo state = companyMapper.getState(applydetail.getApply_idx());
			state.setState(applydetail.getState());
			System.out.println("state" + state);
			
			mv.addObject("state", state);
		}
		
		//회원 정보 가져오기
		PersonVo info = personMapper.getPersonDetail(vo.getUser_idx());
		
		mv.addObject("vo", vo);
		mv.addObject("info", info);
		mv.addObject("skill", skill);
		mv.addObject("apply", apply);
		mv.addObject("applydetail", applydetail);
		mv.addObject("usertype", usertype);
		mv.setViewName("/company/apply_detail");
		
		return mv;
	}
	
	@RequestMapping("/PostUpdateForm")
	public ModelAndView postUpdateForm(PostVo post_idx, @SessionAttribute("login") UserVo userVo) {
		//회원 정보 세션 가져오기
		int user_idx = userMapper.getUser_idx(userVo.getId());

		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		//post 정보 가져오기
		PostVo post = companyMapper.getPostDetail(post_idx.getPost_idx());
		
		//모든 스킬 가져오기
		List<SkillVo> skill = companyMapper.getAllSKills();
		
		//post 스킬 가져오기
		List<PostSkillVo> postSkills = companyMapper.getPostSkills(post_idx.getPost_idx());
		
		//System.out.println("post_idx: " + post_idx.getPost_idx());
		//System.out.println("this post: " + post);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("post", post);
		mv.addObject("skill", skill);
		mv.addObject("postSkills", postSkills);
		mv.addObject("usertype", usertype);
		mv.setViewName("company/postupdateform");
		
		return mv;
	}
	
	@RequestMapping("/PostUpdate")
	public ModelAndView postUpdate(@RequestParam("skillIdx") List<Integer> skillIdxList, PostVo post,
			@SessionAttribute("login") UserVo userVo) {
		//회원 정보 세션 가져오기
		int user_idx = userMapper.getUser_idx(userVo.getId());

		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		//String id = comVo.getId();
		// 해당 공고의 post_idx를 확정
		int post_idx = post.getPost_idx();
		post.setPost_idx(post_idx);
		
		//System.out.println("post1: " + post);

		// 해당 공고의 정보를 update
		companyMapper.updatePost(post);
		
		//System.out.println("post2: " + post);

		// 해당 공고의 모든 기술자격 데이터를 삭제
		companyMapper.deletepostskills(post);
		
		//System.out.println("post3: " + post);

		// 해당 공고의 기술자격 데이터를 다시 입력
		for (Integer skillIdx : skillIdxList) {
			PostSkillVo skillVo = new PostSkillVo();
			skillVo.setPost_idx(post_idx);
			skillVo.setSkill_idx(skillIdx);
			companyMapper.insertskills(skillVo);
		}
		
		//System.out.println("post4: " + post);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("usertype", usertype);
		mv.setViewName("redirect:/Company/PostDetail?post_idx=" + post.getPost_idx());
		
		return mv;
	}
	
	//회원 정보 수정
	@RequestMapping("/InfoUpdateForm")
	public ModelAndView infoUpdateform(UserVo infoUser, CompanyVo infoCompany,
			@SessionAttribute("login") UserVo userVo) {
		//회원 정보 세션 가져오기
		int user_idx = userMapper.getUser_idx(userVo.getId());

		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		UserVo user = userMapper.getUserInfoById(infoUser.getUser_idx());
		CompanyVo company = companyMapper.getCompanyById(user.getUser_idx());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", user);
		mv.addObject("company", company);
		mv.addObject("usertype", usertype);
		mv.setViewName("/company/infoupdateform");
		
		return mv;
	}
	@RequestMapping("/InfoUpdate")
	public ModelAndView infoUpdate(UserVo userVo, CompanyVo companyVo, 
									@RequestParam("address2") String address2, //상세 주소
									@RequestParam("tbpwd") String tbpwd, //기존 비밀 번호
									@RequestParam("file") MultipartFile file, 
									@Value("${file.upload-dir}") String uploadDir,
									@SessionAttribute("login") UserVo loginuserVo) {
		//회원 정보 세션 가져오기
		int user_idx = userMapper.getUser_idx(loginuserVo.getId());

		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
		ModelAndView mv = new ModelAndView();
		
		if (file != null && !file.isEmpty()) {
			try {
				// 파일 저장 경로 구성
				String baseDir = System.getProperty("user.dir");
				String imagesDirPath = baseDir + uploadDir; // application.properties에서 설정된 값을 사용

				File directory = new File(imagesDirPath);
				if (!directory.exists()) {
					directory.mkdirs();
				}
				DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");
				ZonedDateTime current = ZonedDateTime.now();
				String namePattern = current.format(format);

				// 파일의 원래 이름을 가져옵니다.
				String originalFileName = file.getOriginalFilename();
				// 파일 확장자를 추출합니다.
				String extension = "";
				if (originalFileName != null && originalFileName.contains(".")) {
					extension = originalFileName.substring(originalFileName.lastIndexOf("."));
				}

				// System.out.println(namePattern);
				String fileName = namePattern + "_" + originalFileName; //??
				//String fileName = originalFileName; //??
				String filePath = Paths.get(imagesDirPath, fileName).toString();

				// 파일 저장 //여기 문제 있음
				Files.copy(file.getInputStream(), Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);

				// 데이터베이스에 저장할 파일 경로 설정
				String relativePath = "/img/" + fileName;
				companyVo.setLogo(relativePath);

			} catch (IOException e) {
				e.printStackTrace();
				// 에러 처리 로직
			}
		} else {
			// 파일이 선택되지 않았거나 비어 있는 경우, 기본 이미지 경로를 사용
			String relativePath = "/img/logo_default.jpg";
			companyVo.setLogo(relativePath);
		}
		
		//db에서 주소 가져오기
		String dbAddress = companyMapper.getAddress(companyVo);
		String add = companyVo.getAddress();
		
		if(!dbAddress.equals(add)) {
			add +=  ", " + address2;
			System.out.println(add);
			companyVo.setAddress(add);	
		}
		
  
		//비밀번호 외 업데이트(못바꾸는 아이디는 안바꿈)
		userMapper.updateInfo(userVo);
		companyMapper.updateInfo(companyVo);
  
		System.out.println("userVo: " + userVo);
		System.out.println("password: " + userVo.getPwd());
		
		//비밀번호가 있다면 비밀번호 바꿈
//		if(!userVo.getPwd().equals(null) || userVo.getPwd().equals("")) {
//			System.out.println("password: " + userVo.getPwd());
//			
//			//비밀번호 바꾸기
//			userMapper.updatePassword(userVo);
//		} else if(userVo.getPwd().equals(null)) {
//			System.out.println("null");
//		}
		if (userVo.getPwd() == null || StringUtils.isBlank(userVo.getPwd())) {
		    System.out.println("password is null or empty");
		} else {
		    System.out.println("password: " + userVo.getPwd());
		    userMapper.updatePassword(userVo);
		}
  
		mv.addObject("usertype", usertype);
		mv.setViewName("redirect:/Company/MyPage?nowpage=1");
		return mv;
	      
	}
	
	//특정 공고의 추천 이력서에서 이력서 보기
	@RequestMapping("/PersonResume")
	public ModelAndView personResume(ResumeVo resume, 
			@SessionAttribute("login") UserVo userVo) {
		//회원 정보 세션 가져오기
		int user_idx = userMapper.getUser_idx(userVo.getId());

		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
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
		
		//user 가져오기
		UserVo user = userMapper.getUserInfoById(vo.getUser_idx());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.addObject("info", info);
		mv.addObject("user", user);
		mv.addObject("skill", skill);
		mv.addObject("usertype", usertype);
		mv.setViewName("/company/resume_detail");
		
		return mv;
	}
	
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
		public ModelAndView ComJoin(CompanyVo comVo, HttpServletRequest request) {
			
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
