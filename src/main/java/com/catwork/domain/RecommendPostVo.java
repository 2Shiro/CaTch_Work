package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecommendPostVo {
	
	private int post_idx;
	private int resume_idx;
	private int row_num;
	private int user_idx;
	private String title;
	private String career;
	private int gowork;
	private String gohome;
	private String salary;
	private String deadline;
	private String intro;
	private String explain;
	private String manager;
	private String mphone;
	private String created;
	
}
