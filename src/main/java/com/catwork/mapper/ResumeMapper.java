package com.catwork.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.BookmarkVo;
import com.catwork.domain.PersonApplyResumeVo;
import com.catwork.domain.PersonBookmarkVo;
import com.catwork.domain.PersonStateVo;
import com.catwork.domain.PostVo;
import com.catwork.domain.RateFormVo;
import com.catwork.domain.RateVo;
import com.catwork.domain.RecommendPostVo;
import com.catwork.domain.ResumeVo;
import com.catwork.domain.Resume_SkillVo;
import com.catwork.domain.SkillVo;



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


	List<RecommendPostVo> getPostList(RecommendPostVo recommendPostVo);

	List<RecommendPostVo> getPostList(int resume_idx);

	List<PersonApplyResumeVo> getResumeList(int resume_idx);


	PersonStateVo getPersonState(PersonStateVo personStateVo);

	//BookmarkVo deleteBookmark(BookmarkVo bookmarkVo);
	void deleteBookmark(BookmarkVo bookmarkVo);


	List<PersonBookmarkVo> getBookmarkList();

	ResumeVo getResume(ResumeVo resumeVo);

	RateFormVo getRateForm(RateFormVo rateFormVo);

	void insertRate(RateVo rateVo);

	List<SkillVo> getSkillList(SkillVo skillVo);


	//List<Resume_SkillVo> getReskillList(Resume_SkillVo resume_SkillVo);


	void updateResumeSkill(ResumeVo vo);

	void deleteSkill(ResumeVo resumeVo);

	void deleteSkillByResumeIdx(int resume_idx);

	void insertResumeSkill2(List<Resume_SkillVo> resumeSkillList);

	int countResumeList(List<ResumeVo> resumeList);

	List<ResumeVo> getResumeListPaging(int offset, int pageSize);

	int countRecommensPostList(List<ResumeVo> resumeList);

	//RateVo insertRate(RateVo rateVo);



	 






}
