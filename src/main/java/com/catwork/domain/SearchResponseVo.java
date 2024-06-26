package com.catwork.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchResponseVo {
	
    private int usertype;
    private List<MainPageVo> searchResults;
	
}
