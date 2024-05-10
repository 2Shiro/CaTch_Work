package com.catwork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.PersonVo;
import com.catwork.domain.ResumeVo;
import com.catwork.domain.UserVo;

@Mapper
public interface PersonMapper {

	PersonVo getPersonInfo(PersonVo personVo, UserVo userVo);

	void updateMyInfo(PersonVo personVo);

	void updateMyInfo2(PersonVo personVo);

	void personDelete(UserVo userVo);

	List<ResumeVo> getResumeList(ResumeVo resumeVo);





}
