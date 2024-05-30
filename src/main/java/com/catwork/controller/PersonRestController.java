package com.catwork.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.domain.BookmarkVo;
import com.catwork.domain.Pagination;
import com.catwork.domain.PagingResponse;
import com.catwork.domain.PagingVo;
import com.catwork.domain.PersonApplyResumeVo;
import com.catwork.domain.PersonBookmarkVo;
import com.catwork.domain.PersonStateVo;
import com.catwork.domain.PersonVo;
import com.catwork.domain.RateFormVo;
import com.catwork.domain.RateVo;
import com.catwork.domain.ResumeVo;
import com.catwork.domain.UserVo;
import com.catwork.mapper.PersonMapper;
import com.catwork.mapper.ResumeMapper;
import com.catwork.mapper.UserMapper;

@RestController
public class PersonRestController {

    @Autowired
    private ResumeMapper resumeMapper;
    
    @Autowired
    private PersonMapper personMapper;
    
    @Autowired
    private UserMapper userMapper;

//    @GetMapping("/Resume/GetRecommendList")
//    public List<RecommendPostVo> getRecommendList(@RequestParam("resume_idx") int resume_idx) {
//        // 이력서에 대한 추천 공고 목록을 가져와서 반환
//    	List<RecommendPostVo> postList = resumeMapper.getPostList(resume_idx);
//        return postList;
//    }
    @GetMapping("/Resume/GetApplyList")
    public List<PersonApplyResumeVo> getApplyList(@SessionAttribute("login") UserVo userVo,@RequestParam("post_idx") int post_idx) {
		int user_idx = userMapper.getUser_idx(userVo.getId());
		UserVo usertype = userMapper.getUserInfoById(user_idx);
    	
    	// 이력서에 대한 추천 공고 목록을 가져와서 반환
    	List<PersonApplyResumeVo> resumeList = resumeMapper.getResumeList(post_idx,user_idx);
    	return resumeList;
    }
    @GetMapping("/MyPage/Resume/GetState")
    public PersonStateVo getPersonState(PersonStateVo personStateVo) {
    	// 이력서에 대한 추천 공고 목록을 가져와서 반환
    	PersonStateVo vo = resumeMapper.getPersonState(personStateVo);
    	return vo;
    }
//    @GetMapping("/Bookmark/List")
//    public List<PersonBookmarkVo> getBookmarkList(@SessionAttribute("login") UserVo userVo) {
//		int user_idx = userMapper.getUser_idx(userVo.getId());
//		UserVo usertype = userMapper.getUserInfoById(user_idx);
//    	
//    	List<PersonBookmarkVo> bookmarkList = resumeMapper.getBookmarkList();
//    	System.out.println("이까진됨3");
//    	return bookmarkList;
//    }
    @GetMapping("/Bookmark/List2")
    public @ResponseBody List<PersonBookmarkVo> getBookmarkList2(@SessionAttribute("login") UserVo userVo1,
            @RequestParam(value = "bookmarkNowpage", defaultValue = "1") int bookmarkNowpage,
            PersonBookmarkVo personbookmarkVo, PersonVo personVo, UserVo userVo) {
    	
    	
		int user_idx = userMapper.getUser_idx(userVo1.getId());
		UserVo usertype = userMapper.getUserInfoById(user_idx);
        // 유저 정보를 가져오는 부분
        PersonVo pvo = personMapper.getPersonInfo(personVo, usertype.getId());

        // 페이지 당 항목 수
        int pageSize = 2;
        int offset = (bookmarkNowpage - 1) * pageSize;
        
        

        // 페이징된 북마크 리스트를 가져오는 부분
        List<PersonBookmarkVo> pagingList2 = resumeMapper.getBookmarkListPaging(offset, pageSize, usertype.getUser_idx());

        return pagingList2;
    }
    
    @DeleteMapping("/Bookmark/Delete")
    public ResponseEntity<String> deleteBookmark(@RequestParam(value = "bookmarkNowpage", defaultValue = "1") int bookmarkNowpage,BookmarkVo bookmarkVo) {
        resumeMapper.deleteBookmark(bookmarkVo);
        System.out.println("bookmarkNowpage:"+bookmarkNowpage);
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
    
    @GetMapping("/MyPage/{nowpage}")
    public PagingResponse<ResumeVo> getMyResumeList(@PathVariable("nowpage") int nowpage, ResumeVo resumeVo){
        List<ResumeVo> resumeList = personMapper.getResumeList(resumeVo);
        int count = resumeMapper.countResumeList(resumeList);

        PagingVo pagingVo = new PagingVo();
        pagingVo.setPage(nowpage);
        pagingVo.setPageSize(3);
        pagingVo.setRecordSize(3);

        int offset = pagingVo.getOffset();
        int pageSize = pagingVo.getPageSize();

        Pagination pagination = new Pagination(count, pagingVo);
        pagingVo.setPagination(pagination);

        List<ResumeVo> pagingList = resumeMapper.getResumeListPaging(offset, pageSize);

        return new PagingResponse<>(pagingList, pagination);
    }
}
    
