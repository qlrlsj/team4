package kr.or.pck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.pck.model.service.PckService;

@Controller
public class PckController {
	@Autowired
	private PckService service;
	
	@RequestMapping(value="/packageMain.kt")
	public String packageMain() {
		return "pck/packageMain";
	}
	@RequestMapping(value="/insertPackagePage.kt")
	public String insertPackagePage() {
		return "pck/insertPackagePage";
	}
	
}
