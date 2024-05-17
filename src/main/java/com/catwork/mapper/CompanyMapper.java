package com.catwork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

//github.com/2Shiro/CaTch_Work.git

import com.catwork.domain.ApplyVo;
import com.catwork.domain.CompanyVo;
import com.catwork.domain.PostSkillVo;
import com.catwork.domain.PostVo;
import com.catwork.domain.ResumeVo;
import com.catwork.domain.SkillVo;
import com.catwork.domain.StateVo;
import com.catwork.domain.UserVo;

@Mapper
public interface CompanyMapper {

	// 메인화면
	List<PostVo> getmainpostList();
	CompanyVo getCompanyById(int user_idx);
	
    // 검색
    List<PostVo> searchPosts(@Param("keyword") String keyword, @Param("department") String department, @Param("region") String region, @Param("career") String career, @Param("jobtype") String jobtype);
	
	// 공고 상세보기
	PostVo getViewPost(int post_idx);
	
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
	
	int countResumeList(List<ResumeVo> resumeList);
	
	List<ResumeVo> getResumeListPaging(int offset, int pageSize);
	
	void insertState(StateVo state);
	
	int countPostList(List<PostVo> postList);
	
	List<PostVo> getPostListPaging(int offset, int pageSize);
	
	void postUpdateForm(@RequestParam("post") PostVo post);
	
	List<SkillVo> getAllSKills();
	
	void updatePost(PostVo post);
	
	void deletepostskills(PostVo post);
	
	void insertApplyState(StateVo state);
	
	StateVo getState(int apply_idx);
	
	void deletePost(PostVo post);
	
	void updateInfo(CompanyVo companyVo);
	
	String getAddress(CompanyVo companyVo);
}
