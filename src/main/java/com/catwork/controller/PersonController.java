package com.catwork.controller;

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
		PersonVo pvo = personMapper.getPersonInfo(personVo, userVo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/person/myPageUpdate");
		mv.addObject("pvo", pvo);

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

}
