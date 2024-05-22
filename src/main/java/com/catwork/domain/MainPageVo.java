package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MainPageVo {
    
    private int post_idx;
    private int user_idx;
    private int com_idx;
    
    private String logo;
    private String name;
    private String title;
    private String deadline;
    private boolean isBookmarked; // 북마크 여부를 나타내는 필드
    
}