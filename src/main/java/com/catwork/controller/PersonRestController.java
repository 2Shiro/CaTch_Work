package com.catwork.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.catwork.domain.PersonApplyResumeVo;
import com.catwork.domain.RecommendPostVo;
import com.catwork.mapper.ResumeMapper;

@RestController
public class PersonRestController {

    @Autowired
    private ResumeMapper resumeMapper;

    @GetMapping("/Resume/GetRecommendList")
    public List<RecommendPostVo> getRecommendList(@RequestParam("resume_idx") int resume_idx) {
        // 이력서에 대한 추천 공고 목록을 가져와서 반환
    	List<RecommendPostVo> postList = resumeMapper.getPostList(resume_idx);
        return postList;
    }
    @GetMapping("/Resume/GetApplyList")
    public List<PersonApplyResumeVo> getApplyList(@RequestParam("resume_idx") int resume_idx) {
    	// 이력서에 대한 추천 공고 목록을 가져와서 반환
    	List<PersonApplyResumeVo> resumeList = resumeMapper.getResumeList(resume_idx);
    	return resumeList;
    }
}