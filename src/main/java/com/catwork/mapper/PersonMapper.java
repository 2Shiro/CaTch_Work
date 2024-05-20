package com.catwork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.catwork.domain.PersonApplyVo;
import com.catwork.domain.PersonBookmarkVo;
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

	List<PersonBookmarkVo> getBookmarkList(PersonBookmarkVo personbookmarkVo);

	// 이력서 지원하기(중복 지원 금지)
    boolean checkIfAlreadyApplied(@Param("user_idx") int user_idx, @Param("post_idx") int post_idx);
    void insertProposal(@Param("resume_idx") int resume_idx, @Param("post_idx") int post_idx);

	PersonVo getPwd(PersonVo personVo);

	int countApplyList(List<PersonApplyVo> applyList);

	int countBookmarkList(List<PersonBookmarkVo> bookmarkList);

}
