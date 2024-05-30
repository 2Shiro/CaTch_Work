package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResumeTbVo {
	private String resume_idx;
	private String user_idx;
	private String title;
	private String image;
	private String link;
	private String intro;
	private String created;
	private String type;
}
