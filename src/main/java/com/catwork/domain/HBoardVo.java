package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HBoardVo {
	
	private int hboard_idx;
	private int user_idx;
	private String title;
	private String content;
	private String created;
	private long hit;
	private String id;

}
