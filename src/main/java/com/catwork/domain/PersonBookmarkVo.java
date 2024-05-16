package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PersonBookmarkVo {
	private int row_num;
	private int book_idx;
	private int user_idx;
	private int post_idx;
	private String bookmark;
	private String title;
	private String career;
	private String salary;
	private String deadline;
	private String manager;
	private String mphone;
	private String created;
}
