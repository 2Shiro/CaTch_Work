package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CcommentVo {

	private int ccomment_idx;
	private int cboard_idx;
	private int user_idx;
	private String content;
	private String created;
	private String id;
}
