package kr.or.air.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String selectAllAir(HttpSession session, Model model) {
		ArrayList<Air> airlist = service.selectAllAir();
		System.out.println(airlist);
		if(airlist != null) {
			model.addAttribute("air",airlist);
		}
		return "air/airMain";
	}
	
	
}
