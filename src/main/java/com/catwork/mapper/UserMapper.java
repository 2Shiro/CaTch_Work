package com.catwork.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.UserVo;

@Mapper
public interface UserMapper {

	UserVo getUserInfo(UserVo userVo);

	UserVo getUserInfoById(int i);

	void updateInfo(UserVo userVo);

	void updatePassword(UserVo userVo);

	void deleteUser(UserVo user);





}
