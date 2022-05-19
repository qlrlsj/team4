package kr.or.companion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.companion.model.service.CompanionService;

@Controller
public class CompanionController {
	@Autowired
	CompanionService service;
	
}
