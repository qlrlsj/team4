package kr.or.air.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.air.model.service.AirService;
import kr.or.air.model.vo.Air;
import kr.or.air.model.vo.AirSchedule;

@Controller
public class AirController {
	@Autowired
	private AirService service;
	
	@RequestMapping(value="/AirMain.kt")
	public String MainPage(HttpSession session) {
		return "air/airMain";
	}
	
	@RequestMapping(value="/selectAllAir.kt")
	public String selectAllAir(HttpSession session, Model model) {
		ArrayList<Air> airlist = service.selectAllAir();
		model.addAttribute("air",airlist);
		return "air/airMain";
	}
	@ResponseBody
	@RequestMapping(value="/allAirSchedule.kt",produces="application/json;charset=utf-8")
	public String selectAllMemberId() {
		ArrayList<AirSchedule> list = null ;
		return new Gson().toJson(list);
	}
	
}
