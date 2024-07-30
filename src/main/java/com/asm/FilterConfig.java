package com.asm;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.asm.filter.URLValidationFilter;

@Configuration
public class FilterConfig {
	@Bean
    public FilterRegistrationBean<URLValidationFilter> loggingFilter(){
        FilterRegistrationBean<URLValidationFilter> registrationBean 
          = new FilterRegistrationBean<>();
        registrationBean.setFilter(new URLValidationFilter());
        registrationBean.addUrlPatterns("/*");
        return registrationBean;    
    }
}
