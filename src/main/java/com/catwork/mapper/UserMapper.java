package com.catwork.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.UserVo;
@Mapper
public interface UserMapper {

	UserVo login1(String id, String pwd);

	UserVo login2(String id, String pwd);

	int checkId(String id);

	int getUser_idx(String id);

}
