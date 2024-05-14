package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApplyVo {
	private int apply_idx;
	private int resume_idx;
	private int post_idx;
	private int state;
	private String created;
}
