package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Resume_SkillVo {
	private int resume_idx;
	private int skill_idx;
	private int reskill_idx;
	public Resume_SkillVo(int skill_idx) {
		this.skill_idx = skill_idx;
	}
}
