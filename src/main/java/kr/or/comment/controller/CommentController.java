package kr.or.comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.comment.model.service.CommentService;
import kr.or.comment.model.vo.Comment;


@Controller
public class CommentController {
	@Autowired
	private CommentService service;
	
	@RequestMapping(value="/insertComment.kt") //m.getMemberPw()
	public String insertComment(Comment c) {
		System.out.println("Controller로 넘어온 코멘트 내용 : "+c.getQcComment());
		System.out.println("Controller로 넘어온 코멘트 번호(게시글 번호) : "+c.getQuestionNo());
		int result = service.insertComment(c);
		if(result == 1) {
			System.out.println("코멘트 입력이 처리 되었습니다.");
		}else {
			System.out.println("코멘트 입력 실패");
		}
		return "redirect:/questionList.kt?reqPage=1";
	}
}
