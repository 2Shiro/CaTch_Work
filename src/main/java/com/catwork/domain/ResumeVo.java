package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResumeVo {
	private int    num;
	private int resume_idx;
	private int user_idx;
	private String title;
	private String image;
	private String link;
	private String intro;
	private String created;
	private String type;
	private String skill_idx;
	private String skill_names;
	
	private String username;
	private String name;
	private String phone;
	
	private String skills;
}
