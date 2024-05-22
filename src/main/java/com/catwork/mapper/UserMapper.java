package com.catwork.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.UserVo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.catwork.domain.PostVo;
import com.catwork.domain.UserListVo;
import com.catwork.domain.UserVo;

@Mapper
public interface UserMapper {

	UserVo getUserInfo(UserVo userVo);

	UserVo getUserInfoById(int i);

	void updateInfo(UserVo userVo);

	void updatePassword(UserVo userVo);

	void deleteUser(UserVo user);

	UserVo login1(String id, String pwd);

	UserVo login2(String id, String pwd);

	int checkId(String id);

	int getUser_idx(int i);

	int getUser_idx(String id);

	List<UserVo> getAllUser();

	void deletePost(PostVo postvo);
}
