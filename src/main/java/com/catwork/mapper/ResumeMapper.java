package com.catwork.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.BookmarkVo;
import com.catwork.domain.PersonApplyResumeVo;
import com.catwork.domain.PersonApplyVo;
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


	// 로그인 되어 있는 유저의 이력서 불러오기
	List<ResumeVo> getResumesByUserId(int user_idx);

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

	//int countRecommensPostList(List<ResumeVo> resumeList);

	int countRecommensPostList(List<RecommendPostVo> postList);

	//List<RecommendPostVo> getPostListPaging(int offset, int pageSize, int i);

	int countRecommensPostList(int resume_idx);

	List<RecommendPostVo> getPostListPaging(int resume_idx, int offset, int pageSize);

	int countApplyList(List<PersonApplyVo> applyList);

	List<PersonApplyVo> getApplyListPaging(int offset1, int pageSize1);

	int countBookmarkList(List<PersonBookmarkVo> bookmarkList);

	List<PersonBookmarkVo> getBookmarkListPaging(int offset2, int pageSize2);

	List<PersonBookmarkVo> getBookmarkListPaging(int offset, int pageSize, PersonBookmarkVo personbookmarkVo);


	int countResumeList(List<ResumeVo> resumeList, int user_idx);


	List<ResumeVo> getResumeListPaging(int offset, int pageSize, String id);

	int countApplyList(List<PersonApplyVo> applyList, int user_idx);

	List<PersonApplyVo> getApplyListPaging(int offset1, int pageSize1, int user_idx);

	int countBookmarkList(List<PersonBookmarkVo> bookmarkList, int user_idx);

	List<PersonBookmarkVo> getBookmarkListPaging(int offset2, int pageSize2, int user_idx);

	void insertResume(ResumeVo resumeVo, int user_idx);

	List<PersonApplyResumeVo> getResumeList(int post_idx, int user_idx);



	List<Resume_SkillVo> getSkillListById(int resume_idx);

	List<RecommendPostVo> getPostListQueryPaging(int resume_idx, int offset, int pageSize, String query);

	int countRecommensQueryPostList(int resume_idx, String query);


	List<RecommendPostVo> getPostListQueryPaging(int resume_idx, int offset, int pageSize);

	int countRecommendQueryPostList(int resume_idx, String query);




	//RateVo insertRate(RateVo rateVo);

}
