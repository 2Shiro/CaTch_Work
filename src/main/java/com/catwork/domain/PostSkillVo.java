package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostSkillVo {
	private int poskill_idx;
	private int post_idx;
	private int skill_idx;
}
