package com.catwork.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.PersonVo;
@Mapper
public interface PersonMapper {

	void insert(PersonVo perVo);

	int getUser_idx(String id);

}
