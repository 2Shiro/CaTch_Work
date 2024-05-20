package com.catwork.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NaverOAuthToken {
    private String access_token;
    private String refresh_token;
    private String token_type;
    private String expires_in;
}
