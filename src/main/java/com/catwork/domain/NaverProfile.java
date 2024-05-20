package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NaverProfile {
    private String email;
    private String nickname;
    private String profile_image;
    private String age;
    private String gender;
    private String id;
    private String name;
    private String birthday;
    private String birthyear;
    private String mobile;
}
