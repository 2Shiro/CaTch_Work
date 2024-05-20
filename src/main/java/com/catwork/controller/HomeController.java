package com.catwork.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.domain.CompanyVo;
import com.catwork.domain.MainPageVo;
import com.catwork.domain.PostSkillVo;
import com.catwork.domain.PostVo;
import com.catwork.domain.ResumeVo;
import com.catwork.domain.SkillVo;
import com.catwork.mapper.CompanyMapper;
import com.catwork.mapper.PersonMapper;
import com.catwork.mapper.ResumeMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
	private PersonMapper personMapper;
	
	@Autowired
	private ResumeMapper resumeMapper;

	// 메인화면
	@RequestMapping("/")
	public ModelAndView main() {
	    int user_idx = 1; // 사용자 ID를 임시로 설정
	    List<MainPageVo> mainPageList = new ArrayList<>();
	    List<PostVo> postList = companyMapper.getmainpostList();

	    // 사용자의 북마크 정보를 조회하는 로직 추가 (가정)
	    List<Integer> bookmarkedPostIds = personMapper.getBookmarked(user_idx);

	    for (PostVo post : postList) {
	        CompanyVo company = companyMapper.getCompanyById(post.getUser_idx());
	        boolean isBookmarked = bookmarkedPostIds.contains(post.getPost_idx()); // 북마크 여부 확인
	        MainPageVo mainPageVo = new MainPageVo(post.getPost_idx(), post.getUser_idx(), company.getCom_idx(), company.getLogo(), company.getName(),
	                post.getTitle(), post.getDeadline(), isBookmarked); // 북마크 여부를 포함하여 객체 생성
	        mainPageList.add(mainPageVo);
	    }

	    ModelAndView mv = new ModelAndView();
	    mv.addObject("postList", postList);
	    mv.addObject("mainPageList", mainPageList);
	    mv.setViewName("/home");
	    return mv;
	}

	// 검색 기능 - AJAX 호출
	@RequestMapping("/Search")
	@ResponseBody
	public ResponseEntity<List<MainPageVo>> search(
	        @RequestParam(value="keyword", required=false, defaultValue="") String keyword,
	        @RequestParam(value="department", required=false, defaultValue="") String department,
	        @RequestParam(value="region", required=false, defaultValue="") String region,
	        @RequestParam(value="career", required=false, defaultValue="") String career,
	        @RequestParam(value="jobtype", required=false, defaultValue="") String jobtype) {
	    
	    int user_idx = 1; // 사용자 ID를 임시로 설정
	    List<MainPageVo> searchResults = new ArrayList<>();

	    // 사용자의 북마크 정보를 조회하는 로직 추가 (가정)
	    List<Integer> bookmarkedPostIds = personMapper.getBookmarked(user_idx);

	    List<PostVo> searchedPosts = companyMapper.searchPosts(keyword, department, region, career, jobtype);

	    for (PostVo post : searchedPosts) {
	        CompanyVo company = companyMapper.getCompanyById(post.getUser_idx());
	        boolean isBookmarked = bookmarkedPostIds.contains(post.getPost_idx()); // 북마크 여부 확인
	        MainPageVo mainPageVo = new MainPageVo(post.getPost_idx(), post.getUser_idx(), company.getCom_idx(), company.getLogo(), company.getName(),
	                post.getTitle(), post.getDeadline(), isBookmarked); // 북마크 여부를 포함하여 객체 생성
	        searchResults.add(mainPageVo);
	    }
	    return ResponseEntity.ok(searchResults); // 검색 결과를 JSON 형태로 반환
	}

    
    
	@RequestMapping("/Company/Viewpost")
	public ModelAndView viewpost(@RequestParam("post_idx") int post_idx, @RequestParam("com_idx") int com_idx, PostVo postidx) {
	    // POST_TB 에서 해당 공고 찾기
	    PostVo postvo = companyMapper.getViewPost(post_idx);
	    
	    // CompanyVo 객체 생성 및 데이터 설정
	    CompanyVo companyvo = companyMapper.getCompanyByComId(com_idx); // com_idx로 회사 정보를 가져옴
	    
		//특정 공고의 스킬 가져오기
		//List<PostSkillVo> postSkills = companyMapper.getPostSkills(postidx);
		List<PostSkillVo> postSkills = companyMapper.getPostSkills(postidx.getPost_idx());
		
		//스킬 이름 가져오기
		List<SkillVo> skill = new ArrayList<SkillVo>();
		for(int i = 0; i < postSkills.size(); i++) {
			SkillVo skillname = companyMapper.getSkillName(postSkills.get(i).getSkill_idx());
			skill.add(skillname);
		}
	    
	    ModelAndView mv = new ModelAndView();
	    
	    // 예시로 사용자 ID를 직접 지정. 실제로는 인증 정보에서 사용자 ID를 가져와야 함.
	    int user_idx = 1; // 수정해야함
	    
	    // 사용자의 북마크 정보를 조회하는 로직 추가 (가정)
	    List<Integer> bookmarkedPostIds = personMapper.getBookmarked(user_idx);
	    boolean isBookmarked = bookmarkedPostIds.contains(postidx.getPost_idx()); // 북마크 여부 확인

	    // 이력서 목록을 가져옴
	    List<ResumeVo> resumevo = resumeMapper.getResumesByUserId(user_idx);
	    
	    System.out.println("사용자 ID: " + user_idx);
	    System.out.println("북마크된 공고 ID 목록: " + bookmarkedPostIds);
	    System.out.println("현재 공고 ID: " + post_idx);
	    System.out.println("북마크 여부: " + isBookmarked);

	    mv.addObject("user_idx", user_idx);
	    mv.addObject("bookmarked", isBookmarked);
	    mv.addObject("skill", skill);
	    mv.addObject("resumevo", resumevo);
	    mv.addObject("postvo", postvo);
	    mv.addObject("companyvo", companyvo);
	    
	    mv.setViewName("/company/viewpost");
	    return mv;
	}


}
