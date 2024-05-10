package com.catwork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.CompanyVo;
import com.catwork.domain.PostVo;

@Mapper
public interface CompanyMapper {

	List<PostVo> getmainpostList();
	CompanyVo getCompanyById(int user_idx);

}
