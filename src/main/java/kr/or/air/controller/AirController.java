package kr.or.air.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.air.model.service.AirService;

@Controller
public class AirController {
	@Autowired
	private AirService service;
	
	
}
