package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PersonStateVo {
	private int apply_idx;
	private int state_idx;
	private int user_idx;
	private int resume_idx;
	private String score;
	private String comments;
}
