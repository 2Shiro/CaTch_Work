package com.catwork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.ResumeVo;

@Mapper
public interface CompanyMapper {

	List<ResumeVo> getResumeList();
}
