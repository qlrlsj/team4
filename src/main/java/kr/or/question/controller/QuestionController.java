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
		return "redirect:/questionList.kt?reqPage=1";
	}
	
	@RequestMapping(value="/questView.kt")
	public String questView(int questionNo, Model model) {
//		Board b = service.selectOneBoard(boardNo);
//		model.addAttribute("b",b);
		Question q = service.selectOneQuestion(questionNo);
		model.addAttribute("q", q);
		
		return "question/questionView";
	}
	
	@RequestMapping(value="/questionDelete.kt")
	public String questionDelete(int questionNo) {
//		System.out.println("jsp에서 넘어온 게시글 번호 : "+questionNo);
		int result = service.deleteQuestion(questionNo);
//		if(result == 1) {
//			System.out.println("게시글 삭제 완료");
//		}else {
//			System.out.println("게시글 삭제 실패");
//		}
		return "redirect:/questionList.kt?reqPage=1";
	}
	
	@RequestMapping(value="/questionUpdateFrm.kt")
	public String questionUpdateFrm(int questionNo, String questionTitle, String questionContent, Model model) {
//		System.out.println("jsp에서 넘어온 게시글 번호 : "+questionNo);
//		System.out.println("jsp에서 넘어온 게시글 제목 : "+questionTitle);
//		System.out.println("jsp에서 넘어온 게시글 내용 : "+questionContent);
		model.addAttribute("questionNo",questionNo);
		model.addAttribute("questionTitle",questionTitle);
		model.addAttribute("questionContent",questionContent);
		return "question/questionUpdateFrm";
	}
	
	@RequestMapping(value="/questionUpdate.kt")
	public String questionUpdate(Question q) {
		System.out.println("변경된 q : "+q);
//		System.out.println("변경된 questionTitle :"+questionTitle);
//		System.out.println("변경된 questionContent : "+questionContent);
		int result = service.questionUpdate(q);
		return "redirect:/questionList.kt?reqPage=1";
	}
}
