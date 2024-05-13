package com.catwork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.ApplyVo;
import com.catwork.domain.CompanyVo;
import com.catwork.domain.PostSkillVo;
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

	List<PostVo> getMyPost(int i);

	List<SkillVo> getSkills();

	int selectpostidxmax();

	void insertpost(PostVo postVo);

	void insertskills(PostSkillVo skillVo);

	PostVo getPostDetail(int post_idx);

	List<PostSkillVo> getPostSkills(int post_idx);

	List<ApplyVo> getParticipateList(int post_idx);

	ApplyVo getApply(int apply_idx);
}
