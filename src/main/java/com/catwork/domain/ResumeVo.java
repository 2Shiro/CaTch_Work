package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResumeVo {
	private int resume_idx;
	private int user_idx;
	private String title;
	private String image;
	private String link;
	private String intro;
	private String created;
	private int type;
}
