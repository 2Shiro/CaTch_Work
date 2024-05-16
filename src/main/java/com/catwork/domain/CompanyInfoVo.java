package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompanyInfoVo {
	private int user_idx;
	private String id;
	private String pwd;
	private int type;
	private String email;
	
	private int com_idx;
	private String name;
	private String logo;
	private int cnum;
	private String representative;
	private String zip_code;
	private String address;
	private String ctype;
	private String bdate;
	private String created;
	
	
	
	public CompanyInfoVo(UserVo user, CompanyVo company) {
		this.user_idx = user.getUser_idx();
		this.id = user.getId();
		this.pwd = user.getPwd();
		this.type = user.getType();
		this.email = user.getEmail();
		this.com_idx = company.getCnum();
		this.name = company.getName();
		this.logo = company.getLogo();
		this.cnum = company.getCnum();
		this.representative = company.getRepresentative();
		this.zip_code = company.getZip_code();
		this.address = company.getAddress();
		this.ctype = company.getCtype();
		this.bdate = company.getBdate();
		this.created = company.getCreated();
	}
}
