package com.catwork.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.PersonVo;
import com.catwork.domain.UserVo;

@Mapper
public interface PersonMapper {

	PersonVo getPersonInfo(PersonVo personVo);





}
