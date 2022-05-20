package kr.or.companion.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.companion.model.service.CompanionService;
import kr.or.companion.model.vo.Companion;
import kr.or.companion.model.vo.CompanionPageData;

@Controller
public class CompanionController {
	@Autowired
	CompanionService service;
	
	@RequestMapping (value="/companionMain.kt")
	public String companionMain(int reqPage, Model model) {
		CompanionPageData cpd = service.selectAllCompanion(reqPage);
		model.addAttribute("list", cpd.getList());
		model.addAttribute("pageNavi", cpd.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		return "companion/companionMain";
	}
	
	@RequestMapping (value="/companionView.kt")
	public String companionView(int companionNo, Model model) {
		Companion com = service.selectOneCompanion(companionNo);
		model.addAttribute("com",com);
		return "companion/companionView";
	}
}
