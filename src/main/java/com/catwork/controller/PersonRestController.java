package com.catwork.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.catwork.domain.BookmarkVo;
import com.catwork.domain.PersonApplyResumeVo;
import com.catwork.domain.PersonBookmarkVo;
import com.catwork.domain.PersonStateVo;
import com.catwork.domain.RateFormVo;
import com.catwork.domain.RateVo;
import com.catwork.mapper.ResumeMapper;

@RestController
public class PersonRestController {

    @Autowired
    private ResumeMapper resumeMapper;

//    @GetMapping("/Resume/GetRecommendList")
//    public List<RecommendPostVo> getRecommendList(@RequestParam("resume_idx") int resume_idx) {
//        // 이력서에 대한 추천 공고 목록을 가져와서 반환
//    	List<RecommendPostVo> postList = resumeMapper.getPostList(resume_idx);
//        return postList;
//    }
    @GetMapping("/Resume/GetApplyList")
    public List<PersonApplyResumeVo> getApplyList(@RequestParam("post_idx") int post_idx) {
    	// 이력서에 대한 추천 공고 목록을 가져와서 반환
    	List<PersonApplyResumeVo> resumeList = resumeMapper.getResumeList(post_idx);
    	return resumeList;
    }
    @GetMapping("/MyPage/Resume/GetState")
    public PersonStateVo getPersonState(PersonStateVo personStateVo) {
    	// 이력서에 대한 추천 공고 목록을 가져와서 반환
    	PersonStateVo vo = resumeMapper.getPersonState(personStateVo);
    	return vo;
    }
    @GetMapping("/Bookmark/List")
    public List<PersonBookmarkVo> getBookmarkList() {
    	List<PersonBookmarkVo> bookmarkList = resumeMapper.getBookmarkList();
    	System.out.println("이까진됨3");
    	return bookmarkList;
    }
    
    @DeleteMapping("/Bookmark/Delete")
    public ResponseEntity<String> deleteBookmark(BookmarkVo bookmarkVo) {
        System.out.println("이까진됨1");
        resumeMapper.deleteBookmark(bookmarkVo);
        System.out.println("이까진됨2");
        
        // 삭제 요청이 성공했음을 나타내는 JSON 응답 반환
        return ResponseEntity.ok().body("{\"result\": \"success\"}");
    }
    
    @GetMapping("MyPage/Company/GetRateForm")
    public RateFormVo getCompanyRateForm(RateFormVo rateFormVo) {
    	
    	RateFormVo vo = resumeMapper.getRateForm(rateFormVo);
    	return vo;
    }
    @PostMapping("/Company/Rate")
    public void insertRate(RateVo rateVo) {
    	
    	resumeMapper.insertRate(rateVo);
    }
}
    
