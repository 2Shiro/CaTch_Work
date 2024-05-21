package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardVo {
	
	private int    board_idx;
	private int    user_idx;
	private String title;
	private String content;
	private String created;
	private long   hit;
	private String id;
	
	private int bcomment_idx;
	
}
