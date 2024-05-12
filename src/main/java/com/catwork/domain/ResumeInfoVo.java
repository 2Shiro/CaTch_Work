package com.catwork.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResumeInfoVo {
	private int resumeno;
	private String title;
	private String username;
	private List<SkillVo> skillList;
}
