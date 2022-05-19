package kr.or.air.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.air.model.service.AirService;
import kr.or.air.model.vo.Air;

@Controller
public class AirController {
	@Autowired
	private AirService service;
	
	@RequestMapping(value="/AirMain.kt")
	public String MainPage(HttpSession session) {
		return "air/airMain";
	}
	
	@RequestMapping(value="selectAllAir.kt")
	public String selectAllAir(HttpSession session) {
		ArrayList<Air> airlist = service.selectAllAir();
		
		return "air/airMain";
	}
	
	
}
