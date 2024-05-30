package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserListVo {
	private int user_idx;
	private String id;
	private String pwd;
	private int type;
	private String email;
	
	private String name;
	private String created;
	private String zip_code;
	private String address;
	
	private int per_idx;
	private String phone;
	private String social_num;
	
	private int com_idx;
	private String logo;
	private int cnum;
	private String representative;
	private String ctype;
	private String bdate;
	
	public UserListVo(int user_idx, String id, String pwd, 
					  int type, String email,
					  String name, String created, 
					  String zip_code, String address, 
					  int com_idx, String logo, 
					  int cnum, String representative, 
					  String ctype, String bdate) {
		this.user_idx = user_idx;
		this.id = id;
		this.pwd = pwd;
		this.type = type;
		this.email = email;
		this.name = name;
		this.created = created;
		this.zip_code = zip_code;
		this.address = address;
		this.com_idx = com_idx;
		this.logo = logo;
		this.cnum = cnum;
		this.representative = representative;
		this.ctype = ctype;
		this.bdate = bdate;
	}

	public UserListVo(int user_idx, String id, String pwd, 
					  int type, String email, 
					  String name, String created,
					  String zip_code, String address, 
					  int per_idx, String phone, 
					  String social_num) {
		this.user_idx = user_idx;
		this.id = id;
		this.pwd = pwd;
		this.type = type;
		this.email = email;
		this.name = name;
		this.created = created;
		this.zip_code = zip_code;
		this.address = address;
		this.per_idx = per_idx;
		this.phone = phone;
		this.social_num = social_num;
	}
}
