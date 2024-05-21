package com.catwork.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.CompanyVo;
@Mapper
public interface CompanyMapper {

	void insert(CompanyVo companyVo);

}
