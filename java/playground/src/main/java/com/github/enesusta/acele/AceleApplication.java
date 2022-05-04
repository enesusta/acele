package com.github.enesusta.acele;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class AceleApplication {

	public static void main(String[] args) {
		SpringApplication.run(AceleApplication.class, args);
	}

	@RestController
	@RequestMapping("/hello")
	static class HelloController {

		@GetMapping
		public String hello() {
			return "hello";
		}
	}

}
