package com.catwork.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.catwork.domain.PersonVo;
import com.catwork.domain.UserVo;
import com.catwork.mapper.PersonMapper;
import com.catwork.mapper.UserMapper;

@Controller
public class PersonController {
	
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private PersonMapper personMapper;
	
	public ModelAndView personMypage(UserVo userVo, PersonVo personVo) {
		
		UserVo vo = userMapper.getUserInfo(userVo);
		PersonVo pvo = personMapper.getPersonInfo(personVo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/person/personMypage");
		mv.addObject("vo",vo);
		return mv;
	}
	
	
}
