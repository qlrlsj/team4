package kr.or.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.member.model.vo.Member;
import kr.or.report.model.service.ReportService;
import kr.or.report.model.vo.Report;

@Controller
public class ReportController {
	@Autowired
	ReportService service;
	
	@ResponseBody
	@RequestMapping (value="/reportInsert.kt", produces = "application/json;charset=utf-8")
	public String reportInsert(Report r) {
		int result = service.insertReport(r);
		if(result>0) {
			return new Gson().toJson("신고 완료");			
		}else {
			return new Gson().toJson("신고 실패");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/insertBlack.kt", produces = "application/json;charset=utf-8")
	public String insertBlack(Report r) {
		System.out.println(r);
		int result = service.insertBlack(r);
		if(result>0) {
			return new Gson().toJson("블랙리스트 추가 완료");			
		}else {
			return new Gson().toJson("블랙리스트 추가 실패");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/blackCheck.kt", produces = "application/json;charset=utf-8")
	public String blackCheck(Member m) {
		System.out.println(m);
		Report r = service.blackCheck(m);
		System.out.println(r);
		if(r!=null) {
			return new Gson().toJson("yes");				
		}else {
			return new Gson().toJson("no");		
		}
	
	}
}
