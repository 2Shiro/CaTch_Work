package com.catwork.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.PersonVo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.catwork.domain.BookmarkVo;
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

	void insert(PersonVo perVo);

	int getUser_idx(String id);

	// 북마크 등록
	boolean addBookmark(int user_idx, int post_idx);
	// 북마크 삭제
	boolean removeBookmark(int user_idx, int post_idx);
	// 북마크 여부
	List<Integer> getBookmarked(int user_idx);
	// viewpost 에서의 북마크 여부
	boolean isBookmarked(@Param("user_idx") int user_idx, @Param("post_idx") int post_idx);

	PersonVo getPersonInfo(PersonVo personVo, String id);

	List<ResumeVo> getResumeList(ResumeVo resumeVo, String id);

	List<PersonApplyVo> getApplyList(PersonApplyVo personApplyVo, int user_idx);

	List<PersonBookmarkVo> getBookmarkList(PersonBookmarkVo personbookmarkVo, int user_idx);

	PersonVo getPwd(int user_idx);

	void updateMyInfo(PersonVo personVo, String id);

	void updateMyInfo2(PersonVo personVo, int user_idx);

}
