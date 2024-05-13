package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PersonVo {
	
	private int per_idx;
	private int user_idx;
	private String name;
	private String phone;
	private String zip_code;
	private String address;
	private String social_num;
	private String created;
	private String id;
	private String pwd;
	private int type;
	
	
}
