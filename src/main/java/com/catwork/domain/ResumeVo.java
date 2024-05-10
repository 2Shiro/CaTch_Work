package com.catwork.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResumeVo {
	private int    num;
	private String resume_idx;
	private String user_idx;
	private String title;
	private String image;
	private String link;
	private String intro;
	private String created;
	private String type;
	private String skill_idx;

	
	
}
