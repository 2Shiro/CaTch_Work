package com.catwork.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.domain.CompanyInfoVo;
import com.catwork.domain.CompanyVo;
import com.catwork.domain.PostVo;
import com.catwork.domain.StateVo;
import com.catwork.domain.UserVo;
import com.catwork.mapper.CompanyMapper;

@RestController
public class CompanyRestController {
	
	@Autowired
	private CompanyMapper companyMapper;
	
	@PostMapping("/Company/State")
	public void state(@RequestBody StateVo state) {
		//state 테이블에 가져온 결과를 insert
		System.out.println("apply: " + state);
		
		companyMapper.insertState(state);
		companyMapper.insertApplyState(state);
	}
	
	@PostMapping("/Company/PostDelete")
	public void postDelete(@RequestBody PostVo post) {
		companyMapper.deletePost(post);
	}
	
//	@PostMapping("/Company/InfoUpdateForm")
//	public ModelAndView infoUpdateform(@RequestBody UserVo user, @RequestBody CompanyVo company) {
//		ModelAndView mv = new ModelAndView();
//		
//		mv.setViewName("/company/infoupdateform");
//		
//		return mv;
//	}
}
