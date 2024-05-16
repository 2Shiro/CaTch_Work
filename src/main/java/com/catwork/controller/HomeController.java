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
import com.catwork.domain.PostVo;
import com.catwork.mapper.CompanyMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	private CompanyMapper companyMapper;

	// 메인화면
	@RequestMapping("/")
	public ModelAndView main() {
	    List<MainPageVo> mainPageList = new ArrayList<>();
	    List<PostVo> postList = companyMapper.getmainpostList();

	    for (PostVo post : postList) {
	        // 각 공고에 해당하는 회사 정보를 가져옵니다.
	        CompanyVo company = companyMapper.getCompanyById(post.getUser_idx());

	        // 바로 MainPageVo 객체를 생성하여 리스트에 추가합니다.
	        // 이때, CompanyVo에서 필요한 정보만 전달합니다.
	        mainPageList.add(new MainPageVo(post.getPost_idx(), post.getUser_idx(), company.getLogo(), company.getName(),
	                post.getTitle(), post.getDeadline()));
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
	    
	    List<MainPageVo> searchResults = new ArrayList<>();

	    List<PostVo> searchedPosts = companyMapper.searchPosts(keyword, department, region, career, jobtype);

	    for (PostVo post : searchedPosts) {
	        CompanyVo company = companyMapper.getCompanyById(post.getUser_idx());
	        searchResults.add(new MainPageVo(post.getPost_idx(), post.getUser_idx(), company.getLogo(), company.getName(),
	                post.getTitle(), post.getDeadline()));
	    }
	    log.info("searchResults = {}", searchResults);
	    return ResponseEntity.ok(searchResults); // 검색 결과를 JSON 형태로 반환
	}
    
    
    @RequestMapping("/Company/Viewpost")
    public ModelAndView viewpost(@RequestParam("post_idx") int post_idx, @RequestParam("user_id") int user_id) {
    	
    	// POST_TB 에서 해당 공고 찾기
    	PostVo postvo = companyMapper.getViewPost(post_idx);
    	
    	// 기업 정보
    	CompanyVo companyVo = companyMapper.getCompanyById(user_id);
    		
    	ModelAndView mv = new ModelAndView();
    	
    	mv.addObject("postvo", postvo);
    	mv.addObject("companyVo", companyVo);
    	
		mv.setViewName("/company/viewpost");
		return mv;
    	
    }

}
