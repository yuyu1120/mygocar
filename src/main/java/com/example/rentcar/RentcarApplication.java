package com.example.rentcar;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

// @SpringBootApplication
// public class RentcarApplication {

// 	public static void main(String[] args) {
// 		SpringApplication.run(RentcarApplication.class, args);
// 	}

// }

@SpringBootApplication
public class RentcarApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(RentcarApplication.class, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(RentcarApplication.class);

	}
}
