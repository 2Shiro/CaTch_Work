package com.catwork.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.domain.CompanyVo;
import com.catwork.domain.MainPageVo;
import com.catwork.domain.PostSkillVo;
import com.catwork.domain.PostVo;
import com.catwork.domain.ResumeVo;
import com.catwork.domain.SearchResponseVo;
import com.catwork.domain.SkillVo;
import com.catwork.domain.UserVo;
//github.com/2Shiro/CaTch_Work.git
import com.catwork.mapper.CompanyMapper;
import com.catwork.mapper.PersonMapper;
import com.catwork.mapper.ResumeMapper;
import com.catwork.mapper.UserMapper;

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
	
	@Autowired
	private UserMapper userMapper;

	// 메인화면
	@RequestMapping("/")
	public ModelAndView main(@SessionAttribute("login") UserVo userVo) {
	    // 세션에서 user_idx 가져오기. 로그인하지 않은 경우 기본값은 null
	    //Integer user_idx = (Integer) session.getAttribute("user_idx");
		//회원 정보 세션 가져오기
		int user_idx = userMapper.getUser_idx(userVo.getId());
		
		UserVo usertype = userMapper.getUserInfoById(user_idx);
	    
	    List<MainPageVo> mainPageList = new ArrayList<>();
	    List<PostVo> postList = companyMapper.getmainpostList();

	    List<Integer> bookmarkedPostIds = new ArrayList<>();
	    if (usertype.getId() != null) {
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
	    mv.addObject("usertype", usertype);
	    mv.setViewName("/home");
	    return mv;
	}

	// 검색 기능 - AJAX 호출
	@RequestMapping("/Search")
	@ResponseBody
	public ResponseEntity<SearchResponseVo> search(
	        @RequestParam(value="keyword", required=false, defaultValue="") String keyword,
	        @RequestParam(value="department", required=false, defaultValue="") String department,
	        @RequestParam(value="region", required=false, defaultValue="") String region,
	        @RequestParam(value="career", required=false, defaultValue="") String career,
	        @RequestParam(value="jobtype", required=false, defaultValue="") String jobtype,
	        @SessionAttribute("login") UserVo userVo) {
	    
		int user_idx = userMapper.getUser_idx(userVo.getId());
		
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
	    List<MainPageVo> searchResults = new ArrayList<>();

	    List<Integer> bookmarkedPostIds = new ArrayList<>();
	    if (usertype.getId() != null) {
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
	    
	    SearchResponseVo responsevo = new SearchResponseVo();
	    responsevo.setUsertype(usertype.getType());
	    responsevo.setSearchResults(searchResults);

	    return ResponseEntity.ok(responsevo);
	}

    
    
	@RequestMapping("/Company/Viewpost")
	public ModelAndView viewpost(@RequestParam("post_idx") int post_idx, @RequestParam("com_idx") int com_idx, PostVo postidx, @SessionAttribute("login") UserVo userVo) {
		int user_idx = userMapper.getUser_idx(userVo.getId());
		
		UserVo usertype = userMapper.getUserInfoById(user_idx);
		
	    PostVo postvo = companyMapper.getViewPost(post_idx);
	    CompanyVo companyvo = companyMapper.getCompanyByComId(com_idx);
	    
		List<PostSkillVo> postSkills = companyMapper.getPostSkills(postidx.getPost_idx());
		List<SkillVo> skill = new ArrayList<SkillVo>();
		for(int i = 0; i < postSkills.size(); i++) {
			SkillVo skillname = companyMapper.getSkillName(postSkills.get(i).getSkill_idx());
			skill.add(skillname);
		}
		
	    ModelAndView mv = new ModelAndView();
	    
	    //Integer user_idx = (Integer) session.getAttribute("user_idx");
	    boolean isBookmarked = false;
	    List<ResumeVo> resumevo = new ArrayList<>();

	    if (usertype.getId() != null && usertype.getType() == 2) {
	        isBookmarked = personMapper.isBookmarked(user_idx, post_idx);
	        resumevo = resumeMapper.getResumesByUserId(user_idx);
	    }

	    mv.addObject("user_idx", user_idx);
	    mv.addObject("isBookmarked", isBookmarked);
	    mv.addObject("skill", skill);
	    mv.addObject("resumevo", resumevo);
	    mv.addObject("postvo", postvo);
	    mv.addObject("companyvo", companyvo);
	    mv.addObject("usertype", usertype);
	    
	    mv.setViewName("/company/viewpost");
	    return mv;
	}

	@RequestMapping("/LoginForm")
	public String plogin() {
		return "login";
	}
	
	// logout
	@RequestMapping("/Logout")
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:/";
	}
	
	// 아이디 중복체크(기업+개인)
	@RequestMapping("/CheckId")
	public @ResponseBody int checkId(@RequestParam(value = "id") String id) {
		int result = userMapper.checkId(id);
		return result;
	}
}
