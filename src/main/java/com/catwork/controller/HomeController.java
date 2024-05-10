package com.catwork.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.domain.CompanyVo;
import com.catwork.domain.MainPageVo;
import com.catwork.domain.PostVo;
import com.catwork.mapper.CompanyMapper;

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

}
