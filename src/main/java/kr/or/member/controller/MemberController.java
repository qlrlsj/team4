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
}













