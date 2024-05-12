package com.catwork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.CompanyVo;
import com.catwork.domain.PostVo;
import com.catwork.domain.ResumeVo;
import com.catwork.domain.SkillVo;

@Mapper
public interface CompanyMapper {

	// 메인화면
	List<PostVo> getmainpostList();
	CompanyVo getCompanyById(int user_idx);
	
	// 검색
	List<PostVo> searchPostsByKeyword(String keyword);
	
	List<ResumeVo> getResumeList();

	SkillVo getSkillName(int skill_idx);
}
