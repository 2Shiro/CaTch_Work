package com.catwork.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.catwork.interceptor.LoginCheckInterceptor;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {

   @Override
   public void addInterceptors(InterceptorRegistry registry) {
      registry.addInterceptor(new LoginCheckInterceptor())
              .addPathPatterns("/**","/**/*")
              .excludePathPatterns("/","/LoginForm","/logout",
                              "/Person/Login","/Person/JoinForm","/Person/Join",
                              "/Company/Login","/Company/JoinForm","/Company/Join",
                                 "/Board",
                                 "/CheckId","/FAQ",
                                 "/log*","/css/**", "/img/**", "/js/**"
                                 );
         
   }   
   
}
