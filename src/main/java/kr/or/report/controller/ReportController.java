package kr.or.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.report.model.service.ReportService;

@Controller
public class ReportController {
	@Autowired
	ReportService service;
}
