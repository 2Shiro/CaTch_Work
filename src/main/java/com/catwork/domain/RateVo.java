package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RateVo {
	private int com_idx;
	private int per_idx;
	private int rate_idx;
	private int rating;
	private String created;
}
