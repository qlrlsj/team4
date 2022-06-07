package kr.or.companion.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

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
	@RequestMapping (value="/companionWriteFrm.kt")
	public String companionWriteFrm() {
		return "companion/companionWriteFrm";
	}
	@RequestMapping (value="/companionInsert.kt")
	public String companionInsert(Companion com) {
		int result = service.insertCompanion(com);		
		if(result>0) {
			return "redirect:/companionMain.kt?reqPage=1";			
		}else {
			return "redirect:/";
		}
	}
	@ResponseBody
	@RequestMapping(value="/companionProgress.kt", produces = "application/json;charset=utf-8")
	public String companionProgress(int companionNo) {
		int result = service.companionProgress(companionNo);
		if(result>0) {
			return new Gson().toJson("모집 완료");
		}else {
			return new Gson().toJson("error");
		}
	}
	@RequestMapping(value="companionDelete.kt")
	public String companionDelete(int companionNo) {
		int result = service.companionDelete(companionNo);
		if(result>0) {
			return "redirect:/companionMain.kt?reqPage=1";
		}else {
			return "redirect:/companionView.kt?companionNo="+companionNo;
		}
	}
	@RequestMapping(value="companionUpdateFrm.kt")
	public String companionUpdateFrm(int companionNo, Model model) {
		Companion com = service.selectOneCompanion(companionNo);
		model.addAttribute("com",com);
		return "companion/companionUpdate";
	}
	@RequestMapping(value="/companionUpdate.kt")
	public String companionUpdate(Companion com) {
		int result = service.updateCompanion(com);
		if(result > 0) {
			return "redirect:/companionView.kt?companionNo="+com.getCompanionNo();
		}else {
			return "redirect:/companionMain.kt?reqPage=1";	
		}
	}
	@RequestMapping(value="companionSearch.kt", produces = "application/json;charset=utf-8")
	public String companionSearch(int reqPage, Companion com,  Model model) {
		System.out.println(reqPage);
		System.out.println(com.getCompanionField());
		System.out.println(com.getCompanionTheme());
		System.out.println(com);
		CompanionPageData cpd = service.selectNewCompanion(reqPage,com);
		model.addAttribute("list", cpd.getList());
		model.addAttribute("pageNavi", cpd.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("com",com);
		return "companion/companionMain";
	}
}
