package com.Group9.ArtZone.Conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
public class MVCConf implements WebMvcConfigurer{
	
	public static String ROOT_UPLOAD_PATH = "D:/Javaweb13/com.Group9.ArtZone/upload/";
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/User/**").addResourceLocations("classpath:/User/");
		registry.addResourceHandler("/Admin-Resources/**").addResourceLocations("classpath:/Admin-Resources/");
		registry.addResourceHandler("/upload/**").addResourceLocations("file:" + ROOT_UPLOAD_PATH);

	}
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean= new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		return bean;
	}
}
