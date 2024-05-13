package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PersonApplyResumeVo {
	
	private int row_num;
	private int apply_idx;
	private int resume_idx;
	private int post_idx;
	private int state;
	private String title;
	private String gohome;
	private String career;
	
	private String salary;
	private String deadline;
	private String intro;
	private String explain;
	private String manager;
	private String mphone;
	private String created;

	
}
