package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FaqVo {
	
	private int q_idx;
	private int type;
	private String question;
	private String answer;

}
