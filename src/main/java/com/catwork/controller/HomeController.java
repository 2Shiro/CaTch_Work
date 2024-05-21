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

import jakarta.servlet.http.HttpSession;
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
	public ModelAndView main(HttpSession session) {
	    // 세션에서 user_idx 가져오기. 로그인하지 않은 경우 기본값은 null
	    Integer user_idx = (Integer) session.getAttribute("user_idx");
	    List<MainPageVo> mainPageList = new ArrayList<>();
	    List<PostVo> postList = companyMapper.getmainpostList();

	    List<Integer> bookmarkedPostIds = new ArrayList<>();
	    if (user_idx != null) {
	        // 로그인한 사용자의 북마크 정보를 조회
	        bookmarkedPostIds = personMapper.getBookmarked(user_idx);
	    }

	    for (PostVo post : postList) {
	        CompanyVo company = companyMapper.getCompanyById(post.getUser_idx());
	        boolean isBookmarked = bookmarkedPostIds.contains(post.getPost_idx());
	        MainPageVo mainPageVo = new MainPageVo(post.getPost_idx(), post.getUser_idx(), company.getCom_idx(), company.getLogo(), company.getName(),
	                post.getTitle(), post.getDeadline(), isBookmarked);
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
	        @RequestParam(value="jobtype", required=false, defaultValue="") String jobtype,
	        HttpSession session) {
	    
	    Integer user_idx = (Integer) session.getAttribute("user_idx");
	    List<MainPageVo> searchResults = new ArrayList<>();

	    List<Integer> bookmarkedPostIds = new ArrayList<>();
	    if (user_idx != null) {
	        bookmarkedPostIds = personMapper.getBookmarked(user_idx);
	    }

	    List<PostVo> searchedPosts = companyMapper.searchPosts(keyword, department, region, career, jobtype);

	    for (PostVo post : searchedPosts) {
	        CompanyVo company = companyMapper.getCompanyById(post.getUser_idx());
	        boolean isBookmarked = bookmarkedPostIds.contains(post.getPost_idx());
	        MainPageVo mainPageVo = new MainPageVo(post.getPost_idx(), post.getUser_idx(), company.getCom_idx(), company.getLogo(), company.getName(),
	                post.getTitle(), post.getDeadline(), isBookmarked);
	        searchResults.add(mainPageVo);
	    }
	    return ResponseEntity.ok(searchResults);
	}

    
    
	@RequestMapping("/Company/Viewpost")
	public ModelAndView viewpost(@RequestParam("post_idx") int post_idx, @RequestParam("com_idx") int com_idx, PostVo postidx, HttpSession session) {
	    PostVo postvo = companyMapper.getViewPost(post_idx);
	    CompanyVo companyvo = companyMapper.getCompanyByComId(com_idx);
	    
		List<PostSkillVo> postSkills = companyMapper.getPostSkills(postidx.getPost_idx());
		List<SkillVo> skill = new ArrayList<SkillVo>();
		for(int i = 0; i < postSkills.size(); i++) {
			SkillVo skillname = companyMapper.getSkillName(postSkills.get(i).getSkill_idx());
			skill.add(skillname);
		}
	    
	    ModelAndView mv = new ModelAndView();
	    
	    Integer user_idx = (Integer) session.getAttribute("user_idx");
	    boolean isBookmarked = false;
	    List<ResumeVo> resumevo = new ArrayList<>();

	    if (user_idx != null) {
	        isBookmarked = personMapper.isBookmarked(user_idx, post_idx);
	        resumevo = resumeMapper.getResumesByUserId(user_idx);
	    }

	    mv.addObject("user_idx", user_idx);
	    mv.addObject("isBookmarked", isBookmarked);
	    mv.addObject("skill", skill);
	    mv.addObject("resumevo", resumevo);
	    mv.addObject("postvo", postvo);
	    mv.addObject("companyvo", companyvo);
	    
	    mv.setViewName("/company/viewpost");
	    return mv;
	}
}
