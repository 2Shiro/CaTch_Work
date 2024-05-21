package com.catwork.domain;

import org.apache.ibatis.annotations.Mapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVo {
	private int user_idx;
	private String id;
	private String pwd;
	private int type;
	private String email;
}
