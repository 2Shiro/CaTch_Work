package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ParticipateVo {
	private int apply_idx;
	private int resume_idx;
	private int user_idx;
	private String title;
	private String name;
	private String state;
}
