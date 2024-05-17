package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookmarkVo {
	private int book_idx;
	private int user_idx;
	private int post_idx;
	private int bookmark;

}
