package com.catwork.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.domain.PersonApplyVo;
import com.catwork.domain.PersonBookmarkVo;
import com.catwork.domain.PersonVo;
import com.catwork.domain.RecommendPostVo;
import com.catwork.domain.ResumeVo;
import com.catwork.domain.Resume_SkillVo;
import com.catwork.domain.UserVo;
import com.catwork.mapper.PersonMapper;
import com.catwork.mapper.ResumeMapper;
import com.catwork.mapper.UserMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class PersonController {

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private PersonMapper personMapper;

	@Autowired
	private ResumeMapper resumeMapper;

	@GetMapping("/MyPage")
	public ModelAndView personMypage(UserVo userVo, PersonVo personVo, ResumeVo resumeVo, PersonApplyVo personApplyVo,
			PersonBookmarkVo personbookmarkVo) {

		PersonVo pvo = personMapper.getPersonInfo(personVo, userVo);

		List<ResumeVo> resumeList = personMapper.getResumeList(resumeVo);

		List<PersonApplyVo> applyList = personMapper.getApplyList(personApplyVo);

		List<PersonBookmarkVo> bookmarkList = personMapper.getBookmarkList(personbookmarkVo);

		ModelAndView mv = new ModelAndView();
		mv.addObject("pvo", pvo);
		mv.addObject("resumeList", resumeList);
		mv.addObject("bookmarkList", bookmarkList);
		mv.addObject("applyList", applyList);
		mv.setViewName("/person/myPage");

		return mv;
	}

	@GetMapping("/MyPage/UpdateForm")
	public ModelAndView myPageUpdateForm(UserVo userVo, PersonVo personVo) {
		PersonVo pvo = personMapper.getPersonInfo(personVo,userVo);
		PersonVo vo =personMapper.getPwd(personVo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/person/myPageUpdate");
		mv.addObject("pvo",pvo);
		mv.addObject("vo",vo);
		return mv;

	}

	@PostMapping("/MyPageUpdate")

	public ModelAndView myPageUpdate(UserVo userVo, PersonVo personVo, @RequestParam("address2") String address2) {
		
		
		
		
		
		String pwd = personVo.getPwd();
		if(pwd != null) {
			String add = personVo.getAddress();
			personMapper.updateMyInfo(personVo); 
			add +=  ", " + address2;
			System.out.println(add);
			personVo.setAddress(add);
			
			personMapper.updateMyInfo2(personVo);
			
			
		}else {
			
		}
		
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

		System.out.println("===-----------------------======" + resumeVo);

		resumeMapper.insertResume(resumeVo);

//		System.out.println("이력서 스킬 넣는 중3333"+resumeSkillList);
		List<Resume_SkillVo> resumeSkillList = new ArrayList<>();
		String[] skillList = resumeVo.getSkill_idx().split(",");
//		System.out.println("이력서 스킬 넣는 중12"+Arrays.toString(skillList));
		for (String s_skill_idx : skillList) {

			resumeSkillList.add(new Resume_SkillVo(Integer.parseInt(s_skill_idx)));
		}
		System.out.println("이력서 스킬 넣는 중" + resumeSkillList);
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
		mv.addObject("vo", vo);
		mv.setViewName("/person/resume_Update");
		return mv;

	}

	@GetMapping("/Resume/Update")
	public ModelAndView resumeUpdate(ResumeVo resumeVo) {

		resumeMapper.updateResume(resumeVo);

//		System.out.println("이력서 스킬 넣는 중3333"+resumeSkillList);
		List<Resume_SkillVo> resumeSkillList = new ArrayList<>();
		String[] skillList = resumeVo.getSkill_idx().split(",");
//		System.out.println("이력서 스킬 넣는 중12"+Arrays.toString(skillList));
		for (String s_skill_idx : skillList) {

			resumeSkillList.add(new Resume_SkillVo(Integer.parseInt(s_skill_idx)));
		}
		System.out.println("이력서 스킬 넣는 중" + resumeSkillList);
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
	@GetMapping("/Resume/GetrecommendList")
	public ModelAndView resumeRecommendList(RecommendPostVo recommendPostVo, ResumeVo resumeVo) {
		
		//ResumeVo vo = resumeMapper.getResume(resumeVo);
		List<RecommendPostVo> postList = resumeMapper.getPostList(recommendPostVo);
		ModelAndView mv = new ModelAndView();
		//mv.addObject("vo",vo);
		mv.addObject("postList",postList);
		mv.setViewName("/person/recommendPost");
		return mv;
	}
	
	// 특정 구직자의 특정 공고에 지원하기( 중복 안되게 할것( 이미 지원한 공고라면 지원하기 버튼 없애는 방법 또는 지원하기 눌렀을때 이미
	// 지원한 공고라고 알람 출력 ) )
	@RequestMapping("/Person/JoinPost")
	public ModelAndView joinpost(@RequestParam HashMap<String, Object> map/* , HttpServletRequest request */) {

		int com_idx = Integer.parseInt((String.valueOf(map.get("com_idx"))));
		int resume_idx = Integer.parseInt((String.valueOf(map.get("resume_idx"))));
		int post_idx = Integer.parseInt((String.valueOf(map.get("post_idx"))));
		//String user_idx = request.getUserPrincipal().getName(); // 현재 로그인한 사용자의 ID를 가져옵니다.
		int user_idx = Integer.parseInt((String.valueOf(map.get("user_idx"))));	// HomeController 의 /Company/Viewpost 부분에서도 같이 지워줘야함
		// 이미 지원한 공고인지 확인
		boolean alreadyApplied = personMapper.checkIfAlreadyApplied(user_idx, post_idx);

		ModelAndView mv = new ModelAndView();

		if (alreadyApplied) {
			// 이미 지원한 공고라면 알람을 출력하거나 다른 처리를 할 수 있습니다.
			// 예를 들어, 사용자에게 메시지를 보여주는 페이지로 리디렉션
			mv.addObject("message", "이미 지원한 공고입니다.");
			mv.setViewName("redirect:/Company/Viewpost?post_idx=" + post_idx + "&com_idx=" + com_idx);
		} else {
			// 아직 지원하지 않은 공고라면 지원 로직을 진행
			personMapper.insertProposal(resume_idx, post_idx);

			// 뷰 이름 설정 (예: 공고 보기 페이지로 리디렉션)
			mv.setViewName("redirect:/Company/Viewpost?post_idx=" + post_idx + "&com_idx=" + com_idx);
		}

		return mv;
	}
	
	// 개인회원 로그인
		@PostMapping("/Person/Login")
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
		@RequestMapping("/Person/JoinForm")
		public String joinForm() {
			return "join";
		}
		
		// 개인회원 회원가입
		@RequestMapping("/Person/Join")
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
