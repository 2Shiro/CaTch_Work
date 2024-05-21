package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PersonVo {
	
	private String id;
	private String pwd;
	private String type;
	private String email;
	private String name;
	private String phone;
	private String zip_code;
	private String address;
	private String social_num;
	private String created;
	
}
