package kr.or.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/login.kt")
	public String login(Member m, HttpSession session) { //index에서 보내준 name과 네이밍이 같으면 자동으로 VO객체로 묶어줌
		
		Member member = service.selectOneMember(m);
		if(member != null) {//조회결과가 존재하는 경우
			session.setAttribute("m", member); //세션에 m으로 member를 저장
		}
		return "redirect:/";
	}

	@RequestMapping(value="/logout.kt")
	public String logout(HttpSession session) { //HttpSession속성의 session값 불러옴
		session.invalidate();					//session파기
		return "redirect:/";					//원래 화면으로 복귀
	}
	
	
	@RequestMapping(value="/joinFrm.kt")
	public String joinFrm() {
		return "member/joinFrm";
	}
	
	@RequestMapping(value="/join.kt")
	public String join(Member m) {
		int result = service.insertMember(m); //insert문은 어차피 결과를 1,0으로 return하기에 int로 변수를 만들어 놓는다.
		return "redirect:/";
	}
	
}













