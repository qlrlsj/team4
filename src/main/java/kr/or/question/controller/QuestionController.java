package kr.or.question.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import kr.or.question.model.service.QuestionService;
import kr.or.question.model.vo.Question;
import kr.or.question.model.vo.QuestionPageDate;

@Controller
public class QuestionController {
	@Autowired
	private QuestionService service;
	//하는중
	@RequestMapping(value="/questionList.kt")
	public String questionList(int reqPage, Model model) {
		QuestionPageDate qpd = service.selectQuestionList(reqPage);
		model.addAttribute("list", qpd.getList());
		model.addAttribute("pageNavi",qpd.getPageNavi());
		model.addAttribute("reqPage",reqPage);
		return "question/questionList";
	}
	
	@RequestMapping(value="questionWriteFrm.kt")
	public String questionWriteFrm() {
		return "question/questionWriteFrm";
	}
	
	@RequestMapping(value="/questionWrite.kt")
	public String questionWriter(Question q) {
		System.out.println("controller에들어온 title,content : "+q);
		int result = service.insertQuestion(q);
		if(result == 1) {
			System.out.println("글 작성 완료");
		}else {
			System.out.println("글 작성 실패");
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/questView.kt")
	public String questView(int questionNo, Model model) {
//		Board b = service.selectOneBoard(boardNo);
//		model.addAttribute("b",b);
		Question q = service.selectOneQuestion(questionNo);
		model.addAttribute("q", q);
		
		return "question/questionView";
	}
	
	
	
}
