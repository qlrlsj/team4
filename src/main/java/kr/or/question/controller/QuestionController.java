package kr.or.question.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.comment.model.vo.Comment;
import kr.or.question.model.service.QuestionService;
import kr.or.question.model.vo.Question;
import kr.or.question.model.vo.QuestionPageDate;
import kr.or.question.model.vo.QuestionViewData;

@Controller
public class QuestionController {
	@Autowired
	private QuestionService service;
	//하는중
	@RequestMapping(value="/questionList.kt")
	public String questionList(int reqPage, Model model) {
		QuestionPageDate qpd = service.selectQuestionList(reqPage);
//		QuestionViewData qvd = service.selectQuestionView(questionNo); //questionNo를 이용해서 게시글정보와 코멘트정보를 한번에 qvd에 담아온다.
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
		QuestionViewData qvd = service.selectQuestionView(questionNo); //questionNo를 이용해서 게시글정보와 코멘트정보를 한번에 qvd에 담아온다.
		Question q = qvd.getQ(); //qvd의 게시글 정보만을 따로 뽑아서 q에 저장
		Comment c = qvd.getC();	 //qvd의 코멘트 정보만을 따로 뽑아서 c에 저장
		model.addAttribute("q", q);
		model.addAttribute("c", c);
//		System.out.println(q);
//		System.out.println(c);
		return "question/questionView";
	}
	
	@RequestMapping(value="/questionDelete.kt")
	public String questionDelete(int questionNo) {
		int result = service.deleteQuestion(questionNo);
		return "redirect:/questionList.kt?reqPage=1";
	}
	
	@RequestMapping(value="/questionUpdateFrm.kt")
	public String questionUpdateFrm(int questionNo, String questionTitle, String questionContent, Model model) {
		model.addAttribute("questionNo",questionNo);
		model.addAttribute("questionTitle",questionTitle);
		model.addAttribute("questionContent",questionContent);
		return "question/questionUpdateFrm";
	}
	
	@RequestMapping(value="/questionUpdate.kt")
	public String questionUpdate(Question q) {
		System.out.println("변경된 q : "+q);
		int result = service.questionUpdate(q);
		return "redirect:/questionList.kt?reqPage=1";
	}
}
