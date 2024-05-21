package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BcommentVo {
	
	private int bcomment_idx;
	private int board_idx;
	private int user_idx;
	private String content;
	private String created;
	private String id;
	
}
