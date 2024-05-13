package com.catwork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.PersonApplyVo;
import com.catwork.domain.PersonVo;
import com.catwork.domain.ResumeVo;
import com.catwork.domain.Resume_SkillVo;
import com.catwork.domain.UserVo;

@Mapper
public interface PersonMapper {

	PersonVo getPersonInfo(PersonVo personVo, UserVo userVo);

	void updateMyInfo(PersonVo personVo);

	void updateMyInfo2(PersonVo personVo);

	void personDelete(UserVo userVo);

	List<ResumeVo> getResumeList(ResumeVo resumeVo);

	PersonVo getPersonDetail(int user_idx);

	List<Resume_SkillVo> getResumeSkill(int resume_idx);

	ResumeVo getResume(int resume_idx);

	List<Resume_SkillVo> getResumeSkillAll();

	List<Integer> getResumeIdxList();

	List<PersonApplyVo> getApplyList(PersonApplyVo personApplyVo);





}
