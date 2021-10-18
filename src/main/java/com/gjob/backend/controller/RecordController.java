package com.gjob.backend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("test/*")
@AllArgsConstructor
public class RecordController {

	@GetMapping("test.do")
	public String view() {
		return "ai-bot/aibot";
	}

}
