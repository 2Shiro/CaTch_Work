package com.catwork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.CompanyVo;
import com.catwork.domain.PostVo;
import com.catwork.domain.ResumeVo;
import com.catwork.domain.SkillVo;

@Mapper
public interface CompanyMapper {

	List<ResumeVo> getResumeList();

	List<PostVo> getmainpostList();
	
	CompanyVo getCompanyById(int user_idx);

	SkillVo getSkillName(int skill_idx);
}
