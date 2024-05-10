package com.catwork.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.ResumeVo;
import com.catwork.domain.Resume_SkillVo;



@Mapper
public interface ResumeMapper {

	void insertResume(ResumeVo resumeVo);

	void insertResumeSkill(ResumeVo resumeVo);

	void insertResumeSkill(List<Resume_SkillVo> resumeSkillList);

	ResumeVo getView(ResumeVo resumeVo);

	ResumeVo getResumeUpdate(ResumeVo resumeVo);

	ResumeVo getResumeDetailView(ResumeVo resumeVo);

	void updateResume(ResumeVo resumeVo);



	void resumeDelete(ResumeVo resumeVo);


	 






}
