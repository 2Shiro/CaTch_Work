package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NaverProfileResponse {
    private String resultcode;
    private String message;
    private NaverProfile response;
}
