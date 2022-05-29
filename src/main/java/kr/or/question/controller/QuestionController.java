package kr.or.question.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.question.model.service.QuestionService;
import kr.or.question.model.vo.QuestionPageDate;

@Controller
public class QuestionController {
	@Autowired
	private QuestionService service;
	
	@RequestMapping(value="/questionList.kt")
	public String questionList(int reqPage, Model model) {
		QuestionPageDate qpd = service.selectQuestionList(reqPage);
		
		
	}
	//여기서부터 시작
	
}
